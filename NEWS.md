# fritools 1.2.0

* Skipping tests for `search_files()` if R has not at least version 4.0.0.
* Add function `r_cmd_install()` as a quick alternative to `devtools::install()`.
  `devtools` calling `callr`, calling `processx::run` seemed too bloated for 
  such a simple task.
* Add function `compare_vectors()` which returns a side-by-side comparison of 
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




