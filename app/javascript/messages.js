$(function(){
  $('div.message-contents').each(function(i){
    $(this).attr('id','message-contents' + (i+1));
  });

  $('div.message-contents__checked > .check_icon').on('click', function(){
    const user_name = gon.current_user_name;
    const index = $('div.message-contents__checked > .check_icon').index(this);
    $('div.message-contents__checked--name:eq('+index+')').append(
      '<li>'+user_name+'</li>'
    );
    $('div.message-contents__checked > .check_icon:eq('+index+')').off();
  });
});