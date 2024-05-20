/**
 * @description       : 
 * @author            : Jakala
 * @group             : 
 * @last modified on  : 12-09-2023
 * @last modified by  : Jakala
**/
public with sharing class PruebasAlb {
    public static void ternarios() {

        integer a = 1;
        string result = (a == 1) ? 'a is 1' : 'a is not 1';
        System.debug(result);
    }
    public static void listas() {

        List<String> frutas = new List<String>{'manzana','pera','naranja'};
        System.debug(frutas[1]);
    }
    public static void mapas() {
  
        Map<String, Integer> edadPorNombre = new Map<String, Integer>{
            'Juan' => 20,
            'Pedro' => 30,
            'Maria' => 40
        };
        System.debug(edadPorNombre);
        integer edadDeLaura = edadPorNombre.get('Laura');


    }

    public static void addQuecosa() {
        
        List<String> nombres =new List<String>{'jose','pedro','juan'};
        
        for (String nombreAuxiliar : nombres){ 
            System.debug('hola'); 
            String a = nombreAuxiliar = nombreAuxiliar + ' quecosa';
        System.debug(a);
        }
        System.debug(nombres);
    }

    public static Boolean isEndWithZero(Integer num){
        //integer tam = num.size();
   
        System.debug('modulo: ' + Math.mod(num,10));
        if (Math.mod(num,10) == 0)
            return true;
    return false;
       }

       public Integer rockPaperScissors(String player1, String player2) {
        if ( player1 == player2)
            return 0;
        if (
                (player1 == 'rock' && (player2 == 'paper' || player2 == 'scissors'))
                || (player1 == 'paper' && player2 == 'rock')
                || (player1 == 'scissors' && player2 == 'paper')
            )
            return 1;
        return 2;
    }
    public String ageGroup(Integer n) {

        if (n >= 0 && n < 2)
            return 'Infant';
        if (n >= 2 && n < 15)
            return 'Child';
        if (n >= 15 && n < 22)
            return 'Youth';
        if (n >= 22)
            return 'Adult';
        return '';
    }

    public Boolean isPrime(Integer num) {
        for (Integer i = 2; i < num; i++)
            if (Math.mod(num, i) == 0)
                return true;
        return false;
    }

    public String formatName(String firstName, String lastName) {
        if (firstName == '' && lastName == '')
            return '';
        if (firstName == null || lastName == null)
            return firstName + lastName;
        if (firstName == null || lastName == null)
            return lastName +', '+ firstName;
        return '';
    }

    public static String nameFromEmail(String email) {
        //code here
        //String posDot = email.index_off('.');
        
        List <String> nombreResto = email.split('\\.');
        String nombre = nombreResto[0].toLowerCase().capitalize();
        List <String> ApellidoResto = nombreResto[1].split('\\@');
        String apellido = ApellidoResto[0].toLowerCase().capitalize();
        system.debug('nombre: ' + nombre);
        system.debug('apellido: ' +apellido);
        return nombre + ' ' + apellido;
        }   

    public static Integer fibonacci(Integer n) {
        //code here
        if (n ==1)
            return 1;
        for(Integer i=1; i<n; i++)
            return fibonacci(n-1) + fibonacci(n-2);
        return 0;
}

    public static String reverseWordsInASentence(String sentence){
        //your flawless code here
        List<String> palabras= sentence.split(' ');
        Integer nPalabras = palabras.size();
        List<String> palabrasReverse = new List<String>();

        for (Integer i = nPalabras; i > 0;  i--){
            palabrasReverse.add(palabras[i-1]);
        }
        palabrasReverse[0] = palabrasReverse[0].capitalize();
        palabrasReverse[nPalabras-1] = palabrasReverse[nPalabras-1].toLowerCase();
        system.debug(palabrasReverse);
        //String frase = String.join(palabrasReverse,' ');
        String frase = '';
        for (String palabra : palabrasReverse){
            frase = frase + palabra + ' ';
        }
        system.debug('frase: ' + frase);
        return frase;
    }

        public static Id insertStudent(String name, String email) {
            // code here
            apxio__Student__c nuevoAlumno = new apxio__Student__c();
            nuevoAlumno.apxio__Email__c = email;
            nuevoAlumno.name = name;
            insert nuevoAlumno;
            return nuevoAlumno.Id;
        
        }

        public Id insertCourse(String name, String details, Integer credits) {
            if (credits <1 || credits >4)
                return null;
            apxio__Course__c nuevoCurso = new apxio__Course__c();
            nuevoCurso.name = name;
            nuevoCurso.apxio__Course_Details__c = details;
            nuevoCurso.apxio__Credits__c = String.valueOf(credits);
            insert nuevoCurso;
            //List<apxio__Course__c> courses = [SELECT Id, Name, apxio__Course_Details__c, apxio__Credits__c FROM apxio__Course__c WHERE Name = 'name'];
            return nuevoCurso.Id;
        }

        /* public String registerStudent(String name, String phone, String email) {
            // code here
            apxio__Student__c estudiante = new  apxio__Student__c();
            estudiante.name = name;
            estudiante.apxio__Phone__c = phone;
            estudiante.apxio__Email__c = email;
            insert estudiante;
            String RegistrationNumber = [Select id,apxio__Registration_Number__c from apxio__Student__c where apxio__Email__c =: email];
            system.debug('RegistrationNumber: ' + RegistrationNumber);
            return RegistrationNumber;
        } */

        public void insertStudents(List<String> studentNames, List<String> studentEmails) {
    // code here
    List<apxio__Student__c> studiantesCompletos = new List<apxio__Student__c>();
    Integer i = 0;
    for (String student: studentNames){
        String Nombre = studentNames[i];
        String Email = studentEmails[i];
        apxio__Student__c nuevoEstudiante = new apxio__Student__c();
        nuevoEstudiante.name = Nombre;
        nuevoEstudiante.apxio__Email__c = Email;
        studiantesCompletos.add(nuevoEstudiante);
        i++;
    }
    insert studiantesCompletos;
    


}
public void enrollStudents(List<String> emails, String className) {
    // code here
    list <apxio__Class_Enrollment__c> enrolos = new list <apxio__Class_Enrollment__c>();
    list <apxio__Class__c> clasen = new list <apxio__Class__c>();
    clasen = [select id from apxio__Class__c where name = :className];
    List<apxio__Student__c> estus = [select id, apxio__Email__c  from apxio__Student__c where apxio__Email__c IN  :emails];
    
    for (apxio__Student__c studiante :estus )
    {
        apxio__Class_Enrollment__c enrol = new apxio__Class_Enrollment__c();
        enrol.apxio__Student__c =studiante.Id;
        enrol.apxio__Offered_Class__c = clasen[0].Id;
        enrolos.add(enrol);
    }
    insert enrolos;
}

public static void setAccountRating(Account a) {
    //code here
    if (a.AnnualRevenue <= 100000)
        a.Rating = 'Cold';
    else if (a.AnnualRevenue > 100000 && a.AnnualRevenue <= 500000)
        a.Rating = 'Warm';
    else if (a.AnnualRevenue > 500000)
        a.Rating = 'Hot';
    update a;
    system.debug('a.Rating: ' + a.Rating);
    

}


}