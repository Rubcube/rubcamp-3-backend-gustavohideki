import { PrismaClient } from "@prisma/client";
import { Transferencia } from "dtos/TransferenciaDTO";


const prisma = new PrismaClient();

export default class ContaModelo {

    criar = async (transferencia: Transferencia) => {
        return await prisma.transferencia.create ({
            data: transferencia
        });
    }

    buscarTodos = async () => {
        return await prisma.transferencia.findMany();
    }

    buscarUm = async (trans_id: number) => {
        return await prisma.transferencia.findUnique ({
            where: {
                trans_id
            }
        });
    }

    excluir = async (trans_id: number) => {
        return await prisma.transferencia.delete ({
            where: {
                trans_id
            }
        });
    }

    alterar = async (trans_id: number, transferencia: Transferencia) => {
        return await prisma.transferencia.update ({
            where: {
                trans_id
            },
            data: {
                ...transferencia
            }
        })
    }
}