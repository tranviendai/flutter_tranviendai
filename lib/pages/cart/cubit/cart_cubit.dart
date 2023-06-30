import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tranviendai/app/model/product_model.dart';

class CartCubit extends Cubit<List<Shoe>> {
  CartCubit() : super([]);

   void fetchShoes(){
     emit(state);
   }
    double get subTotal => state.fold(0, (total, current) => total + (current.price! * current.quantity));
   



   void addShoe(Shoe shoe){
    state.add(shoe);
    emit([...state]);
   }

   void removeShoe(Shoe shoe){
    state.remove(shoe);
    emit([...state]);
   }
}

