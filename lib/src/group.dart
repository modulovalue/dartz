part of dartz;

abstract class Group<A> extends Monoid<A> {
  const Group();
  A inverse(A a1, A a2);
}

class _AnonymousGroup<A> extends Group<A> {
  final Function0<A> _zero;
  final Function2<A, A, A> _append;
  final Function2<A, A, A> _inverse;
  
  const _AnonymousGroup(this._zero, this._append, this._inverse);

  @override A append(A a1, A a2) => _append(a1, a2);

  @override A inverse(A a1, A a2) => _inverse(a1, a2);

  @override A zero() => _zero();
}

// 'group' is already defined by the test framework.
Group<A> defineGroup<A>(Function0<A> zero, Function2<A, A, A> append, Function2<A, A, A> inverse) {
  return _AnonymousGroup(zero, append, inverse);
}