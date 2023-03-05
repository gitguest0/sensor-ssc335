SENSOR ?= imx335
SOURCE ?= ../linux-4.9.84
MAJOR ?= 1
MINOR ?= 2

EXTRA_CFLAGS += -I $(src)/sensordriver/inc
EXTRA_CFLAGS += -I $(src)/sensordriver/pub
EXTRA_CFLAGS += -I $(src)/cam_os_wrapper/pub
EXTRA_CFLAGS += -D MAJOR_VERSION=$(MAJOR)
EXTRA_CFLAGS += -D MINOR_VERSION=$(MINOR)

DATE := $(shell date +%Y%m%d%H%M)
MVXV := MVX3I6E[sensor_module][$(DATE)]XVM
EXTRA_CFLAGS += -D SENSOR_MODULE_VERSION=$(MVXV)

TARGET := sensor_$(SENSOR)_mipi
obj-m := $(TARGET).o
$(TARGET)-y := sensordriver/src/drv_ms_cus_$(SENSOR)_MIPI.o

all:
	$(MAKE) -C $(SOURCE) M=$(PWD) modules

clean:
	$(MAKE) -C $(SOURCE) M=$(PWD) clean
