function main
do

  disp('Ingresar Funcion Transferencia mediante: ');
  disp('1. Sus coeficientes del polinomio de Numerador y Denominador');
  disp('2. Sus polos, ceros y ganancia');
  
  opc = input("\nSeleccione una opcion: ");
  
  if(opc == 1)
        numerador = input("\nIngrese coeficientes Numerador: ");
        denominador = input('Ingrese coeficientes Denominador: ');
        funcionTransf = tf(numerador, denominador);

    else 
        if (opc == 2)
          polos = input("\nIngrese coeficientes Polos: ");
          ceros = input('Ingrese coeficientes Ceros: ');
          ganancia = input('Ingrese coeficiente Ganancia: ');
          funcionTransf = zpk(ceros, polos, ganancia);
        endif
  endif
  
  if(opc == 1 || opc == 2)
    menuPrincipal(funcionTransf);
  endif

until(0)
endfunction

%Menu Principal
function menuPrincipal(funcionTransf)

  do
  
        disp("\n1. Obtener la expresion de la funcion transferencia.");
        disp('2. Indicar Polos.');
        disp('3. Indicar Ceros.');
        disp('4. Marcar ganancia de la funcion.');
        disp('5. Obtener expresion con sus polos, ceros y ganancia.');
        disp('6. Mostrar graficamente la distribucion de polos y ceros.');
        disp('7. Indicar estabilidad del sistema.');
        disp('8. Obtener todas las caracteristicas de la funcion transferencia: Esta funcionalidad barre todos los puntos anteriores (1, 2, 3, 4, 5,6 y 7).');
        disp('9. Ingresar una nueva funcion.');
        disp('10. Finalizar.');

        opc = input("\nSeleccione una opcion: ");
        
        switch(opc)
          case 1
            mostrarTransferencia(funcionTransf);
          case 2
            mostrarPolos(funcionTransf);
          case 3
            mostrarCeros(funcionTransf);
          case 4
            mostrarGanancia(funcionTransf);
          case 5
            mostrarPolosCerosGanancia(funcionTransf);
          case 6
            mostrarGraficamente(funcionTransf);            
          case 7
            mostrarEstabilidad(funcionTransf);
          case 8
            mostrarTransferencia(funcionTransf);
            mostrarPolosCerosGanancia(funcionTransf);
            mostrarGraficamente(funcionTransf);
          case 9
            return
          case 10
            exit
        endswitch
      
 until(opc == 10 || opc == 9)
endfunction


%Mostrar Funcion Transferencia
function mostrarTransferencia(FuncionTransferencia)
  FuncionTransferencia
endfunction

%Mostrar Polos
function mostrarPolos(FuncionTransferencia)
   [~, Polos, ~]=tf2zp(FuncionTransferencia)
endfunction

%Mostrar Ceros
function mostrarCeros(FuncionTransferencia)
  [Ceros, ~, ~]=tf2zp(FuncionTransferencia)
endfunction

%Mostrar Ganancia
function mostrarGanancia(FuncionTransferencia)
  [~, ~, Ganancia]=tf2zp(FuncionTransferencia)
endfunction

%Mostrar Polos-Ceros-Ganancia
function mostrarPolosCerosGanancia(FuncionTransferencia)
   [Ceros, Polos, Ganancia]=tf2zp(FuncionTransferencia)
endfunction

%Mostrar Graficamente
function mostrarGraficamente(FuncionTransferencia)
  pzmap(FuncionTransferencia)
endfunction

%Mostrar Estabilidad del Sistema
function mostrarEstabilidad(FuncionTransferencia)
  [~, Polos, ~]=tf2zp(FuncionTransferencia)
  if(Polos>0)
    disp('Sistema Estable');
  else
    disp('Sistema Inestable');
  endif
endfunction