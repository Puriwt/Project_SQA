<?php

namespace App\Http\Controllers;

use App\Models\Academicwork;
use App\Models\Paper;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $id = auth()->user()->id;
       
        if (auth()->user()->hasRole('admin') or auth()->user()->hasRole('staff')) {
           
            $books = Academicwork::where('ac_type', '=', 'book')->get();
           
        } else {
            
            $books = Academicwork::with('user')->whereHas('user', function ($query) use ($id) {
                 $query->where('users.id', '=', $id);
            })->paginate(10);
        }

        
        return view('books.index', compact('books'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('books.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'ac_name' => 'required',
            
            'ac_year' => 'required',
        ]);

        $input = $request->except(['_token']);
        $input['ac_type'] = 'book';
        $acw = Academicwork::create($input);
        
        $id = auth()->user()->id;
        $user = User::find($id);
        $user->academicworks()->attach($acw);
        return redirect()->route('books.index')->with('success', 'book created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $paper = Academicwork::find($id);
        return view('books.show', compact('paper'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $book = Academicwork::find($id);
        $this->authorize('update', $book);
        return view('books.edit', compact('book'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
       
        $book = Academicwork::find($id);
       
        $this->validate($request, [
            'ac_name' => 'required',
            
            'ac_year' => 'required',
        ]);

        $input = $request->except(['_token']);
        $input['ac_type'] = 'book';

        $book->update($input);
    
        return redirect()->route('books.index')
                        ->with('success','Book updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $book = Academicwork::find($id);
        $this->authorize('delete', $book);
        $book->delete();

        return redirect()->route('books.index')
            ->with('success', 'Product deleted successfully');
    }
}
