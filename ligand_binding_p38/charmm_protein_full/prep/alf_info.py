import numpy as np
alf_info={}
alf_info['name']='p38'
alf_info['nsubs']=np.loadtxt('prep/nsubs',dtype='int',ndmin=1)
alf_info['nblocks']=np.sum(alf_info['nsubs'])
alf_info['ncentral']=0
alf_info['nreps']=3
alf_info['nnodes']=1
alf_info['temp']=298.15
alf_info['enginepath']='/home/luiscv/Tools/NLALF/charmm/build_charmm/charmm'
alf_info['lmalf']=True
print(alf_info['nblocks'])
