function btnWitS() {
    var newbie = "<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default witdent'> Witness Signature: ________________________________ <br> Name: ____________________<br> Address: ____________________<br> City: ____________________<br> State: ____________________<br> Phone Number: ____________________<br> Email: _____________________</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

    $(".A").parent().parent().after(newbie);
    $('.legaLogi').hide();
    $("#sortable").change(); //updates the doc and adds buttons to new DPs
    $("#addbox").dialog("close");
    $(".A").removeClass("A");
}

function secH() {
	var newbie = "<li class='ui-state-defaults hdr'><p class = 'medium'></p><p id='witdent' class = 'italics ui-state-default header'>ARTICLE #<br> ARTICLE NAME</p><p class = 'hard'><ol class = 'legaLogi'></ol></li>";
	
	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}

function WillP() {
	var newbie = "<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default'>I {Applicant.FullName}, of {Applicant.City},  {Applicant.State}, revoke my former Wills and Codicils and declare this to be my Last Will and Testament.</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}

function SpouseP() {
var newbie = "<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default'>I am married to {Spouse.FullName} and all references in this Will to “my spouse” are references to {Spouse.FullName}. .</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";


	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}

function ChildrenP() {
var newbie = "<li class='ui-state-defaults'><p class = 'medium'></p><p class = 'italics ui-state-default'>The names of my children are {Children.FullNames}. All references in this Will to “my children” are references to the above-named children.</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}

function PetL() {
var newbie = "<li class='ui-state-defaults pet'><p class = 'medium'></p><p class = 'italics ui-state-default'>-&nbsp;&nbsp; My {Pet.Type}, {Pet.Name}</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}

function  PetCareL() {
	var newbie = "<li class='ui-state-defaults pet'><p class = 'medium'></p><p class = 'italics ui-state-default'>Notwithstanding any other provision of this Will, I further direct that: <br> <br>A. Pet Caretaker. I give my following pet(s):<br><br></p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}

function CareP() {
var newbie = "<li class='ui-state-defaults pet'><p class = 'medium'></p><p class = 'italics ui-state-default'>and other animal which may own as companion animals at the time of my death, to {Caretaker.FullName}.</p><p class = 'hard'></p><ol class = 'legaLogi'></ol></li>";

	$(".A").parent().parent().after(newbie);
	$('.legaLogi').hide();
	$("#sortable").change(); //updates the doc and adds buttons to new DPs
	$("#addbox").dialog("close");
	$(".A").removeClass("A");
}















































