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
  public function store(Request $request){
  $user = $this->UsuarioService->create($request->all());

  return $user;

}



}




