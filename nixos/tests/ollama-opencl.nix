{ lib, pkgs, ... }:
{
  name = "ollama-opencl";
  meta.maintainers = with lib.maintainers; [ abysssol ];

  nodes.opencl =
    { ... }:
    {
      services.ollama.enable = true;
      services.ollama.package = pkgs.ollama-opencl;
    };

  testScript = ''
    opencl.wait_for_unit("multi-user.target")
    opencl.wait_for_open_port(11434)
  '';
}
