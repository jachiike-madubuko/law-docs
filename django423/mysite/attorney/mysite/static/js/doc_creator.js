$(function() {
   	    $(window).scrollTop(0);
        $("#del").hide();
        $("#editor").hide();  //keeps the editor out of site until a DocPiece(DP) is clicked
        $("#ed").hide();
        $("#final").hide();
        $("#qbox").hide();
        $("#addbox").hide();
		$("#merge").hide();
        // will eventually be a django front live editor.
        //this defines the characteristic of the draggable blocks
        $(".ui-state-defaults").not(".addbut", ".t").draggable({
            axis: "y", containment: "#containment-wrapper", scroll: false, scrollSensitivity: 100
        });

        //this defines characteristics of the sort area
        $("#sortable").sortable({
            axis: "y",
            revert: false,
			placeholder: "ui-state-highlight",
        });

       $("#sortable").disableSelection();

        // this defines the characteristics of the dialog box for editting
        //will be abstracted into a django front end editor in future
       var dialog = $( "#editor" ).dialog({
		  autoOpen: false,
		  height: 425,
		  width: 900,
		  modal: true,
		  buttons: {
		    "Merge Fields": function() {        //clicking the done button sends current input to the DocPiece
				$("#merge").dialog("open");
			},
			"Done": function() {        //clicking the done button sends current input to the DocPiece
				var editted = $("#swag").val();
				$(".small").html( editted);      //class::small is used to keep track of which DocPiece is being editted
				$(".small").removeClass("small");
				dialog.dialog( "close" );

			$("#merge").dialog( "close" );
			},
			Cancel: function() {
			  dialog.dialog( "close" );
				$("#merge").dialog( "close" );
			}
		  }
    });

	$("#merge").dialog({
		modal: false,
		autoOpen:false,
		width: 185,
		position: {
        my: "right center",
        at: "left center",
        of: "#editor",
        collision: "none",
        }
	});

  // Initializes all textareas with the tinymce class
   	 $( ".italics" ).dblclick( function() { //class::italics given to the DP to make editable
   	     $(this).addClass("small");         //class::small tracking which DP is being updated
   	     var  old = $(".small").html();
         $("#swag").val(old);
      dialog.dialog( "open" );
    });

   	 //functionality of delete button
$("#sortable li").on('click', '.delbut', function(event) {
    $(this).parent().parent().remove();
});

//decide the kind of DP

//functionality for the add button. Will be generalized for all DPs
$(".addbut").on("click", function(){ //TODO add a dialog box that asks which DP is being added
    //newbie will be changed to be content based on the type of DP selected by user
	//TODO add accordian effect

	$(this).addClass("A");

	// http://jqueryui.com/accordion/#sortable
	$( "#addbox" ).dialog({
      autoOpen: false,
      position: {
        my: "left center",
        at: "right center",
        of: ".A",
        collision: "none"
        },
		width: 225,
		height: 380,
      show: {
        effect: "fade",
        duration: 500
      },
         hide: {
        effect: "fade",
        duration: 500
      },
     buttons: {
			Cancel: function() {
			  $("#addbox").dialog( "close" );
			}
		  }
    });
		$("#addbox").dialog("open");
	//add dialog to determine which docPiece and then create newbie
        });
	$("#witS").on('click', function(){
	    var newbie ="<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default witdent'> Witness Signature: ________________________________ <br> Name: ____________________<br> Address: ____________________<br> City: ____________________<br> State: ____________________<br> Phone Number: ____________________<br> Email: _____________________</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });

	$("#testS").on('click', function(){
	    var newbie ="<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default witdent'>Testator Signature: ________________________________ <br> {Applicant.FullName}&emsp&emsp&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";
	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });

	$("#secH").on('click', function(){
	    var newbie ="<li class='ui-state-defaults hdr'><p class = 'medium'></p><p id='witdent' class = 'italics ui-state-default header'>ARTICLE #<br> ARTICLE NAME</p><p class = 'hard'><ol class = 'legaLogi'></ol></li>";
	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });

	$("#WillP").on('click', function(){
	    var newbie ="<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default'>I {Applicant.FullName}, of {Applicant.City},  {Applicant.State}, revoke my former Wills and Codicils and declare this to be my Last Will and Testament.</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });
	$("#SpouseP").on('click', function()	{
	    var newbie ="<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default'>I am married to {Spouse.FullName} and all references in this Will to “my spouse” are references to {Spouse.FullName}. .</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";


	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });
 	$("#ChildrenP").on('click', function(){
	    var newbie ="<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default'>The names of my children are {Children.FullNames}. All references in this Will to “my children” are references to the above-named children.</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });
  	$("#PetL").on('click', function(){
	    var newbie ="<li class='ui-state-defaults pet'><p class = 'medium'></p><p class = 'italics ui-state-default'>-&nbsp;&nbsp; My {Pet.Type}, {Pet.Name}</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });
  	$("#PetCareL").on('click', function(){
	    var newbie ="<li class='ui-state-defaults pet'><p class = 'medium'></p><p class = 'italics ui-state-default'>Notwithstanding any other provision of this Will, I further direct that: <br> <br>A. Pet Caretaker. I give my following pet(s):<br><br></p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });
  	$("#CareP").on('click', function(){
	    var newbie ="<li class='ui-state-defaults pet'><p class = 'medium'></p><p class = 'italics ui-state-default'>and other animal which may own as companion animals at the time of my death, to {Caretaker.FullName}.</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	    $(".A").parent().parent().after(newbie);
	    $('.legaLogi').hide();
        $( "#sortable" ).change(); //updates the doc and adds buttons to new DPs
        $("#addbox").dialog("close");
	     $(".A").removeClass("A");
    });
    //this function updates the DocArea (DA) when something is added
   	$( "#sortable" ).change(function() {
        $("#sortable li").on('click', '.delbut', function(event) {
    $(this).parent().parent().remove();
});
//new DPs will have classes attached to <p></p> where the buttons will be placed.
//the classes are used a targets to place the buttons then are removed
// /your current y position on the page
$('#containment-wrapper').animate( { scrollTop: '+=200' }, 1000,);

$("#sortable .medium").append($(".delbut").eq(0).clone(true));
$("#sortable .medium").append($(".edbut").eq(0).clone(true));
$("#sortable .medium .edbut").css({"float": "right"});
$(".medium").removeClass("medium");
$("#sortable .hard").append($(".addbut").eq(0).clone(true));
$(".hard").removeClass("hard");

$("#testQ").on('click', function () {

   	    $("#sortable .pet").toggleClass("ui-state-disabled");
   	     $("#sortable .hdr").eq(1).toggleClass("ui-state-disabled");
    });
    //repeat of function of editting DP
   	  $( ".italics" ).dblclick( function() {
   	     $(this).addClass("small");
   	     var  old = $(".small").html();
         $("#swag").val(old);
      dialog.dialog( "open" );
    });

 });

   	   		 $( ".edbut" ).click(function(e) {
   	     $(this).addClass("Q");
   	     //$("#qbox p ol").empty();

   	     $("#qbox").html($('#qList').html());
   	      $( "#qbox" ).dialog( "open" );
          $(this).removeClass("Q");
   	     });

   	     $( "#qbox" ).dialog({
      autoOpen: false,
      position: {
        my: "left center",
        at: "right center",
        of: ".Q",
        collision: "none"
        },
      show: {
        effect: "fade",
        duration: 500
      },
         hide: {
        effect: "fade",
        duration: 500
      },
     buttons: {
			"Done": function() {
			    //clicking the done button sends current input to the DocPiece
				//var editted = $("#qList").val();
				//$(".small").html( editted);
                // class::small is used to keep track of which DocPiece is being editted
				//$(".small").removeClass("small");
				$("#qbox").dialog( "close" );
			},
			Cancel: function() {
			  $("#qbox").dialog( "close" );

			}
		  }
    });
   	//TODO add gen logic gates
        $("#addQ").on('click', function () {
             $("#qList").append('<li> <form action="#"> <fieldset><label for="bools">Question</label><select name="bools"><option selected="selected">Yes</option><option>No</option></select> </fieldset></form></li>');
             $("#qList li").css({"float": "left"});
             $("#qbox-list").empty();

             $("#qbox-list").css({"float":"none"});
        });
		 $("#qList").clone().appendTo('#qbox-list');
        //add question simulators at the top for testing
        //each DocPiece gets a set of question listeners, preset to don't care
        //when test button clicked, for each DocPiece, for each question, if test answer == DocPieceListener
        // or test answer== Don't care then show else hide
        //click test again to display all
    //this button will load a new page with the final Document generated
   	$( "#cont" ).on('click', function(event) {
        $("#cont").parent().append("<div id='sender'></div>");// insert an invisible form
		$("#sender").hide();
        // var sendy = event.target.after("<div id='sender'>  </div>");
        //   $("#sender").append($(".italics").html());

        $(".italics").not("#sortable .pet").each(function (i) {
            $(this).prepend("&nbsp; &nbsp; &nbsp; &nbsp;");
            $(this).append("<br />");
            $(this).append("<br />");
            $("#sender").append($(this).html());


        });
            var sendy = $("#sender");

            //find out how to convert sender to a text file
			//simulate file being dropped into fileststack picker
        $("#live").hide("fade", 100, reveal);
        function reveal() {
            setTimeout(function () {
                $("#final").show("fade", 2000);

            }, 10);
        }
        //  const client = filestack.init('AfEkWPbqOQYqKQt291D7dz');
     //   client.pick({}).then(function(e) {
   //           const fileUrl = result.filesUploaded[0].url;
//  link.href=fileUrl;
  //link.innerHTML=fileUrl;
       // });
    //    https://cdn.filestackcontent.com/output=format:pdf/AxnRSaLRL2fERM9C2aGk




    var progressbar = $( "#progressbar" ),
      progressLabel = $( ".progress-label" );

    progressbar.progressbar({
      value: false,
      change: function() {
        progressLabel.text( progressbar.progressbar( "value" ) + "%" );
      },
      complete: function() {
        progressLabel.text( "Complete!" );

      $("#progressbar").before(sendy);
      $("#sender").hide();
      $("#progressbar").hide("fade",500);
     	$("#sender").show("fade",1000);
      }
    });

    function progress() {
      var val = progressbar.progressbar( "value" ) || 0;

      progressbar.progressbar( "value", val + 1 );

      if ( val < 99 ) {
        setTimeout( progress, 5 );
      }
    }

    setTimeout( progress, 2000 );
  });

//		$('#fpButton').click(function() {
//  filepicker.setKey("AfEkWPbqOQYqKQt291D7dz");
//  filepicker.pick({
			//      services: ['COMPUTER'],
//      mimetypes: ['application/pdf']
			//    },
//    function(Blob) {
//      console.log(Blob.url);
//      addL//ink(Blob);
//      addLink2(Blob);
//      addLink3(Blob);
//    }
//  );
//});
//
//		client.preview('ko0fdJ2Sy2iDnvCuFqjw', { id: 'previewId'});
//
//function addLink(data) {
//  $("#results")
			//    .append(
			//      '<a target="_blank" href="' +
//      data.url + '">' + data.filename + '</a>'
			//    );
//}
//
//function addLink2(data) {
//  $("#results2").append('<img target="_blank" src="' +
			//    'https://process.filestackapi.com/output=format:jpg/resize=w:200/' + data.url.substr(data.url.lastIndexOf("/")+1) + '">'
			//  );
//}
//
//function addLink3(data) {
//  $('#results3').load('https://process.filestackapi.com/output=docinfo:true/' + data.url.substr(data.url.lastIndexOf("/")+1) + '');
//}
//
	});