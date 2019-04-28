# from article on Installing Modelplotr
# https://modelplot.github.io/intro_modelplotpy.html
# https://www.r-bloggers.com/modelplotr-v1-0-now-on-cran-visualize-the-business-value-of-your-predictive-models/ 

# interesting comparison of models in R

setwd("~/R_programing/R_randomCode/modelplotr - predictive models")
# Data in your folder: modelplotr - predictive models

#install.packages("RDocumentation")
# https://github.com/datacamp/Rdocumentation
library('RDocumentation')
#install.packages('modelplotr')
library('modelplotr')
# command line pip install git+https://github.com/modelplot/modelplotpy.git
# command line import modelplotpy as mp

# download bank data and prepare 
# Dataset description https://archive.ics.uci.edu/ml/datasets/Bank+Marketing#
#zipname = 'https://archive.ics.uci.edu/ml/machine-learning-databases/00222/bank-additional.zip'
# we encountered that the source at uci.edu is not always available, therefore we made a copy to our repos.
zipname = 'https://modelplot.github.io/img/bank-additional.zip'
csvname = 'bank-additional/bank-additional-full.csv'
temp <- tempfile()
download.file(zipname,temp, mode="wb")
bank <- read.table(unzip(temp,csvname),sep=";", stringsAsFactors=FALSE,header = T)
unlink(temp)
# rename headings
bank <- bank[,c('y','duration','campaign','pdays','previous','euribor3m')]
# look at bank
bank
# rename target class value 'yes' for better interpretation and convert to factor
bank$y[bank$y=='yes'] <- 'term.deposit'
bank$y <- as.factor(bank$y)

#explore data
str(bank)
## 'data.frame':    41188 obs. of  6 variables:
##  $ y        : Factor w/ 2 levels "no","term.deposit": 1 1 1 1 1 1 1 1 1 1 ...
##  $ duration : int  261 149 226 151 307 198 139 217 380 50 ...
##  $ campaign : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ pdays    : int  999 999 999 999 999 999 999 999 999 999 ...
##  $ previous : int  0 0 0 0 0 0 0 0 0 0 ...
##  $ euribor3m: num  4.86 4.86 4.86 4.86 4.86 ...

# On this data, we’ve applied some predictive modeling techniques. 
# To show modelplotr can be used for any kind of model, built with numerous 
# packages, we’ve created some models with the caret package, the mlr package, 
# the h2o package and the keras package. These four are very popular R packages 
# to build models with many predictive modeling techniques, such as logistic 
# regression, random forest, XG boost, svm, neural nets and many, many others. 
# When you’ve built your model with one of these packages, using modelplotr 
# is super simple.

# mlr, caret, h2o and keras provide numerous different algorithms for binary 
# classification. It should be noted, that to use our modelplotr package, you 
# don’t have to use one of these packages to build your models. It’s just a tiny 
# bit more work to use modelplotr for models created differently, using R or even 
# outside or R! More on this in the vignette (see: vignette(modelplotr) or go here. 
# For now, to have a few models to evaluate with our plots, we do take advantage 
# of mlr’s/caret’s/h2o’s/keras’ greatness.

# prepare data for training and train models 
test_size = 0.3
train_index =  sample(seq(1, nrow(bank)),size = (1 - test_size)*nrow(bank) ,replace = F)
train = bank[train_index,]
test = bank[-train_index,]

#train models using mlr...
#install.packages('ParamHelpers')
library('ParamHelpers')
#install.packages('mlr')
library('mlr')
trainTask <- mlr::makeClassifTask(data = train, target = "y")
testTask <- mlr::makeClassifTask(data = test, target = "y")
# mlr::configureMlr() # this line is needed when using mlr without loading it (mlr::)
task = mlr::makeClassifTask(data = train, target = "y")
#install.packages('randomForest')
library('randomForest')
lrn = mlr::makeLearner("classif.randomForest", predict.type = "prob")
rf = mlr::train(lrn, task)

# train models using caret...
# setting caret cross validation, here tuned for speed (not accuracy!)
#install.packages('caret')
library('lattice')
library('ggplot2')
library('caret')
fitControl <- caret::trainControl(method = "cv",number = 2,classProbs=TRUE)
# mnl model using glmnet package
#install.packages('glmnet')
library('Matrix')
library('foreach')
library('glmnet')
#install.packages('e1071')
library('e1071')
mnl = caret::train(y ~.,data = train, method = "glmnet",trControl = fitControl)
## Warning in load(system.file("models", "models.RData", package = "caret")):
## strings not representable in native encoding will be translated to UTF-8
# have a look
mnl

# train models using h2o...    !!!!!! not working :( needs Java Virtual Machine
#install.packages('h2o')
library('h2o')

# my added stuff to get h2o working
# http://docs.h2o.ai/h2o/latest-stable/h2o-docs/downloading.html#install-in-r
if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
pkgs <- c("RCurl","jsonlite")
  for (pkg in pkgs) {
    if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}
