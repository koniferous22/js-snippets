import { T as Tool, L as List } from 'ts-toolbelt';

type ArrayElement<A> = A extends readonly (infer T)[] ? T : never;
type Cast<X, Y> = X extends Y ? X : Y
type FromEntries<T> = T extends [infer Key, any][]
    ? { [K in Cast<Key, string>]: Extract<ArrayElement<T>, [K, any]>[1]}
    : never

type HeadT<T extends any[]> = T extends [infer TT, ...infer RestT] ? TT : never;
type TailT<T extends any[]> = T extends [infer TT, ...infer RestT] ? RestT : never;
type HasTail<T extends any[]> = T extends [infer TT, ...infer RestT] ? true : false;
type Translation = 
| {
  originalField: string;
  translatedField: boolean;
}
| {
  originalField: number;
  translatedField: null;
}

type Translate<OriginalT> = Extract<Translation, { originalField: OriginalT }>['translatedField'];

type ConstructTranslatedAcc<
  EntriesT extends [string, any][],
  ResultT extends any[]
> = {
  1: (
    HeadT<EntriesT> extends [infer EntryKey, infer EntryValue]
    ? ConstructTranslatedAcc<
        Cast<TailT<EntriesT>, [string,any][]>,
        List.Concat<
          ResultT,
          [
            [ 
              EntryKey,
              Translate<EntryValue>
            ]
          ]>
        >
      : never
    );
  0: ResultT;
}[
  HasTail<EntriesT> extends true ? 1 : 0  
];
type ConstructTranslatedT<Entries extends any[]> = ConstructTranslatedAcc<Entries,  []>;

type SampleType = {
  a: string;
  b: string;
  c: number;
  d: number;
};

/* helpers */
type Overwrite<T, S extends any> = { [P in keyof T]: S[Cast<P, keyof S>] };
type TupleUnshift<T extends any[], X> = T extends any ? ((x: X, ...t: T) => void) extends (...t: infer R) => void ? R : never : never;
type TuplePush<T extends any[], X> = T extends any ? Overwrite<TupleUnshift<T, any>, T & { [x: string]: X }> : never;

type UnionToIntersection<U> =(U extends any ? (k: U) => void : never) extends ((k: infer I) => void) ? I : never
type UnionToOvlds<U> = UnionToIntersection<U extends any ? (f: U) => void : never>;
type PopUnion<U> = UnionToOvlds<U> extends ((a: infer A) => void) ? A : never;
/* end helpers */
/* main work */
type UnionToTupleRecursively<T extends any[], U> = {
    1: T;
    0: PopUnion<U> extends infer SELF ? UnionToTupleRecursively<TuplePush<T, SELF>, Exclude<U, SELF>> : never;
}[[U] extends [never] ? 1 : 0]
/* end main work */
type UnionToTuple<U> = UnionToTupleRecursively<[], U>;


type EnhancedTuple<T extends any[], SomeObj> = {
  0: (
    T extends any[]
      ? Tool.Concat<[ [HeadT<T>, SomeObj[Cast<HeadT<T>, keyof SomeObj>] ]], EnhancedTuple<TailT<T>, SomeObj>>
      : [T, 1]
  )
  1: T
}[HasTail<T> extends true ? 0 : 1]
type Entries<T> = EnhancedTuple<UnionToTuple<keyof T>, T>
type Test = Entries<{
  x: 1,
  y: 2
}>;
type TranslateToDifferentSchema<T> = FromEntries<ConstructTranslatedT<Entries<T>>>;
const x: SampleType = {
  a: 'a',
  b: 'b',
  c: 1,
  d: 2
};

const y: TranslateToDifferentSchema<typeof x> = {
  a: true,
  b: false,
  c: null,
  d: null
};
