function p = predict(Theta1, Theta2, X)
    %PREDICT Predict the label of an input given a trained neural network
    %   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
    %   trained weights of a neural network (Theta1, Theta2)

    % Useful values
    m = size(X, 1);
    num_labels = size(Theta2, 1);

    % You need to return the following variables correctly
    p = zeros(size(X, 1), 1);

    % ====================== YOUR CODE HERE ======================
    % Instructions: Complete the following code to make predictions using
    %               your learned neural network. You should set p to a
    %               vector containing labels between 1 to num_labels.
    %
    % Hint: The max function might come in useful. In particular, the max
    %       function can also return the index of the max element, for more
    %       information see 'help max'. If your examples are in rows, then, you
    %       can use max(A, [], 2) to obtain the max for each row.
    %

    % ! first create the (l1+1)*m matrix a_1, Theta1 is of l2*(l1+1) so a_2 is of l2*m
    a_1 = [ones(1, m); X'];
    z_2 = Theta1 * a_1;
    a_2 = sigmoid(z_2);

    a_2 = [ones(1, m); a_2];
    z_3 = Theta2 * a_2;
    a_3 = sigmoid(z_3);

    % ! Then a_3 is of l3*m, we take the transpose and take the maximum probability of each row (each row represents a data sample) and takes the index (which corresponds to the category).
    [maxProb ix] = max(a_3', [], 2);
    p = ix;

    % =========================================================================

end
