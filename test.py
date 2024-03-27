import torch
import test

t = torch.ones((2, 3, 10))

print(t.device)
print(t.shape)
print(t.data_ptr())

test.function(t.data_ptr())

