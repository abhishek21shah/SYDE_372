% This function will either classify as A or B
function [classifier] = classify(J,X,Y,discriminants,n_ab,n_ba)
    classifier = -1;
    while (J < numel(discriminants))
        classifier = MED(X,Y,discriminants{J}(1,:),discriminants{J}(2,:));
        if (classifier == 1 && n_ba{J} == 0)
            break;
        end
        if (classifier == 2 && n_ab{J} == 0)
            break;
        end
        J = J + 1;
    end
end