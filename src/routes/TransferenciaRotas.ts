import { Router } from 'express';
import TransferenciaController from 'controllers/TransferenciaController';

const routes = Router();
const transferenciaController = new TransferenciaController();

routes.post('/create', transferenciaController.criar);
routes.get('/', transferenciaController.buscarTodos);
routes.get('/:id', transferenciaController.buscar);
routes.put('/:id', transferenciaController.atualizar);
routes.delete('/:id', transferenciaController.excluir);

export default routes;