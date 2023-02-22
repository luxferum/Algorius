## Processo de conexão com o repositório online e atualização de arquivos modificados, por meio da linha de comandos (CMD).

### Conexão com o repositório online.

- Para clonar o repositório, deve ser utilizado o comando: ``` git clone https://github.com/luxferum/Algorius.git ```

### Atualizar os arquivos.

- Primeiro, verifique se suas mudanças foram feitas nos arquivos desejados, navegue até a pasta principal (main -> /Algorius) e, então, utilize o comando: ``` git add CAMINHO_ATE_O_ARQUIVO ```
- Depois, confirme suas mudanças com o comando: ```git commit -m "COMENTARIO_SOBRE_AS_MUDANÇAS"```
- Sincronize o seu repositório local com o comando: ```git pull```. Dessa forma, você saberá se houve alguma mudança antes das suas. Se esse é o caso, faça uma junção das modificações (merge). 
- Por fim, envie suas mudanças para o repositório online, utilizando o comando: ```git push```.
