import { Router } from 'express';
import UsuarioController from 'controllers/UsuarioController';

const routes = Router();
const usuarioController = new UsuarioController();

routes.post('/create', usuarioController.criar);
routes.get('/', usuarioController.buscarTodos);
routes.get('/:id', usuarioController.buscar);
routes.put('/:id', usuarioController.atualizar);
routes.delete('/:id', usuarioController.excluir);
routes.get('/teste', (_,res) => {
    return res.send('teste')
});
export default routes;