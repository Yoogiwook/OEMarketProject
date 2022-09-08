// html dom 이 다 로딩된 후 실행
    $(document).ready(function(){
        // a 클릭했을때
      $('.hide_menu').hide();

        $(".admin_menu>a ").click(function(){
         $(".hide_menu").toggle();
        });
      
      
});
 