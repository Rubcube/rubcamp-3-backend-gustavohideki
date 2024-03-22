-- AlterTable
ALTER TABLE "Conta" ALTER COLUMN "con_senha" SET DATA TYPE BIGINT;

-- AlterTable
CREATE SEQUENCE transferencia_trans_id_seq;
ALTER TABLE "Transferencia" ALTER COLUMN "trans_id" SET DEFAULT nextval('transferencia_trans_id_seq');
ALTER SEQUENCE transferencia_trans_id_seq OWNED BY "Transferencia"."trans_id";
