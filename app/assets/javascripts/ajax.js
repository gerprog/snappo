var afterAjax = function() {
   $(".container").wtScroller({
            num_display:6,
            slide_width:200,
            slide_height:300,
            slide_margin:1,
            button_width:35,
            ctrl_height:25,
            margin:10,    
            auto_scroll:true,
            delay:4800,
            scroll_speed:1500,
            easing:"",
            auto_scale:false,
            move_one:false,
            ctrl_type:"scrollbar",
            display_buttons:true,
            mouseover_buttons:true,
            display_caption:true,
            mouseover_caption:true,
            caption_effect:"slide",            
            caption_align:"bottom",
            caption_position:"inside",                    
            cont_nav:true,
            shuffle:false,
            mousewheel_scroll:true
        });
    
        //initialize lightbox for scroller  
      $("a[rel='scroller']").wtLightBox({
            rotate:true,
            delay:4000,
            duration:600,
            display_number:true,
            display_dbuttons:true,
            display_timer:true,
            display_caption:true,
            caption_position:"outside",
            cont_nav:true,
            auto_fit:true,
            easing:"",
            type:"GET"
        });

      $(function() {
       $('#notice').delay(500).fadeIn('normal', function() {
          $(this).delay(2000).fadeOut();
       });
      });

      $(".details_container").hover(
      function() { $(this).children(".details").fadeIn(500) },
      function() { $(this).children(".details").fadeOut(500); }
    );

        // below is trying to have submit btn on upload in edit/Orders work
        //divs in these tests now removed.
        //$('f#myForm').trigger('submit.rails');

        // stop ajax on click in certain div. eg. vote_div. not working. see vote_div.js
        //$("#vote_div a").on("click", ajaxEnabled = false;); 
}

$(function(){ // another way of saying window(onload) is $(function().....
var displayResponse = function(response) { // Display fetched content from the server on the page
    /*$("#loading").hide();  // hides the loading bar*/
    
  var content = $("#main"); // fetch the main div
  
  content.html($(response).find('#main').children()); // write the new content in it
  content.find("a").on("click", loadAjax); // finds every link in it and monitor the click events
  content.find("form").on("submit", submitForm); // findex every form in it and monitor the submit events

  //alert("hi");
  afterAjax();
 }

 var submitForm = function(e) { // When a form is submitted
  
  // below line was preventing the Upload! submit button on edit/Orders from working
  //e.preventDefault(); // cancel the default action, page refresh  
  
  $(this).find("input[type=submit]").attr("disabled", "disabled"); // find the submit button and disable it 
  $(this).off("submit"); // remove the submission event from the form
  
    /*$("#loading").show(); // display the loading bar*/
  
  
  var url = $(this).attr("action"); // retrieve the action attribute from the submitted form
  var method = $(this).attr("method"); // retrive the method attribute from the submitted form
  var data = {}; // creates an empty data json object to hold all the values from the submitted form
  
  $(this).find("input, select, radio").each(function() { // for each input / select / radio in the submitted form
    var name = $(this).attr("name"); // find the name of the input
    var value = $(this).val(); // find the value of the input
    
    data[name] = value; // add it to the data object
  }); 
  
  $.ajax({ // start an ajax request
    url: url, // to the following url
    type: method, // with this http verb (get / post / put / delete)
    data: data, // with these values from the form
    success: displayResponse // when it is done, display the content fetched
  });
 }

 var loadAjax = function(e) { // When a link is clicked
   e.preventDefault(); // cancel the default action, page refresh
  
  /*$("#loading").show(); // display the loading bar*/
  
  var url = $(this).attr("href"); // retrive the href attribute from the clicked link
  var method = $(this).attr("data-method") || "get"; // retrive the data-method attribute from the clicked link or get if the attribute is empty
  
  if(method === "delete") { // if the method is delete
    $(this).parents("tr").remove(); // remove the row from the page
  }
  
  $.ajax({ // start an ajax request
    url: url, // to the following url
    type: method, // with this http verb (get / post / put / delete)
    success: displayResponse // when it is done, display the content fetched
  });


 }

 /*$("#navbar a, #navtwo a").on("click", loadAjax); // this is for the links on the 'give me a clue' page w JSON*/
 $("#navbar a").on("click", loadAjax); // monitor the navigation bar for click events

 afterAjax();
 });