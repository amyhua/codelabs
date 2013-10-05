
$(document).ready(function(){

    // Toggle Column Views
    $('#2col-view').click(function(e){
        e.preventDefault()
        $('.col-md-12.view').removeClass('col-md-12').addClass('col-md-6')
    })
    $('#1col-view').click(function(e){
        e.preventDefault()
        $('.col-md-6.view').removeClass('col-md-6').addClass('col-md-12')
    })

    // Favorite Codepens

    function favorite(el) {
        $.ajax({
            type: "POST",
            url: "/favorite",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {user_id: el.data('user'), id: el.data('codepen')},
            success: el.addClass('favorited').removeClass('favorite')
        });
    }
    function unfavorite(el) {
        $.ajax({
            type: "POST",
            url: "/unfavorite",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {user_id: el.data('user'), id: el.data('codepen')},
            success: el.removeClass('favorited').addClass('favorite')
        });
    }


    $('a.favorite').on('click', function(e){
        var $this = $(this);
        var id = '#codepen-' + $(this).data('codepen');
        e.preventDefault()
        $.when( favorite($this) ).then(function(el){
            var $id = $(id)
            var num = Number($id.next().next().html());
            num++;
            $id.next().next().html(num);
        })
    })
    $('a.favorited').on('click', function(e){
        e.preventDefault()
        unfavorite( $(this) )
    })




});
