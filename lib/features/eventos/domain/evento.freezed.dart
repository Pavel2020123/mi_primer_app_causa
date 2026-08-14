// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Evento {

 String get id; String get nombre; String get descripcion; Ubicacion get ubicacion; DateTime get fecha; EstadoEvento get estado; List<String> get inscritos;
/// Create a copy of Evento
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventoCopyWith<Evento> get copyWith => _$EventoCopyWithImpl<Evento>(this as Evento, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Evento&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.ubicacion, ubicacion) || other.ubicacion == ubicacion)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other.inscritos, inscritos));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,ubicacion,fecha,estado,const DeepCollectionEquality().hash(inscritos));



}

/// @nodoc
abstract mixin class $EventoCopyWith<$Res>  {
  factory $EventoCopyWith(Evento value, $Res Function(Evento) _then) = _$EventoCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String descripcion, Ubicacion ubicacion, DateTime fecha, EstadoEvento estado, List<String> inscritos
});




}
/// @nodoc
class _$EventoCopyWithImpl<$Res>
    implements $EventoCopyWith<$Res> {
  _$EventoCopyWithImpl(this._self, this._then);

  final Evento _self;
  final $Res Function(Evento) _then;

/// Create a copy of Evento
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? ubicacion = null,Object? fecha = null,Object? estado = null,Object? inscritos = null,}) {
  return _then(Evento(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,ubicacion: null == ubicacion ? _self.ubicacion : ubicacion // ignore: cast_nullable_to_non_nullable
as Ubicacion,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoEvento,inscritos: null == inscritos ? _self.inscritos : inscritos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Evento].
extension EventoPatterns on Evento {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Evento value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Evento() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Evento value)  $default,){
final _that = this;
switch (_that) {
case _Evento():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Evento value)?  $default,){
final _that = this;
switch (_that) {
case _Evento() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String descripcion,  Ubicacion ubicacion,  DateTime fecha,  EstadoEvento estado,  List<String> inscritos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Evento() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.ubicacion,_that.fecha,_that.estado,_that.inscritos);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String descripcion,  Ubicacion ubicacion,  DateTime fecha,  EstadoEvento estado,  List<String> inscritos)  $default,) {final _that = this;
switch (_that) {
case _Evento():
return $default(_that.id,_that.nombre,_that.descripcion,_that.ubicacion,_that.fecha,_that.estado,_that.inscritos);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String descripcion,  Ubicacion ubicacion,  DateTime fecha,  EstadoEvento estado,  List<String> inscritos)?  $default,) {final _that = this;
switch (_that) {
case _Evento() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.ubicacion,_that.fecha,_that.estado,_that.inscritos);case _:
  return null;

}
}

}

/// @nodoc


class _Evento extends Evento {
  const _Evento({required this.id, required this.nombre, required this.descripcion, required this.ubicacion, required this.fecha, required this.estado,  List<String> inscritos = const <String>[]}): _inscritos = inscritos,super._();
  

@override final  String id;
@override final  String nombre;
@override final  String descripcion;
@override final  Ubicacion ubicacion;
@override final  DateTime fecha;
@override final  EstadoEvento estado;
 final  List<String> _inscritos;
@override@JsonKey() List<String> get inscritos {
  if (_inscritos is EqualUnmodifiableListView) return _inscritos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inscritos);
}


/// Create a copy of Evento
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventoCopyWith<_Evento> get copyWith => __$EventoCopyWithImpl<_Evento>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Evento&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.ubicacion, ubicacion) || other.ubicacion == ubicacion)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other._inscritos, _inscritos));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,ubicacion,fecha,estado,const DeepCollectionEquality().hash(_inscritos));



}

/// @nodoc
abstract mixin class _$EventoCopyWith<$Res> implements $EventoCopyWith<$Res> {
  factory _$EventoCopyWith(_Evento value, $Res Function(_Evento) _then) = __$EventoCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String descripcion, Ubicacion ubicacion, DateTime fecha, EstadoEvento estado, List<String> inscritos
});




}
/// @nodoc
class __$EventoCopyWithImpl<$Res>
    implements _$EventoCopyWith<$Res> {
  __$EventoCopyWithImpl(this._self, this._then);

  final _Evento _self;
  final $Res Function(_Evento) _then;

/// Create a copy of Evento
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? ubicacion = null,Object? fecha = null,Object? estado = null,Object? inscritos = null,}) {
  return _then(_Evento(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,ubicacion: null == ubicacion ? _self.ubicacion : ubicacion // ignore: cast_nullable_to_non_nullable
as Ubicacion,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoEvento,inscritos: null == inscritos ? _self._inscritos : inscritos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
