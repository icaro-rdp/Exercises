# x <- rnorm(100)
# y <- rnorm(100)

# # One sample t-test two-sided

# t_test_one_sample <- t.test(x, mu = 0)
# t_test_one_sample_one_sided_great <- t.test(x, mu = 0, alternative = "greater")
# t_test_one_sample_one_sided_less <- t.test(x, mu = 0, alternative = "less")

# # t-test for independent samples

# t_test <- t.test(x, y)
# t_test_one_sided_great <- t.test(x, y, alternative = "greater")
# t_test_one_sided_less <- t.test(x, y, alternative = "less")

# # Welch's t-test for independent samples

# t_test_welch <- t.test(x, y, var.equal = FALSE)
# t_test_welch_one_sided_great <- t.test(x, y, var.equal = FALSE, alternative = "greater")
# t_test_welch_one_sided_less <- t.test(x, y, var.equal = FALSE, alternative = "less")


# # Paired t-test

# t_test_paired <- t.test(x, y, paired = TRUE)
# t_test_paired_one_sided_great <- t.test(x, y, paired = TRUE, alternative = "greater")
# t_test_paired_one_sided_less <- t.test(x, y, paired = TRUE, alternative = "less")

# print(t_test_one_sample)
# print(t_test_one_sample_one_sided_great)
# print(t_test_one_sample_one_sided_less)

# print(t_test)
# print(t_test_one_sided_great)
# print(t_test_one_sided_less)

# print(t_test_welch)
# print(t_test_welch_one_sided_great)
# print(t_test_welch_one_sided_less)

# print(t_test_paired)
# print(t_test_paired_one_sided_great)
# print(t_test_paired_one_sided_less)


# X <- c(c(rep("a", 25), rep("b", 20), rep("c", 15)))

# print(cumsum((table(X) / length(X)) * 100))
# print(sum(cumsum(table(X) / length(X))))

genres <- c("m", "f", "m", "f", "m", "f", "m", "f", "m", "f")
another_var <- c("a", "b", "f", "b", "a", "b", "a", "b", "a", "b")
ct <- table(genres, another_var)
print(ct)
print(margin.table(ct, 2))
print(mean(margin.table(ct, 2)))
print(apply(ct, 2, sum))
