
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