# Lib: EditMode

## [11](https://github.com/p3lim-wow/LibEditMode/tree/11) (2025-12-07)
[Full Changelog](https://github.com/p3lim-wow/LibEditMode/commits/11) [Previous Releases](https://github.com/p3lim-wow/LibEditMode/releases)

- Bump version  
- Rethink how we allow multi-select dropdowns  
    Ref #56  
- Lint  
- Fix doc links  
- Add option to disable settings, with accompanying functions  
- Support non-radio correctly  
    Fixes #56  
- Add color picker support  
    Fixes #53  
- Support fine editing for slider  
    Fixes #52  
- Bump actions/checkout from 5 to 6 (#51)  
    Bumps [actions/checkout](https://github.com/actions/checkout) from 5 to 6.  
    - [Release notes](https://github.com/actions/checkout/releases)  
    - [Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)  
    - [Commits](https://github.com/actions/checkout/compare/v5...v6)  
    ---  
    updated-dependencies:  
    - dependency-name: actions/checkout  
      dependency-version: '6'  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
    Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>  
- Lint  
- Add description tooltip support  
    This is beyond what blizzard supports, but it's nice to have  
- Update wiki on tags only  
- Rename tags workflow  
- Reset dialog predictably  
    Fixes #5  
- Don't figure callbacks early  
- Update cache whenever the layouts change  
    It's not guaranteed to be on ADDON\_LOADED  
- Don't throw errors with missing layouts  
    This actually kills the init process of the entire library  
- Different table structure  
- Use cache when querying layout names  
    C\_EditMode.GetLayouts() requires pulling data from the server, which  
    causes a freeze every time it's called (based on latency)  
- Fix error on early loading  
- Specs can trigger layout changes  
    Ref https://github.com/Gethe/wow-ui-source/blob/cbd9586890ae30fd5bdfb2f87533f3c35877ef9a/Interface/AddOns/Blizzard\_EditMode/Mainline/EditModeManager.lua#L181C19-L187  
    Fixes #47  
- Fix regression  
    Fixes #48  
- Try to run layout callback on registration (#46)  
- Lint  
- Trigger layout callbacks when frames are added  
    Otherwise it's rather cumbersome to deal with updates.  
- Add callbacks for create, rename and delete  
    Fixes #45  
- Pass layout index of the changed layout  
    Fixes #45  
- Don't get in the way  
- :lipstick:  
- Prevent clicking through the extension dialog  
- Keep extension static (#44)  
- Add docs for #43  
- Split entry's name and value (#43)  
- Manually fetch layout info (#42)  
- Better handling of system names  
- Don't waste minutes  
- :lipstick:  
- :lipstick:  
- :lipstick:  
- :lipstick:  
- :lipstick:  
- Rearrange for docs cohesiveness  
- Re-add docs for the deprecated method but mark it  
- Make extension settings divider dynamic  
- Add method to add multiple buttons at once  
- Overlap system dialogs so they look unified  
- Fix system dialog width  
- Add test case for system settings  
- Oops  
- It bothers me so much...  
- Move DropdownOption after Dropdown  
- Reset position belongs in .Buttons  
- Add extension to blizz settings (#37)  
- Add divider widget (#36)  
- Bump actions/upload-artifact from 4 to 5 (#35)  
    Bumps [actions/upload-artifact](https://github.com/actions/upload-artifact) from 4 to 5.  
    - [Release notes](https://github.com/actions/upload-artifact/releases)  
    - [Commits](https://github.com/actions/upload-artifact/compare/v4...v5)  
    ---  
    updated-dependencies:  
    - dependency-name: actions/upload-artifact  
      dependency-version: '5'  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
    Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>  
- Prevent combat errors from protected API  
- Prevent OnDragStop from erroring  
- Stop dragging if the player enters combat  
- Don't try to move things in combat  
- Update dialog on all movement  
- Lint  
- Add per pixel adjustment via arrow keys (#33)  
- Consider any floating point issues  
- Disable reset position button if we're at default position  
- Bump version  
- Update Interface version (#31)  
    Co-authored-by: p3lim <26496+p3lim@users.noreply.github.com>  
- Need to check for nil on booleans  
    Fixes #32  
- Add a standalone test case  
- Bump actions/checkout from 4 to 5 (#28)  
    Bumps [actions/checkout](https://github.com/actions/checkout) from 4 to 5.  
    - [Release notes](https://github.com/actions/checkout/releases)  
    - [Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)  
    - [Commits](https://github.com/actions/checkout/compare/v4...v5)  
    ---  
    updated-dependencies:  
    - dependency-name: actions/checkout  
      dependency-version: '5'  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
    Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>  
- Update Interface version (#27)  
    Co-authored-by: p3lim <26496+p3lim@users.noreply.github.com>  
- Update Interface version (#26)  
    Co-authored-by: p3lim <26496+p3lim@users.noreply.github.com>  
- Use GitHub for sponsorship  
- Bump minor  
- Update Interface version (#25)  
    Co-authored-by: p3lim <26496+p3lim@users.noreply.github.com>  
- Lint  
- Add fix for 11.2  
- Fix release job  
- Fix artifacts  
- Update license (#24)  
    Co-authored-by: p3lim <26496+p3lim@users.noreply.github.com>  
- Use beta/PTR versions  
- Bump p3lim/toc-interface-updater from 3 to 4 (#22)  
    Bumps [p3lim/toc-interface-updater](https://github.com/p3lim/toc-interface-updater) from 3 to 4.  
    - [Release notes](https://github.com/p3lim/toc-interface-updater/releases)  
    - [Commits](https://github.com/p3lim/toc-interface-updater/compare/v3...v4)  
    ---  
    updated-dependencies:  
    - dependency-name: p3lim/toc-interface-updater  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
    Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>  
- Bump peter-evans/create-pull-request from 6 to 7 (#23)  
    Bumps [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) from 6 to 7.  
    - [Release notes](https://github.com/peter-evans/create-pull-request/releases)  
    - [Commits](https://github.com/peter-evans/create-pull-request/compare/v6...v7)  
    ---  
    updated-dependencies:  
    - dependency-name: peter-evans/create-pull-request  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
    Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>  
- Bump minor  
- Use multi-valued interface version  
- Bump peter-evans/create-pull-request from 5 to 6  
    Bumps [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) from 5 to 6.  
    - [Release notes](https://github.com/peter-evans/create-pull-request/releases)  
    - [Commits](https://github.com/peter-evans/create-pull-request/compare/v5...v6)  
    ---  
    updated-dependencies:  
    - dependency-name: peter-evans/create-pull-request  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
- Bump actions/upload-artifact from 3 to 4  
    Bumps [actions/upload-artifact](https://github.com/actions/upload-artifact) from 3 to 4.  
    - [Release notes](https://github.com/actions/upload-artifact/releases)  
    - [Commits](https://github.com/actions/upload-artifact/compare/v3...v4)  
    ---  
    updated-dependencies:  
    - dependency-name: actions/upload-artifact  
      dependency-type: direct:production  
      update-type: version-update:semver-major  
    ...  
    Signed-off-by: dependabot[bot] <support@github.com>  
- Bump Interface version  
- Remove old embeds and references  
- :broom:  
- Rename TOC to avoid loading on unsupported versions  
- Bump TOC  
- Support changing menu height  
- Use unsecured pool variant  
    Not entirely sure this will stay  
- :broom:  
- Drop LibDropDown for 11.x built-in system  
    It's a drop-in system for simple dropdowns, but any entry types other  
    than checkboxes and radio buttons are not supported by the simple menu.  
    A complex menu can be made using the generator callback.  
- Use stock pools logic as much we can  
- Share tables  
- Use future TOC bumps  
    # Conflicts:  
    #	.github/workflows/version.yml  
- Create FUNDING.yml  
- Update Interface version  
