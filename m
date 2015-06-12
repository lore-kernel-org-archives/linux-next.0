From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20150612 build: 1 failures 52 warnings (next-20150612)
Date: Fri, 12 Jun 2015 15:49:05 +0100
Message-ID: <E1Z3QGX-0001Zy-Fq@optimist>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55039 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755122AbbFLOtN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2015 10:49:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20150612
Git describe: next-20150612
Commit: d9b5ec5b1b Add linux-next specific files for 20150612

Build Time: 75 min 57 sec

Passed:    8 / 9   ( 88.89 %)
=46ailed:    1 / 9   ( 11.11 %)

Errors: 8
Warnings: 52
Section Mismatches: 1

=46ailed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
=2E./drivers/net/ethernet/cavium/liquidio/octeon_device.c:1231:2: error=
: implicit declaration of function 'readq' [-Werror=3Dimplicit-function=
-declaration]
=2E./drivers/net/ethernet/cavium/liquidio/octeon_device.c:1247:2: error=
: implicit declaration of function 'writeq' [-Werror=3Dimplicit-functio=
n-declaration]
=2E./drivers/net/ethernet/cavium/liquidio/cn66xx_device.c:45:2: error: =
implicit declaration of function 'writeq' [-Werror=3Dimplicit-function-=
declaration]
=2E./drivers/net/ethernet/cavium/liquidio/cn66xx_device.c:61:2: error: =
implicit declaration of function 'readq' [-Werror=3Dimplicit-function-d=
eclaration]
=2E./drivers/net/ethernet/cavium/liquidio/cn68xx_device.c:87:2: error: =
implicit declaration of function 'readq' [-Werror=3Dimplicit-function-d=
eclaration]
=2E./drivers/net/ethernet/cavium/liquidio/cn68xx_device.c:94:2: error: =
implicit declaration of function 'writeq' [-Werror=3Dimplicit-function-=
declaration]
=2E./drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:72:3: error:=
 implicit declaration of function 'writeq' [-Werror=3Dimplicit-function=
-declaration]
=2E./drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:96:3: error:=
 implicit declaration of function 'readq' [-Werror=3Dimplicit-function-=
declaration]

-----------------------------------------------------------------------=
--------
defconfigs with issues (other than build errors):
      5 warnings    0 mismatches  : arm64-allnoconfig
     21 warnings    3 mismatches  : arm64-allmodconfig
     11 warnings    0 mismatches  : arm-multi_v5_defconfig
     13 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    0 mismatches  : x86_64-defconfig
     34 warnings    0 mismatches  : arm-allmodconfig
      7 warnings    0 mismatches  : arm-allnoconfig
      4 warnings    0 mismatches  : x86_64-allnoconfig
      9 warnings    0 mismatches  : arm64-defconfig

-----------------------------------------------------------------------=
--------

