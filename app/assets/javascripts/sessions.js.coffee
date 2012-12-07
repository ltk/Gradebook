jQuery ->
  $('a.fill_credentials').click (event) ->
    $('#user_email').val($(this).data('email'))
    $('#user_password').val($(this).data('password'))
    event.preventDefault()