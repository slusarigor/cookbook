$(function(){
    console.log('Hello world!');
    var products = ['egg', 'milk', 'cheese'];
    var bindInput = function(input)
    {
        input.on('blur', fn)
            .autocomplete({
                source: products,
                select: productChange
            });
    };

    var unbindInput = function(input)
    {
        input.off('blur')
             .autocomplete('destroy');
    };

    var productChange = function(e, data)
    {
        var self = $(this);
        var product_titles = [data.item.value];

        $('.product_title').each(function(i){
            var input = $(this);
            var title = $(this).val();

            if(self[0] !== input[0]) product_titles.push(title);
        });
        console.log(product_titles);
        var url = '/recipes?products=' + product_titles.join(',');
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

        clone.val('');
        bindInput(clone);

        if(self.val().length >= 2){
            self.parent().append(clone);
            unbindInput(self);
        }
    };



   bindInput($('input.product_title'));

});