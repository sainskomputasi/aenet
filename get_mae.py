import numpy as np
import pandas as pd
import re
from IPython.display import Image
#matplotlib inline
import matplotlib.pyplot as plt
#plt.rcParams.update({"font.size": 15})
#plt.close("all")

errors = []
with open("train.out") as fp:
  for line in fp:
    if re.match("^ *[0-9].*<$", line):
      errors.append([float(a) for a in line.split()[1:-1]])
errors = np.array(errors)
errors = pd.DataFrame(
    data=errors, 
    columns=['MAE_train', 'RMSE_train', 'MAE_test', 'RMSE_test'])
ax = errors[['MAE_train', 'MAE_test']].plot(logy=True)
ax.set_xlabel("Epoch"); ax.set_ylabel("MAE (eV/atom)")
plt.show()
