# Valuer

    require "valuer"

    Valuer.value Integer, "20"
    => 20

    Valuer.value Integer, "20x"
    => Valuer::Error (invalid value for Integer(): "20x")

    Valuer.value Integer, "20x", default: -1
    => -1

    Valuer.value Integer, "20", min: 21
    => Valuer::MinimumError (minimum is 21)

    Valuer.value Integer, "20", min: 19
    => Valuer::MaximumError (maximum is 19)

    Valuer.value Float, "1.2", min: 1, max: 20
    => 1.2

    Valuer.value TrueClass, "yes"
    => true

    Valuer.value TrueClass, "no"
    => false