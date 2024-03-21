import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const usuario = await prisma.usuario.create({
    data: {
        usu_cadastro: '1234567',
        usu_nome: 'teste',
        usu_email: 'teste@gmail.com',
        usu_telefone: '123456789',
        usu_dtNasc: new Date(18042002),
        usu_senha: 'senha123'
    }
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