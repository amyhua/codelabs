
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
            success: el.addClass('favorited')
        });
    }
    function unfavorite(el) {
        $.ajax({
            type: "POST",
            url: "/unfavorite",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {user_id: el.data('user'), id: el.data('codepen')},
            success: el.removeClass('favorited')
        });
    }
    $('a.favorite').bind('click', function(e){
        var $this = $(this);
        var id = '#codepen-' + $(this).data('codepen');
        var $id = $(id)
        e.preventDefault()
        if ($this.hasClass('favorited')) {
            $.when( unfavorite($this) ).then(function(){
                var num = Number($id.next().next().html());
                num--;
                $id.next().next().html(num);
            })

        } else {
            $.when( favorite($this) ).then(function(){
                var $id = $(id)
                var num = Number($id.next().next().html());
                num++;
                $id.next().next().html(num);
            })
        }
    })

    // Request instructor help ->> SMS and/or Email to instructors
    $('#request_instructor_help').on('click', function(){
        $.ajax({
            type: "GET",
            url: "/request_instructor_help",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            success: $('#request-status').html('<br><br>Thanks for asking! We got your request and are on our way!<br><br>')
        });
    })

    $('.remove_as_admin').on('click', function(){
        $.ajax({
            type: "POST",
            url: "/remove_as_admin",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {id: $(this).data('user')},
            success: confirm('Are you sure you want to remove this user as admin?')
        });
    })
    $('.make_as_admin').on('click', function(){
        $.ajax({
            type: "POST",
            url: "/make_as_admin",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {id: $(this).data('user')},
            success: confirm('Are you sure you want to make this user an admin?')
        });
    })

    // Admin Dashboard


        var converter = new Showdown.converter();

    if ($('input#lesson_name').length) {

        var description = $('input#lesson_name').val();
        var desc_html = converter.makeHtml(description);
        $('#lesson-name-preview').html('<h2>'+desc_html+'</h2>');

        $('input#lesson_name').on('keyup', function(){
            var description = $(this).val();
            var desc_html = converter.makeHtml(description);
            $('#lesson-name-preview').html('<h2>'+desc_html+'</h2>');

        })
    }
    if ($('textarea#lesson_description').length) {
        var description = $('textarea#lesson_description').val();
        var desc_html = converter.makeHtml(description);
        $('#lesson-desc-preview').html(desc_html);

        $('textarea#lesson_description').on('keyup', function(){
            var description = $(this).val();
            var desc_html = converter.makeHtml(description);
            $('#lesson-desc-preview').html(desc_html);

        })
    }
    if ($('textarea#lesson_content').length) {
        var content = $('textarea#lesson_content').val();
        var content_html = converter.makeHtml(content);
        $('#lesson-content-preview').html(content_html);

        $('textarea#lesson_content').on('keyup', function(){
            var content = $(this).val();
            var content_html = converter.makeHtml(content);
            $('#lesson-content-preview').html(content_html);
        })
    }
    if ($('.markdown').length) {
        var content = $('.markdown').text();
        var content_html = converter.makeHtml(content);
        $('.markdown').html(content_html);
    }

    if ($('textarea#question_detail.preview').length) {
        var content = $('textarea#question_detail.preview').val();
        var content_html = converter.makeHtml(content);
        $('#question-detail-preview').html(content_html);

        $('textarea#question_detail.preview').on('keyup', function(){
            console.log('key')
            var content = $(this).val();
            var content_html = converter.makeHtml(content);
            $('#question-detail-preview').html(content_html);
        })
    }
    // TODO: refactor




});
