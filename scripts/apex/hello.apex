// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

/* string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar); */

//PruebasAlb.ternarios();
//PruebasAlb.listas();
//PruebasAlb.isEndWithZero(20);
//ruebasAlb.reverseWordsInASentence('El gato con botas las tenia puestas');
//PruebasAlb.insertCourse('Alberto', '5', 3);
account alber = new account();
alber.Name = 'Alberto';
alber.AnnualRevenue = 400000;
insert alber;
PruebasAlb.setAccountRating(alber);
delete alber;