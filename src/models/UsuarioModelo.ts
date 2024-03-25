import { PrismaClient } from "@prisma/client";
import { Usuario } from "dtos/UsuarioDTO";


export const prisma = new PrismaClient();

export default class UsuarioModelo {

  criar = async (usuario: Usuario) => {
    return await prisma.usuario.create({
      data: usuario
    })
  }

  buscarTodos = async () => {
    return await prisma.usuario.findMany();
  }

  buscarUm = async (usu_cpf: string) => {
    return await prisma.usuario.findUnique({
      where: {
        usu_cpf
      }
    })
  }

  excluir = async (usu_cpf: string) => {
    return await prisma.usuario.delete({
      where: {
        usu_cpf
      }
    })
  }

  alterar = async (usu_cpf: string, usuario: Usuario) => {
    return await prisma.usuario.update({
      where: {
        usu_cpf
      },
      data: {
        ...usuario
      }
    })
  }

}
