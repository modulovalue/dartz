part of dartz;

abstract class Group<A> extends Monoid<A> {
  static Group<A> define<A>(Function0<A> zero, Function2<A, A, A> append, Function2<A, A, A> inverse) => _AnonymousGroup(zero, append, inverse);

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

class DoubleProductGroup extends Group<double> {
  const DoubleProductGroup();
  @override double append(double a1, double a2) => a1 * a2;
  @override double inverse(double a1, double a2) => a1 / a2;
  @override double zero() => 1;
}

class DoubleSumGroup extends Group<double> {
  const DoubleSumGroup();
  @override double append(double a1, double a2) => a1 + a2;
  @override double inverse(double a1, double a2) => a1 - a2;
  @override double zero() => 0;
}

class NumProductGroup extends NumProductMonoid implements Group<num>  {
  const NumProductGroup();
  @override num inverse(num a1, num a2) => a1 / a2;
}

class NumSumGroup extends NumSumMonoid implements Group<num>  {
  const NumSumGroup();
  @override num inverse(num a1, num a2) => a1 - a2;
}