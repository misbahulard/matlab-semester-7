function bit = check_rule(bits, ruleset)
    if bits(1) == 0 && bits(2) == 0 && bits(3) == 0
        bit = ruleset(1);
    end
    if bits(1) == 0 && bits(2) == 0 && bits(3) == 1
        bit = ruleset(2);
    end
    if bits(1) == 0 && bits(2) == 1 && bits(3) == 0
        bit = ruleset(3);
    end
    if bits(1) == 0 && bits(2) == 1 && bits(3) == 1
        bit = ruleset(4);
    end
    if bits(1) == 1 && bits(2) == 0 && bits(3) == 0
        bit = ruleset(5);
    end
    if bits(1) == 1 && bits(2) == 0 && bits(3) == 1
        bit = ruleset(6);
    end
    if bits(1) == 1 && bits(2) == 1 && bits(3) == 0
        bit = ruleset(7);
    end
    if bits(1) == 1 && bits(2) == 1 && bits(3) == 1
        bit = ruleset(8);
    end
end