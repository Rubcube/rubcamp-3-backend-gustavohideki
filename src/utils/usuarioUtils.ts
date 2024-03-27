
export class usuarioUtils {
    
    static cpfValido(usu_cpf:string) {
        const str = usu_cpf;
        var resto = 0;
        var cpfNumero = []
        var cpf = str.replace(/[a-zA-Z^'-.]/gm, "");
        let aux = 0;
        var cpfDecomposto = cpf.split("", cpf.length)
        for(var i=0; i<cpf.length; i++){
            cpfNumero.push(parseInt(cpfDecomposto[i]))
        }
        for(var i=0; i<=cpf.length-3; i++){
            aux = (cpfNumero[i])*(10-i)+aux;
        }
        resto = aux % 11;
        resto = 11 - resto;
        if (resto >= 10){resto = 0}      
        if (resto == cpfNumero[9]){
            aux = 0;
            resto = 0;
            for(var i=0; i<=cpf.length-2; i++){
                aux = (cpfNumero[i])*(11-i)+aux;
            }
            resto = aux % 11;
            resto = 11- resto;
            if (resto >= 10)
                resto=0;
            if (resto == cpfNumero[10]){return true;}
            else {return false}
        }
        else{return false}
    }

    static emailValido(usu_email:string) {
        let regex = /^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/gm
        if (regex.test(usu_email)){
            return true
        } else {
            return false
        }
    }
}
//^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.[a-z]{3})?[^.\W])$