Errors summary: 8
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:96:3: err=
or: implicit declaration of function 'readq' [-Werror=3Dimplicit-functi=
on-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:72:3: err=
or: implicit declaration of function 'writeq' [-Werror=3Dimplicit-funct=
ion-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_device.c:1247:2: er=
ror: implicit declaration of function 'writeq' [-Werror=3Dimplicit-func=
tion-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_device.c:1231:2: er=
ror: implicit declaration of function 'readq' [-Werror=3Dimplicit-funct=
ion-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/cn68xx_device.c:94:2: erro=
r: implicit declaration of function 'writeq' [-Werror=3Dimplicit-functi=
on-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/cn68xx_device.c:87:2: erro=
r: implicit declaration of function 'readq' [-Werror=3Dimplicit-functio=
n-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/cn66xx_device.c:61:2: erro=
r: implicit declaration of function 'readq' [-Werror=3Dimplicit-functio=
n-declaration]
	  1 ../drivers/net/ethernet/cavium/liquidio/cn66xx_device.c:45:2: erro=
r: implicit declaration of function 'writeq' [-Werror=3Dimplicit-functi=
on-declaration]

Warnings Summary: 52
	 18 drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported characte=
r '=C2'
	 18 drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported characte=
r '=A0'
	 11 <stdin>:1253:2: warning: #warning syscall userfaultfd not implemen=
ted [-Wcpp]
	  8 arch/arm/Kconfig.debug:1576:warning: ignoring unsupported characte=
r '>'
	  5 ../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is no=
t supported for this machine [-Wpragmas]
	  4 ../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but =
not used [-Wunused-function]
	  2 ../crypto/jitterentropy.c:336:9: warning: #pragma GCC target is no=
t supported for this machine [-Wpragmas]
	  1 arch/arm/configs/multi_v7_defconfig:605:warning: override: reassig=
ning to symbol COMMON_CLK_QCOM
	  1 ../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer f=
rom integer of different size [-Wint-to-pointer-cast]
	  1 ../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer f=
rom integer of different size [-Wint-to-pointer-cast]
	  1 ../net/ipv4/inet_hashtables.c:631:13: warning: division by zero [-=
Wdiv-by-zero]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninit=
ialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninit=
ialized in this function [-Wmaybe-uninitialized]
	  1 ../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large=
 integer implicitly truncated to unsigned type [-Woverflow]
	  1 ../include/linux/bitops.h:6:19: warning: large integer implicitly =
truncated to unsigned type [-Woverflow]
	  1 ../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from p=
ointer to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/scsi/advansys.c:7805:2: warning: large integer implicit=
ly truncated to unsigned type [-Woverflow]
	  1 ../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'fl=
ags' [-Wunused-variable]
	  1 ../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #w=
arning Processor architecture undefined [-Wcpp]
	  1 ../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #wa=
rning Processor architecture undefined! [-Wcpp]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_droq.c:282:2: warni=
ng: format '%lx' expects argument of type 'long unsigned int', but argu=
ment 6 has type 'size_t' [-Wformat]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_console.c:533:3: wa=
rning: format '%lu' expects argument of type 'long unsigned int', but a=
rgument 3 has type 'size_t' [-Wformat]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_console.c:522:5: wa=
rning: format '%lu' expects argument of type 'long unsigned int', but a=
rgument 3 has type 'size_t' [-Wformat]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_console.c:475:5: wa=
rning: format '%lu' expects argument of type 'long unsigned int', but a=
rgument 3 has type 'size_t' [-Wformat]
	  1 ../drivers/net/ethernet/cavium/liquidio/octeon_console.c:470:5: wa=
rning: format '%lu' expects argument of type 'long unsigned int', but a=
rgument 3 has type 'size_t' [-Wformat]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:2952:19: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cas=
t]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:2411:19: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cas=
t]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:2308:19: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cas=
t]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:2255:19: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cas=
t]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:2135:30: warnin=
g: cast to pointer from integer of different size [-Wint-to-pointer-cas=
t]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:1558:2: warning=
: passing argument 1 of 'timespec_to_ns' from incompatible pointer type=
 [enabled by default]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_main.c:1169:19: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cas=
t]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_ethtool.c:982:19: warn=
ing: cast from pointer to integer of different size [-Wpointer-to-int-c=
ast]
	  1 ../drivers/net/ethernet/cavium/liquidio/lio_ethtool.c:237:19: warn=
ing: cast from pointer to integer of different size [-Wpointer-to-int-c=
ast]
	  1 ../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAG=
E" redefined
	  1 ../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%=
lu' expects argument of type 'long unsigned int', but argument 4 has ty=
pe 'long long int' [-Wformat]
	  1 ../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format =
'%ld' expects argument of type 'long int', but argument 3 has type 'lon=
g long int' [-Wformat]
	  1 ../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warnin=
g: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larg=
er-than=3D]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11877:6: warning: 'crtc' m=
ay be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/i915/intel_display.c:11853:14: warning: 'crtc_s=
tate' may be used uninitialized in this function [-Wmaybe-uninitialized=
]
	  1 ../drivers/gpu/drm/exynos/exynos_drm_vidi.c:183:6: warning: unused=
 variable 'i' [-Wunused-variable]
	  1 ../drivers/gpu/drm/exynos/exynos_drm_vidi.c:182:27: warning: unuse=
d variable 'plane' [-Wunused-variable]
	  1 ../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
	  1 ../drivers/block/nvme-core.c:1834:10: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/nvme-core.c:1792:4: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE=
_MASK" redefined
	  1 ../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE=
" redefined
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is =
larger than 1024 bytes [-Wframe-larger-than=3D]
	  1 ../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of =
1088 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]

Section Mismatch Summary: 1
	  3 WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x1=
8c): Section mismatch in reference from the function init_module() to t=
he function .exit.text:dprc_driver_exit()



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Detailed per-defconfig build reports below:


-----------------------------------------------------------------------=
--------
arm64-allnoconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]

