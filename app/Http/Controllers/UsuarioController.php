<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use App\Service\UsuarioService;
use Illuminate\Http\Request;

class UsuarioController extends Controller
{
  protected $UsuarioService;

  public function __construct(UsuarioService $usuarioService)
  {
    $this->UsuarioService = $usuarioService;
  }

  public function store(Request $request)
  {
    $user = $this->UsuarioService->create($request->all());

    return $user;
  }

  public function findbyId($id)
  {
    $result = $this->UsuarioService->findbyId($id);

    return response()->json($result);
  }

  public function index()
  {
    $result = $this->UsuarioService->getAll();

    return response()->json($result);
  }
  public function searchByName(Request $request)
  {
    $result = $this->UsuarioService->searchByName($request->nome);
  }





  public function searchByEmail(Request $request)
  {
    $result = $this->UsuarioService->searchByEmail($request->email);
    return response()->json($result);
  }
  
  
  
  
  
  public function delete($id){
    $result = $this->UsuarioService->delete($id);
    return response()->json($result);
  }
  public function update(Request $request){
    $result = $this-> UsuarioService->update($request->all());
    return response()->json($result);
  }
}
