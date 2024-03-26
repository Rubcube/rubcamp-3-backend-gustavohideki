/*
  Warnings:

  - You are about to alter the column `age_num` on the `Agencia` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The `end_ativo` column on the `Endereco` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Agencia" ALTER COLUMN "age_num" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "Endereco" ADD COLUMN     "end_dtCriado" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "end_dtModificado" TIMESTAMP(3),
DROP COLUMN "end_ativo",
ADD COLUMN     "end_ativo" BOOLEAN;
