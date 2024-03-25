/*
  Warnings:

  - You are about to drop the column `con_agencia` on the `Conta` table. All the data in the column will be lost.
  - You are about to alter the column `con_senha` on the `Conta` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `Endereco` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[end_id]` on the table `Endereco` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `end_ativo` to the `Endereco` table without a default value. This is not possible if the table is not empty.
  - Added the required column `trans_descricao` to the `Transferencia` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Endereco_usu_cadastro_key";

-- AlterTable
ALTER TABLE "Conta" DROP COLUMN "con_agencia",
ALTER COLUMN "con_num" SET DATA TYPE TEXT,
ALTER COLUMN "con_senha" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "Endereco" DROP CONSTRAINT "Endereco_pkey",
ADD COLUMN     "end_ativo" INTEGER NOT NULL,
ADD COLUMN     "end_id" SERIAL NOT NULL,
ALTER COLUMN "end_num" SET DATA TYPE TEXT,
ADD CONSTRAINT "Endereco_pkey" PRIMARY KEY ("end_id");

-- AlterTable
ALTER TABLE "Transferencia" ADD COLUMN     "trans_descricao" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_end_id_key" ON "Endereco"("end_id");
