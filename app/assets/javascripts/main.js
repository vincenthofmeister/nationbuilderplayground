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
            alert("Person was created.");
        });


    }
    else
    {
        //warn user not all fields are filled out
        alert("Please make sure you have filled out all fields, as they are all required.");
    }



    return false;

}