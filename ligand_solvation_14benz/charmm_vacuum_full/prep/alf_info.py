import numpy as np
alf_info={}
alf_info['name']='benz'
alf_info['nsubs']=np.loadtxt('prep/nsubs',dtype='int',ndmin=1)
alf_info['nblocks']=np.sum(alf_info['nsubs'])
alf_info['ncentral']=0
alf_info['nreps']=2
alf_info['nnodes']=1
alf_info['temp']=298.15
alf_info['enginepath']='/data/homezvol0/rhayes1/CHARMM/chv5/charmm_exe/gnu/charmm'
alf_info['lmalf']=True
