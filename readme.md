https://github.com/pythonprobr/estrutura-de-dados?tab=readme-ov-file
https://www.youtube.com/watch?v=o1bkZuDXIlk&list=PLA05yVJtRWYS4mhKqJo_1bZqcetSGjDgU&index=17
https://github.com/renzon/estrutura-de-dados

Ordenacao
- Definicao
- Contrato
- Analise


# Estrutura de Dados

## Big O
![[Screenshot 2026-08-05 at 16.51.44.png]]

![[IMG_7061.png]]

![[IMG_7062.png]]

![[IMG_7063.png]]


## Arrays


![[Screenshot 2026-08-17 at 14.34.17.png]]

![[Screenshot 2026-08-17 at 14.36.37.png]]

![[Screenshot 2026-08-17 at 14.38.11.png]]

## Linked Lists

![[Screenshot 2026-08-17 at 14.44.45.png]]![[Screenshot 2026-08-17 at 14.47.33.png]]




## Entrevistas

O que entrevista de DSA busca?
- demonstrar profundidade profissional
- capacidade de quebrar problemas em problemas menores
- Analise de tradeoffs
- logica
- tomada de decisoes
- traduzir requisitos em codigo
- Principais
	- lidar com pressao
	- comunicacao ***
	- colaboracao
- Multiplas resolucoes
	- Resolver da maneira mais obvia e rapida usando forca bruta

![[Screenshot 2026-08-18 at 12.33.11.png]]![[Screenshot 2026-08-18 at 12.34.48.png]]

# Arrays
## Arrays estáticos vs dinâmicos

![[Screenshot 2026-08-18 at 16.15.49.png]]


## Mapas de Frequencia

Inicializar um hashmap e contar quantas vezes apareceu algo no hashmaps
![[Screenshot 2026-08-20 at 16.17.05.png]]
![[Screenshot 2026-08-20 at 16.19.26.png]]




## Two pointer

```java
class Solution {
	public String reverseWords(String s) {
		String[] words = s.split(" ");
		StringBuilder r = new StringBuilder();
		
		for (String word : words) {
			r.append(new StringBuilder(word).reverse()).append(" ");
		}
		
		return r.toString().trim();
	}
}
```

```elixir
defmodule Solution do
  @spec reverse_words(s :: String.t()) :: String.t()
  def reverse_words(s) do
    s
    |> String.codepoints()
    |> Enum.chunk_by(&(&1 == " "))
    |> Enum.map(&Enum.reverse/1)
    |> Enum.join("")
  end
end
```

```elixir
defmodule Solution do
  @spec reverse_words(s :: String.t()) :: String.t()
  def reverse_words(s) do
    s
    |> String.split(" ")
    |> Enum.map(&String.reverse/1)
    |> Enum.join(" ")
  end
end
```


```elixir
defmodule Solution do
  @spec reverse_words(s :: String.t()) :: String.t()
  def reverse_words(s) do
    reverse_word = fn s, l, r ->
      s
      |> String.slice(l, r - l)
      |> String.reverse()
    end

    s
    |> String.codepoints()
    |> Enum.with_index()
    |> Enum.reduce({"", 0, 0}, fn {e, i}, {acc, l, r} ->
      if e != " " do
        {acc, l, r + 1}
      else
        word = reverse_word.(s, l, r)
        acc = if acc == "", do: word, else: "#{acc} #{word}"

        {acc, i + 1, i + 1}
      end
    end)
    |> then(fn {acc, l, r} ->
      word = reverse_word.(s, l, r)
      if acc == "", do: word, else: "#{acc} #{word}"
    end)
  end
end
```


```go
package main

import (
    "fmt"
    "strings"
)

func reverseWords(s string) string {
    words := strings.Split(s, " ") 
    
    for i, j := 0, len(words)-1; i < j; i, j = i+1, j-1 {
        words[i], words[j] = words[j], words[i]
    }
    
    // Join the words back into a single string
    return strings.Join(words, " ")
}

```

## Binary Search

### Aula
![[Screenshot 2026-11-02 at 08.36.25.png]]


### Exercicio 

