/*
  Warnings:

  - The primary key for the `Conta` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `usu_cadastro` on the `Conta` table. All the data in the column will be lost.
  - You are about to drop the column `usu_cadastro` on the `Endereco` table. All the data in the column will be lost.
  - The primary key for the `Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `usu_cadastro` on the `Usuario` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[usu_cpf]` on the table `Conta` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[usu_cpf]` on the table `Usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `usu_cpf` to the `Conta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usu_cpf` to the `Endereco` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usu_cpf` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Conta" DROP CONSTRAINT "Conta_usu_cadastro_fkey";

-- DropForeignKey
ALTER TABLE "Endereco" DROP CONSTRAINT "Endereco_usu_cadastro_fkey";

-- DropIndex
DROP INDEX "Conta_usu_cadastro_key";

-- DropIndex
DROP INDEX "Usuario_usu_cadastro_key";

-- AlterTable
ALTER TABLE "Conta" DROP CONSTRAINT "Conta_pkey",
DROP COLUMN "usu_cadastro",
ADD COLUMN     "usu_cpf" TEXT NOT NULL,
ADD CONSTRAINT "Conta_pkey" PRIMARY KEY ("usu_cpf");

-- AlterTable
ALTER TABLE "Endereco" DROP COLUMN "usu_cadastro",
ADD COLUMN     "usu_cpf" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Usuario" DROP CONSTRAINT "Usuario_pkey",
DROP COLUMN "usu_cadastro",
ADD COLUMN     "usu_cpf" TEXT NOT NULL,
ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("usu_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "Conta_usu_cpf_key" ON "Conta"("usu_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_usu_cpf_key" ON "Usuario"("usu_cpf");

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_usu_cpf_fkey" FOREIGN KEY ("usu_cpf") REFERENCES "Usuario"("usu_cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Conta" ADD CONSTRAINT "Conta_usu_cpf_fkey" FOREIGN KEY ("usu_cpf") REFERENCES "Usuario"("usu_cpf") ON DELETE RESTRICT ON UPDATE CASCADE;