-----------------------------------------------------------------------=
--------
arm64-allmodconfig : PASS, 0 errors, 21 warnings, 3 section mismatches

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../crypto/jitterentropy.c:336:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../drivers/block/drbd/drbd_bitmap.c:482:0: warning: "BITS_PER_PAGE" re=
defined
	../drivers/block/drbd/drbd_bitmap.c:483:0: warning: "BITS_PER_PAGE_MAS=
K" redefined
	../drivers/gpio/gpio-74xx-mmio.c:132:16: warning: cast from pointer to=
 integer of different size [-Wpointer-to-int-cast]
	../sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from =
integer of different size [-Wint-to-pointer-cast]
	../sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from =
integer of different size [-Wint-to-pointer-cast]
	../drivers/infiniband/hw/qib/qib_qp.c:44:0: warning: "BITS_PER_PAGE" r=
edefined
	../drivers/mmc/host/sh_mmcif.c:417:4: warning: cast to pointer from in=
teger of different size [-Wint-to-pointer-cast]
	../drivers/mmc/host/sh_mmcif.c:418:4: warning: cast to pointer from in=
teger of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/dec/tulip/winbond-840.c:910:2: warning: #warni=
ng Processor architecture undefined [-Wcpp]
	../drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warnin=
g Processor architecture undefined! [-Wcpp]
	../include/linux/bitops.h:6:19: warning: large integer implicitly trun=
cated to unsigned type [-Woverflow]
	../include/uapi/linux/byteorder/big_endian.h:32:26: warning: large int=
eger implicitly truncated to unsigned type [-Woverflow]
	../drivers/usb/renesas_usbhs/common.c:496:25: warning: cast from point=
er to integer of different size [-Wpointer-to-int-cast]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]

Section Mismatches:
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c):=
 Section mismatch in reference from the function init_module() to the f=
unction .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c):=
 Section mismatch in reference from the function init_module() to the f=
unction .exit.text:dprc_driver_exit()
	WARNING: drivers/staging/fsl-mc/bus/mc-bus-driver.o(.init.text+0x18c):=
 Section mismatch in reference from the function init_module() to the f=
unction .exit.text:dprc_driver_exit()

-----------------------------------------------------------------------=
--------
arm-multi_v5_defconfig : PASS, 0 errors, 11 warnings, 0 section mismatc=
hes

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not =
used [-Wunused-function]
	../net/ipv4/inet_hashtables.c:631:13: warning: division by zero [-Wdiv=
-by-zero]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]

-----------------------------------------------------------------------=
--------
arm-multi_v7_defconfig : PASS, 0 errors, 13 warnings, 0 section mismatc=
hes

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	arch/arm/configs/multi_v7_defconfig:605:warning: override: reassigning=
 to symbol COMMON_CLK_QCOM
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not =
used [-Wunused-function]
	../net/bluetooth/mgmt.c:6463:8: warning: 'r192' may be used uninitiali=
zed in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:6463:8: warning: 'h192' may be used uninitiali=
zed in this function [-Wmaybe-uninitialized]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]

-----------------------------------------------------------------------=
--------
x86_64-defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not =
used [-Wunused-function]
	../drivers/gpu/drm/i915/intel_display.c:11853:14: warning: 'crtc_state=
' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/i915/intel_display.c:11877:6: warning: 'crtc' may b=
e used uninitialized in this function [-Wmaybe-uninitialized]

-----------------------------------------------------------------------=
--------
arm-allmodconfig : FAIL, 8 errors, 34 warnings, 0 section mismatches

Errors:
	../drivers/net/ethernet/cavium/liquidio/octeon_device.c:1231:2: error:=
 implicit declaration of function 'readq' [-Werror=3Dimplicit-function-=
declaration]
	../drivers/net/ethernet/cavium/liquidio/octeon_device.c:1247:2: error:=
 implicit declaration of function 'writeq' [-Werror=3Dimplicit-function=
-declaration]
	../drivers/net/ethernet/cavium/liquidio/cn66xx_device.c:45:2: error: i=
mplicit declaration of function 'writeq' [-Werror=3Dimplicit-function-d=
eclaration]
	../drivers/net/ethernet/cavium/liquidio/cn66xx_device.c:61:2: error: i=
mplicit declaration of function 'readq' [-Werror=3Dimplicit-function-de=
claration]
	../drivers/net/ethernet/cavium/liquidio/cn68xx_device.c:87:2: error: i=
mplicit declaration of function 'readq' [-Werror=3Dimplicit-function-de=
claration]
	../drivers/net/ethernet/cavium/liquidio/cn68xx_device.c:94:2: error: i=
