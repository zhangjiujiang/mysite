import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Array "mo:base/Array";

actor {

    public func qsort(arr:[Int]) : async [Int]{
        quicksort(arr)
    };

    func quicksort(arr : [Int]) : [Int] {
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
        Array.append(Array.append(quicksort(left),[point]),quicksort(right));
    };
}