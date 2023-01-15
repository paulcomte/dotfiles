{ config, lib, pkgs, modulesPath, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in

{
  hardware = {
    nvidia.modesetting.enable = true;
    nvidia.package =
      let
        nv =
          config.boot.kernelPackages.nvidiaPackages;
      in
      if lib.versionAtLeast nv.stable.version nv.beta.version
      then nv.stable
      else nv.beta;
    nvidia.powerManagement.enable = true;
    nvidia.prime = {
      offload.enable = true;
      
      # Bus ID of the AMD iGPU
      amdgpuBusId = "PCI:5:0:0";
      
      # Bus id of the NVIDIA GPU
      nvidiaBusId = "PCI:1:0:0";
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
    };
  };
}