install.packages("h2o", type="source", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/latest_stable_R")))
library(h2o)
localH2O = h2o.init()
demo(h2o.kmeans)

h2o.init()

h2o.init(ip = "localhost", port = 54321, name = NA_character_,
         startH2O = TRUE, forceDL = FALSE, enable_assertions = TRUE,
         license = NULL, nthreads = -1, max_mem_size = NULL,
         min_mem_size = NULL, ice_root = tempdir(), log_dir = NA_character_,
         log_level = NA_character_, strict_version_check = TRUE,
         proxy = NA_character_, https = FALSE, insecure = FALSE,
         username = NA_character_, password = NA_character_,
         cookies = NA_character_, context_path = NA_character_,
         ignore_config = FALSE, extra_classpath = NULL,
         jvm_custom_args = NULL, bind_to_localhost = TRUE)

h2o::h2o.init()
## Warning in h2o.clusterInfo(): 
## Your H2O cluster version is too old (3 months and 27 days)!
## Please download and install the latest version from http://h2o.ai/download/
## will need Java environment to run
h2o::h2o.no_progress()
h2o_train = h2o::as.h2o(train)
h2o_test = h2o::as.h2o(test)
gbm <- h2o::h2o.gbm(y = "y",
                    x = setdiff(colnames(train), "y"),
                    training_frame = h2o_train,
                    nfolds = 5)

## train models using keras. This was a beast!
# https://keras.rstudio.com 
# for the %>% to work you need one of these packages
#install.packages("magrittr") # only needed the first time you use it
library(magrittr) # need to run every time you start R and want to use %>%
#install.packages("dplyr")    # alternative installation of the %>%
#library(dplyr)    # alternative, this also loads %>%
# install tensorflow
#install_tensorflow()
library('tensorflow')
#install.packages('keras')
library('keras')
install_keras()
x_train <- as.matrix(train[,-1]); y=train[,1]; y_train <- keras::to_categorical(as.numeric(y)-1);
`%>%` <- magrittr::`%>%`
nn <- keras::keras_model_sequential() %>%
  keras::layer_dense(units = 16,kernel_initializer = "uniform",activation = 'relu',
                     input_shape = NCOL(x_train))%>%
  keras::layer_dense(units = 16,kernel_initializer = "uniform", activation='relu') %>%
  keras::layer_dense(units = length(levels(train[,1])),activation='softmax')
nn %>% keras::compile(optimizer='rmsprop',loss='categorical_crossentropy',metrics=c('accuracy'))
nn %>% keras::fit(x_train,y_train,epochs = 20,batch_size = 1028)
x_train
nn

#Ok, we’ve generated some predictive models. Now, let’s prepare the data 
#for plotting! We will focus on explaining to our marketing colleagues how 
#good our predictive model works and how it can help them select customers 
#for their term deposit campaign.

# transform datasets and model objects into scored data and calculate ntiles 
# preparation steps
# adjusted for my scoring method above MSL
# can we see everything? 
rf      # random forest generated with MLR
mnl     # generated with caret
nn      # generated with keras - is a model not a dataset (not sure what to make of that)
gbm     # h2o not working needs JVM installed ? 

scores_and_ntiles <- prepare_scores_and_ntiles(datasets=list("train","test"),
                                               dataset_labels = list("train data","test data"),
                                               models = list("rf","mnl","nn"),
                                               # for h2o "gbm"),
                                               model_labels = list("random forest","multinomial logit","artificial neural network"),
                                               # for h2o "gradient boosted trees"),
                                               target_column="y",
                                               ntiles=100)
## ... scoring mlr model "rf" on dataset "train".
## ... scoring caret model "mnl" on dataset "train".
## ... scoring h2o model "gbm" on dataset "train".
## ... scoring keras model "nn" on dataset "train".
## ... scoring mlr model "rf" on dataset "test".
## ... scoring caret model "mnl" on dataset "test".
## ... scoring h2o model "gbm" on dataset "test".
## ... scoring keras model "nn" on dataset "test".
## answer you should see
## Data preparation step 1 succeeded! Dataframe created.

# transform data generated with prepare_scores_and_ntiles into aggregated data for chosen plotting scope 
plot_input <- plotting_scope(prepared_input = scores_and_ntiles,
                             select_model_label = "random forest",
      #need h2o running to use this   #select_model_label = "gradient boosted trees",
                             select_dataset_label = "test data")
## Data preparation step 2 succeeded! Dataframe created.
## "prepared_input" aggregated...
## Data preparation step 3 succeeded! Dataframe created.
## 
## No comparison specified, default values are used. 
## 
## Single evaluation line will be plotted: Target value "term.deposit" plotted for dataset "test data" and model "gradient boosted trees.
## "
## -> To compare models, specify: scope = "compare_models"
## -> To compare datasets, specify: scope = "compare_datasets"
## -> To compare target classes, specify: scope = "compare_targetclasses"
## -> To plot one line, do not specify scope or specify scope = "no_comparison".

# look at dataframe
plot_input

# plot the cumulative gains plot
plot_cumgains(data = plot_input,
              save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Cumul gains')

# plot the cumulative gains plot and annotate the plot at percentile = 20
plot_cumgains(data = plot_input,highlight_ntile = 20,
              save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Cumul gains c20')

# plot the cumulative lift plot and annotate the plot at percentile = 20
plot_cumlift(data = plot_input,highlight_ntile = 20,
             save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Cumul lift c20')

##  
## Plot annotation for plot: Cumulative lift
## - When we select 20% with the highest probability according to model 
## gradient boosted trees in test data, this selection for term.deposit 
## cases is 4.3 times better than selecting without a model. 
##  
## 

# plot the response plot and annotate the plot at ntile = 10
plot_response(data = plot_input,highlight_ntile = 10,
              save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Response c10')
##  
## Plot annotation for plot: Response
## - When we select ntile 10 according to model gradient boosted trees 
# in dataset test data the % of term.deposit cases in the selection is 50.4%. 
##  
## 

# plot the cumulative response plot and annotate the plot at decile = 3
plot_cumresponse(data = plot_input,highlight_ntile = 30,
                 save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Cumul Response c30')

##  
## Plot annotation for plot: Cumulative response
## - When we select ntiles 1 until 30 according to model gradient boosted trees in dataset test data the % of term.deposit cases in the selection is 34.9%. 
##  
##

#All four plots together

# With the function call plot_multiplot we get the previous four plots on one grid. 
# We can easily save it to a file to include it in a presentation or share it with colleagues.

# plot all four evaluation plots and save to file, highlight decile 2
plot_multiplot(data = plot_input,highlight_ntile=2,
               save_fig = TRUE,
               save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits')

#getwd()
##  
## Plot annotation for plot: Cumulative gains
## - When we select 20% with the highest probability according to model gradient 
## boosted trees, this selection holds 87% of all term.deposit cases in test data. 
##  
## Plot annotation for plot: Cumulative lift
## - When we select 20% with the highest probability according to model gradient 
## boosted trees in test data, this selection for term.deposit cases is 4.3 times 
## better than selecting without a model. 
##  
## Plot annotation for plot: Response
## - When we select ntile 2 according to model gradient boosted trees in dataset 
## test data the % of term.deposit cases in the selection is 32.2%. 
##  
## Plot annotation for plot: Cumulative response
## - When we select ntiles 1 until 2 according to model gradient boosted trees in dataset test data the % of term.deposit cases in the selection is 47.2%. 
##  
## Warning: No location for saved plot specified! Plot is saved to tempdir(). Specify 'save_fig_filename' to customize location and name.
## Plot is saved as: C:\Users\J9AF3~1.NAG\AppData\Local\Temp\Rtmpc5waFv/Selection model Term Deposits.png

#Profit plot - automatically highlighting the ntile where profit is maximized!
plot_profit(data=plot_input,fixed_costs=75000,
            variable_costs_per_unit=50,profit_per_unit=250,
            save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Profit')

##  
## Plot annotation for plot: Profit
## - When we select ntiles 1 until 19 in dataset test data using model gradient boosted trees to target term.deposit cases the expected profit is 93,850 
##  

# set plotting scope to model comparison
# Get more out of modelplotr: using different scopes, highlight ntiles, customize text & colors.
plot_input <- plotting_scope(prepared_input = scores_and_ntiles,
                             scope = "compare_models") 
# to see plot run next piece of code
## Data preparation step 2 succeeded! Dataframe created.
## "prepared_input" aggregated...
## Data preparation step 3 succeeded! Dataframe created.
## 
## Models "random forest", "multinomial logit", "gradient boosted trees", "artificial neural network" compared for dataset "test data" and target value "term.deposit".

# plot the cumulative response plot and annotate the plot at ntile 20
plot_cumresponse(data = plot_input,highlight_ntile = 20,
                 save_fig_filename = '/Users/markloessi/R_programing/R_randomCode/modelplotr - predictive models/Selection model Term Deposits - Cumul Response Profit cScope')

##  
## Plot annotation for plot: Cumulative response
## - When we select ntiles 1 until 20 according to model random forest in dataset test data the % of term.deposit cases in the selection is 46.5%. 
## - When we select ntiles 1 until 20 according to model multinomial logit in dataset test data the % of term.deposit cases in the selection is 42.1%. 
## - When we select ntiles 1 until 20 according to model gradient boosted trees in dataset test data the % of term.deposit cases in the selection is 47.2%. 
## - When we select ntiles 1 until 20 according to model artificial neural network in dataset test data the % of term.deposit cases in the selection is 40.7%. 
##  
## 









