part of dartz;

abstract class Eq<A> {
  const Eq();
  bool eq(A a1, A a2);
  bool neq(A a1, A a2) => !eq(a1, a2);
}

abstract class EqOps<A> {
  const EqOps();
  bool eq(A other);
  bool neq(A other) => !eq(other);
}

typedef bool EqF<A>(A a1, A a2);
class _AnonymousEq<A> extends Eq<A> {
  final EqF<A> _f;
  const _AnonymousEq(this._f);
  @override bool eq(A a1, A a2) => _f(a1, a2);
}

Eq<A> eq<A>(EqF<A> f) => new _AnonymousEq(f);

final Eq<Object> ObjectEq = eq((o1, o2) => o1 == o2);
Eq<A> objectEq<A extends Object>() => eq((o1, o2) => o1 == o2);
