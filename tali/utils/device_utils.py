import nvidia_smi


def get_current_gpu_memory_stats():
    nvidia_smi.nvmlInit()

    device_count = nvidia_smi.nvmlDeviceGetCount()
    info_string = ""
    for i in range(device_count):
        handle = nvidia_smi.nvmlDeviceGetHandleByIndex(i)
        info = nvidia_smi.nvmlDeviceGetMemoryInfo(handle)
        info_string = (
            f"Device {i}: {nvidia_smi.nvmlDeviceGetName(handle)}, "
            f"Memory : ({100 * info.free / info.total}% free): {info.total}(total), "
            f"{info.free} (free), {info.used} (used)"
        )

    nvidia_smi.nvmlShutdown()
    return info_string
