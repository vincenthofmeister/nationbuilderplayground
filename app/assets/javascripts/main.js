
//called when someone wants to create a contact point
function create_contact(){


    var contact_id = document.getElementById("contact_id").value;
    var sender_id = document.getElementById("sender_id").value;
    var broadcaster_id = document.getElementById("broadcaster_id").value;
    var contact_method = document.getElementById("contact_method").value;
    var contact_status = document.getElementById("contact_status").value;
    var contact_type = document.getElementById("contact_type").value;
    var note = document.getElementById("note").value;

    if(!contact_id || !sender_id || !broadcaster_id || !contact_method || !contact_status || !contact_type)
    {
        //some value is missing
        alert("Please make sure you have all the fields filled out as they are all required (except note).");

    }
    else
    {

        //create request to backend to create new user
        $.post( "/contacts/send_contact", { contact_id: contact_id, sender_id: sender_id, broadcaster_id: broadcaster_id, contact_method: contact_method, contact_status: contact_status, contact_type: contact_type, note: note}).done(function(data){

            if(data == 200)
            {
                alert('The contact was successfully logged! Visit the "View Payloads" tab and the most recent one will be the response for this.');
            }
            else
            {
                alert("Error! The contact point was not saved.");
            }

        });
    }









    //return false
    return false;
}




//called when someone clicks on 'delete' person
function delete_person(person_id){

    var c = confirm("Are you sure you want to delete the person with an ID of " + person_id + "?");

    if(c == true) {
        //create request to backend to create new user
        $.get("/peoples/delete_person", {person_id: person_id}).done(function (data) {


            if (data == 204) {
                alert("Person was successfully deleted!")
                //remove person
                $("#" + person_id).remove();
            }
            else {
                alert("There was a problem and the person was not deleted. Are you sure the person exists?");
            }


        });

    }


}



//called when someone wants to update a person
function update_person(){

    var email = document.getElementById("email").value;
    var first_name = document.getElementById("first_name").value;
    var last_name = document.getElementById("last_name").value;
    var gender = document.getElementById("gender").value;
    var employer = document.getElementById("employer").value;
    var party = document.getElementById("party").value;
    var state = document.getElementById("state").value;
    var country_code = document.getElementById("country_code").value;
    var person_id = document.getElementById("person_id").value;


    var submittable = true;


    if(!email || !first_name || !last_name || !gender || !employer || !party || !state || !country_code || !person_id)
    {
        submittable = false;
    }


    if(submittable)
    {
        //create request to backend to create new user
        $.post( "/peoples/send_update_person", { person_id: person_id, email: email, first_name: first_name, last_name: last_name, gender: gender, employer: employer, party: party, state: state, country_code: country_code}).done(function(data){

            if(data == 200)
            {
                alert(first_name + " " + last_name + " with ID of " + person_id  + " and email: " + email + " was updated!");
                location.reload();
            }
            else
            {
                alert("There was an issue and the person was not updated. You may be trying to enter an email address that already exists.");
            }




        });


    }
    else
    {
        //warn user not all fields are filled out
        alert("Please make sure you have filled out all fields, as they are all required.");
    }



    return false;

}








//called when someone wants to create a person
function create_person(){

    var email = document.getElementById("email").value;
    var first_name = document.getElementById("first_name").value;
    var last_name = document.getElementById("last_name").value;
    var gender = document.getElementById("gender").value;
    var employer = document.getElementById("employer").value;
    var party = document.getElementById("party").value;
    var state = document.getElementById("state").value;
    var country_code = document.getElementById("country_code").value;


    var submittable = true;


    if(!email || !first_name || !last_name || !gender || !employer || !party || !state || !country_code)
    {
        submittable = false;
    }


    if(submittable)
    {
        //create request to backend to create new user
        $.post( "/peoples/create_person", { email: email, first_name: first_name, last_name: last_name, gender: gender, employer: employer, party: party, state: state, country_code: country_code}).done(function(data){


            if(data == 201)
            {
                alert("Person was created!")
            }
            else
            {
                alert("There was a problem and the person was not created. You may be trying to enter a duplicate record.");
            }


        });


    }
    else
    {
        //warn user not all fields are filled out
        alert("Please make sure you have filled out all fields, as they are all required.");
    }



    return false;

}