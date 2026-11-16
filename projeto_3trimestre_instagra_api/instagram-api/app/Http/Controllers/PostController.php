<?php
namespace App\Http\Controllers;
use App\Models\Post;
use Illuminate\Http\Request;
class PostController extends Controller
{
    // GET /api/posts - lista todos os posts
    public function index()
    {
        return Post::orderBy('id', 'desc')->get();
    }

    // POST /api/posts - cria um novo post
    public function store(Request $request)
    {
        $dados = $request->validate([
        'title' => 'required|string|max:255',
        'text' => 'required|string',
        'liked' => 'sometimes|boolean',
        ]);
        $post = Post::create($dados);
        return response()->json($post, 201);
    }
    // GET /api/posts/{post} - retorna um post

    public function show(Post $post)
    {
        return $post;
    }

    // PUT/PATCH /api/posts/{post} - altera um post
    public function update(Request $request, Post $post)
    {
        $dados = $request->validate([
        'title' => 'sometimes|required|string|max:255',
        'text' => 'sometimes|required|string',
        'liked' => 'sometimes|boolean',
        ]);
        
        $post->update($dados);
        return $post;
    }
    // DELETE /api/posts/{post} - remove um post
    public function destroy(Post $post)
    {
        $post->delete();
        return response()->noContent();
    }
}