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
}