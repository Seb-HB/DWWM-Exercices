window.addEventListener("DOMContentLoaded", (event) => {
    console.log("DOM entièrement chargé et analysé");

    let canSubmit = [0, 0, 0, 0, 0, 0];

    // const cond = [".value.length<3",
    //     ".value.length<3",
    //     ".value<4 || inputs[i].value>140",
    //     ".value.length<4",
    //     ".value.length>6",
    //     ".value!=inputs[i-1].value"
    // ];

    const conditions = {
        lastName: {cond:".value.length<3",isOk:false},
        firstName: ".value.length<3",
        age: ".value<4 || inputs[i].value>140",
        login: ".value.length<4",
        pwd1: ".value.length>6",
        pwd2: ".value!=inputs[i-1].value"
    };
    console.log(Object.values(conditions)[0]);

    let inputs = document.querySelectorAll('input');

    tooltips = document.querySelectorAll('.tooltip');
    tooltips.forEach(element => {
        element.style.display = 'none';
    });

    for (let i = 0; i < 7; i++) {
        inputs[i].addEventListener('input', function (e) {
            console.log(inputs[i]);
            console.log( Object.values(conditions)[i]);
            console.log(eval('inputs[i]' + Object.values(conditions)[i]))
            if (eval('inputs[i]' + cond[i])) {
                inputs[i].className = "form_col incorrect";
                tooltips[i].style.display = 'inline-block';
                canSubmit[i] = 0;
            } else {
                inputs[i].className = "form_col correct";
                tooltips[i].style.display = 'none';
                canSubmit[i] = 1;
            }
        })
    }

    document.querySelector('#myForm').addEventListener('submit', function (e) {
        let test = 0;
        canSubmit.forEach(element => {
            test += element.value;
        });
        if (test != 6) {
            e.preventDefault();
            alert('Tous les champs ne sont pas correctement remplis');
        } else {
            alert('Merci pour votre interet. Votre demande sera traitée dans le splus brefs délais.');
        }

    });

});


// Object.entries(object).forEach(([key, value], index) => {
//     console.log(`${index}: ${key} = ${value}`);
// });