$(function(){
    var products = ['egg', 'milk', 'cheese'];
    var fn = function(){
        var self = $(this);
        var clone = self.clone();

        clone.val('').on('blur', fn);

        if(self.val().length >= 2){
            self.parent().append(clone);
            self.off('blur');
        }
    };

   $('input.product_title')
       .on('blur', fn)
       .autocomplete({
           source: products
       });
});