import { Router } from 'express';
import EnderecoController from 'controllers/EnderecoController';

const routes = Router();
const enderecoController = new EnderecoController();

routes.post('/create', enderecoController.criar);
routes.get('/', enderecoController.buscarTodos);
routes.get('/:id', enderecoController.buscar);
routes.put('/:id', enderecoController.atualizar);
routes.delete('/:id', enderecoController.excluir);

export default routes;