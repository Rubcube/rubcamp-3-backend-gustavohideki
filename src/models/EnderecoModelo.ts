import { PrismaClient } from "@prisma/client";
import { Endereco } from '../dtos/EnderecoDTO';

const prisma = new PrismaClient();

export default class EnderecoModelo {

    criar = async (endereco: Endereco) => {
        return await prisma.endereco.create({
          data: endereco
        });
      }
    
    buscarTodos = async () => {
        return await prisma.endereco.findMany();
    }

    buscarUm = async (end_id:number) => {
        return await prisma.endereco.findUnique ({
            where: {
                end_id
            }
        })
    }

    apagar = async (end_id: number) => {
        return await prisma.endereco.delete({
            where:{
                end_id
            }
        })
    }

    alterar = async (end_id: number, endereco: Endereco) => {
        return await prisma.endereco.update ({
            where: {
                end_id
            },
            data: {
                ...endereco
            }
        })
    }
}