# installing rJava on MacOS
# https://zhiyzuo.github.io/installation-rJava/
# https://cran.r-project.org/web/packages/h2o/h2o.pdf

# OMG !!!! 
# SDK man may help
# https://sdkman.io/usage

#dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/jre/lib/server/libjvm.dylib')

# didn't work
#Last login: Thu Apr 25 18:17:52 on console
#Marks-MacBook-Air:~ markloessi$ ~$ ls /Library/Java/JavaVirtualMachines/
#  -bash: ~$: command not found
#Marks-MacBook-Air:~ markloessi$ ~$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#-bash: ~$: command not found

install.packages("h2o", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/rel-jacobi/2/R", getOption("repos"))))
library('h2o')

Java_home='Library/Java/JavaVirtualMachines/jdk1.8.0_212'
Java_home
localH2O = h2o.init(ip = "localhost", port = 54321, name = NA_character_,
         startH2O = TRUE, forceDL = FALSE, enable_assertions = TRUE,
         license = NULL, nthreads = -1, max_mem_size = NULL,
         min_mem_size = NULL, ice_root = tempdir(), log_dir = NA_character_,
         log_level = NA_character_, strict_version_check = TRUE,
         proxy = NA_character_, https = FALSE, insecure = FALSE,
         username = NA_character_, password = NA_character_,
         cookies = NA_character_, context_path = NA_character_,
         ignore_config = FALSE, extra_classpath = NULL,
         jvm_custom_args = NULL, bind_to_localhost = TRUE)

demo(h2o.kmeans)





