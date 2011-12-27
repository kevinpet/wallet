/* http://docs.angularjs.org/#!angular.filter */
angular.filter("titleVault", function(vault) {
    var locked =  vault.locked ? "locked" : "unlocked";
    return vault.resource.name + " (" + locked + ")";
});
