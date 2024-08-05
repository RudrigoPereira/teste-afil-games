# Afil Games Menu Teste

## Descrição

Este projeto é uma implementação do desafio proposto pela Afil Games para avaliar a compreensão de fundamentos de programação em GML (GameMaker Language). O objetivo foi criar um menu navegável utilizando o GameMaker, permitindo o uso de mouse e teclado para navegação.

## Funcionalidades

### Menu Principal

1. **Jogar**
   - Redireciona para a cena "rm_gameplay".
   - Na "rm_gameplay", há um botão "retornar" para voltar ao menu principal.

2. **Configurações**
   - **Volume:** Permite ajuste do volume com um indicador do volume atual.
   - **Tela Cheia:** Alterna entre modo tela cheia e modo janela.
   - **Voltar:** Retorna ao menu principal.

3. **Sair**
   - Exibe um pop-up de confirmação perguntando "Você deseja sair?" com opções "Sim" e "Não".

### Detalhes de Implementação

- **Persistência de Configurações:** As configurações de volume e modo de tela são salvas para sessões futuras.
- **Navegação Intuitiva:** O menu pode ser navegado utilizando o mouse ou o teclado.
- **Feedback Auditivo:** Implementação de sons para feedback de interação, essencial para o ajuste de volume.

## Como Executar o Projeto

1. **Clonar o Repositório:**

   ```bash
   git clone https://github.com/RudrigoPereira/teste-afil-games.git
   ```

2. **Abrir no GameMaker:**
   - Inicie o GameMaker e abra o projeto clonado.

3. **Compilar e Executar:**
   - Compile e execute o projeto para testar as funcionalidades do menu.

## Estrutura do Projeto

- **`rm_menu`:** Sala principal com o menu.
- **`rm_gameplay`:** Sala de gameplay simples com botão para voltar ao menu.
- **Objetos:** Incluem a lógica para navegação, ajustes de volume e alternância de tela.

## Considerações

Este projeto focou em fornecer um código limpo, bem estruturado e de fácil manutenção. A estética do menu não foi priorizada, conforme pedido no desafio.

## Autor

- [Rodrigo Ferreira Pereira](https://www.linkedin.com/in/rodrigoferreirapereira/) - Desenvolvedor
