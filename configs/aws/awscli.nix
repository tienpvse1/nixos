{pkgs, ...} : {
  programs.awscli = {
      enable = true;
      settings = {
        "profile amili-tienpvse-dev" = {
          sso_session = "amili-tienpvse-dev";
          sso_account_id = "705030229210";
          sso_role_name = "v2-amili-dev-developer";
          region = "ap-southeast-1";
        };

        "sso-session amili-tienpvse-dev" = {
          sso_start_url = "https://amili-sso.awsapps.com/start/";
          sso_region = "ap-southeast-1";
          sso_registration_scopes = "sso:account:access";
        };

        "profile amili-tienpvse-prod" = {
          sso_session = "amili-tienpvse-prod";
          sso_account_id = "412868562714";
          sso_role_name = "v2-amili-prod-pe";
          region = "ap-southeast-1";
        };

        "sso-session amili-tienpvse-prod" = {
          sso_start_url = "https://amili-sso.awsapps.com/start/";
          sso_region = "ap-southeast-1";
          sso_registration_scopes = "sso:account:access";
        };
      };
    };
}
