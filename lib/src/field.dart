part of dartz;

class Field<A> {
  static Field<A> define<A>(Group<A> addition, Group<A> multiplication) => _AnonymousField(addition, multiplication);
  const Field(this.addition, this.multiplication);
  final Group<A> addition;
  final Group<A> multiplication;
}

class _AnonymousField<A> extends Field<A> {
  const _AnonymousField(Group<A> addition, Group<A> multiplication) : super(addition, multiplication);
}

class DoubleField extends Field<double> {
  const DoubleField() : super(const DoubleSumGroup(), const DoubleProductGroup());
}

class NumField extends Field<num> {
  const NumField() : super(const NumSumGroup(), const NumProductGroup());
}