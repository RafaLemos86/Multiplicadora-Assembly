.code
INICIO:
          lda x2          ;carrega x2 em AC(Registrador Acumulador)
          jz FIM          ;se Z=1, então vai para FIM
          lda x1          ;carrega x1 em AC
          add rf          ;adiciona AC em rf
          sta rf          ;armazena AC em rf
          jc SOMA         ;se C=1, então vai para SOMA
VOLTA:    
          lda x2          ;carrega x2 em AC
          add #0ffh       ;carrega e decrementa em menos 1
          sta x2          ;armazena AC em x2    
          jz FIM          ;se Z=1, então vai para FIM
          jmp INICIO      ;senão volta para INICIO
SOMA:
          lda aux         ;carrega aux
          add #01h        ;carrega e adiciona mais 1
          sta aux         ;armazena AC em aux
          jmp VOLTA       ;senão vai para VOLTA 
FIM:
          hlt             ;suspende processo

.endcode



.data
         x1: db #08h  ; multiplicando
         x2: db #00h  ; multiplicador
         rf: db #00h  ; resultado final
         aux:db #00h  ; variável auxiliar para SOMA

.enddata
