--Nome: Ricardo Ramalho Marques--
--Matricula: 202308031--
--Turma: CC1MA--


--Cria a tabela gerente--
CREATE TABLE public.gerente (
                gerente_id VARCHAR NOT NULL,
                CONSTRAINT gerente_id PRIMARY KEY (gerente_id)
);
COMMENT ON COLUMN public.gerente.gerente_id IS 'ID do gerente';

--Cria a tabela departamentos--
CREATE TABLE public.departamento_table (
                id_departamento_departamento_pk NUMERIC(10) NOT NULL,
                departamento VARCHAR NOT NULL,
                CONSTRAINT id_departamento PRIMARY KEY (id_departamento_departamento_pk)
);
COMMENT ON COLUMN public.departamento_table.id_departamento_departamento_pk IS 'atribui um id a departamento como pk';
COMMENT ON COLUMN public.departamento_table.departamento                    IS 'armazena o nome do departamento';

--Cria a tabela de endereços---
CREATE TABLE public.endereco_table (
                id_endereco_endereco  NUMERIC(10)  NOT NULL,
                cidade_endereco       VARCHAR(250) NOT NULL,
                logradouro            VARCHAR(250) NOT NULL,
                UF_endereco           VARCHAR(150) NOT NULL,
                bairro_endereco       VARCHAR(150) NOT NULL,
                numero_endereco       VARCHAR      NOT NULL,
                complemento_endereco  VARCHAR(100),
                CONSTRAINT pk         PRIMARY KEY (id_endereco_endereco)
);
COMMENT ON COLUMN public.endereco_table.id_endereco_endereco   IS  'atribui um id ao endereco';
COMMENT ON COLUMN public.endereco_table.cidade_endereco        IS  'armazena a cidade que a pessoa mora';
COMMENT ON COLUMN public.endereco_table.logradouro             IS  'armazena a rua que as pessoas moram';
COMMENT ON COLUMN public.endereco_table.UF_endereco            IS  'armazena o estado em que as pessoas moram';
COMMENT ON COLUMN public.endereco_table.bairro_endereco        IS  'armazena o bairo que as pessoas moram';
COMMENT ON COLUMN public.endereco_table.numero_endereco        IS  'armazena o numero das residencias';
COMMENT ON COLUMN public.endereco_table.complemento_endereco   IS  'armazena um complemnto ao endereço';

--Cria a tabela de funcionarios--
CREATE TABLE public.funcionario_table (
                id_funcionario                 NUMERIC(10)   NOT NULL,
                gerente_id                     VARCHAR       NOT NULL,
                id_endereco_endereco           NUMERIC(10)   NOT NULL,
                cpf_pk_funcionario             NUMERIC(11)   NOT NULL,
                foto_perfil BYTEA,
                id_departamento_funcionario_fk NUMERIC(10)   NOT NULL,
                biografia_descricao            VARCHAR(256),
                nome_funcionario               VARCHAR(250)  NOT NULL,
                usuario_funcionario            VARCHAR(100)  NOT NULL,
                CONSTRAINT cpf_pk_funcionario  PRIMARY KEY (id_funcionario)
);
COMMENT ON COLUMN public.funcionario_table.id_funcionario                  IS 'ID do funcionario';
COMMENT ON COLUMN public.funcionario_table.gerente_id                      IS 'ID do gerente';
COMMENT ON COLUMN public.funcionario_table.id_endereco_endereco            IS 'atribui um id ao endereco';
COMMENT ON COLUMN public.funcionario_table.cpf_pk_funcionario              IS 'armazena o cpf do funcionario como pk para 1 conta pertencer a aapenas 1 cpf';
COMMENT ON COLUMN public.funcionario_table.foto_perfil                     IS 'Foto de perfil';
COMMENT ON COLUMN public.funcionario_table.id_departamento_funcionario_fk  IS 'armazena o departamento de cada funcionario';
COMMENT ON COLUMN public.funcionario_table.biografia_descricao             IS 'Descrição do perfil do funcionario';
COMMENT ON COLUMN public.funcionario_table.nome_funcionario                IS 'armazena o nome do funcionario';
COMMENT ON COLUMN public.funcionario_table.usuario_funcionario             IS 'armazena o nome de usuario da conta';

