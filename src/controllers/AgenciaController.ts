
import { Agencia } from "dtos/AgenciaDTO";
import { Request, Response } from "express";
import AgenciaModelo from "models/AgenciaModelo";




const agenciaModelo= new AgenciaModelo();

export default class AgenciaController {

    criar = async (req: Request, res: Response) => {
        try {
            const agencia: Agencia = req.body;
            const novaAgencia: Agencia = await agenciaModelo.criar(agencia);
            res.status(201).json(novaAgencia);
        } catch (e) {
            console.log("Não foi possível criar uma conta", e);
            res.status(500).send({
                error: "USR-01",
                message: "Não foi possível criar uma conta"
            })
        }
    };

    buscar = async (req: Request, res: Response) => {
        try {
            const age_nome: string = req.params.age_nome;
            const novaAgencia: Agencia | null = await agenciaModelo.buscarUm(age_nome);

            if (novaAgencia) {
                res.status(200).json(novaAgencia);
            } else {
                res.status(404).json({
                    error: "USR-06 ",
                    message: "Agencia não encontrada"
                });
            }
        } catch (e) {
            console.log("Agencia não encontrada", e);
            res.status(500).send({
                error: "USR-02",
                message: "Agencia não encontrada"
            })
        }
    }

    buscarTodos = async (req: Request, res: Response) => {
        try {
            const conta: Conta[] | null = await contaModelo.buscarTodos();
            res.status(200).json(conta);
        } catch (e) {
            console.log("Não foi possível buscar todas as contas", e);
            res.status(500).send({
                error: "USR-03",
                message: "Não foi possível buscar todas as contas",
            });
        }
    }

    atualizar = async (req: Request, res: Response) => {
        try {
            const con_id: number = parseInt(req.params.con_id);
            const alterarConta: Conta = req.body;
            const contaAlerada: Conta | null = await contaModelo.alterar(
                con_id,
                alterarConta
            );
            if (contaAlerada) {
                res.status(200).json(contaAlerada);
            } else {
                res.status(404).json({
                    error: "USR-06",
                    message: "Conta não encontrada.",
                  });
            }
        } catch (e) {
            console.log("Não foi possível alterar a conta", e);
            res.status(500).send({
              error: "USR-04",
              message: "Não foi possível alterar a conta",
            });
          }
        }

    excluir = async (req: Request, res: Response) => {
        try {
            const con_id: number = parseInt(req.params.con_id);
            const contaExcluida = await contaModelo.excluir(con_id);
            res.status(204).json(contaExcluida);
        } catch (e) {
            console.log("Não foi possível excluir a conta", e);
            res.status(500).send({
              error: "USR-05",
              message: "Não foi possível excluir a conta",
            });
        }
    };
}

