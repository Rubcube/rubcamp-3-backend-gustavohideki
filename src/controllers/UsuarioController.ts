import { Usuario } from "dtos/UsuarioDTO";
import { Request, Response } from "express";
import UsuarioModelo from "models/UsuarioModelo";


const usuarioModelo = new UsuarioModelo();

export default class UsuarioController {

    criar = async (req: Request, res: Response) => {
        try {
            const usuario: Usuario = req.body;
            const novoUsuario: Usuario = await usuarioModelo.criar(usuario);
            res.status(201).json(novoUsuario);
        } catch (e) {
            console.log("Não foi possível criar um usuário", e);
            res.status(500).send({
                error: "USR-01",
                message: "Não foi possível criar um usuário"
            })
        }
    };

    buscar = async (req: Request, res: Response) => {
        try {
            const usu_cpf: string = req.params.usu_cpf;
            const novoUsuario: Usuario | null = await usuarioModelo.buscarUm(usu_cpf);

            if (novoUsuario) {
                res.status(200).json(novoUsuario);
            } else {
                res.status(404).json({
                    error: "USR-06 ",
                    message: "Usuário não encontrado"
                });
            }
        } catch (e) {
            console.log("Usuário não encontrado", e);
            res.status(500).send({
                error: "USR-02",
                message: "Usuário não encontrado"
            })
        }
    }

    buscarTodos = async (req: Request, res: Response) => {
        try {
            const usuario: Usuario[] | null = await usuarioModelo.buscarTodos();
            res.status(200).json(usuario);
        } catch (e) {
            console.log("Não foi possível buscar todos os usuários", e);
            res.status(500).send({
                error: "USR-03",
                message: "Não foi possível buscar todos os usuários",
            });
        }
    }

    atualizar = async (req: Request, res: Response) => {
        try {
            const usu_cpf: string = req.params.usu_cpf;
            const alterarUsuario: Usuario = req.body;
            const usuarioAlterado: Usuario | null = await usuarioModelo.alterar(
                usu_cpf,
                alterarUsuario
            );
            if (usuarioAlterado) {
                res.status(200).json(usuarioAlterado);
            } else {
                res.status(404).json({
                    error: "USR-06",
                    message: "Usuario não encontrado.",
                  });
            }
        } catch (e) {
            console.log("Não foi possível alterar o usuário", e);
            res.status(500).send({
              error: "USR-04",
              message: "Não foi possível alterar o usuário",
            });
          }
        }

    excluir = async (req: Request, res: Response) => {
        try {
            const usu_cpf: string = req.params.usu_cpf;
            const usuarioExcluido = await usuarioModelo.excluir(usu_cpf);
            res.status(204).json(usuarioExcluido);
        } catch (e) {
            console.log("Não foi possível excluir o usuário", e);
            res.status(500).send({
              error: "USR-05",
              message: "Não foi possível excluir o usuário",
            });
        }
    };
}