--Cria a tabela de postagens--
CREATE TABLE public.postagens (
                id_postagem            VARCHAR      NOT NULL,
                id_funcionario         NUMERIC(10)  NOT NULL,
                data DATE NOT NULL,
                texto                  VARCHAR(256),
                midia BYTEA,
                CONSTRAINT id_da_postagem PRIMARY KEY (id_postagem)
);
COMMENT ON COLUMN public.postagens.id_postagem     IS 'Identificação da postagem';
COMMENT ON COLUMN public.postagens.id_funcionario  IS 'ID do funcionario';
COMMENT ON COLUMN public.postagens.data            IS 'Data que foi feito o post';
COMMENT ON COLUMN public.postagens.texto           IS 'Texto caso haja em um post';
COMMENT ON COLUMN public.postagens.midia           IS 'Midia da postagem';

--Cria a tabela de emails de funcionarios--
CREATE TABLE public.email (
                email_id          VARCHAR(100) NOT NULL,
                id_funcionario    NUMERIC(10)  NOT NULL,
                email             VARCHAR      NOT NULL,
                CONSTRAINT email_id PRIMARY KEY (email_id, id_funcionario)
);
COMMENT ON COLUMN public.email.email_id       IS 'Email do funcionario ';
COMMENT ON COLUMN public.email.id_funcionario IS 'ID do funcionario';
COMMENT ON COLUMN public.email.email          IS 'email do funcionario';

--Cria a tabela de talentos--
CREATE TABLE public.talentos_table (
                talento         VARCHAR      NOT NULL,
                id_funcionario  NUMERIC(10)  NOT NULL,
                hard_skill      VARCHAR(72)  NOT NULL,
                soft_skill      VARCHAR(72)  NOT NULL,
                CONSTRAINT talento PRIMARY KEY (talento, id_funcionario)
);
COMMENT ON COLUMN public.talentos_table.talento         IS 'Mostra qual o talento';
COMMENT ON COLUMN public.talentos_table.id_funcionario  IS 'ID do funcionario';
COMMENT ON COLUMN public.talentos_table.hard_skill      IS 'hard skill do funcionario';
COMMENT ON COLUMN public.talentos_table.soft_skill      IS 'Soft skills do funcionario';

--Cria a tabela da formação dos funcionarios--
CREATE TABLE public.formacao (
                formacao_id NUMERIC(10) NOT NULL,
                id_funcionario NUMERIC(10) NOT NULL,
                formacao VARCHAR(32),
                data DATE,
                intituicao VARCHAR(256),
                CONSTRAINT formacao_id PRIMARY KEY (formacao_id)
);
COMMENT ON COLUMN public.formacao.id_funcionario  IS 'ID do funcionario';
COMMENT ON COLUMN public.formacao.formacao        IS 'Qual a formação do funcionario';
COMMENT ON COLUMN public.formacao.data            IS 'Data da formação';
COMMENT ON COLUMN public.formacao.intituicao      IS 'Instituição na qual é formado';

--Transorma gerente_id em uma FK--
ALTER TABLE public.funcionario_table ADD CONSTRAINT gerente_funcionario_table_fk
FOREIGN KEY (gerente_id)
REFERENCES public.gerente (gerente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
--Transforma a coluna id_departamento em uma FK--
ALTER TABLE public.funcionario_table ADD CONSTRAINT departamento_table_funcionario_table_fk
FOREIGN KEY (id_departamento_funcionario_fk)
REFERENCES public.departamento_table (id_departamento_departamento_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
--Transorma a coluna endereco_id em FK--
ALTER TABLE public.funcionario_table ADD CONSTRAINT endereco_table_funcionario_table_fk
FOREIGN KEY (id_endereco_endereco)
REFERENCES public.endereco_table (id_endereco_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
--Transforma a coluna id_funcionario em uma PFK--
ALTER TABLE public.formacao ADD CONSTRAINT funcionario_table_formacao_fk
FOREIGN KEY (id_funcionario)
REFERENCES public.funcionario_table (id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
--Transforma a coluna id_funcionario em uma PFK--
ALTER TABLE public.talentos_table ADD CONSTRAINT funcionario_table_talentos_table_fk
FOREIGN KEY (id_funcionario)
REFERENCES public.funcionario_table (id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
--Transforma a coluna id_funcionario em uma PFK--
ALTER TABLE public.email ADD CONSTRAINT funcionario_table_email_fk
FOREIGN KEY (id_funcionario)
REFERENCES public.funcionario_table (id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
--Transforma a coluna id_funcionario em uma PFK--
ALTER TABLE public.postagens ADD CONSTRAINT funcionario_table_postagens_fk
FOREIGN KEY (id_funcionario)
REFERENCES public.funcionario_table (id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
-
--Deu trabaio hein paizão--
--Deixei de ir pescar--