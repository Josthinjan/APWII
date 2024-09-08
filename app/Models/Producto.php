<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    // Tabla asociada al modelo
    protected $table = 'producto';

    // Llave primaria
    protected $primaryKey = 'id_producto';

    // Atributos que se pueden asignar de manera masiva
    protected $fillable = [
        'nombre_producto',
        'tipo_producto',
        'descripcion_producto',
        'precio',
        'cantidad',
        'id_etiqueta',
        'isActive'
    ];

    // Relación con el modelo Etiqueta (muchos productos pueden tener una etiqueta)
    public function etiqueta()
    {
        return $this->belongsTo(Etiqueta::class, 'id_etiqueta', 'id_etiqueta');
    }
}