mplicit declaration of function 'writeq' [-Werror=3Dimplicit-function-d=
eclaration]
	../drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:72:3: error: =
implicit declaration of function 'writeq' [-Werror=3Dimplicit-function-=
declaration]
	../drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:96:3: error: =
implicit declaration of function 'readq' [-Werror=3Dimplicit-function-d=
eclaration]

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]
	../arch/arm/mach-cns3xxx/pcie.c:266:1: warning: the frame size of 1088=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larg=
er than 1024 bytes [-Wframe-larger-than=3D]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../drivers/block/nvme-core.c:1792:4: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
	../drivers/block/nvme-core.c:1834:10: warning: cast to pointer from in=
teger of different size [-Wint-to-pointer-cast]
	../drivers/gpu/drm/exynos/exynos_drm_vidi.c:183:6: warning: unused var=
iable 'i' [-Wunused-variable]
	../drivers/gpu/drm/exynos/exynos_drm_vidi.c:182:27: warning: unused va=
riable 'plane' [-Wunused-variable]
	../drivers/infiniband/hw/cxgb4/mem.c:147:20: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
	../drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm204.c:975:1: warning: t=
he frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-t=
han=3D]
	../drivers/gpu/drm/virtio/virtgpu_fence.c:64:2: warning: format '%lu' =
expects argument of type 'long unsigned int', but argument 4 has type '=
long long int' [-Wformat]
	../drivers/gpu/drm/virtio/virtgpu_debugfs.c:39:6: warning: format '%ld=
' expects argument of type 'long int', but argument 3 has type 'long lo=
ng int' [-Wformat]
	../drivers/rtc/rtc-armada38x.c:91:22: warning: unused variable 'flags'=
 [-Wunused-variable]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:1169:19: warning: c=
ast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:1558:2: warning: pa=
ssing argument 1 of 'timespec_to_ns' from incompatible pointer type [en=
abled by default]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:2135:30: warning: c=
ast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:2255:19: warning: c=
ast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:2308:19: warning: c=
ast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:2411:19: warning: c=
ast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_main.c:2952:19: warning: c=
ast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_ethtool.c:237:19: warning:=
 cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/lio_ethtool.c:982:19: warning:=
 cast from pointer to integer of different size [-Wpointer-to-int-cast]
	../drivers/net/ethernet/cavium/liquidio/octeon_droq.c:282:2: warning: =
format '%lx' expects argument of type 'long unsigned int', but argument=
 6 has type 'size_t' [-Wformat]
	../drivers/net/ethernet/cavium/liquidio/octeon_console.c:470:5: warnin=
g: format '%lu' expects argument of type 'long unsigned int', but argum=
ent 3 has type 'size_t' [-Wformat]
	../drivers/net/ethernet/cavium/liquidio/octeon_console.c:475:5: warnin=
g: format '%lu' expects argument of type 'long unsigned int', but argum=
ent 3 has type 'size_t' [-Wformat]
	../drivers/net/ethernet/cavium/liquidio/octeon_console.c:522:5: warnin=
g: format '%lu' expects argument of type 'long unsigned int', but argum=
ent 3 has type 'size_t' [-Wformat]
	../drivers/net/ethernet/cavium/liquidio/octeon_console.c:533:3: warnin=
g: format '%lu' expects argument of type 'long unsigned int', but argum=
ent 3 has type 'size_t' [-Wformat]
	../drivers/scsi/advansys.c:7805:2: warning: large integer implicitly t=
runcated to unsigned type [-Woverflow]

-----------------------------------------------------------------------=
--------
arm-allnoconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	arch/arm/Kconfig.debug:1576:warning: ignoring unsupported character '>=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]

-----------------------------------------------------------------------=
--------
x86_64-allnoconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'

-----------------------------------------------------------------------=
--------
arm64-defconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=C2=
'
	drivers/usb/dwc3/Kconfig:16:warning: ignoring unsupported character '=A0=
'
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]
	../crypto/jitterentropy.c:266:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../crypto/jitterentropy.c:336:9: warning: #pragma GCC target is not su=
pported for this machine [-Wpragmas]
	../block/cfq-iosched.c:469:2: warning: 'cpd_to_cfqgd' defined but not =
used [-Wunused-function]
	<stdin>:1253:2: warning: #warning syscall userfaultfd not implemented =
[-Wcpp]
-----------------------------------------------------------------------=
--------

Passed with no errors, warnings or mismatches:
