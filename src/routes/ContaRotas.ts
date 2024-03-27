import { Router } from 'express';
import ContaController from 'controllers/ContaController';

const routes = Router();
const contaController = new ContaController();

routes.post('/create', contaController.criar);
routes.get('/', contaController.buscarTodos);
routes.get('/:id', contaController.buscar);
routes.put('/:id', contaController.atualizar);
routes.delete('/:id', contaController.excluir);

export default routes;