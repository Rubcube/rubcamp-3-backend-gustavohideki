import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
    await prisma.usuario.create({
        data: {
            usu_cadastro: 'teste',
            usu_nome: 'teste',
            usu_email: 'teste@gmail.com',
            usu_telefone: '123456789',
            usu_dtNasc: new Date(),
            usu_senha: 'teste'           
        }
      
    })

    const editarUsuario = await prisma.usuario.update({
        where: {usu_cadastro: 'teste'},
        data: {
            usu_nome: 'modificado'
        }
    })

    const apagarUsuario = await prisma.usuario.delete({
      where: {usu_cadastro: 'teste'}
    })

    const buscarUsuario = await prisma.usuario.findUnique({
      where: {usu_cadastro: 'teste'}
    })

    const buscarUsuarioNome = await prisma.usuario.findMany({
      where: {usu_nome: 'teste'}
    })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })