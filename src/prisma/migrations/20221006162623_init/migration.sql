-- CreateEnum
--CREATE TYPE "EnumStatusAccount" AS ENUM ('ACTIVE', 'BLOCKED', 'INACTIVE');

-- CreateEnum
--CREATE TYPE "TransactionType" AS ENUM ('TRANSFER', 'BILLET');

-- CreateEnum
--CREATE TYPE "StatementType" AS ENUM ('CREDIT', 'DEBIT');

-- CreateTable
/*CREATE TABLE "Usuario" (

    usu_cadastro VARCHAR UNIQUE NOT NULL,
    usu_nome VARCHAR NOT NULL,
    usu_email VARCHAR UNIQUE NOT NULL,
    usu_telefone VARCHAR NOT NULL,
    usu_dtNasc DATE NOT NULL,
    usu_senha VARCHAR NOT NULL

    CONSTRAINT "pk_usuario" PRIMARY KEY("usu_cadastro")
);

-- CreateTable
CREATE TABLE "Endereco" (
    
    usu_cadastro VARCHAR UNIQUE NOT NULL,
    end_cep VARCHAR NOT NULL,
    end_rua VARCHAR NOT NULL,
    end_num VARCHAR NOT NULL,
    end_bairro VARCHAR NOT NULL,
    end_cidade VARCHAR NOT NULL,
    end_uf CHAR (2) NOT NULL,
    end_complemento VARCHAR,

    CONSTRAINT fk_endereco FOREIGN KEY(usu_cadastro) REFERENCES Usuario(usu_cadastro)
    CONSTRAINT pk_endereco PRIMARY KEY (usu_cadastro)
);

-- CreateTable
CREATE TABLE "Conta" (
    usu_cadastro VARCHAR UNIQUE NOT NULL,
    con_id SERIAL NOT NULL,
    con_agencia TEXT NOT NULL,
    con_tipo TEXT NOT NULL,
    con_extrato FLOAT,
    con_senha INTEGER NOT NULL,

    CONSTRAINT fk_conta FOREIGN KEY (usu_cadastro) REFERENCES Usuario(usu_cadastro)
    CONSTRAINT pk_conta PRIMARY KEY (usu_cadastro)
);

-- CreateTable
CREATE TABLE "Transferencia" (
    trans_id SERIAL NOT NULL,
    trans_val FLOAT NOT NULL,
    trans_dtTrans DATETIME NOT NULL,
    trans_remetente VARCHAR NOT NULL,
    trans_destinatario VARCHAR NOT NULL,

    CONSTRAINT pk_transferencia PRIMARY KEY (trans_id)
    CONSTRAINT fk_destinatario FOREIGN KEY (trans_destinatario) REFERENCES Conta(usu_cadastro)
    CONSTRAINT fk_remetente FOREIGN KEY (trans_remetente) REFERENCES Conta(usu_cadastro)
);

-- CreateTable
CREATE TABLE "Agencia" (
    con_cadastro VARCHAR NOT NULL,
    age_num INTEGER NOT NULL,
    age_nome VARCHAR NOT NULL,
    
    CONSTRAINT pk_agencia PRIMARY KEY (age_num)
    CONSTRAINT fk_agencia_cadastro FOREIGN KEY (con_cadastro) REFERENCES Conta(usu_cadastro)
);
*/

-- CreateIndex
--CREATE UNIQUE INDEX "User_addressId_key" ON "User"("addressId");

-- CreateIndex
--CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
--CREATE UNIQUE INDEX "User_cpf_key" ON "User"("cpf");

-- AddForeignKey
--ALTER TABLE "User" ADD CONSTRAINT "User_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "Transfers" ADD CONSTRAINT "Transfers_fromId_fkey" FOREIGN KEY ("fromId") REFERENCES "Account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "Transfers" ADD CONSTRAINT "Transfers_toId_fkey" FOREIGN KEY ("toId") REFERENCES "Account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- CreateEnum
CREATE TYPE "EnumStatusAccount" AS ENUM ('ACTIVE', 'BLOCKED', 'INACTIVE');

-- CreateEnum
CREATE TYPE "TransactionType" AS ENUM ('TRANSFER', 'BILLET');

-- CreateEnum
CREATE TYPE "StatementType" AS ENUM ('CREDIT', 'DEBIT');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "addressId" INTEGER NOT NULL,
    "full_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "transaction_password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" SERIAL NOT NULL,
    "cep" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "account_number" TEXT NOT NULL,
    "account_branch" TEXT NOT NULL,
    "balance" DECIMAL(65,30) NOT NULL,
    "status" "EnumStatusAccount" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transfers" (
    "id" SERIAL NOT NULL,
    "fromId" INTEGER NOT NULL,
    "toId" INTEGER NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "Transfers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transactions" (
    "id" SERIAL NOT NULL,
    "transaction_type" "TransactionType" NOT NULL,
    "type" "StatementType" NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "Transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_addressId_key" ON "User"("addressId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_cpf_key" ON "User"("cpf");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transfers" ADD CONSTRAINT "Transfers_fromId_fkey" FOREIGN KEY ("fromId") REFERENCES "Account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transfers" ADD CONSTRAINT "Transfers_toId_fkey" FOREIGN KEY ("toId") REFERENCES "Account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;