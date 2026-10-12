{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.${config.home.username} = {
      extraConfig = builtins.readFile "${inputs.better-fox}/user.js";
      settings = {
        "network.trr.mode" = 5;
        "extensions.autoDisableScopes" = 0;
        "dom.security.https_only_mode" = true;
        "general.autoScroll" = true;
        "sidebar.verticalTabs" = true;
        "identity.sync.tokenserver.uri" = "https://firefox.moneten.cc/1.0/sync/1.5";
        "browser.startup.homepage" = "https://glance.moneten.cc";
        "browser.newtabpage.enabled" = true;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopsites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
      };
      containersForce = true;
      search = {
        force = true;
        default = "SearXNG";
        privateDefault = "SearXNG";
        engines = {
          SearXNG = {
            urls = [
              {
                template = "https://search.moneten.cc/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
          home-manager = {
            name = "Home Manager";
            urls = [
              {
                template = "https://home-manager-options.extranix.com";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                  {
                    name = "release";
                    value = "master";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@hm" ];
          };
          nix-packages = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          nix-options = {
            name = "Nix Options";
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
        };
      };
      extensions = {
        force = true;
        exactPermissions = true;
        exhaustivePermissions = true;
        packages =
          with inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.rycee.firefox-addons; [
            bitwarden
            catppuccin-web-file-icons
            darkreader
            dearrow
            facebook-container
            firefox-color
            indie-wiki-buddy
            libredirect
            private-relay
            refined-github
            sponsorblock
            stylus
            ublock-origin
            videospeed
          ];
        settings = {
          "deArrow@ajay.app".permissions = [
            "storage"
            "unlimitedStorage"
            "alarms"
            "https://sponsor.ajay.app/*"
            "https://dearrow.ajay.app/*"
            "https://dearrow-thumb.ajay.app/*"
            "https://*.googlevideo.com/*"
            "https://*.youtube.com/*"
            "https://www.youtube-nocookie.com/embed/*"
            "scripting"
          ];
          "@contain-facebook".permissions = [
            "<all_urls>"
            "browsingData"
            "contextualIdentities"
            "cookies"
            "management"
            "storage"
            "tabs"
            "webRequestBlocking"
            "webRequest"
          ];
          "FirefoxColor@mozilla.com".permissions = [
            "theme"
            "storage"
            "tabs"
            "https://color.firefox.com/*"
          ];
          # Stylus
          "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".permissions = [
            "alarms"
            "contextMenus"
            "storage"
            "tabs"
            "unlimitedStorage"
            "webNavigation"
            "webRequest"
            "webRequestBlocking"
            "<all_urls>"
            "https://userstyles.org/*"
          ];
          "sponsorBlocker@ajay.app".permissions = [
            "storage"
            "scripting"
            "unlimitedStorage"
            "https://sponsor.ajay.app/*"
            "https://*.youtube.com/*"
            "https://www.youtube-nocookie.com/embed/*"
          ];
          # Refined GitHub
          "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}".permissions = [
            "storage"
            "scripting"
            "contextMenus"
            "activeTab"
            "alarms"
            "https://github.com/*"
            "https://gist.github.com/*"
          ];
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}".permissions = [
            "<all_urls>"
            "*://*/*"
            "alarms"
            "clipboardRead"
            "clipboardWrite"
            "contextMenus"
            "idle"
            "storage"
            "tabs"
            "unlimitedStorage"
            "webNavigation"
            "webRequest"
            "webRequestBlocking"
            "notifications"
            "file:///*"
          ];
          "7esoorv3@alefvanoon.anonaddy.me" = {
            # libredirect settings
            settings = lib.importJSON ./libredirect-settings.json;
            permissions = [
              "webRequest"
              "webRequestBlocking"
              "storage"
              "clipboardWrite"
              "contextMenus"
              "<all_urls>"
            ];
          };
          "private-relay@firefox.com".permissions = [
            "<all_urls>"
            "storage"
            "menus"
            "contextMenus"
            "https://relay.firefox.com/"
            "https://relay.firefox.com/**"
            "https://relay.firefox.com/accounts/profile/**"
            "https://relay.firefox.com/accounts/settings/**"
          ];
          # Video Speed Controller
          "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}".permissions = [
            "storage"
            "http://*/*"
            "https://*/*"
            "file:///*"
          ];
          "addon@darkreader.org".permissions = [
            "alarms"
            "contextMenus"
            "storage"
            "tabs"
            "theme"
            "<all_urls>"
          ];
          # Catppuccin File Explorer Icons
          "{bbb880ce-43c9-47ae-b746-c3e0096c5b76}".permissions = [
            "storage"
            "contextMenus"
            "activeTab"
            "*://bitbucket.org/*"
            "*://codeberg.org/*"
            "*://gitea.com/*"
            "*://github.com/*"
            "*://gitlab.com/*"
            "*://tangled.org/*"
          ];
          "uBlock0@raymondhill.net" = {
            settings.selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-quick-fixes"
              "ublock-unbreak"
              "easylist"
              "adguard-generic"
              "easyprivacy"
              "adguard-spyware"
              "adguard-spyware-url"
              "block-lan"
              "urlhaus-1"
              "curben-phishing"
              "plowe-0"
              "fanboy-cookiemonster"
              "ublock-cookies-easylist"
              "adguard-cookies"
              "ublock-cookies-adguard"
            ];
            permissions = [
              "alarms"
              "dns"
              "menus"
              "privacy"
              "storage"
              "tabs"
              "unlimitedStorage"
              "webNavigation"
              "webRequest"
              "webRequestBlocking"
              "<all_urls>"
              "http://*/*"
              "https://*/*"
              "file://*/*"
              "https://easylist.to/*"
              "https://*.fanboy.co.nz/*"
              "https://filterlists.com/*"
              "https://forums.lanik.us/*"
              "https://github.com/*"
              "https://*.github.io/*"
              "https://github.com/uBlockOrigin/*"
              "https://ublockorigin.github.io/*"
              "https://*.reddit.com/r/uBlockOrigin/*"
            ];
          };
          # Indie Wiki Buddy
          "{cb31ec5d-c49a-4e5a-b240-16c767444f62}".permissions = [
            "storage"
            "alarms"
            "webRequest"
            "notifications"
            "scripting"
            "https://*.fandom.com/*"
            "https://*.fextralife.com/*"
            "https://*.neoseeker.com/*"
            "https://breezewiki.com/*"
            "https://www.google.com/search*"
          ];
        };
      };
    };
  };
}
