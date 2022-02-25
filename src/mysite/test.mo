import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Array "mo:base/Array";

func quicksort(arr : [var Int]){
    Debug.print(debug_show(quicksortHelper(Array.freeze(arr))));
};

func quicksortHelper(arr:[Int]) : [Int] {
    if(arr.size() <= 1){return arr};
    let midIndex = Nat.div(arr.size(),2);
    let point = arr[midIndex];
    var left : [Int] = [];
    var right : [Int] = [];
    for (i in Iter.range(0,arr.size()-1)){
        if(midIndex != i){
            if(arr[i] > point){
                let _right = Array.append<Int>(right,Array.make<Int>(arr[i]));
                right := _right;
            }else{
                let _left = Array.append<Int>(left,Array.make<Int>(arr[i]));
                left := _left;
            }
        }
    };
    Array.append(Array.append(quicksortHelper(left),[point]),quicksortHelper(right));
};

let arr : [var Int] = [var 4,3,5,2,7,9,6,1,3,3,1];
quicksort(arr);