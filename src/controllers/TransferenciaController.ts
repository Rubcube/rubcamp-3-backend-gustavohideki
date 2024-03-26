
import { Request, Response } from "express";
import { Transferencia } from '../dtos/TransferenciaDTO';
import TransferenciaModelo from "models/TransferenciaModelo"





const transferenciaModelo= new TransferenciaModelo();

export default class TransferenciaController {

    criar = async (req: Request, res: Response) => {
        try {
            const transferencia: Transferencia = req.body;
            const novaTransferencia: Transferencia = await transferenciaModelo.criar(transferencia);
            res.status(201).json(novaTransferencia);
        } catch (e) {
            console.log("Não foi possível criar uma transferencia", e);
            res.status(500).send({
                error: "USR-01",
                message: "Não foi possível criar uma transferencia"
            })
        }
    };

    buscar = async (req: Request, res: Response) => {
        try {
            const trans_id: number = parseInt(req.params.con_id);
            const novaTransferencia: Transferencia | null = await transferenciaModelo.buscarUm(trans_id);

            if (novaTransferencia) {
                res.status(200).json(novaTransferencia);
            } else {
                res.status(404).json({
                    error: "USR-06 ",
                    message: "Transferencia não encontrada"
                });
            }
        } catch (e) {
            console.log("Transferencia não encontrada", e);
            res.status(500).send({
                error: "USR-02",
                message: "Transferencia não encontrada"
            })
        }
    }

    buscarTodos = async (req: Request, res: Response) => {
        try {
            const transferencia: Transferencia[] | null = await transferenciaModelo.buscarTodos();
            res.status(200).json(transferencia);
        } catch (e) {
            console.log("Não foi possível buscar todas as transferencias", e);
            res.status(500).send({
                error: "USR-03",
                message: "Não foi possível buscar todas as transferencias",
            });
        }
    }

    atualizar = async (req: Request, res: Response) => {
        try {
            const trans_id: number = parseInt(req.params.trans_id);
            const alterarTransferencia: Transferencia = req.body;
            const transferenciaAlerada: Transferencia | null = await transferenciaModelo.alterar(
                trans_id,
                alterarTransferencia
            );
            if (transferenciaAlerada) {
                res.status(200).json(transferenciaAlerada);
            } else {
                res.status(404).json({
                    error: "USR-06",
                    message: "Transferencia não encontrada.",
                  });
            }
        } catch (e) {
            console.log("Não foi possível alterar a Transferencia", e);
            res.status(500).send({
              error: "USR-04",
              message: "Não foi possível alterar a Transferencia",
            });
          }
        }

    excluir = async (req: Request, res: Response) => {
        try {
            const trans_id: number = parseInt(req.params.trans_id);
            const TransferenciaExcluida = await transferenciaModelo.excluir(trans_id);
            res.status(204).json(TransferenciaExcluida);
        } catch (e) {
            console.log("Não foi possível excluir a Transferencia", e);
            res.status(500).send({
              error: "USR-05",
              message: "Não foi possível excluir a Transferencia",
            });
        }
    };
}

