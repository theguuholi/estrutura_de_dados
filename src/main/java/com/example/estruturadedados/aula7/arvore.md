Arvores Binarias
Arvores cujo nos possuem no maximo 3 filhos
arvore balanceada
representacao em vetor
formula para filhos
 - esquerdo: (i+1)*2-1
 - direito: (i+1)*2
 - pai: floor((i-1)//2)

 Representacao em vetor de uma arvore binaria

 arvore=[A, B, C]
 
                A
            B       C
        D       E F     G


calcular_indice_filho_esquerdo(indiceDoPai)
    return (indiceDoPai + 1) * 2 - 1

calcularIndiceDireito(indiceDoPai)
    return (indiceDoPai+1) * 2

calcularIndiceDoPAi(indice) 
    return floor((indice-1) // 2)


Arvoces com objetos
- Utilizar estrutura de Noh
- atributo pai
- versao 1 
 - atributo filho esquerdo
 - atributo irmao direito
- versao 2
    - atributos filhos
versao 1 versus 2