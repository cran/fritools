# fritools 2.1.0

* Added `convert_umlauts_to_ascii()`.
* Added `file_last_modified()`.
* Added `is_cran()`, a copy of `fda::CRAN()`.
* `touch()` now creates directories as needed.
* `get_path()` and `set_path()` now throw errors, if a path to get is not set or
  if a path to set is already set and argument `overwrite` is not `TRUE`.

# fritools 2.0.0

* **`search_files()` now throws an error if no matches are found.**
* Added function `search_rows()`.
* Added function `is_success()`.
* Added function `convert_umlauts_to_tex()`.

# fritools 1.4.0

* Added function `split_code_file()`.
* Added function `weighted_variance()`.
* Added function `tapply()` to fix the base version which will not digest
  `data.frame`s as input.

# fritools 1.3.0

* Extended `is_running_on_fvafrcu_machines()` to catch a new machine.
* Added function `with_dir()` as this is often the only function I import from
  package `withr` making `withr` a dependency.
* Added function `get_boolean_envvar()`, `get_run_r_tests()` is
  now a wrapper to that.
* Added function `is_of_length_zero()`.
* Added function `get_unique_string()`.
* Added function `is_r_cmd_check()`.
* Added function `run_r_tests_for_known_hosts()`.
* Added functions `get_path()` and `set_path()`.
* The `matrix` returned by `compare_vectors` now has named rows.

# fritools 1.2.0

* Skipping tests for `search_files()` if R has not at least version 4.0.0.
* Added function `r_cmd_install()` as a quick alternative to `devtools::install()`.
  `devtools` calling `callr`, calling `processx::run` seemed too bloated for 
  such a simple task.
* Added function `compare_vectors()` which returns a side-by-side comparison of 
  two vectors.
* Updated test\_helper to recognize machines running at the Forest Research
  Institute of the state of Baden-Wuerttemberg.

# fritools 1.1.0

* Fixed buggy regular expression in `is_running_on_gitlab_com()`
* Added `get_options`, `set_options`, `is_force`; 
  `call_conditionally`, `call_safe`;
  `is_installed`, `is_r_package_installed`;
  `is_false`, `is_null_or_true`;
  `search_files`, `find_files`, `summary.filesearch` and
  `strip_off_attributes`
  from package `packager`.


# fritools 1.0.0

* Got the compilation of utilities from
   - rasciidoc/R/utils.R: *
   - packager/R/is\_version\_sufficient.R: *
   - rasciidoc/R/is\_version\_sufficient.R: *
   - document/R/test\_helpers.R: *
   - fakemake/R/tools.R: *
   - cleanr/R/utils.R: *
   - bundeswaldinventur/R/utils.R: golden\_ratio()
   - cuutils/R/utils.R: *
   - cuutils/R/?.R: ?
   - packager/R/package\_version.R




