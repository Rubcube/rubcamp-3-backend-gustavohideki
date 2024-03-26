/*
  Warnings:

  - You are about to drop the `Account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Transactions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Transfers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Account" DROP CONSTRAINT "Account_userId_fkey";

-- DropForeignKey
ALTER TABLE "Transfers" DROP CONSTRAINT "Transfers_fromId_fkey";

-- DropForeignKey
ALTER TABLE "Transfers" DROP CONSTRAINT "Transfers_toId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_addressId_fkey";

-- DropTable
DROP TABLE "Account";

-- DropTable
DROP TABLE "Address";

-- DropTable
DROP TABLE "Transactions";

-- DropTable
DROP TABLE "Transfers";

-- DropTable
DROP TABLE "User";

-- DropEnum
DROP TYPE "EnumStatusAccount";

-- DropEnum
DROP TYPE "StatementType";

-- DropEnum
DROP TYPE "TransactionType";

-- CreateTable
CREATE TABLE "Usuario" (
    "usu_cadastro" TEXT NOT NULL,
    "usu_nome" TEXT NOT NULL,
    "usu_email" TEXT NOT NULL,
    "usu_telefone" TEXT NOT NULL,
    "usu_dtNasc" TIMESTAMP(3) NOT NULL,
    "usu_senha" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("usu_cadastro")
);

-- CreateTable
CREATE TABLE "Endereco" (
    "usu_cadastro" TEXT NOT NULL,
    "end_cep" TEXT NOT NULL,
    "end_rua" TEXT NOT NULL,
    "end_num" INTEGER NOT NULL,
    "end_bairro" TEXT NOT NULL,
    "end_cidade" TEXT NOT NULL,
    "end_uf" TEXT NOT NULL,
    "end_complemento" TEXT,

    CONSTRAINT "Endereco_pkey" PRIMARY KEY ("usu_cadastro")
);

-- CreateTable
CREATE TABLE "Conta" (
    "usu_cadastro" TEXT NOT NULL,
    "con_id" SERIAL NOT NULL,
    "con_num" INTEGER NOT NULL,
    "con_agencia" TEXT NOT NULL,
    "con_tipo" TEXT NOT NULL,
    "con_extrato" DOUBLE PRECISION NOT NULL,
    "con_senha" INTEGER NOT NULL,

    CONSTRAINT "Conta_pkey" PRIMARY KEY ("usu_cadastro")
);

-- CreateTable
CREATE TABLE "Agencia" (
    "con_id" INTEGER NOT NULL,
    "age_num" INT NOT NULL,
    "age_nome" TEXT NOT NULL,

    CONSTRAINT "Agencia_pkey" PRIMARY KEY ("age_nome")
);

-- CreateTable
CREATE TABLE "Transferencia" (
    "trans_id" INTEGER NOT NULL,
    "trans_remetente" INTEGER NOT NULL,
    "trans_destinatario" INTEGER NOT NULL,
    "trans_val" DOUBLE PRECISION NOT NULL,
    "trans_dtTrans" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Transferencia_pkey" PRIMARY KEY ("trans_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_usu_cadastro_key" ON "Usuario"("usu_cadastro");

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_usu_cadastro_key" ON "Endereco"("usu_cadastro");

-- CreateIndex
CREATE UNIQUE INDEX "Conta_usu_cadastro_key" ON "Conta"("usu_cadastro");

-- CreateIndex
CREATE UNIQUE INDEX "Conta_con_id_key" ON "Conta"("con_id");

-- CreateIndex
CREATE UNIQUE INDEX "Agencia_con_id_key" ON "Agencia"("con_id");

-- CreateIndex
CREATE UNIQUE INDEX "Agencia_age_nome_key" ON "Agencia"("age_nome");

-- CreateIndex
CREATE UNIQUE INDEX "Transferencia_trans_id_key" ON "Transferencia"("trans_id");

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_usu_cadastro_fkey" FOREIGN KEY ("usu_cadastro") REFERENCES "Usuario"("usu_cadastro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Conta" ADD CONSTRAINT "Conta_usu_cadastro_fkey" FOREIGN KEY ("usu_cadastro") REFERENCES "Usuario"("usu_cadastro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agencia" ADD CONSTRAINT "Agencia_con_id_fkey" FOREIGN KEY ("con_id") REFERENCES "Conta"("con_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transferencia" ADD CONSTRAINT "Transferencia_trans_remetente_fkey" FOREIGN KEY ("trans_remetente") REFERENCES "Conta"("con_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transferencia" ADD CONSTRAINT "Transferencia_trans_destinatario_fkey" FOREIGN KEY ("trans_destinatario") REFERENCES "Conta"("con_id") ON DELETE RESTRICT ON UPDATE CASCADE;
