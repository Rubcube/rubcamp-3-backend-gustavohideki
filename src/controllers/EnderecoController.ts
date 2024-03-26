
import { Endereco } from "dtos/EnderecoDTO";
import { Request, Response } from "express";
import EnderecoModelo from "models/EnderecoModelo";



const enderecoModelo= new EnderecoModelo();

export default class EnderecoController {

    criar = async (req: Request, res: Response) => {
        try {
            const endereco: Endereco = req.body;
            const novoEndereco: Endereco = await enderecoModelo.criar(endereco);
            res.status(201).json(novoEndereco);
        } catch (e) {
            console.log("Não foi possível criar um endereço", e);
            res.status(500).send({
                error: "USR-01",
                message: "Não foi possível criar um endereço"
            })
        }
    };

    buscar = async (req: Request, res: Response) => {
        try {
            const end_id: number = parseInt(req.params.end_id);
            const novoEndereco: Endereco | null = await enderecoModelo.buscarUm(end_id);

            if (novoEndereco) {
                res.status(200).json(novoEndereco);
            } else {
                res.status(404).json({
                    error: "USR-06 ",
                    message: "Endereço não encontrado"
                });
            }
        } catch (e) {
            console.log("Endereço não encontrado", e);
            res.status(500).send({
                error: "USR-02",
                message: "Endereço não encontrado"
            })
        }
    }

    buscarTodos = async (req: Request, res: Response) => {
        try {
            const agencia: Endereco[] | null = await enderecoModelo.buscarTodos();
            res.status(200).json(agencia);
        } catch (e) {
            console.log("Não foi possível buscar todos os endereços", e);
            res.status(500).send({
                error: "USR-03",
                message: "Não foi possível buscar todos os endereços",
            });
        }
    }

    atualizar = async (req: Request, res: Response) => {
        try {
            const end_id: number = parseInt(req.params.end_id);
            const alterarEndereco: Endereco = req.body;
            const enderecoAlterado: Endereco | null = await enderecoModelo.alterar(
                end_id,
                alterarEndereco
            );
            if (enderecoAlterado) {
                res.status(200).json(enderecoAlterado);
            } else {
                res.status(404).json({
                    error: "USR-06",
                    message: "Endereço não encontrado.",
                  });
            }
        } catch (e) {
            console.log("Não foi possível alterar o endereço", e);
            res.status(500).send({
              error: "USR-04",
              message: "Não foi possível alterar o endereço",
            });
          }
        }

    excluir = async (req: Request, res: Response) => {
        try {
            const end_id: number = parseInt(req.params.end_id);
            const enderecoExcluido = await enderecoModelo.excluir(end_id);
            res.status(204).json(enderecoExcluido);
        } catch (e) {
            console.log("Não foi possível excluir o endereço", e);
            res.status(500).send({
              error: "USR-05",
              message: "Não foi possível excluir o endereço",
            });
        }
    };
}

