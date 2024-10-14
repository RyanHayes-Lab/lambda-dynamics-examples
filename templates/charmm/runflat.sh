#!/bin/bash

python -c "import alf; alf.initialize(engine='bladelib')"
python -c "import alf; alf.runflat(1,300,13000,39000,engine='bladelib',G_imp='`pwd`/G_imp',ntersite=[0,0])"
python -c "import alf; alf.runflat(301,330,125000,375000,engine='bladelib',G_imp='`pwd`/G_imp',ntersite=[0,0])"
