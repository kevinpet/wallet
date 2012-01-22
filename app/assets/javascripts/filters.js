/* http://docs.angularjs.org/#!angular.filter */
angular.filter("dirtyTitle", function(vault) {
    return vault.resource.name + (vault.dirty ? "*" : "");
});
