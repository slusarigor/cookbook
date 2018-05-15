$(function(){
    var products = ['egg', 'milk', 'cheese'];
    var productChange = function(e)
    {
        var product_titles = [];

        $('.product_title').each(function(i){
            var title = $(this).val();
            product_titles.push(title);
        });
        console.log(product_titles);
        var url = '/recipes?products=' + product_titles.join(',')
       $.ajax({
           url: url,
           success: function(response){
               $('body').append(response);
           },
           fail: function(response){
               $('body').prepend(response);
           }
       })
    };

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
           source: products,
           select: productChange
       });
});