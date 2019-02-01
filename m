From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 1 (extcon/ptn5150)
Date: Fri, 1 Feb 2019 08:57:54 -0800
Message-ID: <39992a9b-95c2-2e92-706b-409a00ad7d00@infradead.org>
References: <20190201164108.12e1fbff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201164108.12e1fbff@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
List-Id: linux-next.vger.kernel.org

On 1/31/19 9:41 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190131:
> 

Hi,

config EXTCON_PTN5150
	tristate "NXP PTN5150 CC LOGIC USB EXTCON support"
	depends on I2C && GPIOLIB || COMPILE_TEST
	select REGMAP_I2C

Where did the " || COMPILE_TEST" come from?

I generally support using COMPILE_TEST, but in this case it causes
problems, when EXTCON_PTN5150=y and I2C=m (and COMPILE_TEST=y),
both in kconfig and in build errors:



WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [m]: I2C [=m]
  Selected by [y]:
  - EXTCON_PTN5150 [=y] && EXTCON [=y] && (I2C [=m] && GPIOLIB [=y] || COMPILE_TEST [=y])
  Selected by [m]:
  - GPIO_PCA953X [=m] && GPIOLIB [=y] && I2C [=m]
  - GPIO_TS4900 [=m] && GPIOLIB [=y] && I2C [=m] && (SOC_IMX6 || COMPILE_TEST [=y])
  - BATTERY_MAX17042 [=m] && POWER_SUPPLY [=y] && I2C [=m]
  - CHARGER_BQ25890 [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
  - CHARGER_SMB347 [=m] && POWER_SUPPLY [=y] && I2C [=m]
  - CHARGER_RT9455 [=m] && POWER_SUPPLY [=y] && I2C [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
  - SENSORS_LTC2945 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_LTC4222 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_LTC4260 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_MAX6621 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_LM75 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_NCT7802 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_ADS7828 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_INA2XX [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_INA3221 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_TMP103 [=m] && HWMON [=y] && I2C [=m]
  - SENSORS_TMP108 [=m] && HWMON [=y] && I2C [=m]
  - MFD_BD9571MWV [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_AXP20X_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_DA9062 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_DA9063 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_DA9150 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_MC13XXX_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_88PM800 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_88PM805 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_MAX14577 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_MAX77693 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_MAX8907 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_RT5033 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_RK808 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
  - MFD_RN5T618 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
  - MFD_SI476X_CORE [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_LP3943 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_TI_LMU [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_TI_LP873X [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_TPS65218 [=m] && HAS_IOMEM [=y] && I2C [=m] && OF [=y]
  - MFD_TPS65912_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_LM3533 [=m] && HAS_IOMEM [=y] && I2C [=m]
  - MFD_ARIZONA_I2C [=m] && HAS_IOMEM [=y] && I2C [=m]
  - VIDEO_LM3560 [=m] && MEDIA_SUPPORT [=y] && I2C [=m] && VIDEO_V4L2 [=m] && MEDIA_CONTROLLER [=y] && MEDIA_CAMERA_SUPPORT [=y]
  - MEDIA_TUNER_E4000 [=m] && (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=y] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=m]
  - MEDIA_TUNER_FC2580 [=m] && (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=y] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=m]
  - MEDIA_TUNER_M88RS6000T [=m] && (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=y] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=m]
  - MEDIA_TUNER_TUA9001 [=m] && (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=y] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=m]
  - MEDIA_TUNER_IT913X [=m] && (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=y] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=m]
  - DRM_SII902X [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && OF [=y]
  - DRM_TOSHIBA_TC358767 [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && OF [=y]
  - DRM_I2C_ADV7511 [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && OF [=y]
  - BACKLIGHT_LM3639 [=m] && HAS_IOMEM [=y] && BACKLIGHT_LCD_SUPPORT [=y] && BACKLIGHT_CLASS_DEVICE [=m] && I2C [=m]
  - LEDS_LM3642 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=m] && I2C [=m]
  - LEDS_LM3692X [=m] && NEW_LEDS [=y] && LEDS_CLASS [=m] && I2C [=m] && OF [=y]
  - LEDS_LP8860 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=m] && I2C [=m] && OF [=y]
  - LEDS_LM355x [=m] && NEW_LEDS [=y] && LEDS_CLASS [=m] && I2C [=m]
  - RTC_I2C_AND_SPI [=m] && RTC_CLASS [=y] && I2C [=m]
  - RTC_DRV_ABB5ZES3 [=m] && RTC_CLASS [=y] && I2C [=m]
  - COMMON_CLK_SI5351 [=m] && COMMON_CLK [=y] && I2C [=m]
  - COMMON_CLK_SI514 [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
  - COMMON_CLK_SI570 [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
  - COMMON_CLK_CDCE925 [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
  - COMMON_CLK_VC5 [=m] && COMMON_CLK [=y] && I2C [=m] && OF [=y]
  - EXTCON_MAX77693 [=m] && EXTCON [=y] && MFD_MAX77693 [=m] && INPUT [=y]
  - EXTCON_RT8973A [=m] && EXTCON [=y] && I2C [=m]
  - EXTCON_SM5502 [=m] && EXTCON [=y] && I2C [=m]
  - ADXL372_I2C [=m] && IIO [=y] && I2C [=m]
  - BMC150_ACCEL_I2C [=m] && IIO [=y]
  - MXC4005 [=m] && IIO [=y] && I2C [=m]
  - MXC6255 [=m] && IIO [=y] && I2C [=m]
  - INA2XX_ADC [=m] && IIO [=y] && I2C [=m] && !SENSORS_INA2XX [=m]
  - TI_ADS1015 [=m] && IIO [=y] && I2C [=m] && !SENSORS_ADS1015 [=n]
  - ATLAS_PH_SENSOR [=m] && IIO [=y] && I2C [=m]
  - BME680_I2C [=m] && IIO [=y] && I2C [=m] && BME680 [=m]
  - BMG160_I2C [=m] && IIO [=y]
  - MPU3050_I2C [=m] && IIO [=y] && INPUT_MPU3050!=y && INPUT_MPU3050!=m && I2C [=m]
  - AFE4404 [=m] && IIO [=y] && I2C [=m]
  - MAX30100 [=m] && IIO [=y] && I2C [=m]
  - MAX30102 [=m] && IIO [=y] && I2C [=m]
  - HTS221_I2C [=m] && IIO [=y] && HTS221 [=y]
  - IIO_ST_LSM6DSX_I2C [=m] && IIO [=y] && IIO_ST_LSM6DSX [=m]
  - APDS9960 [=m] && IIO [=y] && I2C [=m]
  - GP2AP020A00F [=m] && IIO [=y] && I2C [=m]
  - SENSORS_ISL29028 [=m] && IIO [=y] && I2C [=m]
  - MAX44000 [=m] && IIO [=y] && I2C [=m]
  - PA12203001 [=m] && IIO [=y] && I2C [=m]
  - SI1133 [=m] && IIO [=y] && I2C [=m]
  - STK3310 [=m] && IIO [=y] && I2C [=m]
  - ST_UVIS25_I2C [=m] && IIO [=y] && ST_UVIS25 [=y]
  - VCNL4035 [=m] && IIO [=y] && I2C [=m]
  - AK8974 [=m] && IIO [=y] && I2C [=m] && OF [=y]
  - MMC35240 [=m] && IIO [=y] && I2C [=m]
  - SENSORS_RM3100_I2C [=m] && IIO [=y] && I2C [=m]
  - LMP91000 [=m] && IIO [=y] && I2C [=m]
  - HP03 [=m] && IIO [=y] && I2C [=m]
  - ZPA2326_I2C [=m] && IIO [=y]
  - MLX90632 [=m] && IIO [=y] && I2C [=m]


and then:

ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_read':
regmap-i2c.c:(.text+0x122): undefined reference to `i2c_smbus_read_byte_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_write':
regmap-i2c.c:(.text+0x157): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_read':
regmap-i2c.c:(.text+0x182): undefined reference to `i2c_smbus_read_word_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_read_swapped':
regmap-i2c.c:(.text+0x1b2): undefined reference to `i2c_smbus_read_word_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_write_swapped':
regmap-i2c.c:(.text+0x1ee): undefined reference to `i2c_smbus_write_word_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_write':
regmap-i2c.c:(.text+0x217): undefined reference to `i2c_smbus_write_word_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read':
regmap-i2c.c:(.text+0x254): undefined reference to `i2c_smbus_read_i2c_block_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write':
regmap-i2c.c:(.text+0x2b0): undefined reference to `i2c_smbus_write_i2c_block_data'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_read':
regmap-i2c.c:(.text+0x312): undefined reference to `i2c_transfer'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_gather_write':
regmap-i2c.c:(.text+0x39c): undefined reference to `i2c_transfer'
ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_write':
regmap-i2c.c:(.text+0x3f4): undefined reference to `i2c_transfer_buffer_flags'
ld: drivers/extcon/extcon-ptn5150.o: in function `ptn5150_i2c_init':
extcon-ptn5150.c:(.init.text+0xb): undefined reference to `i2c_register_driver'



thanks.
-- 
~Randy
