## Processo de conexão com o repositório online e atualização de arquivos modificados, por meio da linha de comandos (CMD).

### Conexão com o repositório online.

- Para clonar o repositório, deve ser utilizado o comando: ``` git clone https://github.com/luxferum/Algorius.git ```

### Atualizar os arquivos.

- Primeiro, verifique se suas mudanças foram feitas nos arquivos desejados, navegue até a pasta principal (main -> /Algorius) e, então, utilize o comando: ``` git add CAMINHO_ATE_O_ARQUIVO ```
- Depois, confirme suas mudanças com o comando: ```git commit -m "COMENTARIO_SOBRE_AS_MUDANÇAS"```
- Sincronize o seu repositório local com o comando: ```git pull```. Dessa forma, você saberá se houve alguma mudança antes das suas. Se esse é o caso, faça uma junção das modificações (merge). 
- Por fim, envie suas mudanças para o repositório online, utilizando o comando: ```git push```.

## Envio de um commit específico para uma branch específica.

- O primeiro passo é armazenar a hash do seu commit após realizá-lo. Caso não tenha armazenado, use o comando ```git log``` e procure o seu commit na lista gerada.
- Após localizar a hash, utilize o comando ```git push origin "HASH":refs/head/"BRANCH"```.
    - Exemplo: ```git push origin 2466083c7ea67d3b3c77a83cbe0448c05f4b15b8:refs/head/main```.
