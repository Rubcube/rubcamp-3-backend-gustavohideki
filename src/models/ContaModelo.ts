import { PrismaClient } from "@prisma/client";
import { Conta } from "dtos/ContaDTO";

const prisma = new PrismaClient();

export default class ContaModelo {

    criar = async (conta: Conta) => {
        return await prisma.conta.create ({
            data: conta
        });
    }

    buscarTodos = async () => {
        return await prisma.conta.findMany();
    }

    buscarUm = async (con_id: number) => {
        return await prisma.conta.findUnique ({
            where: {
                con_id
            }
        });
    }

    excluir = async (con_id: number) => {
        return await prisma.conta.delete ({
            where: {
                con_id
            }
        });
    }

    alterar = async (con_id: number, conta: Conta) => {
        return await prisma.conta.update ({
            where: {
                con_id
            },
            data: {
                ...conta
            }
        })
    }
}