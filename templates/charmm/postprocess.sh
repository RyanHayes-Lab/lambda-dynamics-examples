#! /bin/bash

python -c "import alf; alf.postprocess($i,$eqS,$S,$N,$skipE,True,engine='bladelib',G_imp='`pwd`/G_imp',ntersite=[0,0])"
