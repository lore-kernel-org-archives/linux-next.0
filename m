From: Grant Likely <grant.likely@secretlab.ca>
Subject: Heads up on mass-rename patch added to linux-next
Date: Fri, 6 Aug 2010 23:26:52 -0600
Message-ID: <AANLkTimgv4B2jpgQxW=KkvnWQLnOqC7PaUN_8Jphynxn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001636920b8b27624f048d3509e1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:51379 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752637Ab0HGF1O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Aug 2010 01:27:14 -0400
Received: by iwn33 with SMTP id 33so1921107iwn.19
        for <linux-next@vger.kernel.org>; Fri, 06 Aug 2010 22:27:13 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>

--001636920b8b27624f048d3509e1
Content-Type: text/plain; charset=ISO-8859-1

[Linus & Andrew, I'm cc'ing you because if you decide that this is a
bad idea and this patch should *not* go into 2.6.36, then the whole
thing is moot and Stephen should not include me tree]

Stephen, this is a heads up on a patch that I've just pushed out to my
next-devicetree branch.  It is a mass replace of all references to
of_device with platform_device, and to_of_device() with
to_platform_device().

This patch was posted for review[1], but I did not push it into my
next branch because of the number of merge conflicts it would have
caused.  Instead, I waited until the bulk of the trees were merged
into Linus' tree so I could resolve them myself and retest.  Risk
should be very low as a mistake would show up as a build failure.
I've build and boot tested on powerpc (powerstation and mpc5200) and
sparc64 (Netra x1), build tested powerpc allmodconfig and microblaze
defconfig, and I've got the branch queued to run through the kisskb
build test[2] which should be complete before you assemble linux-next
on Monday.

There are still 2 linux-next merge conflicts left which are resolved
in the attached diff.

[1] http://lkml.org/lkml/2010/8/1/26
[2] http://kisskb.ellerman.id.au/kisskb/branch/13/

The following changes since commit 17879857821adad4e180c5d6457c3b8bbf1d0c0c:
  Linus Torvalds (1):
        Merge branch 'irq-core-for-linus' of
git://git.kernel.org/.../tip/linux-2.6-tip

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 next-devicetree

Grant Likely (1):
      of/device: Replace struct of_device with struct platform_device

 arch/powerpc/platforms/83xx/mpc837x_mds.c     |    2 +-
 arch/powerpc/platforms/83xx/mpc837x_rdb.c     |    2 +-
 arch/powerpc/sysdev/fsl_rio.c                 |    2 +-
 drivers/ata/pata_mpc52xx.c                    |    8 ++--
 drivers/ata/pata_of_platform.c                |    4 +-
 drivers/ata/sata_fsl.c                        |    8 ++--
 drivers/atm/fore200e.c                        |   26 +++++++-------
 drivers/block/xsysace.c                       |    4 +-
 drivers/char/hw_random/n2-drv.c               |    4 +-
 drivers/char/hw_random/n2rng.h                |    2 +-
 drivers/char/hw_random/pasemi-rng.c           |    4 +-
 drivers/char/ipmi/ipmi_si_intf.c              |    4 +-
 drivers/char/rtc.c                            |    2 +-
 drivers/char/xilinx_hwicap/xilinx_hwicap.c    |    4 +-
 drivers/crypto/amcc/crypto4xx_core.c          |    4 +-
 drivers/crypto/amcc/crypto4xx_core.h          |    2 +-
 drivers/crypto/n2_core.c                      |   22 ++++++------
 drivers/crypto/talitos.c                      |    6 ++--
 drivers/dma/fsldma.c                          |    4 +-
 drivers/dma/mpc512x_dma.c                     |    4 +-
 drivers/dma/ppc4xx/adma.c                     |    8 ++--
 drivers/edac/mpc85xx_edac.c                   |   12 +++---
 drivers/edac/ppc4xx_edac.c                    |   12 +++---
 drivers/hwmon/ams/ams.h                       |    2 +-
 drivers/hwmon/ultra45_env.c                   |    4 +-
 drivers/i2c/busses/i2c-cpm.c                  |    8 ++--
 drivers/i2c/busses/i2c-ibm_iic.c              |    6 ++--
 drivers/i2c/busses/i2c-mpc.c                  |    4 +-
 drivers/infiniband/hw/ehca/ehca_classes.h     |    2 +-
 drivers/infiniband/hw/ehca/ehca_main.c        |    4 +-
 drivers/input/misc/sparcspkr.c                |   10 +++---
 drivers/input/serio/i8042-sparcio.h           |    8 ++--
 drivers/input/serio/xilinx_ps2.c              |    4 +-
 drivers/leds/leds-gpio.c                      |    4 +-
 drivers/macintosh/macio_sysfs.c               |    6 ++--
 drivers/macintosh/smu.c                       |    6 ++--
 drivers/macintosh/therm_adt746x.c             |    2 +-
 drivers/macintosh/therm_pm72.c                |    6 ++--
 drivers/macintosh/therm_windtunnel.c          |    6 ++--
 drivers/media/video/fsl-viu.c                 |    8 ++--
 drivers/mmc/host/sdhci-of-core.c              |    8 ++--
 drivers/mtd/maps/physmap_of.c                 |    8 ++--
 drivers/mtd/maps/sun_uflash.c                 |    6 ++--
 drivers/mtd/nand/fsl_elbc_nand.c              |    4 +-
 drivers/mtd/nand/fsl_upm.c                    |    4 +-
 drivers/mtd/nand/mpc5121_nfc.c                |    4 +-
 drivers/mtd/nand/ndfc.c                       |    6 ++--
 drivers/mtd/nand/pasemi_nand.c                |    4 +-
 drivers/mtd/nand/socrates_nand.c              |    4 +-
 drivers/net/can/mscan/mpc5xxx_can.c           |   18 +++++-----
 drivers/net/can/sja1000/sja1000_of_platform.c |    4 +-
 drivers/net/ehea/ehea.h                       |    4 +-
 drivers/net/ehea/ehea_main.c                  |   12 +++---
 drivers/net/fec_mpc52xx.c                     |    8 ++--
 drivers/net/fec_mpc52xx_phy.c                 |    4 +-
 drivers/net/fs_enet/fs_enet-main.c            |    4 +-
 drivers/net/fs_enet/mac-fcc.c                 |    2 +-
 drivers/net/fs_enet/mac-fec.c                 |    2 +-
 drivers/net/fs_enet/mac-scc.c                 |    2 +-
 drivers/net/fs_enet/mii-bitbang.c             |    4 +-
 drivers/net/fs_enet/mii-fec.c                 |    4 +-
 drivers/net/fsl_pq_mdio.c                     |    4 +-
 drivers/net/gianfar.c                         |   10 +++---
 drivers/net/gianfar.h                         |    2 +-
 drivers/net/greth.c                           |    4 +-
 drivers/net/greth.h                           |    2 +-
 drivers/net/ibm_newemac/core.c                |    6 ++--
 drivers/net/ibm_newemac/core.h                |   12 +++---
 drivers/net/ibm_newemac/mal.c                 |    4 +-
 drivers/net/ibm_newemac/mal.h                 |    2 +-
 drivers/net/ibm_newemac/rgmii.c               |   18 +++++-----
 drivers/net/ibm_newemac/rgmii.h               |   16 ++++----
 drivers/net/ibm_newemac/tah.c                 |   14 ++++----
 drivers/net/ibm_newemac/tah.h                 |   12 +++---
 drivers/net/ibm_newemac/zmii.c                |   18 +++++-----
 drivers/net/ibm_newemac/zmii.h                |   16 ++++----
 drivers/net/ll_temac_main.c                   |    8 ++--
 drivers/net/myri_sbus.c                       |    4 +-
 drivers/net/myri_sbus.h                       |    2 +-
 drivers/net/niu.c                             |    8 ++--
 drivers/net/phy/mdio-gpio.c                   |    4 +-
 drivers/net/sunbmac.c                         |   18 +++++-----
 drivers/net/sunbmac.h                         |    4 +-
 drivers/net/sunhme.c                          |   22 ++++++------
 drivers/net/sunhme.h                          |    2 +-
 drivers/net/sunlance.c                        |   20 ++++++------
 drivers/net/sunqe.c                           |   16 ++++----
 drivers/net/sunqe.h                           |    4 +-
 drivers/net/ucc_geth.c                        |    8 ++--
 drivers/net/xilinx_emaclite.c                 |    6 ++--
 drivers/of/device.c                           |    2 +-
 drivers/parport/parport_sunbpp.c              |    4 +-
 drivers/pcmcia/electra_cf.c                   |    6 ++--
 drivers/pcmcia/m8xx_pcmcia.c                  |    4 +-
 drivers/rtc/rtc-mpc5121.c                     |    4 +-
 drivers/sbus/char/bbc_envctrl.c               |    6 ++--
 drivers/sbus/char/bbc_i2c.c                   |   18 +++++-----
 drivers/sbus/char/bbc_i2c.h                   |   10 +++---
 drivers/sbus/char/display7seg.c               |    4 +-
 drivers/sbus/char/envctrl.c                   |    4 +-
 drivers/sbus/char/flash.c                     |    4 +-
 drivers/sbus/char/uctrl.c                     |    4 +-
 drivers/scsi/qlogicpti.c                      |   14 ++++----
 drivers/scsi/qlogicpti.h                      |    2 +-
 drivers/scsi/sun_esp.c                        |   44 ++++++++++++------------
 drivers/serial/apbuart.c                      |    2 +-
 drivers/serial/cpm_uart/cpm_uart_core.c       |    4 +-
 drivers/serial/mpc52xx_uart.c                 |    8 ++--
 drivers/serial/nwpserial.c                    |    2 +-
 drivers/serial/of_serial.c                    |    6 ++--
 drivers/serial/sunhv.c                        |    4 +-
 drivers/serial/sunsab.c                       |    8 ++--
 drivers/serial/sunsu.c                        |    8 ++--
 drivers/serial/sunzilog.c                     |    6 ++--
 drivers/serial/uartlite.c                     |    4 +-
 drivers/serial/ucc_uart.c                     |    4 +-
 drivers/spi/mpc512x_psc_spi.c                 |    4 +-
 drivers/spi/mpc52xx_psc_spi.c                 |    4 +-
 drivers/spi/mpc52xx_spi.c                     |    4 +-
 drivers/spi/spi_mpc8xxx.c                     |    4 +-
 drivers/spi/spi_ppc4xx.c                      |    6 ++--
 drivers/spi/xilinx_spi_of.c                   |    6 ++--
 drivers/usb/gadget/fsl_qe_udc.c               |   10 +++---
 drivers/usb/host/ehci-ppc-of.c                |    6 ++--
 drivers/usb/host/ehci-xilinx-of.c             |   12 +++---
 drivers/usb/host/fhci-hcd.c                   |    4 +-
 drivers/usb/host/isp1760-if.c                 |    4 +-
 drivers/usb/host/ohci-ppc-of.c                |    6 ++--
 drivers/video/bw2.c                           |    4 +-
 drivers/video/cg14.c                          |    6 ++--
 drivers/video/cg3.c                           |    4 +-
 drivers/video/cg6.c                           |    6 ++--
 drivers/video/ffb.c                           |    4 +-
 drivers/video/fsl-diu-fb.c                    |    8 ++--
 drivers/video/leo.c                           |    6 ++--
 drivers/video/mb862xx/mb862xxfb.c             |    4 +-
 drivers/video/p9100.c                         |    4 +-
 drivers/video/platinumfb.c                    |    4 +-
 drivers/video/sunxvr1000.c                    |    4 +-
 drivers/video/tcx.c                           |    6 ++--
 drivers/video/xilinxfb.c                      |    4 +-
 drivers/watchdog/cpwd.c                       |    4 +-
 drivers/watchdog/gef_wdt.c                    |    2 +-
 drivers/watchdog/mpc8xxx_wdt.c                |    4 +-
 drivers/watchdog/riowd.c                      |    4 +-
 include/linux/of_device.h                     |   16 ---------
 include/linux/of_platform.h                   |   14 ++++++--
 sound/aoa/soundbus/core.c                     |    2 +-
 sound/aoa/soundbus/soundbus.h                 |    2 +-
 sound/aoa/soundbus/sysfs.c                    |    2 +-
 sound/soc/fsl/mpc5200_dma.c                   |    4 +-
 sound/soc/fsl/mpc5200_dma.h                   |    4 +-
 sound/soc/fsl/mpc5200_psc_ac97.c              |    4 +-
 sound/soc/fsl/mpc5200_psc_i2s.c               |    4 +-
 sound/soc/fsl/mpc8610_hpcd.c                  |    4 +-
 sound/sparc/amd7930.c                         |    8 ++--
 sound/sparc/cs4231.c                          |   18 +++++-----
 sound/sparc/dbri.c                            |    8 ++--
 158 files changed, 519 insertions(+), 527 deletions(-)


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

--001636920b8b27624f048d3509e1
Content-Type: text/x-diff; charset=US-ASCII; name="trial-merge-2.6.36.patch"
Content-Disposition: attachment; filename="trial-merge-2.6.36.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gcjxjwlm0

Y29tbWl0IDEyNTY1NDk0MDU1YmNmYWJjN2Q3YjJjMzM3MDU4MjBhMWM2MzRkM2MKTWVyZ2U6IDU1
YzliOTkgNTk4YTgwZgpBdXRob3I6IEdyYW50IExpa2VseSA8Z3JhbnQubGlrZWx5QHNlY3JldGxh
Yi5jYT4KRGF0ZTogICBGcmkgQXVnIDYgMTI6MTY6NDcgMjAxMCAtMDYwMAoKICAgIE1lcmdlIHJl
bW90ZSBicmFuY2ggJ2xpbnV4LW5leHQnIGludG8gZGV2aWNldHJlZS9uZXh0CiAgICAKICAgIENv
bmZsaWN0czoKICAgIAlkcml2ZXJzL3NwaS9tcGM1MTJ4X3BzY19zcGkuYwoKZGlmZiAtLWNjIGRy
aXZlcnMvYXRhL3NhdGFfZHdjXzQ2MGV4LmMKaW5kZXggMDAwMDAwMCxlYTI0YzFlLi4yNjczYTNk
Cm1vZGUgMDAwMDAwLDEwMDY0NC4uMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYXRhL3NhdGFfZHdjXzQ2
MGV4LmMKKysrIGIvZHJpdmVycy9hdGEvc2F0YV9kd2NfNDYwZXguYwpAQEAgLTEsMCAtMSwxNzU2
ICsxLDE3NTYgQEBACisgLyoKKyAgKiBkcml2ZXJzL2F0YS9zYXRhX2R3Y180NjBleC5jCisgICoK
KyAgKiBTeW5vcHN5cyBEZXNpZ25XYXJlIENvcmVzIChEV0MpIFNBVEEgaG9zdCBkcml2ZXIKKyAg
KgorICAqIEF1dGhvcjogTWFyayBNaWVzZmVsZCA8bW1pZXNmZWxkQGFtY2MuY29tPgorICAqCisg
ICogUG9ydGVkIGZyb20gMi42LjE5LjIgdG8gMi42LjI1LzI2IGJ5IFN0ZWZhbiBSb2VzZSA8c3JA
ZGVueC5kZT4KKyAgKiBDb3B5cmlnaHQgMjAwOCBERU5YIFNvZnR3YXJlIEVuZ2luZWVyaW5nCisg
ICoKKyAgKiBCYXNlZCBvbiB2ZXJzaW9ucyBwcm92aWRlZCBieSBBTUNDIGFuZCBTeW5vcHN5cyB3
aGljaCBhcmU6CisgICogICAgICAgICAgQ29weXJpZ2h0IDIwMDYgQXBwbGllZCBNaWNybyBDaXJj
dWl0cyBDb3Jwb3JhdGlvbgorICAqICAgICAgICAgIENPUFlSSUdIVCAoQykgMjAwNSAgU1lOT1BT
WVMsIElOQy4gIEFMTCBSSUdIVFMgUkVTRVJWRUQKKyAgKgorICAqIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSAgaXQgYW5kL29yIG1vZGlmeSBpdAor
ICAqIHVuZGVyICB0aGUgdGVybXMgb2YgIHRoZSBHTlUgR2VuZXJhbCAgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5IHRoZQorICAqIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgIGVpdGhl
ciB2ZXJzaW9uIDIgb2YgdGhlICBMaWNlbnNlLCBvciAoYXQgeW91cgorICAqIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCisgICovCisgCisgI2lmZGVmIENPTkZJR19TQVRBX0RXQ19ERUJVRwor
ICNkZWZpbmUgREVCVUcKKyAjZW5kaWYKKyAKKyAjaWZkZWYgQ09ORklHX1NBVEFfRFdDX1ZERUJV
RworICNkZWZpbmUgVkVSQk9TRV9ERUJVRworICNkZWZpbmUgREVCVUdfTkNRCisgI2VuZGlmCisg
CisgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgorICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
KyAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KKyAj
aW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KKyAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CisgI2luY2x1ZGUgPGxpbnV4L2xpYmF0YS5oPgorICNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+CisgI2luY2x1ZGUgImxpYmF0YS5oIgorIAorICNpbmNsdWRlIDxzY3NpL3Njc2lfaG9z
dC5oPgorICNpbmNsdWRlIDxzY3NpL3Njc2lfY21uZC5oPgorIAorICNkZWZpbmUgRFJWX05BTUUg
ICAgICAgICJzYXRhLWR3YyIKKyAjZGVmaW5lIERSVl9WRVJTSU9OICAgICAiMS4wIgorIAorIC8q
IFNBVEEgRE1BIGRyaXZlciBHbG9iYWxzICovCisgI2RlZmluZSBETUFfTlVNX0NIQU5TCQkxCisg
I2RlZmluZSBETUFfTlVNX0NIQU5fUkVHUwk4CisgCisgLyogU0FUQSBETUEgUmVnaXN0ZXIgZGVm
aW5pdGlvbnMgKi8KKyAjZGVmaW5lIEFIQl9ETUFfQlJTVF9ERkxUCTY0CS8qIDE2IGRhdGEgaXRl
bXMgYnVyc3QgbGVuZ3RoKi8KKyAKKyBzdHJ1Y3QgZG1hcmVnIHsKKyAJdTMyIGxvdzsJCS8qIExv
dyBiaXRzIDAtMzEgKi8KKyAJdTMyIGhpZ2g7CQkvKiBIaWdoIGJpdHMgMzItNjMgKi8KKyB9Owor
IAorIC8qIERNQSBQZXIgQ2hhbm5lbCByZWdpc3RlcnMgKi8KKyBzdHJ1Y3QgZG1hX2NoYW5fcmVn
cyB7CisgCXN0cnVjdCBkbWFyZWcgc2FyOwkvKiBTb3VyY2UgQWRkcmVzcyAqLworIAlzdHJ1Y3Qg
ZG1hcmVnIGRhcjsJLyogRGVzdGluYXRpb24gYWRkcmVzcyAqLworIAlzdHJ1Y3QgZG1hcmVnIGxs
cDsJLyogTGlua2VkIExpc3QgUG9pbnRlciAqLworIAlzdHJ1Y3QgZG1hcmVnIGN0bDsJLyogQ29u
dHJvbCAqLworIAlzdHJ1Y3QgZG1hcmVnIHNzdGF0OwkvKiBTb3VyY2UgU3RhdHVzIG5vdCBpbXBs
ZW1lbnRlZCBpbiBjb3JlICovCisgCXN0cnVjdCBkbWFyZWcgZHN0YXQ7CS8qIERlc3RpbmF0aW9u
IFN0YXR1cyBub3QgaW1wbGVtZW50ZWQgaW4gY29yZSovCisgCXN0cnVjdCBkbWFyZWcgc3N0YXRh
cjsJLyogU291cmNlIFN0YXR1cyBBZGRyZXNzIG5vdCBpbXBsIGluIGNvcmUgKi8KKyAJc3RydWN0
IGRtYXJlZyBkc3RhdGFyOwkvKiBEZXN0aW5hdGlvbiBTdGF0dXMgQWRkcmVzcyBub3QgaW1wbGVt
ZW50ZSAqLworIAlzdHJ1Y3QgZG1hcmVnIGNmZzsJLyogQ29uZmlnICovCisgCXN0cnVjdCBkbWFy
ZWcgc2dyOwkvKiBTb3VyY2UgR2F0aGVyICovCisgCXN0cnVjdCBkbWFyZWcgZHNyOwkvKiBEZXN0
aW5hdGlvbiBTY2F0dGVyICovCisgfTsKKyAKKyAvKiBHZW5lcmljIEludGVycnVwdCBSZWdpc3Rl
cnMgKi8KKyBzdHJ1Y3QgZG1hX2ludGVycnVwdF9yZWdzIHsKKyAJc3RydWN0IGRtYXJlZyB0ZnI7
CS8qIFRyYW5zZmVyIEludGVycnVwdCAqLworIAlzdHJ1Y3QgZG1hcmVnIGJsb2NrOwkvKiBCbG9j
ayBJbnRlcnJ1cHQgKi8KKyAJc3RydWN0IGRtYXJlZyBzcmN0cmFuOwkvKiBTb3VyY2UgVHJhbnNm
ZXIgSW50ZXJydXB0ICovCisgCXN0cnVjdCBkbWFyZWcgZHN0dHJhbjsJLyogRGVzdCBUcmFuc2Zl
ciBJbnRlcnJ1cHQgKi8KKyAJc3RydWN0IGRtYXJlZyBlcnJvcjsJLyogRXJyb3IgKi8KKyB9Owor
IAorIHN0cnVjdCBhaGJfZG1hX3JlZ3MgeworIAlzdHJ1Y3QgZG1hX2NoYW5fcmVncwljaGFuX3Jl
Z3NbRE1BX05VTV9DSEFOX1JFR1NdOworIAlzdHJ1Y3QgZG1hX2ludGVycnVwdF9yZWdzIGludGVy
cnVwdF9yYXc7CS8qIFJhdyBJbnRlcnJ1cHQgKi8KKyAJc3RydWN0IGRtYV9pbnRlcnJ1cHRfcmVn
cyBpbnRlcnJ1cHRfc3RhdHVzOwkvKiBJbnRlcnJ1cHQgU3RhdHVzICovCisgCXN0cnVjdCBkbWFf
aW50ZXJydXB0X3JlZ3MgaW50ZXJydXB0X21hc2s7CS8qIEludGVycnVwdCBNYXNrICovCisgCXN0
cnVjdCBkbWFfaW50ZXJydXB0X3JlZ3MgaW50ZXJydXB0X2NsZWFyOwkvKiBJbnRlcnJ1cHQgQ2xl
YXIgKi8KKyAJc3RydWN0IGRtYXJlZwkJc3RhdHVzSW50OwkvKiBJbnRlcnJ1cHQgY29tYmluZWQq
LworIAlzdHJ1Y3QgZG1hcmVnCQlycV9zcmNyZWc7CS8qIFNyYyBUcmFucyBSZXEgKi8KKyAJc3Ry
dWN0IGRtYXJlZwkJcnFfZHN0cmVnOwkvKiBEc3QgVHJhbnMgUmVxICovCisgCXN0cnVjdCBkbWFy
ZWcJCXJxX3NnbF9zcmNyZWc7CS8qIFNuZ2wgU3JjIFRyYW5zIFJlcSovCisgCXN0cnVjdCBkbWFy
ZWcJCXJxX3NnbF9kc3RyZWc7CS8qIFNuZ2wgRHN0IFRyYW5zIFJlcSovCisgCXN0cnVjdCBkbWFy
ZWcJCXJxX2xzdF9zcmNyZWc7CS8qIExhc3QgU3JjIFRyYW5zIFJlcSovCisgCXN0cnVjdCBkbWFy
ZWcJCXJxX2xzdF9kc3RyZWc7CS8qIExhc3QgRHN0IFRyYW5zIFJlcSovCisgCXN0cnVjdCBkbWFy
ZWcJCWRtYV9jZmc7CQkvKiBETUEgQ29uZmlnICovCisgCXN0cnVjdCBkbWFyZWcJCWRtYV9jaGFu
X2VuOwkJLyogRE1BIENoYW5uZWwgRW5hYmxlKi8KKyAJc3RydWN0IGRtYXJlZwkJZG1hX2lkOwkJ
CS8qIERNQSBJRCAqLworIAlzdHJ1Y3QgZG1hcmVnCQlkbWFfdGVzdDsJCS8qIERNQSBUZXN0ICov
CisgCXN0cnVjdCBkbWFyZWcJCXJlczE7CQkJLyogcmVzZXJ2ZWQgKi8KKyAJc3RydWN0IGRtYXJl
ZwkJcmVzMjsJCQkvKiByZXNlcnZlZCAqLworIAkvKgorIAkgKiBETUEgQ29tcCBQYXJhbXMKKyAJ
ICogUGFyYW0gNiA9IGRtYV9wYXJhbVswXSwgUGFyYW0gNSA9IGRtYV9wYXJhbVsxXSwKKyAJICog
UGFyYW0gNCA9IGRtYV9wYXJhbVsyXSAuLi4KKyAJICovCisgCXN0cnVjdCBkbWFyZWcJCWRtYV9w
YXJhbXNbNl07CisgfTsKKyAKKyAvKiBEYXRhIHN0cnVjdHVyZSBmb3IgbGlua2VkIGxpc3QgaXRl
bSAqLworIHN0cnVjdCBsbGkgeworIAl1MzIJCXNhcjsJCS8qIFNvdXJjZSBBZGRyZXNzICovCisg
CXUzMgkJZGFyOwkJLyogRGVzdGluYXRpb24gYWRkcmVzcyAqLworIAl1MzIJCWxscDsJCS8qIExp
bmtlZCBMaXN0IFBvaW50ZXIgKi8KKyAJc3RydWN0IGRtYXJlZwljdGw7CQkvKiBDb250cm9sICov
CisgCXN0cnVjdCBkbWFyZWcJZHN0YXQ7CQkvKiBEZXN0aW5hdGlvbiBTdGF0dXMgKi8KKyB9Owor
IAorIGVudW0geworIAlTQVRBX0RXQ19ETUFDX0xMSV9TWiA9CShzaXplb2Yoc3RydWN0IGxsaSkp
LAorIAlTQVRBX0RXQ19ETUFDX0xMSV9OVU0gPQkyNTYsCisgCVNBVEFfRFdDX0RNQUNfTExJX1RC
TF9TWiA9IChTQVRBX0RXQ19ETUFDX0xMSV9TWiAqIFwKKyAJCQkJCVNBVEFfRFdDX0RNQUNfTExJ
X05VTSksCisgCVNBVEFfRFdDX0RNQUNfVFdJRFRIX0JZVEVTID0gNCwKKyAJU0FUQV9EV0NfRE1B
Q19DVFJMX1RTSVpFX01BWCA9ICgweDAwMDAwODAwICogXAorIAkJCQkJCVNBVEFfRFdDX0RNQUNf
VFdJRFRIX0JZVEVTKSwKKyB9OworIAorIC8qIERNQSBSZWdpc3RlciBPcGVyYXRpb24gQml0cyAq
LworIGVudW0geworIAlETUFfRU4JPQkJMHgwMDAwMDAwMSwgLyogRW5hYmxlIEFIQiBETUEgKi8K
KyAJRE1BX0NUTF9MTFBfU1JDRU4gPQkweDEwMDAwMDAwLCAvKiBCbGsgY2hhaW4gZW5hYmxlIFNy
YyAqLworIAlETUFfQ1RMX0xMUF9EU1RFTiA9CTB4MDgwMDAwMDAsIC8qIEJsayBjaGFpbiBlbmFi
bGUgRHN0ICovCisgfTsKKyAKKyAjZGVmaW5lCURNQV9DVExfQkxLX1RTKHNpemUpCSgoc2l6ZSkg
JiAweDAwMDAwMEZGRikJLyogQmxrIFRyYW5zZmVyIHNpemUgKi8KKyAjZGVmaW5lIERNQV9DSEFO
TkVMKGNoKQkJKDB4MDAwMDAwMDEgPDwgKGNoKSkJLyogU2VsZWN0IGNoYW5uZWwgKi8KKyAJLyog
RW5hYmxlIGNoYW5uZWwgKi8KKyAjZGVmaW5lCURNQV9FTkFCTEVfQ0hBTihjaCkJKCgweDAwMDAw
MDAxIDw8IChjaCkpIHwJCQlcCisgCQkJCSAoKDB4MDAwMDAwMDAxIDw8IChjaCkpIDw8IDgpKQor
IAkvKiBEaXNhYmxlIGNoYW5uZWwgKi8KKyAjZGVmaW5lCURNQV9ESVNBQkxFX0NIQU4oY2gpCSgw
eDAwMDAwMDAwIHwgKCgweDAwMDAwMDAwMSA8PCAoY2gpKSA8PCA4KSkKKyAJLyogVHJhbnNmZXIg
VHlwZSAmIEZsb3cgQ29udHJvbGxlciAqLworICNkZWZpbmUJRE1BX0NUTF9UVEZDKHR5cGUpCSgo
KHR5cGUpICYgMHg3KSA8PCAyMCkKKyAjZGVmaW5lCURNQV9DVExfU01TKG51bSkJKCgobnVtKSAm
IDB4MykgPDwgMjUpIC8qIFNyYyBNYXN0ZXIgU2VsZWN0ICovCisgI2RlZmluZQlETUFfQ1RMX0RN
UyhudW0pCSgoKG51bSkgJiAweDMpIDw8IDIzKS8qIERzdCBNYXN0ZXIgU2VsZWN0ICovCisgCS8q
IFNyYyBCdXJzdCBUcmFuc2FjdGlvbiBMZW5ndGggKi8KKyAjZGVmaW5lIERNQV9DVExfU1JDX01T
SVpFKHNpemUpICgoKHNpemUpICYgMHg3KSA8PCAxNCkKKyAJLyogRHN0IEJ1cnN0IFRyYW5zYWN0
aW9uIExlbmd0aCAqLworICNkZWZpbmUJRE1BX0NUTF9EU1RfTVNJWkUoc2l6ZSkgKCgoc2l6ZSkg
JiAweDcpIDw8IDExKQorIAkvKiBTb3VyY2UgVHJhbnNmZXIgV2lkdGggKi8KKyAjZGVmaW5lCURN
QV9DVExfU1JDX1RSV0lEKHNpemUpICgoKHNpemUpICYgMHg3KSA8PCA0KQorIAkvKiBEZXN0aW5h
dGlvbiBUcmFuc2ZlciBXaWR0aCAqLworICNkZWZpbmUJRE1BX0NUTF9EU1RfVFJXSUQoc2l6ZSkg
KCgoc2l6ZSkgJiAweDcpIDw8IDEpCisgCisgLyogQXNzaWduIEhXIGhhbmRzaGFraW5nIGludGVy
ZmFjZSAoeCkgdG8gZGVzdGluYXRpb24gLyBzb3VyY2UgcGVyaXBoZXJhbCAqLworICNkZWZpbmUJ
RE1BX0NGR19IV19IU19ERVNUKGludF9udW0pICgoKGludF9udW0pICYgMHhGKSA8PCAxMSkKKyAj
ZGVmaW5lCURNQV9DRkdfSFdfSFNfU1JDKGludF9udW0pICgoKGludF9udW0pICYgMHhGKSA8PCA3
KQorICNkZWZpbmUJRE1BX0xMUF9MTVMoYWRkciwgbWFzdGVyKSAoKChhZGRyKSAmIDB4ZmZmZmZm
ZmMpIHwgKG1hc3RlcikpCisgCisgLyoKKyAgKiBUaGlzIGRlZmluZSBpcyB1c2VkIHRvIHNldCBi
bG9jayBjaGFpbmluZyBkaXNhYmxlZCBpbiB0aGUgY29udHJvbCBsb3cKKyAgKiByZWdpc3Rlci4g
IEl0IGlzIGFscmVhZHkgaW4gbGl0dGxlIGVuZGlhbiBmb3JtYXQgc28gaXQgY2FuIGJlICYnZCBk
aXJjdGx5LgorICAqIEl0IGlzIGVzc2VudGlhbGx5OiBjcHVfdG9fbGUzMih+KERNQV9DVExfTExQ
X1NSQ0VOIHwgRE1BX0NUTF9MTFBfRFNURU4pKQorICAqLworIGVudW0geworIAlETUFfQ1RMX0xM
UF9ESVNBQkxFX0xFMzIgPSAweGZmZmZmZmU3LAorIAlETUFfQ1RMX1RURkNfUDJNX0RNQUMgPQkw
eDAwMDAwMDAyLCAvKiBQZXIgdG8gbWVtLCBETUFDIGNudHIgKi8KKyAJRE1BX0NUTF9UVEZDX00y
UF9QRVIgPQkweDAwMDAwMDAzLCAvKiBNZW0gdG8gcGVyLCBwZXJpcGhlcmFsIGNudHIgKi8KKyAJ
RE1BX0NUTF9TSU5DX0lOQyA9CTB4MDAwMDAwMDAsIC8qIFNvdXJjZSBBZGRyZXNzIEluY3JlbWVu
dCAqLworIAlETUFfQ1RMX1NJTkNfREVDID0JMHgwMDAwMDIwMCwKKyAJRE1BX0NUTF9TSU5DX05P
Q0hBTkdFID0JMHgwMDAwMDQwMCwKKyAJRE1BX0NUTF9ESU5DX0lOQyA9CTB4MDAwMDAwMDAsIC8q
IERlc3RpbmF0aW9uIEFkZHJlc3MgSW5jcmVtZW50ICovCisgCURNQV9DVExfRElOQ19ERUMgPQkw
eDAwMDAwMDgwLAorIAlETUFfQ1RMX0RJTkNfTk9DSEFOR0UgPQkweDAwMDAwMTAwLAorIAlETUFf
Q1RMX0lOVF9FTiA9CTB4MDAwMDAwMDEsIC8qIEludGVycnVwdCBFbmFibGUgKi8KKyAKKyAvKiBD
aGFubmVsIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgaGlnaCBiaXRzICovCisgCURNQV9DRkdfRkNN
T0RfUkVRID0JMHgwMDAwMDAwMSwgLyogRmxvdyBDb250cm9sIC0gcmVxdWVzdCBiYXNlZCAqLwor
IAlETUFfQ0ZHX1BST1RDVEwJPQkoMHgwMDAwMDAwMyA8PCAyKSwvKiBQcm90ZWN0aW9uIENvbnRy
b2wgKi8KKyAKKyAvKiBDaGFubmVsIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgbG93IGJpdHMgKi8K
KyAJRE1BX0NGR19SRUxEX0RTVCA9CTB4ODAwMDAwMDAsIC8qIFJlbG9hZCBEZXN0IC8gU3JjIEFk
ZHIgKi8KKyAJRE1BX0NGR19SRUxEX1NSQyA9CTB4NDAwMDAwMDAsCisgCURNQV9DRkdfSFNfU0VM
U1JDID0JMHgwMDAwMDgwMCwgLyogU29mdHdhcmUgaGFuZHNoYWtlIFNyYy8gRGVzdCAqLworIAlE
TUFfQ0ZHX0hTX1NFTERTVCA9CTB4MDAwMDA0MDAsCisgCURNQV9DRkdfRklGT0VNUFRZID0gICAg
ICgweDAwMDAwMDAxIDw8IDkpLCAvKiBGSUZPIEVtcHR5IGJpdCAqLworIAorIC8qIENoYW5uZWwg
TGlua2VkIExpc3QgUG9pbnRlciBSZWdpc3RlciAqLworIAlETUFfTExQX0FIQk1BU1RFUjEgPQkw
LAkvKiBMaXN0IE1hc3RlciBTZWxlY3QgKi8KKyAJRE1BX0xMUF9BSEJNQVNURVIyID0JMSwKKyAK
KyAJU0FUQV9EV0NfTUFYX1BPUlRTID0gMSwKKyAKKyAJU0FUQV9EV0NfU0NSX09GRlNFVCA9IDB4
MjQsCisgCVNBVEFfRFdDX1JFR19PRkZTRVQgPSAweDY0LAorIH07CisgCisgLyogRFdDIFNBVEEg
UmVnaXN0ZXJzICovCisgc3RydWN0IHNhdGFfZHdjX3JlZ3MgeworIAl1MzIgZnB0YWdyOwkJLyog
MXN0IHBhcnR5IERNQSB0YWcgKi8KKyAJdTMyIGZwYm9yOwkJLyogMXN0IHBhcnR5IERNQSBidWZm
ZXIgb2Zmc2V0ICovCisgCXUzMiBmcHRjcjsJCS8qIDFzdCBwYXJ0eSBETUEgWGZyIGNvdW50ICov
CisgCXUzMiBkbWFjcjsJCS8qIERNQSBDb250cm9sICovCisgCXUzMiBkYnRzcjsJCS8qIERNQSBC
dXJzdCBUcmFuc2FjIHNpemUgKi8KKyAJdTMyIGludHByOwkJLyogSW50ZXJydXB0IFBlbmRpbmcg
Ki8KKyAJdTMyIGludG1yOwkJLyogSW50ZXJydXB0IE1hc2sgKi8KKyAJdTMyIGVycm1yOwkJLyog
RXJyb3IgTWFzayAqLworIAl1MzIgbGxjcjsJCS8qIExpbmsgTGF5ZXIgQ29udHJvbCAqLworIAl1
MzIgcGh5Y3I7CQkvKiBQSFkgQ29udHJvbCAqLworIAl1MzIgcGh5c3I7CQkvKiBQSFkgU3RhdHVz
ICovCisgCXUzMiByeGJpc3RwZDsJCS8qIFJlY3ZkIEJJU1QgcGF0dGVybiBkZWYgcmVnaXN0ZXIg
Ki8KKyAJdTMyIHJ4YmlzdHBkMTsJCS8qIFJlY3ZkIEJJU1QgZGF0YSBkd29yZDEgKi8KKyAJdTMy
IHJ4YmlzdHBkMjsJCS8qIFJlY3ZkIEJJU1QgcGF0dGVybiBkYXRhIGR3b3JkMiAqLworIAl1MzIg
dHhiaXN0cGQ7CQkvKiBUcmFucyBCSVNUIHBhdHRlcm4gZGVmIHJlZ2lzdGVyICovCisgCXUzMiB0
eGJpc3RwZDE7CQkvKiBUcmFucyBCSVNUIGRhdGEgZHdvcmQxICovCisgCXUzMiB0eGJpc3RwZDI7
CQkvKiBUcmFucyBCSVNUIGRhdGEgZHdvcmQyICovCisgCXUzMiBiaXN0Y3I7CQkvKiBCSVNUIENv
bnRyb2wgUmVnaXN0ZXIgKi8KKyAJdTMyIGJpc3RmY3RyOwkJLyogQklTVCBGSVMgQ291bnQgUmVn
aXN0ZXIgKi8KKyAJdTMyIGJpc3RzcjsJCS8qIEJJU1QgU3RhdHVzIFJlZ2lzdGVyICovCisgCXUz
MiBiaXN0ZGVjcjsJCS8qIEJJU1QgRHdvcmQgRXJyb3IgY291bnQgcmVnaXN0ZXIgKi8KKyAJdTMy
IHJlc1sxNV07CQkvKiBSZXNlcnZlZCBsb2NhdGlvbnMgKi8KKyAJdTMyIHRlc3RyOwkJLyogVGVz
dCBSZWdpc3RlciAqLworIAl1MzIgdmVyc2lvbnI7CQkvKiBWZXJzaW9uIFJlZ2lzdGVyICovCisg
CXUzMiBpZHI7CQkvKiBJRCBSZWdpc3RlciAqLworIAl1MzIgdW5pbXBsWzE5Ml07CS8qIFVuaW1w
bGVtZW50ZWQgKi8KKyAJdTMyIGRtYWRyWzI1Nl07CS8qIEZJRk8gTG9jYXRpb25zIGluIERNQSBN
b2RlICovCisgfTsKKyAKKyBlbnVtIHsKKyAJU0NSX1NDT05UUk9MX0RFVF9FTkFCTEUJPQkweDAw
MDAwMDAxLAorIAlTQ1JfU1NUQVRVU19ERVRfUFJFU0VOVAk9CTB4MDAwMDAwMDEsCisgCVNDUl9T
RVJST1JfRElBR19YCT0JMHgwNDAwMDAwMCwKKyAvKiBEV0MgU0FUQSBSZWdpc3RlciBPcGVyYXRp
b25zICovCisgCVNBVEFfRFdDX1RYRklGT19ERVBUSAk9CTB4MDFGRiwKKyAJU0FUQV9EV0NfUlhG
SUZPX0RFUFRICT0JMHgwMUZGLAorIAlTQVRBX0RXQ19ETUFDUl9UTU9EX1RYQ0hFTiA9CTB4MDAw
MDAwMDQsCisgCVNBVEFfRFdDX0RNQUNSX1RYQ0hFTgk9ICgweDAwMDAwMDAxIHwgU0FUQV9EV0Nf
RE1BQ1JfVE1PRF9UWENIRU4pLAorIAlTQVRBX0RXQ19ETUFDUl9SWENIRU4JPSAoMHgwMDAwMDAw
MiB8IFNBVEFfRFdDX0RNQUNSX1RNT0RfVFhDSEVOKSwKKyAJU0FUQV9EV0NfRE1BQ1JfVFhSWENI
X0NMRUFSID0JU0FUQV9EV0NfRE1BQ1JfVE1PRF9UWENIRU4sCisgCVNBVEFfRFdDX0lOVFBSX0RN
QVQJPQkweDAwMDAwMDAxLAorIAlTQVRBX0RXQ19JTlRQUl9ORVdGUAk9CTB4MDAwMDAwMDIsCisg
CVNBVEFfRFdDX0lOVFBSX1BNQUJSVAk9CTB4MDAwMDAwMDQsCisgCVNBVEFfRFdDX0lOVFBSX0VS
Ugk9CTB4MDAwMDAwMDgsCisgCVNBVEFfRFdDX0lOVFBSX05FV0JJU1QJPQkweDAwMDAwMDEwLAor
IAlTQVRBX0RXQ19JTlRQUl9JUEYJPQkweDEwMDAwMDAwLAorIAlTQVRBX0RXQ19JTlRNUl9ETUFU
TQk9CTB4MDAwMDAwMDEsCisgCVNBVEFfRFdDX0lOVE1SX05FV0ZQTQk9CTB4MDAwMDAwMDIsCisg
CVNBVEFfRFdDX0lOVE1SX1BNQUJSVE0JPQkweDAwMDAwMDA0LAorIAlTQVRBX0RXQ19JTlRNUl9F
UlJNCT0JMHgwMDAwMDAwOCwKKyAJU0FUQV9EV0NfSU5UTVJfTkVXQklTVE0JPQkweDAwMDAwMDEw
LAorIAlTQVRBX0RXQ19MTENSX1NDUkFNRU4JPQkweDAwMDAwMDAxLAorIAlTQVRBX0RXQ19MTENS
X0RFU0NSQU1FTgk9CTB4MDAwMDAwMDIsCisgCVNBVEFfRFdDX0xMQ1JfUlBERU4JPQkweDAwMDAw
MDA0LAorIC8qIFRoaXMgaXMgYWxsIGVycm9yIGJpdHMsIHplcm8ncyBhcmUgcmVzZXJ2ZWQgZmll
bGRzLiAqLworIAlTQVRBX0RXQ19TRVJST1JfRVJSX0JJVFMgPQkweDBGRkYwRjAzCisgfTsKKyAK
KyAjZGVmaW5lIFNBVEFfRFdDX1NDUjBfU1BEX0dFVCh2KQkoKCh2KSA+PiA0KSAmIDB4MDAwMDAw
MEYpCisgI2RlZmluZSBTQVRBX0RXQ19ETUFDUl9UWF9DTEVBUih2KQkoKCh2KSAmIH5TQVRBX0RX
Q19ETUFDUl9UWENIRU4pIHxcCisgCQkJCQkJIFNBVEFfRFdDX0RNQUNSX1RNT0RfVFhDSEVOKQor
ICNkZWZpbmUgU0FUQV9EV0NfRE1BQ1JfUlhfQ0xFQVIodikJKCgodikgJiB+U0FUQV9EV0NfRE1B
Q1JfUlhDSEVOKSB8XAorIAkJCQkJCSBTQVRBX0RXQ19ETUFDUl9UTU9EX1RYQ0hFTikKKyAjZGVm
aW5lIFNBVEFfRFdDX0RCVFNSX01XUihzaXplKQkoKChzaXplKS80KSAmIFNBVEFfRFdDX1RYRklG
T19ERVBUSCkKKyAjZGVmaW5lIFNBVEFfRFdDX0RCVFNSX01SRChzaXplKQkoKCgoc2l6ZSkvNCkg
JiBTQVRBX0RXQ19SWEZJRk9fREVQVEgpXAorIAkJCQkJCSA8PCAxNikKKyBzdHJ1Y3Qgc2F0YV9k
d2NfZGV2aWNlIHsKKyAJc3RydWN0IGRldmljZQkJKmRldjsJCS8qIGdlbmVyaWMgZGV2aWNlIHN0
cnVjdCAqLworIAlzdHJ1Y3QgYXRhX3Byb2JlX2VudAkqcGU7CQkvKiBwdHIgdG8gcHJvYmUtZW50
ICovCisgCXN0cnVjdCBhdGFfaG9zdAkJKmhvc3Q7CisgCXU4CQkJKnJlZ19iYXNlOworIAlzdHJ1
Y3Qgc2F0YV9kd2NfcmVncwkqc2F0YV9kd2NfcmVnczsJLyogRFcgU3lub3BzeXMgU0FUQSBzcGVj
aWZpYyAqLworIAlpbnQJCQlpcnFfZG1hOworIH07CisgCisgI2RlZmluZSBTQVRBX0RXQ19RQ01E
X01BWAkzMgorIAorIHN0cnVjdCBzYXRhX2R3Y19kZXZpY2VfcG9ydCB7CisgCXN0cnVjdCBzYXRh
X2R3Y19kZXZpY2UJKmhzZGV2OworIAlpbnQJCQljbWRfaXNzdWVkW1NBVEFfRFdDX1FDTURfTUFY
XTsKKyAJc3RydWN0IGxsaQkJKmxsaXRbU0FUQV9EV0NfUUNNRF9NQVhdOyAgLyogRE1BIExMSSB0
YWJsZSAqLworIAlkbWFfYWRkcl90CQlsbGl0X2RtYVtTQVRBX0RXQ19RQ01EX01BWF07CisgCXUz
MgkJCWRtYV9jaGFuW1NBVEFfRFdDX1FDTURfTUFYXTsKKyAJaW50CQkJZG1hX3BlbmRpbmdbU0FU
QV9EV0NfUUNNRF9NQVhdOworIH07CisgCisgLyoKKyAgKiBDb21tb25seSB1c2VkIERXQyBTQVRB
IGRyaXZlciBNYWNyb3MKKyAgKi8KKyAjZGVmaW5lIEhTREVWX0ZST01fSE9TVChob3N0KSAgKChz
dHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlICopXAorIAkJCQkJKGhvc3QpLT5wcml2YXRlX2RhdGEpCisg
I2RlZmluZSBIU0RFVl9GUk9NX0FQKGFwKSAgKChzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlICopXAor
IAkJCQkJKGFwKS0+aG9zdC0+cHJpdmF0ZV9kYXRhKQorICNkZWZpbmUgSFNERVZQX0ZST01fQVAo
YXApICAgKChzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlX3BvcnQgKilcCisgCQkJCQkoYXApLT5wcml2
YXRlX2RhdGEpCisgI2RlZmluZSBIU0RFVl9GUk9NX1FDKHFjKQkoKHN0cnVjdCBzYXRhX2R3Y19k
ZXZpY2UgKilcCisgCQkJCQkocWMpLT5hcC0+aG9zdC0+cHJpdmF0ZV9kYXRhKQorICNkZWZpbmUg
SFNERVZfRlJPTV9IU0RFVlAocCkJKChzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlICopXAorIAkJCQkJ
CShoc2RldnApLT5oc2RldikKKyAKKyBlbnVtIHsKKyAJU0FUQV9EV0NfQ01EX0lTU1VFRF9OT1QJ
CT0gMCwKKyAJU0FUQV9EV0NfQ01EX0lTU1VFRF9QRU5ECT0gMSwKKyAJU0FUQV9EV0NfQ01EX0lT
U1VFRF9FWEVDCT0gMiwKKyAJU0FUQV9EV0NfQ01EX0lTU1VFRF9OT0RBVEEJPSAzLAorIAorIAlT
QVRBX0RXQ19ETUFfUEVORElOR19OT05FCT0gMCwKKyAJU0FUQV9EV0NfRE1BX1BFTkRJTkdfVFgJ
CT0gMSwKKyAJU0FUQV9EV0NfRE1BX1BFTkRJTkdfUlgJCT0gMiwKKyB9OworIAorIHN0cnVjdCBz
YXRhX2R3Y19ob3N0X3ByaXYgeworIAl2b2lkCV9faW9tZW0JICpzY3JfYWRkcl9zc3RhdHVzOwor
IAl1MzIJc2F0YV9kd2Nfc2FjdGl2ZV9pc3N1ZWQgOworIAl1MzIJc2F0YV9kd2Nfc2FjdGl2ZV9x
dWV1ZWQgOworIAl1MzIJZG1hX2ludGVycnVwdF9jb3VudDsKKyAJc3RydWN0CWFoYl9kbWFfcmVn
cwkqc2F0YV9kbWFfcmVnczsKKyAJc3RydWN0CWRldmljZQkqZHdjX2RldjsKKyB9OworIHN0cnVj
dCBzYXRhX2R3Y19ob3N0X3ByaXYgaG9zdF9wdnQ7CisgLyoKKyAgKiBQcm90b3R5cGVzCisgICov
Cisgc3RhdGljIHZvaWQgc2F0YV9kd2NfYm1kbWFfc3RhcnRfYnlfdGFnKHN0cnVjdCBhdGFfcXVl
dWVkX2NtZCAqcWMsIHU4IHRhZyk7Cisgc3RhdGljIGludCBzYXRhX2R3Y19xY19jb21wbGV0ZShz
dHJ1Y3QgYXRhX3BvcnQgKmFwLCBzdHJ1Y3QgYXRhX3F1ZXVlZF9jbWQgKnFjLAorIAkJCQl1MzIg
Y2hlY2tfc3RhdHVzKTsKKyBzdGF0aWMgdm9pZCBzYXRhX2R3Y19kbWFfeGZlcl9jb21wbGV0ZShz
dHJ1Y3QgYXRhX3BvcnQgKmFwLCB1MzIgY2hlY2tfc3RhdHVzKTsKKyBzdGF0aWMgdm9pZCBzYXRh
X2R3Y19wb3J0X3N0b3Aoc3RydWN0IGF0YV9wb3J0ICphcCk7Cisgc3RhdGljIHZvaWQgc2F0YV9k
d2NfY2xlYXJfZG1hY3Ioc3RydWN0IHNhdGFfZHdjX2RldmljZV9wb3J0ICpoc2RldnAsIHU4IHRh
Zyk7Cisgc3RhdGljIGludCBkbWFfZHdjX2luaXQoc3RydWN0IHNhdGFfZHdjX2RldmljZSAqaHNk
ZXYsIGludCBpcnEpOworIHN0YXRpYyB2b2lkIGRtYV9kd2NfZXhpdChzdHJ1Y3Qgc2F0YV9kd2Nf
ZGV2aWNlICpoc2Rldik7Cisgc3RhdGljIGludCBkbWFfZHdjX3hmZXJfc2V0dXAoc3RydWN0IHNj
YXR0ZXJsaXN0ICpzZywgaW50IG51bV9lbGVtcywKKyAJCQkgICAgICBzdHJ1Y3QgbGxpICpsbGks
IGRtYV9hZGRyX3QgZG1hX2xsaSwKKyAJCQkgICAgICB2b2lkIF9faW9tZW0gKmFkZHIsIGludCBk
aXIpOworIHN0YXRpYyB2b2lkIGRtYV9kd2NfeGZlcl9zdGFydChpbnQgZG1hX2NoKTsKKyAKKyBz
dGF0aWMgdm9pZCBzYXRhX2R3Y190Zl9kdW1wKHN0cnVjdCBhdGFfdGFza2ZpbGUgKnRmKQorIHsK
KyAJZGV2X3ZkYmcoaG9zdF9wdnQuZHdjX2RldiwgInRhc2tmaWxlIGNtZDogMHglMDJ4IHByb3Rv
Y29sOiAlcyBmbGFnczoiCisgCQkiMHglbHggZGV2aWNlOiAleFxuIiwgdGYtPmNvbW1hbmQsIGF0
YV9nZXRfY21kX2Rlc2NyaXB0XAorIAkJKHRmLT5wcm90b2NvbCksIHRmLT5mbGFncywgdGYtPmRl
dmljZSk7CisgCWRldl92ZGJnKGhvc3RfcHZ0LmR3Y19kZXYsICJmZWF0dXJlOiAweCUwMnggbnNl
Y3Q6IDB4JXggbGJhbDogMHgleCAiCisgCQkibGJhbTogMHgleCBsYmFoOiAweCV4XG4iLCB0Zi0+
ZmVhdHVyZSwgdGYtPm5zZWN0LCB0Zi0+bGJhbCwKKyAJCSB0Zi0+bGJhbSwgdGYtPmxiYWgpOwor
IAlkZXZfdmRiZyhob3N0X3B2dC5kd2NfZGV2LCAiaG9iX2ZlYXR1cmU6IDB4JTAyeCBob2JfbnNl
Y3Q6IDB4JXggIgorIAkJImhvYl9sYmFsOiAweCV4IGhvYl9sYmFtOiAweCV4IGhvYl9sYmFoOiAw
eCV4XG4iLAorIAkJdGYtPmhvYl9mZWF0dXJlLCB0Zi0+aG9iX25zZWN0LCB0Zi0+aG9iX2xiYWws
IHRmLT5ob2JfbGJhbSwKKyAJCXRmLT5ob2JfbGJhaCk7CisgfQorIAorIC8qCisgICogRnVuY3Rp
b246IGdldF9idXJzdF9sZW5ndGhfZW5jb2RlCisgICogYXJndW1lbnRzOiBkYXRhbGVuZ3RoOiBs
ZW5ndGggaW4gYnl0ZXMgb2YgZGF0YQorICAqIHJldHVybnMgdmFsdWUgdG8gYmUgcHJvZ3JhbW1l
ZCBpbiByZWdpc3RlciBjb3JycmVzcG9uZGluZyB0byBkYXRhIGxlbmd0aAorICAqIFRoaXMgdmFs
dWUgaXMgZWZmZWN0aXZlbHkgdGhlIGxvZyhiYXNlIDIpIG9mIHRoZSBsZW5ndGgKKyAgKi8KKyBz
dGF0aWMgIGludCBnZXRfYnVyc3RfbGVuZ3RoX2VuY29kZShpbnQgZGF0YWxlbmd0aCkKKyB7Cisg
CWludCBpdGVtcyA9IGRhdGFsZW5ndGggPj4gMjsJLyogZGl2IGJ5IDQgdG8gZ2V0IGx3b3JkIGNv
dW50ICovCisgCisgCWlmIChpdGVtcyA+PSA2NCkKKyAJCXJldHVybiA1OworIAorIAlpZiAoaXRl
bXMgPj0gMzIpCisgCQlyZXR1cm4gNDsKKyAKKyAJaWYgKGl0ZW1zID49IDE2KQorIAkJcmV0dXJu
IDM7CisgCisgCWlmIChpdGVtcyA+PSA4KQorIAkJcmV0dXJuIDI7CisgCisgCWlmIChpdGVtcyA+
PSA0KQorIAkJcmV0dXJuIDE7CisgCisgCXJldHVybiAwOworIH0KKyAKKyBzdGF0aWMgIHZvaWQg
Y2xlYXJfY2hhbl9pbnRlcnJ1cHRzKGludCBjKQorIHsKKyAJb3V0X2xlMzIoJihob3N0X3B2dC5z
YXRhX2RtYV9yZWdzLT5pbnRlcnJ1cHRfY2xlYXIudGZyLmxvdyksCisgCQkgRE1BX0NIQU5ORUwo
YykpOworIAlvdXRfbGUzMigmKGhvc3RfcHZ0LnNhdGFfZG1hX3JlZ3MtPmludGVycnVwdF9jbGVh
ci5ibG9jay5sb3cpLAorIAkJIERNQV9DSEFOTkVMKGMpKTsKKyAJb3V0X2xlMzIoJihob3N0X3B2
dC5zYXRhX2RtYV9yZWdzLT5pbnRlcnJ1cHRfY2xlYXIuc3JjdHJhbi5sb3cpLAorIAkJIERNQV9D
SEFOTkVMKGMpKTsKKyAJb3V0X2xlMzIoJihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5pbnRlcnJ1
cHRfY2xlYXIuZHN0dHJhbi5sb3cpLAorIAkJIERNQV9DSEFOTkVMKGMpKTsKKyAJb3V0X2xlMzIo
Jihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5pbnRlcnJ1cHRfY2xlYXIuZXJyb3IubG93KSwKKyAJ
CSBETUFfQ0hBTk5FTChjKSk7CisgfQorIAorIC8qCisgICogRnVuY3Rpb246IGRtYV9yZXF1ZXN0
X2NoYW5uZWwKKyAgKiBhcmd1bWVudHM6IE5vbmUKKyAgKiByZXR1cm5zIGNoYW5uZWwgbnVtYmVy
IGlmIGF2YWlsYWJsZSBlbHNlIC0xCisgICogVGhpcyBmdW5jdGlvbiBhc3NpZ25zIHRoZSBuZXh0
IGF2YWlsYWJsZSBETUEgY2hhbm5lbCBmcm9tIHRoZSBsaXN0IHRvIHRoZQorICAqIHJlcXVlc3Rl
cgorICAqLworIHN0YXRpYyBpbnQgZG1hX3JlcXVlc3RfY2hhbm5lbCh2b2lkKQorIHsKKyAJaW50
IGk7CisgCisgCWZvciAoaSA9IDA7IGkgPCBETUFfTlVNX0NIQU5TOyBpKyspIHsKKyAJCWlmICgh
KGluX2xlMzIoJihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5kbWFfY2hhbl9lbi5sb3cpKSAmXAor
IAkJCURNQV9DSEFOTkVMKGkpKSkKKyAJCQlyZXR1cm4gaTsKKyAJfQorIAlkZXZfZXJyKGhvc3Rf
cHZ0LmR3Y19kZXYsICIlcyBOTyBjaGFubmVsIGNoYW5fZW46IDB4JTA4eFxuIiwgX19mdW5jX18s
CisgCQlpbl9sZTMyKCYoaG9zdF9wdnQuc2F0YV9kbWFfcmVncy0+ZG1hX2NoYW5fZW4ubG93KSkp
OworIAlyZXR1cm4gLTE7CisgfQorIAorIC8qCisgICogRnVuY3Rpb246IGRtYV9kd2NfaW50ZXJy
dXB0CisgICogYXJndW1lbnRzOiBpcnEsIGRldl9pZCwgcHRfcmVncworICAqIHJldHVybnMgY2hh
bm5lbCBudW1iZXIgaWYgYXZhaWxhYmxlIGVsc2UgLTEKKyAgKiBJbnRlcnJ1cHQgSGFuZGxlciBm
b3IgRFcgQUhCIFNBVEEgRE1BCisgICovCisgc3RhdGljIGlycXJldHVybl90IGRtYV9kd2NfaW50
ZXJydXB0KGludCBpcnEsIHZvaWQgKmhzZGV2X2luc3RhbmNlKQorIHsKKyAJaW50IGNoYW47Cisg
CXUzMiB0ZnJfcmVnLCBlcnJfcmVnOworIAl1bnNpZ25lZCBsb25nIGZsYWdzOworIAlzdHJ1Y3Qg
c2F0YV9kd2NfZGV2aWNlICpoc2RldiA9CisgCQkoc3RydWN0IHNhdGFfZHdjX2RldmljZSAqKWhz
ZGV2X2luc3RhbmNlOworIAlzdHJ1Y3QgYXRhX2hvc3QgKmhvc3QgPSAoc3RydWN0IGF0YV9ob3N0
ICopaHNkZXYtPmhvc3Q7CisgCXN0cnVjdCBhdGFfcG9ydCAqYXA7CisgCXN0cnVjdCBzYXRhX2R3
Y19kZXZpY2VfcG9ydCAqaHNkZXZwOworIAl1OCB0YWcgPSAwOworIAl1bnNpZ25lZCBpbnQgcG9y
dCA9IDA7CisgCisgCXNwaW5fbG9ja19pcnFzYXZlKCZob3N0LT5sb2NrLCBmbGFncyk7CisgCWFw
ID0gaG9zdC0+cG9ydHNbcG9ydF07CisgCWhzZGV2cCA9IEhTREVWUF9GUk9NX0FQKGFwKTsKKyAJ
dGFnID0gYXAtPmxpbmsuYWN0aXZlX3RhZzsKKyAKKyAJdGZyX3JlZyA9IGluX2xlMzIoJihob3N0
X3B2dC5zYXRhX2RtYV9yZWdzLT5pbnRlcnJ1cHRfc3RhdHVzLnRmclwKKyAJCQkubG93KSk7Cisg
CWVycl9yZWcgPSBpbl9sZTMyKCYoaG9zdF9wdnQuc2F0YV9kbWFfcmVncy0+aW50ZXJydXB0X3N0
YXR1cy5lcnJvclwKKyAJCQkubG93KSk7CisgCisgCWRldl9kYmcoYXAtPmRldiwgImVvdD0weCUw
OHggZXJyPTB4JTA4eCBwZW5kaW5nPSVkIGFjdGl2ZSBwb3J0PSVkXG4iLAorIAkJdGZyX3JlZywg
ZXJyX3JlZywgaHNkZXZwLT5kbWFfcGVuZGluZ1t0YWddLCBwb3J0KTsKKyAKKyAJZm9yIChjaGFu
ID0gMDsgY2hhbiA8IERNQV9OVU1fQ0hBTlM7IGNoYW4rKykgeworIAkJLyogQ2hlY2sgZm9yIGVu
ZC1vZi10cmFuc2ZlciBpbnRlcnJ1cHQuICovCisgCQlpZiAodGZyX3JlZyAmIERNQV9DSEFOTkVM
KGNoYW4pKSB7CisgCQkJLyoKKyAJCQkgKiBFYWNoIERNQSBjb21tYW5kIHByb2R1Y2VzIDIgaW50
ZXJydXB0cy4gIE9ubHkKKyAJCQkgKiBjb21wbGV0ZSB0aGUgY29tbWFuZCBhZnRlciBib3RoIGlu
dGVycnVwdHMgaGF2ZSBiZWVuCisgCQkJICogc2Vlbi4gKFNlZSBzYXRhX2R3Y19pc3IoKSkKKyAJ
CQkgKi8KKyAJCQlob3N0X3B2dC5kbWFfaW50ZXJydXB0X2NvdW50Kys7CisgCQkJc2F0YV9kd2Nf
Y2xlYXJfZG1hY3IoaHNkZXZwLCB0YWcpOworIAorIAkJCWlmIChoc2RldnAtPmRtYV9wZW5kaW5n
W3RhZ10gPT0KKyAJCQkgICAgU0FUQV9EV0NfRE1BX1BFTkRJTkdfTk9ORSkgeworIAkJCQlkZXZf
ZXJyKGFwLT5kZXYsICJETUEgbm90IHBlbmRpbmcgZW90PTB4JTA4eCAiCisgCQkJCQkiZXJyPTB4
JTA4eCB0YWc9MHglMDJ4IHBlbmRpbmc9JWRcbiIsCisgCQkJCQl0ZnJfcmVnLCBlcnJfcmVnLCB0
YWcsCisgCQkJCQloc2RldnAtPmRtYV9wZW5kaW5nW3RhZ10pOworIAkJCX0KKyAKKyAJCQlpZiAo
KGhvc3RfcHZ0LmRtYV9pbnRlcnJ1cHRfY291bnQgJSAyKSA9PSAwKQorIAkJCQlzYXRhX2R3Y19k
bWFfeGZlcl9jb21wbGV0ZShhcCwgMSk7CisgCisgCQkJLyogQ2xlYXIgdGhlIGludGVycnVwdCAq
LworIAkJCW91dF9sZTMyKCYoaG9zdF9wdnQuc2F0YV9kbWFfcmVncy0+aW50ZXJydXB0X2NsZWFy
XAorIAkJCQkudGZyLmxvdyksCisgCQkJCSBETUFfQ0hBTk5FTChjaGFuKSk7CisgCQl9CisgCisg
CQkvKiBDaGVjayBmb3IgZXJyb3IgaW50ZXJydXB0LiAqLworIAkJaWYgKGVycl9yZWcgJiBETUFf
Q0hBTk5FTChjaGFuKSkgeworIAkJCS8qIFRPRE8gTmVlZCBlcnJvciBoYW5kbGVyICEgKi8KKyAJ
CQlkZXZfZXJyKGFwLT5kZXYsICJlcnJvciBpbnRlcnJ1cHQgZXJyX3JlZz0weCUwOHhcbiIsCisg
CQkJCWVycl9yZWcpOworIAorIAkJCS8qIENsZWFyIHRoZSBpbnRlcnJ1cHQuICovCisgCQkJb3V0
X2xlMzIoJihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5pbnRlcnJ1cHRfY2xlYXJcCisgCQkJCS5l
cnJvci5sb3cpLAorIAkJCQkgRE1BX0NIQU5ORUwoY2hhbikpOworIAkJfQorIAl9CisgCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmhvc3QtPmxvY2ssIGZsYWdzKTsKKyAJcmV0dXJuIElSUV9IQU5E
TEVEOworIH0KKyAKKyAvKgorICAqIEZ1bmN0aW9uOiBkbWFfcmVxdWVzdF9pbnRlcnJ1cHRzCisg
ICogYXJndW1lbnRzOiBoc2RldgorICAqIHJldHVybnMgc3RhdHVzCisgICogVGhpcyBmdW5jdGlv
biByZWdpc3RlcnMgSVNSIGZvciBhIHBhcnRpY3VsYXIgRE1BIGNoYW5uZWwgaW50ZXJydXB0Cisg
ICovCisgc3RhdGljIGludCBkbWFfcmVxdWVzdF9pbnRlcnJ1cHRzKHN0cnVjdCBzYXRhX2R3Y19k
ZXZpY2UgKmhzZGV2LCBpbnQgaXJxKQorIHsKKyAJaW50IHJldHZhbCA9IDA7CisgCWludCBjaGFu
OworIAorIAlmb3IgKGNoYW4gPSAwOyBjaGFuIDwgRE1BX05VTV9DSEFOUzsgY2hhbisrKSB7Cisg
CQkvKiBVbm1hc2sgZXJyb3IgaW50ZXJydXB0ICovCisgCQlvdXRfbGUzMigmKGhvc3RfcHZ0LnNh
dGFfZG1hX3JlZ3MpLT5pbnRlcnJ1cHRfbWFzay5lcnJvci5sb3csCisgCQkJIERNQV9FTkFCTEVf
Q0hBTihjaGFuKSk7CisgCisgCQkvKiBVbm1hc2sgZW5kLW9mLXRyYW5zZmVyIGludGVycnVwdCAq
LworIAkJb3V0X2xlMzIoJihob3N0X3B2dC5zYXRhX2RtYV9yZWdzKS0+aW50ZXJydXB0X21hc2su
dGZyLmxvdywKKyAJCQkgRE1BX0VOQUJMRV9DSEFOKGNoYW4pKTsKKyAJfQorIAorIAlyZXR2YWwg
PSByZXF1ZXN0X2lycShpcnEsIGRtYV9kd2NfaW50ZXJydXB0LCAwLCAiU0FUQSBETUEiLCBoc2Rl
dik7CisgCWlmIChyZXR2YWwpIHsKKyAJCWRldl9lcnIoaG9zdF9wdnQuZHdjX2RldiwgIiVzOiBj
b3VsZCBub3QgZ2V0IElSUSAlZFxuIiwKKyAJCV9fZnVuY19fLCBpcnEpOworIAkJcmV0dXJuIC1F
Tk9ERVY7CisgCX0KKyAKKyAJLyogTWFyayB0aGlzIGludGVycnVwdCBhcyByZXF1ZXN0ZWQgKi8K
KyAJaHNkZXYtPmlycV9kbWEgPSBpcnE7CisgCXJldHVybiAwOworIH0KKyAKKyAvKgorICAqIEZ1
bmN0aW9uOiBtYXBfc2dfdG9fbGxpCisgICogVGhlIFN5bm9wc2lzIGRyaXZlciBoYXMgYSBjb21t
ZW50IHByb3Bvc2luZyB0aGF0IGJldHRlciBwZXJmb3JtYW5jZQorICAqIGlzIHBvc3NpYmxlIGJ5
IG9ubHkgZW5hYmxpbmcgaW50ZXJydXB0cyBvbiB0aGUgbGFzdCBpdGVtIGluIHRoZSBsaW5rZWQg
bGlzdC4KKyAgKiBIb3dldmVyLCBpdCBzZWVtcyB0aGF0IGNvdWxkIGJlIGEgcHJvYmxlbSBpZiBh
biBlcnJvciBoYXBwZW5lZCBvbiBvbmUgb2YgdGhlCisgICogZmlyc3QgaXRlbXMuICBUaGUgdHJh
bnNmZXIgd291bGQgaGFsdCwgYnV0IG5vIGVycm9yIGludGVycnVwdCB3b3VsZCBvY2N1ci4KKyAg
KiBDdXJyZW50bHkgdGhpcyBmdW5jdGlvbiBzZXRzIGludGVycnVwdHMgZW5hYmxlZCBmb3IgZWFj
aCBsaW5rZWQgbGlzdCBpdGVtOgorICAqIERNQV9DVExfSU5UX0VOLgorICAqLworIHN0YXRpYyBp
bnQgbWFwX3NnX3RvX2xsaShzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLCBpbnQgbnVtX2VsZW1zLAor
IAkJCXN0cnVjdCBsbGkgKmxsaSwgZG1hX2FkZHJfdCBkbWFfbGxpLAorIAkJCXZvaWQgX19pb21l
bSAqZG1hZHJfYWRkciwgaW50IGRpcikKKyB7CisgCWludCBpLCBpZHggPSAwOworIAlpbnQgZmlz
X2xlbiA9IDA7CisgCWRtYV9hZGRyX3QgbmV4dF9sbHA7CisgCWludCBibDsKKyAKKyAJZGV2X2Ri
Zyhob3N0X3B2dC5kd2NfZGV2LCAiJXM6IHNnPSVwIG5lbGVtPSVkIGxsaT0lcCBkbWFfbGxpPTB4
JTA4eCIKKyAJCSIgZG1hZHI9MHglMDh4XG4iLCBfX2Z1bmNfXywgc2csIG51bV9lbGVtcywgbGxp
LCAodTMyKWRtYV9sbGksCisgCQkodTMyKWRtYWRyX2FkZHIpOworIAorIAlibCA9IGdldF9idXJz
dF9sZW5ndGhfZW5jb2RlKEFIQl9ETUFfQlJTVF9ERkxUKTsKKyAKKyAJZm9yIChpID0gMDsgaSA8
IG51bV9lbGVtczsgaSsrLCBzZysrKSB7CisgCQl1MzIgYWRkciwgb2Zmc2V0OworIAkJdTMyIHNn
X2xlbiwgbGVuOworIAorIAkJYWRkciA9ICh1MzIpIHNnX2RtYV9hZGRyZXNzKHNnKTsKKyAJCXNn
X2xlbiA9IHNnX2RtYV9sZW4oc2cpOworIAorIAkJZGV2X2RiZyhob3N0X3B2dC5kd2NfZGV2LCAi
JXM6IGVsZW09JWQgc2dfYWRkcj0weCV4IHNnX2xlbiIKKyAJCQkiPSVkXG4iLCBfX2Z1bmNfXywg
aSwgYWRkciwgc2dfbGVuKTsKKyAKKyAJCXdoaWxlIChzZ19sZW4pIHsKKyAJCQlpZiAoaWR4ID49
IFNBVEFfRFdDX0RNQUNfTExJX05VTSkgeworIAkJCQkvKiBUaGUgTExJIHRhYmxlIGlzIG5vdCBs
YXJnZSBlbm91Z2guICovCisgCQkJCWRldl9lcnIoaG9zdF9wdnQuZHdjX2RldiwgIkxMSSB0YWJs
ZSBvdmVycnVuICIKKyAJCQkJIihpZHg9JWQpXG4iLCBpZHgpOworIAkJCQlicmVhazsKKyAJCQl9
CisgCQkJbGVuID0gKHNnX2xlbiA+IFNBVEFfRFdDX0RNQUNfQ1RSTF9UU0laRV9NQVgpID8KKyAJ
CQkJU0FUQV9EV0NfRE1BQ19DVFJMX1RTSVpFX01BWCA6IHNnX2xlbjsKKyAKKyAJCQlvZmZzZXQg
PSBhZGRyICYgMHhmZmZmOworIAkJCWlmICgob2Zmc2V0ICsgc2dfbGVuKSA+IDB4MTAwMDApCisg
CQkJCWxlbiA9IDB4MTAwMDAgLSBvZmZzZXQ7CisgCisgCQkJLyoKKyAJCQkgKiBNYWtlIHN1cmUg
YSBMTEkgYmxvY2sgaXMgbm90IGNyZWF0ZWQgdGhhdCB3aWxsIHNwYW4KKyAJCQkgKiA4SyBtYXgg
RklTIGJvdW5kYXJ5LiAgSWYgdGhlIGJsb2NrIHNwYW5zIHN1Y2ggYSBGSVMKKyAJCQkgKiBib3Vu
ZGFyeSwgdGhlcmUgaXMgYSBjaGFuY2UgdGhhdCBhIERNQSBidXJzdCB3aWxsCisgCQkJICogY3Jv
c3MgdGhhdCBib3VuZGFyeSAtLSB0aGlzIHJlc3VsdHMgaW4gYW4gZXJyb3IgaW4KKyAJCQkgKiB0
aGUgaG9zdCBjb250cm9sbGVyLgorIAkJCSAqLworIAkJCWlmIChmaXNfbGVuICsgbGVuID4gODE5
MikgeworIAkJCQlkZXZfZGJnKGhvc3RfcHZ0LmR3Y19kZXYsICJTUExJVFRJTkc6IGZpc19sZW49
IgorIAkJCQkJIiVkKDB4JXgpIGxlbj0lZCgweCV4KVxuIiwgZmlzX2xlbiwKKyAJCQkJCSBmaXNf
bGVuLCBsZW4sIGxlbik7CisgCQkJCWxlbiA9IDgxOTIgLSBmaXNfbGVuOworIAkJCQlmaXNfbGVu
ID0gMDsKKyAJCQl9IGVsc2UgeworIAkJCQlmaXNfbGVuICs9IGxlbjsKKyAJCQl9CisgCQkJaWYg
KGZpc19sZW4gPT0gODE5MikKKyAJCQkJZmlzX2xlbiA9IDA7CisgCisgCQkJLyoKKyAJCQkgKiBT
ZXQgRE1BIGFkZHJlc3NlcyBhbmQgbG93ZXIgaGFsZiBvZiBjb250cm9sIHJlZ2lzdGVyCisgCQkJ
ICogYmFzZWQgb24gZGlyZWN0aW9uLgorIAkJCSAqLworIAkJCWlmIChkaXIgPT0gRE1BX0ZST01f
REVWSUNFKSB7CisgCQkJCWxsaVtpZHhdLmRhciA9IGNwdV90b19sZTMyKGFkZHIpOworIAkJCQls
bGlbaWR4XS5zYXIgPSBjcHVfdG9fbGUzMigodTMyKWRtYWRyX2FkZHIpOworIAorIAkJCQlsbGlb
aWR4XS5jdGwubG93ID0gY3B1X3RvX2xlMzIoCisgCQkJCQlETUFfQ1RMX1RURkMoRE1BX0NUTF9U
VEZDX1AyTV9ETUFDKSB8CisgCQkJCQlETUFfQ1RMX1NNUygwKSB8CisgCQkJCQlETUFfQ1RMX0RN
UygxKSB8CisgCQkJCQlETUFfQ1RMX1NSQ19NU0laRShibCkgfAorIAkJCQkJRE1BX0NUTF9EU1Rf
TVNJWkUoYmwpIHwKKyAJCQkJCURNQV9DVExfU0lOQ19OT0NIQU5HRSB8CisgCQkJCQlETUFfQ1RM
X1NSQ19UUldJRCgyKSB8CisgCQkJCQlETUFfQ1RMX0RTVF9UUldJRCgyKSB8CisgCQkJCQlETUFf
Q1RMX0lOVF9FTiB8CisgCQkJCQlETUFfQ1RMX0xMUF9TUkNFTiB8CisgCQkJCQlETUFfQ1RMX0xM
UF9EU1RFTik7CisgCQkJfSBlbHNlIHsJLyogRE1BX1RPX0RFVklDRSAqLworIAkJCQlsbGlbaWR4
XS5zYXIgPSBjcHVfdG9fbGUzMihhZGRyKTsKKyAJCQkJbGxpW2lkeF0uZGFyID0gY3B1X3RvX2xl
MzIoKHUzMilkbWFkcl9hZGRyKTsKKyAKKyAJCQkJbGxpW2lkeF0uY3RsLmxvdyA9IGNwdV90b19s
ZTMyKAorIAkJCQkJRE1BX0NUTF9UVEZDKERNQV9DVExfVFRGQ19NMlBfUEVSKSB8CisgCQkJCQlE
TUFfQ1RMX1NNUygxKSB8CisgCQkJCQlETUFfQ1RMX0RNUygwKSB8CisgCQkJCQlETUFfQ1RMX1NS
Q19NU0laRShibCkgfAorIAkJCQkJRE1BX0NUTF9EU1RfTVNJWkUoYmwpIHwKKyAJCQkJCURNQV9D
VExfRElOQ19OT0NIQU5HRSB8CisgCQkJCQlETUFfQ1RMX1NSQ19UUldJRCgyKSB8CisgCQkJCQlE
TUFfQ1RMX0RTVF9UUldJRCgyKSB8CisgCQkJCQlETUFfQ1RMX0lOVF9FTiB8CisgCQkJCQlETUFf
Q1RMX0xMUF9TUkNFTiB8CisgCQkJCQlETUFfQ1RMX0xMUF9EU1RFTik7CisgCQkJfQorIAorIAkJ
CWRldl9kYmcoaG9zdF9wdnQuZHdjX2RldiwgIiVzIHNldHRpbmcgY3RsLmhpZ2ggbGVuOiAiCisg
CQkJCSIweCUwOHggdmFsOiAweCUwOHhcbiIsIF9fZnVuY19fLAorIAkJCQlsZW4sIERNQV9DVExf
QkxLX1RTKGxlbiAvIDQpKTsKKyAKKyAJCQkvKiBQcm9ncmFtIHRoZSBMTEkgQ1RMIGhpZ2ggcmVn
aXN0ZXIgKi8KKyAJCQlsbGlbaWR4XS5jdGwuaGlnaCA9IGNwdV90b19sZTMyKERNQV9DVExfQkxL
X1RTXAorIAkJCQkJCShsZW4gLyA0KSk7CisgCisgCQkJLyogUHJvZ3JhbSB0aGUgbmV4dCBwb2lu
dGVyLiAgVGhlIG5leHQgcG9pbnRlciBtdXN0IGJlCisgCQkJICogdGhlIHBoeXNpY2FsIGFkZHJl
c3MsIG5vdCB0aGUgdmlydHVhbCBhZGRyZXNzLgorIAkJCSAqLworIAkJCW5leHRfbGxwID0gKGRt
YV9sbGkgKyAoKGlkeCArIDEpICogc2l6ZW9mKHN0cnVjdCBcCisgCQkJCQkJCWxsaSkpKTsKKyAK
KyAJCQkvKiBUaGUgbGFzdCAyIGJpdHMgZW5jb2RlIHRoZSBsaXN0IG1hc3RlciBzZWxlY3QuICov
CisgCQkJbmV4dF9sbHAgPSBETUFfTExQX0xNUyhuZXh0X2xscCwgRE1BX0xMUF9BSEJNQVNURVIy
KTsKKyAKKyAJCQlsbGlbaWR4XS5sbHAgPSBjcHVfdG9fbGUzMihuZXh0X2xscCk7CisgCQkJaWR4
Kys7CisgCQkJc2dfbGVuIC09IGxlbjsKKyAJCQlhZGRyICs9IGxlbjsKKyAJCX0KKyAJfQorIAor
IAkvKgorIAkgKiBUaGUgbGFzdCBuZXh0IHB0ciBoYXMgdG8gYmUgemVybyBhbmQgdGhlIGxhc3Qg
Y29udHJvbCBsb3cgcmVnaXN0ZXIKKyAJICogaGFzIHRvIGhhdmUgTExQX1NSQ19FTiBhbmQgTExQ
X0RTVF9FTiAobGlua2VkIGxpc3QgcG9pbnRlciBzb3VyY2UKKyAJICogYW5kIGRlc3RpbmF0aW9u
IGVuYWJsZSkgc2V0IGJhY2sgdG8gMCAoZGlzYWJsZWQuKSBUaGlzIGlzIHdoYXQgdGVsbHMKKyAJ
ICogdGhlIGNvcmUgdGhhdCB0aGlzIGlzIHRoZSBsYXN0IGl0ZW0gaW4gdGhlIGxpbmtlZCBsaXN0
LgorIAkgKi8KKyAJaWYgKGlkeCkgeworIAkJbGxpW2lkeC0xXS5sbHAgPSAweDAwMDAwMDAwOwor
IAkJbGxpW2lkeC0xXS5jdGwubG93ICY9IERNQV9DVExfTExQX0RJU0FCTEVfTEUzMjsKKyAKKyAJ
CS8qIEZsdXNoIGNhY2hlIHRvIG1lbW9yeSAqLworIAkJZG1hX2NhY2hlX3N5bmMoTlVMTCwgbGxp
LCAoc2l6ZW9mKHN0cnVjdCBsbGkpICogaWR4KSwKKyAJCQkgICAgICAgRE1BX0JJRElSRUNUSU9O
QUwpOworIAl9CisgCisgCXJldHVybiBpZHg7CisgfQorIAorIC8qCisgICogRnVuY3Rpb246IGRt
YV9kd2NfeGZlcl9zdGFydAorICAqIGFyZ3VtZW50czogQ2hhbm5lbCBudW1iZXIKKyAgKiBSZXR1
cm4gOiBOb25lCisgICogRW5hYmxlcyB0aGUgRE1BIGNoYW5uZWwKKyAgKi8KKyBzdGF0aWMgdm9p
ZCBkbWFfZHdjX3hmZXJfc3RhcnQoaW50IGRtYV9jaCkKKyB7CisgCS8qIEVuYWJsZSB0aGUgRE1B
IGNoYW5uZWwgKi8KKyAJb3V0X2xlMzIoJihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5kbWFfY2hh
bl9lbi5sb3cpLAorIAkJIGluX2xlMzIoJihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5kbWFfY2hh
bl9lbi5sb3cpKSB8CisgCQkgRE1BX0VOQUJMRV9DSEFOKGRtYV9jaCkpOworIH0KKyAKKyBzdGF0
aWMgaW50IGRtYV9kd2NfeGZlcl9zZXR1cChzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLCBpbnQgbnVt
X2VsZW1zLAorIAkJCSAgICAgIHN0cnVjdCBsbGkgKmxsaSwgZG1hX2FkZHJfdCBkbWFfbGxpLAor
IAkJCSAgICAgIHZvaWQgX19pb21lbSAqYWRkciwgaW50IGRpcikKKyB7CisgCWludCBkbWFfY2g7
CisgCWludCBudW1fbGxpOworIAkvKiBBY3F1aXJlIERNQSBjaGFubmVsICovCisgCWRtYV9jaCA9
IGRtYV9yZXF1ZXN0X2NoYW5uZWwoKTsKKyAJaWYgKGRtYV9jaCA9PSAtMSkgeworIAkJZGV2X2Vy
cihob3N0X3B2dC5kd2NfZGV2LCAiJXM6IGRtYSBjaGFubmVsIHVuYXZhaWxhYmxlXG4iLAorIAkJ
CSBfX2Z1bmNfXyk7CisgCQlyZXR1cm4gLUVBR0FJTjsKKyAJfQorIAorIAkvKiBDb252ZXJ0IFNH
IGxpc3QgdG8gbGlua2VkIGxpc3Qgb2YgaXRlbXMgKExMSXMpIGZvciBBSEIgRE1BICovCisgCW51
bV9sbGkgPSBtYXBfc2dfdG9fbGxpKHNnLCBudW1fZWxlbXMsIGxsaSwgZG1hX2xsaSwgYWRkciwg
ZGlyKTsKKyAKKyAJZGV2X2RiZyhob3N0X3B2dC5kd2NfZGV2LCAiJXMgc2c6IDB4JXAsIGNvdW50
OiAlZCBsbGk6ICVwIGRtYV9sbGk6IgorIAkJIiAweCUweGx4IGFkZHI6ICVwIGxsaSBjb3VudDog
JWRcbiIsIF9fZnVuY19fLCBzZywgbnVtX2VsZW1zLAorIAkJIGxsaSwgKHUzMilkbWFfbGxpLCBh
ZGRyLCBudW1fbGxpKTsKKyAKKyAJY2xlYXJfY2hhbl9pbnRlcnJ1cHRzKGRtYV9jaCk7CisgCisg
CS8qIFByb2dyYW0gdGhlIENGRyByZWdpc3Rlci4gKi8KKyAJb3V0X2xlMzIoJihob3N0X3B2dC5z
YXRhX2RtYV9yZWdzLT5jaGFuX3JlZ3NbZG1hX2NoXS5jZmcuaGlnaCksCisgCQkgRE1BX0NGR19Q
Uk9UQ1RMIHwgRE1BX0NGR19GQ01PRF9SRVEpOworIAlvdXRfbGUzMigmKGhvc3RfcHZ0LnNhdGFf
ZG1hX3JlZ3MtPmNoYW5fcmVnc1tkbWFfY2hdLmNmZy5sb3cpLCAwKTsKKyAKKyAJLyogUHJvZ3Jh
bSB0aGUgYWRkcmVzcyBvZiB0aGUgbGlua2VkIGxpc3QgKi8KKyAJb3V0X2xlMzIoJihob3N0X3B2
dC5zYXRhX2RtYV9yZWdzLT5jaGFuX3JlZ3NbZG1hX2NoXS5sbHAubG93KSwKKyAJCSBETUFfTExQ
X0xNUyhkbWFfbGxpLCBETUFfTExQX0FIQk1BU1RFUjIpKTsKKyAKKyAJLyogUHJvZ3JhbSB0aGUg
Q1RMIHJlZ2lzdGVyIHdpdGggc3JjIGVuYWJsZSAvIGRzdCBlbmFibGUgKi8KKyAJb3V0X2xlMzIo
Jihob3N0X3B2dC5zYXRhX2RtYV9yZWdzLT5jaGFuX3JlZ3NbZG1hX2NoXS5jdGwubG93KSwKKyAJ
CSBETUFfQ1RMX0xMUF9TUkNFTiB8IERNQV9DVExfTExQX0RTVEVOKTsKKyAJcmV0dXJuIDA7Cisg
fQorIAorIC8qCisgICogRnVuY3Rpb246IGRtYV9kd2NfZXhpdAorICAqIGFyZ3VtZW50czogTm9u
ZQorICAqIHJldHVybnMgc3RhdHVzCisgICogVGhpcyBmdW5jdGlvbiBleGl0cyB0aGUgU0FUQSBE
TUEgZHJpdmVyCisgICovCisgc3RhdGljIHZvaWQgZG1hX2R3Y19leGl0KHN0cnVjdCBzYXRhX2R3
Y19kZXZpY2UgKmhzZGV2KQorIHsKKyAJZGV2X2RiZyhob3N0X3B2dC5kd2NfZGV2LCAiJXM6XG4i
LCBfX2Z1bmNfXyk7CisgCWlmIChob3N0X3B2dC5zYXRhX2RtYV9yZWdzKQorIAkJaW91bm1hcCho
b3N0X3B2dC5zYXRhX2RtYV9yZWdzKTsKKyAKKyAJaWYgKGhzZGV2LT5pcnFfZG1hKQorIAkJZnJl
ZV9pcnEoaHNkZXYtPmlycV9kbWEsIGhzZGV2KTsKKyB9CisgCisgLyoKKyAgKiBGdW5jdGlvbjog
ZG1hX2R3Y19pbml0CisgICogYXJndW1lbnRzOiBoc2RldgorICAqIHJldHVybnMgc3RhdHVzCisg
ICogVGhpcyBmdW5jdGlvbiBpbml0aWFsaXplcyB0aGUgU0FUQSBETUEgZHJpdmVyCisgICovCisg
c3RhdGljIGludCBkbWFfZHdjX2luaXQoc3RydWN0IHNhdGFfZHdjX2RldmljZSAqaHNkZXYsIGlu
dCBpcnEpCisgeworIAlpbnQgZXJyOworIAorIAllcnIgPSBkbWFfcmVxdWVzdF9pbnRlcnJ1cHRz
KGhzZGV2LCBpcnEpOworIAlpZiAoZXJyKSB7CisgCQlkZXZfZXJyKGhvc3RfcHZ0LmR3Y19kZXYs
ICIlczogZG1hX3JlcXVlc3RfaW50ZXJydXB0cyByZXR1cm5zIgorIAkJCSIgJWRcbiIsIF9fZnVu
Y19fLCBlcnIpOworIAkJZ290byBlcnJvcl9vdXQ7CisgCX0KKyAKKyAJLyogRW5hYmUgRE1BICov
CisgCW91dF9sZTMyKCYoaG9zdF9wdnQuc2F0YV9kbWFfcmVncy0+ZG1hX2NmZy5sb3cpLCBETUFf
RU4pOworIAorIAlkZXZfbm90aWNlKGhvc3RfcHZ0LmR3Y19kZXYsICJETUEgaW5pdGlhbGl6ZWRc
biIpOworIAlkZXZfZGJnKGhvc3RfcHZ0LmR3Y19kZXYsICJTQVRBIERNQSByZWdpc3RlcnM9MHgl
cFxuIiwgaG9zdF9wdnQuXAorIAkJc2F0YV9kbWFfcmVncyk7CisgCisgCXJldHVybiAwOworIAor
IGVycm9yX291dDoKKyAJZG1hX2R3Y19leGl0KGhzZGV2KTsKKyAKKyAJcmV0dXJuIGVycjsKKyB9
CisgCisgc3RhdGljIGludCBzYXRhX2R3Y19zY3JfcmVhZChzdHJ1Y3QgYXRhX2xpbmsgKmxpbmss
IHVuc2lnbmVkIGludCBzY3IsIHUzMiAqdmFsKQorIHsKKyAJaWYgKHNjciA+IFNDUl9OT1RJRklD
QVRJT04pIHsKKyAJCWRldl9lcnIobGluay0+YXAtPmRldiwgIiVzOiBJbmNvcnJlY3QgU0NSIG9m
ZnNldCAweCUwMnhcbiIsCisgCQkJX19mdW5jX18sIHNjcik7CisgCQlyZXR1cm4gLUVJTlZBTDsK
KyAJfQorIAorIAkqdmFsID0gaW5fbGUzMigodm9pZCAqKWxpbmstPmFwLT5pb2FkZHIuc2NyX2Fk
ZHIgKyAoc2NyICogNCkpOworIAlkZXZfZGJnKGxpbmstPmFwLT5kZXYsICIlczogaWQ9JWQgcmVn
PSVkIHZhbD12YWw9MHglMDh4XG4iLAorIAkJX19mdW5jX18sIGxpbmstPmFwLT5wcmludF9pZCwg
c2NyLCAqdmFsKTsKKyAKKyAJcmV0dXJuIDA7CisgfQorIAorIHN0YXRpYyBpbnQgc2F0YV9kd2Nf
c2NyX3dyaXRlKHN0cnVjdCBhdGFfbGluayAqbGluaywgdW5zaWduZWQgaW50IHNjciwgdTMyIHZh
bCkKKyB7CisgCWRldl9kYmcobGluay0+YXAtPmRldiwgIiVzOiBpZD0lZCByZWc9JWQgdmFsPXZh
bD0weCUwOHhcbiIsCisgCQlfX2Z1bmNfXywgbGluay0+YXAtPnByaW50X2lkLCBzY3IsIHZhbCk7
CisgCWlmIChzY3IgPiBTQ1JfTk9USUZJQ0FUSU9OKSB7CisgCQlkZXZfZXJyKGxpbmstPmFwLT5k
ZXYsICIlczogSW5jb3JyZWN0IFNDUiBvZmZzZXQgMHglMDJ4XG4iLAorIAkJCSBfX2Z1bmNfXywg
c2NyKTsKKyAJCXJldHVybiAtRUlOVkFMOworIAl9CisgCW91dF9sZTMyKCh2b2lkICopbGluay0+
YXAtPmlvYWRkci5zY3JfYWRkciArIChzY3IgKiA0KSwgdmFsKTsKKyAKKyAJcmV0dXJuIDA7Cisg
fQorIAorIHN0YXRpYyB1MzIgY29yZV9zY3JfcmVhZCh1bnNpZ25lZCBpbnQgc2NyKQorIHsKKyAJ
cmV0dXJuIGluX2xlMzIoKHZvaWQgX19pb21lbSAqKShob3N0X3B2dC5zY3JfYWRkcl9zc3RhdHVz
KSArXAorIAkJCShzY3IgKiA0KSk7CisgfQorIAorIHN0YXRpYyB2b2lkIGNvcmVfc2NyX3dyaXRl
KHVuc2lnbmVkIGludCBzY3IsIHUzMiB2YWwpCisgeworIAlvdXRfbGUzMigodm9pZCBfX2lvbWVt
ICopKGhvc3RfcHZ0LnNjcl9hZGRyX3NzdGF0dXMpICsgKHNjciAqIDQpLAorIAkJdmFsKTsKKyB9
CisgCisgc3RhdGljIHZvaWQgY2xlYXJfc2Vycm9yKHZvaWQpCisgeworIAl1MzIgdmFsOworIAl2
YWwgPSBjb3JlX3Njcl9yZWFkKFNDUl9FUlJPUik7CisgCWNvcmVfc2NyX3dyaXRlKFNDUl9FUlJP
UiwgdmFsKTsKKyAKKyB9CisgCisgc3RhdGljIHZvaWQgY2xlYXJfaW50ZXJydXB0X2JpdChzdHJ1
Y3Qgc2F0YV9kd2NfZGV2aWNlICpoc2RldiwgdTMyIGJpdCkKKyB7CisgCW91dF9sZTMyKCZoc2Rl
di0+c2F0YV9kd2NfcmVncy0+aW50cHIsCisgCQkgaW5fbGUzMigmaHNkZXYtPnNhdGFfZHdjX3Jl
Z3MtPmludHByKSk7CisgfQorIAorIHN0YXRpYyB1MzIgcWNtZF90YWdfdG9fbWFzayh1OCB0YWcp
CisgeworIAlyZXR1cm4gMHgwMDAwMDAwMSA8PCAodGFnICYgMHgxZik7CisgfQorIAorIC8qIFNl
ZSBhaGNpLmMgKi8KKyBzdGF0aWMgdm9pZCBzYXRhX2R3Y19lcnJvcl9pbnRyKHN0cnVjdCBhdGFf
cG9ydCAqYXAsCisgCQkJCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2UgKmhzZGV2LCB1aW50IGludHBy
KQorIHsKKyAJc3RydWN0IHNhdGFfZHdjX2RldmljZV9wb3J0ICpoc2RldnAgPSBIU0RFVlBfRlJP
TV9BUChhcCk7CisgCXN0cnVjdCBhdGFfZWhfaW5mbyAqZWhpID0gJmFwLT5saW5rLmVoX2luZm87
CisgCXVuc2lnbmVkIGludCBlcnJfbWFzayA9IDAsIGFjdGlvbiA9IDA7CisgCXN0cnVjdCBhdGFf
cXVldWVkX2NtZCAqcWM7CisgCXUzMiBzZXJyb3I7CisgCXU4IHN0YXR1cywgdGFnOworIAl1MzIg
ZXJyX3JlZzsKKyAKKyAJYXRhX2VoaV9jbGVhcl9kZXNjKGVoaSk7CisgCisgCXNlcnJvciA9IGNv
cmVfc2NyX3JlYWQoU0NSX0VSUk9SKTsKKyAJc3RhdHVzID0gYXAtPm9wcy0+c2ZmX2NoZWNrX3N0
YXR1cyhhcCk7CisgCisgCWVycl9yZWcgPSBpbl9sZTMyKCYoaG9zdF9wdnQuc2F0YV9kbWFfcmVn
cy0+aW50ZXJydXB0X3N0YXR1cy5lcnJvci5cCisgCQkJbG93KSk7CisgCXRhZyA9IGFwLT5saW5r
LmFjdGl2ZV90YWc7CisgCisgCWRldl9lcnIoYXAtPmRldiwgIiVzIFNDUl9FUlJPUj0weCUwOHgg
aW50cHI9MHglMDh4IHN0YXR1cz0weCUwOHggIgorIAkJImRtYV9pbnRwPSVkIHBlbmRpbmc9JWQg
aXNzdWVkPSVkIGRtYV9lcnJfc3RhdHVzPTB4JTA4eFxuIiwKKyAJCV9fZnVuY19fLCBzZXJyb3Is
IGludHByLCBzdGF0dXMsIGhvc3RfcHZ0LmRtYV9pbnRlcnJ1cHRfY291bnQsCisgCQloc2RldnAt
PmRtYV9wZW5kaW5nW3RhZ10sIGhzZGV2cC0+Y21kX2lzc3VlZFt0YWddLCBlcnJfcmVnKTsKKyAK
KyAJLyogQ2xlYXIgZXJyb3IgcmVnaXN0ZXIgYW5kIGludGVycnVwdCBiaXQgKi8KKyAJY2xlYXJf
c2Vycm9yKCk7CisgCWNsZWFyX2ludGVycnVwdF9iaXQoaHNkZXYsIFNBVEFfRFdDX0lOVFBSX0VS
Uik7CisgCisgCS8qIFRoaXMgaXMgdGhlIG9ubHkgZXJyb3IgaGFwcGVuaW5nIG5vdy4gIFRPRE8g
Y2hlY2sgZm9yIGV4YWN0IGVycm9yICovCisgCisgCWVycl9tYXNrIHw9IEFDX0VSUl9IT1NUX0JV
UzsKKyAJYWN0aW9uIHw9IEFUQV9FSF9SRVNFVDsKKyAKKyAJLyogUGFzcyB0aGlzIG9uIHRvIEVI
ICovCisgCWVoaS0+c2Vycm9yIHw9IHNlcnJvcjsKKyAJZWhpLT5hY3Rpb24gfD0gYWN0aW9uOwor
IAorIAlxYyA9IGF0YV9xY19mcm9tX3RhZyhhcCwgdGFnKTsKKyAJaWYgKHFjKQorIAkJcWMtPmVy
cl9tYXNrIHw9IGVycl9tYXNrOworIAllbHNlCisgCQllaGktPmVycl9tYXNrIHw9IGVycl9tYXNr
OworIAorIAlhdGFfcG9ydF9hYm9ydChhcCk7CisgfQorIAorIC8qCisgICogRnVuY3Rpb24gOiBz
YXRhX2R3Y19pc3IKKyAgKiBhcmd1bWVudHMgOiBpcnEsIHZvaWQgKmRldl9pbnN0YW5jZSwgc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MKKyAgKiBSZXR1cm4gdmFsdWUgOiBpcnFyZXR1cm5fdCAtIHN0YXR1
cyBvZiBJUlEKKyAgKiBUaGlzIEludGVycnVwdCBoYW5kbGVyIGNhbGxlZCB2aWEgcG9ydCBvcHMg
cmVnaXN0ZXJlZCBmdW5jdGlvbi4KKyAgKiAuaXJxX2hhbmRsZXIgPSBzYXRhX2R3Y19pc3IKKyAg
Ki8KKyBzdGF0aWMgaXJxcmV0dXJuX3Qgc2F0YV9kd2NfaXNyKGludCBpcnEsIHZvaWQgKmRldl9p
bnN0YW5jZSkKKyB7CisgCXN0cnVjdCBhdGFfaG9zdCAqaG9zdCA9IChzdHJ1Y3QgYXRhX2hvc3Qg
KilkZXZfaW5zdGFuY2U7CisgCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2UgKmhzZGV2ID0gSFNERVZf
RlJPTV9IT1NUKGhvc3QpOworIAlzdHJ1Y3QgYXRhX3BvcnQgKmFwOworIAlzdHJ1Y3QgYXRhX3F1
ZXVlZF9jbWQgKnFjOworIAl1bnNpZ25lZCBsb25nIGZsYWdzOworIAl1OCBzdGF0dXMsIHRhZzsK
KyAJaW50IGhhbmRsZWQsIG51bV9wcm9jZXNzZWQsIHBvcnQgPSAwOworIAl1aW50IGludHByLCBz
YWN0aXZlLCBzYWN0aXZlMiwgdGFnX21hc2s7CisgCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2VfcG9y
dCAqaHNkZXZwOworIAlob3N0X3B2dC5zYXRhX2R3Y19zYWN0aXZlX2lzc3VlZCA9IDA7CisgCisg
CXNwaW5fbG9ja19pcnFzYXZlKCZob3N0LT5sb2NrLCBmbGFncyk7CisgCisgCS8qIFJlYWQgdGhl
IGludGVycnVwdCByZWdpc3RlciAqLworIAlpbnRwciA9IGluX2xlMzIoJmhzZGV2LT5zYXRhX2R3
Y19yZWdzLT5pbnRwcik7CisgCisgCWFwID0gaG9zdC0+cG9ydHNbcG9ydF07CisgCWhzZGV2cCA9
IEhTREVWUF9GUk9NX0FQKGFwKTsKKyAKKyAJZGV2X2RiZyhhcC0+ZGV2LCAiJXMgaW50cHI9MHgl
MDh4IGFjdGl2ZV90YWc9JWRcbiIsIF9fZnVuY19fLCBpbnRwciwKKyAJCWFwLT5saW5rLmFjdGl2
ZV90YWcpOworIAorIAkvKiBDaGVjayBmb3IgZXJyb3IgaW50ZXJydXB0ICovCisgCWlmIChpbnRw
ciAmIFNBVEFfRFdDX0lOVFBSX0VSUikgeworIAkJc2F0YV9kd2NfZXJyb3JfaW50cihhcCwgaHNk
ZXYsIGludHByKTsKKyAJCWhhbmRsZWQgPSAxOworIAkJZ290byBET05FOworIAl9CisgCisgCS8q
IENoZWNrIGZvciBETUEgU0VUVVAgRklTIChGUCBETUEpIGludGVycnVwdCAqLworIAlpZiAoaW50
cHIgJiBTQVRBX0RXQ19JTlRQUl9ORVdGUCkgeworIAkJY2xlYXJfaW50ZXJydXB0X2JpdChoc2Rl
diwgU0FUQV9EV0NfSU5UUFJfTkVXRlApOworIAorIAkJdGFnID0gKHU4KShpbl9sZTMyKCZoc2Rl
di0+c2F0YV9kd2NfcmVncy0+ZnB0YWdyKSk7CisgCQlkZXZfZGJnKGFwLT5kZXYsICIlczogTkVX
RlAgdGFnPSVkXG4iLCBfX2Z1bmNfXywgdGFnKTsKKyAJCWlmIChoc2RldnAtPmNtZF9pc3N1ZWRb
dGFnXSAhPSBTQVRBX0RXQ19DTURfSVNTVUVEX1BFTkQpCisgCQkJZGV2X3dhcm4oYXAtPmRldiwg
IkNNRCB0YWc9JWQgbm90IHBlbmRpbmc/XG4iLCB0YWcpOworIAorIAkJaG9zdF9wdnQuc2F0YV9k
d2Nfc2FjdGl2ZV9pc3N1ZWQgfD0gcWNtZF90YWdfdG9fbWFzayh0YWcpOworIAorIAkJcWMgPSBh
dGFfcWNfZnJvbV90YWcoYXAsIHRhZyk7CisgCQkvKgorIAkJICogU3RhcnQgRlAgRE1BIGZvciBO
Q1EgY29tbWFuZC4gIEF0IHRoaXMgcG9pbnQgdGhlIHRhZyBpcyB0aGUKKyAJCSAqIGFjdGl2ZSB0
YWcuICBJdCBpcyB0aGUgdGFnIHRoYXQgbWF0Y2hlcyB0aGUgY29tbWFuZCBhYm91dCB0bworIAkJ
ICogYmUgY29tcGxldGVkLgorIAkJICovCisgCQlxYy0+YXAtPmxpbmsuYWN0aXZlX3RhZyA9IHRh
ZzsKKyAJCXNhdGFfZHdjX2JtZG1hX3N0YXJ0X2J5X3RhZyhxYywgdGFnKTsKKyAKKyAJCWhhbmRs
ZWQgPSAxOworIAkJZ290byBET05FOworIAl9CisgCXNhY3RpdmUgPSBjb3JlX3Njcl9yZWFkKFND
Ul9BQ1RJVkUpOworIAl0YWdfbWFzayA9IChob3N0X3B2dC5zYXRhX2R3Y19zYWN0aXZlX2lzc3Vl
ZCB8IHNhY3RpdmUpIF4gc2FjdGl2ZTsKKyAKKyAJLyogSWYgbm8gc2FjdGl2ZSBpc3N1ZWQgYW5k
IHRhZ19tYXNrIGlzIHplcm8gdGhlbiB0aGlzIGlzIG5vdCBOQ1EgKi8KKyAJaWYgKGhvc3RfcHZ0
LnNhdGFfZHdjX3NhY3RpdmVfaXNzdWVkID09IDAgJiYgdGFnX21hc2sgPT0gMCkgeworIAkJaWYg
KGFwLT5saW5rLmFjdGl2ZV90YWcgPT0gQVRBX1RBR19QT0lTT04pCisgCQkJdGFnID0gMDsKKyAJ
CWVsc2UKKyAJCQl0YWcgPSBhcC0+bGluay5hY3RpdmVfdGFnOworIAkJcWMgPSBhdGFfcWNfZnJv
bV90YWcoYXAsIHRhZyk7CisgCisgCQkvKiBERVYgaW50ZXJydXB0IHcvIG5vIGFjdGl2ZSBxYz8g
Ki8KKyAJCWlmICh1bmxpa2VseSghcWMgfHwgKHFjLT50Zi5mbGFncyAmIEFUQV9URkxBR19QT0xM
SU5HKSkpIHsKKyAJCQlkZXZfZXJyKGFwLT5kZXYsICIlcyBpbnRlcnJ1cHQgd2l0aCBubyBhY3Rp
dmUgcWMgIgorIAkJCQkicWM9JXBcbiIsIF9fZnVuY19fLCBxYyk7CisgCQkJYXAtPm9wcy0+c2Zm
X2NoZWNrX3N0YXR1cyhhcCk7CisgCQkJaGFuZGxlZCA9IDE7CisgCQkJZ290byBET05FOworIAkJ
fQorIAkJc3RhdHVzID0gYXAtPm9wcy0+c2ZmX2NoZWNrX3N0YXR1cyhhcCk7CisgCisgCQlxYy0+
YXAtPmxpbmsuYWN0aXZlX3RhZyA9IHRhZzsKKyAJCWhzZGV2cC0+Y21kX2lzc3VlZFt0YWddID0g
U0FUQV9EV0NfQ01EX0lTU1VFRF9OT1Q7CisgCisgCQlpZiAoc3RhdHVzICYgQVRBX0VSUikgewor
IAkJCWRldl9kYmcoYXAtPmRldiwgImludGVycnVwdCBBVEFfRVJSICgweCV4KVxuIiwgc3RhdHVz
KTsKKyAJCQlzYXRhX2R3Y19xY19jb21wbGV0ZShhcCwgcWMsIDEpOworIAkJCWhhbmRsZWQgPSAx
OworIAkJCWdvdG8gRE9ORTsKKyAJCX0KKyAKKyAJCWRldl9kYmcoYXAtPmRldiwgIiVzIG5vbi1O
Q1EgY21kIGludGVycnVwdCwgcHJvdG9jb2w6ICVzXG4iLAorIAkJCV9fZnVuY19fLCBhdGFfZ2V0
X2NtZF9kZXNjcmlwdChxYy0+dGYucHJvdG9jb2wpKTsKKyBEUlZTVElMTEJVU1k6CisgCQlpZiAo
YXRhX2lzX2RtYShxYy0+dGYucHJvdG9jb2wpKSB7CisgCQkJLyoKKyAJCQkgKiBFYWNoIERNQSB0
cmFuc2FjdGlvbiBwcm9kdWNlcyAyIGludGVycnVwdHMuIFRoZSBETUFDCisgCQkJICogdHJhbnNm
ZXIgY29tcGxldGUgaW50ZXJydXB0IGFuZCB0aGUgU0FUQSBjb250cm9sbGVyCisgCQkJICogb3Bl
cmF0aW9uIGRvbmUgaW50ZXJydXB0LiBUaGUgY29tbWFuZCBzaG91bGQgYmUKKyAJCQkgKiBjb21w
bGV0ZWQgb25seSBhZnRlciBib3RoIGludGVycnVwdHMgYXJlIHNlZW4uCisgCQkJICovCisgCQkJ
aG9zdF9wdnQuZG1hX2ludGVycnVwdF9jb3VudCsrOworIAkJCWlmIChoc2RldnAtPmRtYV9wZW5k
aW5nW3RhZ10gPT0gXAorIAkJCQkJU0FUQV9EV0NfRE1BX1BFTkRJTkdfTk9ORSkgeworIAkJCQlk
ZXZfZXJyKGFwLT5kZXYsICIlczogRE1BIG5vdCBwZW5kaW5nICIKKyAJCQkJCSJpbnRwcj0weCUw
OHggc3RhdHVzPTB4JTA4eCBwZW5kaW5nIgorIAkJCQkJIj0lZFxuIiwgX19mdW5jX18sIGludHBy
LCBzdGF0dXMsCisgCQkJCQloc2RldnAtPmRtYV9wZW5kaW5nW3RhZ10pOworIAkJCX0KKyAKKyAJ
CQlpZiAoKGhvc3RfcHZ0LmRtYV9pbnRlcnJ1cHRfY291bnQgJSAyKSA9PSAwKQorIAkJCQlzYXRh
X2R3Y19kbWFfeGZlcl9jb21wbGV0ZShhcCwgMSk7CisgCQl9IGVsc2UgaWYgKGF0YV9pc19waW8o
cWMtPnRmLnByb3RvY29sKSkgeworIAkJCWF0YV9zZmZfaHNtX21vdmUoYXAsIHFjLCBzdGF0dXMs
IDApOworIAkJCWhhbmRsZWQgPSAxOworIAkJCWdvdG8gRE9ORTsKKyAJCX0gZWxzZSB7CisgCQkJ
aWYgKHVubGlrZWx5KHNhdGFfZHdjX3FjX2NvbXBsZXRlKGFwLCBxYywgMSkpKQorIAkJCQlnb3Rv
IERSVlNUSUxMQlVTWTsKKyAJCX0KKyAKKyAJCWhhbmRsZWQgPSAxOworIAkJZ290byBET05FOwor
IAl9CisgCisgCS8qCisgCSAqIFRoaXMgaXMgYSBOQ1EgY29tbWFuZC4gQXQgdGhpcyBwb2ludCB3
ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgZm9yIHdoaWNoCisgCSAqIHRhZ3Mgd2UgaGF2ZSBnb3R0ZW4g
YSBjb21wbGV0aW9uIGludGVycnVwdC4gIE9uZSBpbnRlcnJ1cHQgbWF5IHNlcnZlCisgCSAqIGFz
IGNvbXBsZXRpb24gZm9yIG1vcmUgdGhhbiBvbmUgb3BlcmF0aW9uIHdoZW4gY29tbWFuZHMgYXJl
IHF1ZXVlZAorIAkgKiAoTkNRKS4gIFdlIG5lZWQgdG8gcHJvY2VzcyBlYWNoIGNvbXBsZXRlZCBj
b21tYW5kLgorIAkgKi8KKyAKKyAJIC8qIHByb2Nlc3MgY29tcGxldGVkIGNvbW1hbmRzICovCisg
CXNhY3RpdmUgPSBjb3JlX3Njcl9yZWFkKFNDUl9BQ1RJVkUpOworIAl0YWdfbWFzayA9IChob3N0
X3B2dC5zYXRhX2R3Y19zYWN0aXZlX2lzc3VlZCB8IHNhY3RpdmUpIF4gc2FjdGl2ZTsKKyAKKyAJ
aWYgKHNhY3RpdmUgIT0gMCB8fCAoaG9zdF9wdnQuc2F0YV9kd2Nfc2FjdGl2ZV9pc3N1ZWQpID4g
MSB8fCBcCisgCQkJCQkJCXRhZ19tYXNrID4gMSkgeworIAkJZGV2X2RiZyhhcC0+ZGV2LCAiJXMg
TkNROnNhY3RpdmU9MHglMDh4ICBzYWN0aXZlX2lzc3VlZD0weCUwOHgiCisgCQkJInRhZ19tYXNr
PTB4JTA4eFxuIiwgX19mdW5jX18sIHNhY3RpdmUsCisgCQkJaG9zdF9wdnQuc2F0YV9kd2Nfc2Fj
dGl2ZV9pc3N1ZWQsIHRhZ19tYXNrKTsKKyAJfQorIAorIAlpZiAoKHRhZ19tYXNrIHwgKGhvc3Rf
cHZ0LnNhdGFfZHdjX3NhY3RpdmVfaXNzdWVkKSkgIT0gXAorIAkJCQkJKGhvc3RfcHZ0LnNhdGFf
ZHdjX3NhY3RpdmVfaXNzdWVkKSkgeworIAkJZGV2X3dhcm4oYXAtPmRldiwgIkJhZCB0YWcgbWFz
az8gIHNhY3RpdmU9MHglMDh4ICIKKyAJCQkgIihob3N0X3B2dC5zYXRhX2R3Y19zYWN0aXZlX2lz
c3VlZCk9MHglMDh4ICB0YWdfbWFzayIKKyAJCQkgIj0weCUwOHhcbiIsIHNhY3RpdmUsIGhvc3Rf
cHZ0LnNhdGFfZHdjX3NhY3RpdmVfaXNzdWVkLAorIAkJCSAgdGFnX21hc2spOworIAl9CisgCisg
CS8qIHJlYWQganVzdCB0byBjbGVhciAuLi4gbm90IGJhZCBpZiBjdXJyZW50bHkgc3RpbGwgYnVz
eSAqLworIAlzdGF0dXMgPSBhcC0+b3BzLT5zZmZfY2hlY2tfc3RhdHVzKGFwKTsKKyAJZGV2X2Ri
ZyhhcC0+ZGV2LCAiJXMgQVRBIHN0YXR1cyByZWdpc3Rlcj0weCV4XG4iLCBfX2Z1bmNfXywgc3Rh
dHVzKTsKKyAKKyAJdGFnID0gMDsKKyAJbnVtX3Byb2Nlc3NlZCA9IDA7CisgCXdoaWxlICh0YWdf
bWFzaykgeworIAkJbnVtX3Byb2Nlc3NlZCsrOworIAkJd2hpbGUgKCEodGFnX21hc2sgJiAweDAw
MDAwMDAxKSkgeworIAkJCXRhZysrOworIAkJCXRhZ19tYXNrIDw8PSAxOworIAkJfQorIAorIAkJ
dGFnX21hc2sgJj0gKH4weDAwMDAwMDAxKTsKKyAJCXFjID0gYXRhX3FjX2Zyb21fdGFnKGFwLCB0
YWcpOworIAorIAkJLyogVG8gYmUgcGlja2VkIHVwIGJ5IGNvbXBsZXRpb24gZnVuY3Rpb25zICov
CisgCQlxYy0+YXAtPmxpbmsuYWN0aXZlX3RhZyA9IHRhZzsKKyAJCWhzZGV2cC0+Y21kX2lzc3Vl
ZFt0YWddID0gU0FUQV9EV0NfQ01EX0lTU1VFRF9OT1Q7CisgCisgCQkvKiBMZXQgbGliYXRhL3Nj
c2kgbGF5ZXJzIGhhbmRsZSBlcnJvciAqLworIAkJaWYgKHN0YXR1cyAmIEFUQV9FUlIpIHsKKyAJ
CQlkZXZfZGJnKGFwLT5kZXYsICIlcyBBVEFfRVJSICgweCV4KVxuIiwgX19mdW5jX18sCisgCQkJ
CXN0YXR1cyk7CisgCQkJc2F0YV9kd2NfcWNfY29tcGxldGUoYXAsIHFjLCAxKTsKKyAJCQloYW5k
bGVkID0gMTsKKyAJCQlnb3RvIERPTkU7CisgCQl9CisgCisgCQkvKiBQcm9jZXNzIGNvbXBsZXRl
ZCBjb21tYW5kICovCisgCQlkZXZfZGJnKGFwLT5kZXYsICIlcyBOQ1EgY29tbWFuZCwgcHJvdG9j
b2w6ICVzXG4iLCBfX2Z1bmNfXywKKyAJCQlhdGFfZ2V0X2NtZF9kZXNjcmlwdChxYy0+dGYucHJv
dG9jb2wpKTsKKyAJCWlmIChhdGFfaXNfZG1hKHFjLT50Zi5wcm90b2NvbCkpIHsKKyAJCQlob3N0
X3B2dC5kbWFfaW50ZXJydXB0X2NvdW50Kys7CisgCQkJaWYgKGhzZGV2cC0+ZG1hX3BlbmRpbmdb
dGFnXSA9PSBcCisgCQkJCQlTQVRBX0RXQ19ETUFfUEVORElOR19OT05FKQorIAkJCQlkZXZfd2Fy
bihhcC0+ZGV2LCAiJXM6IERNQSBub3QgcGVuZGluZz9cbiIsCisgCQkJCQlfX2Z1bmNfXyk7Cisg
CQkJaWYgKChob3N0X3B2dC5kbWFfaW50ZXJydXB0X2NvdW50ICUgMikgPT0gMCkKKyAJCQkJc2F0
YV9kd2NfZG1hX3hmZXJfY29tcGxldGUoYXAsIDEpOworIAkJfSBlbHNlIHsKKyAJCQlpZiAodW5s
aWtlbHkoc2F0YV9kd2NfcWNfY29tcGxldGUoYXAsIHFjLCAxKSkpCisgCQkJCWdvdG8gU1RJTExC
VVNZOworIAkJfQorIAkJY29udGludWU7CisgCisgU1RJTExCVVNZOgorIAkJYXAtPnN0YXRzLmlk
bGVfaXJxKys7CisgCQlkZXZfd2FybihhcC0+ZGV2LCAiU1RJTEwgQlVTWSBJUlEgYXRhJWQ6IGly
cSB0cmFwXG4iLAorIAkJCWFwLT5wcmludF9pZCk7CisgCX0gLyogd2hpbGUgdGFnX21hc2sgKi8K
KyAKKyAJLyoKKyAJICogQ2hlY2sgdG8gc2VlIGlmIGFueSBjb21tYW5kcyBjb21wbGV0ZWQgd2hp
bGUgd2Ugd2VyZSBwcm9jZXNzaW5nIG91cgorIAkgKiBpbml0aWFsIHNldCBvZiBjb21wbGV0ZWQg
Y29tbWFuZHMgKHJlYWQgc3RhdHVzIGNsZWFycyBpbnRlcnJ1cHRzLAorIAkgKiBzbyB3ZSBtaWdo
dCBtaXNzIGEgY29tcGxldGVkIGNvbW1hbmQgaW50ZXJydXB0IGlmIG9uZSBjYW1lIGluIHdoaWxl
CisgCSAqIHdlIHdlcmUgcHJvY2Vzc2luZyAtLXdlIHJlYWQgc3RhdHVzIGFzIHBhcnQgb2YgcHJv
Y2Vzc2luZyBhIGNvbXBsZXRlZAorIAkgKiBjb21tYW5kKS4KKyAJICovCisgCXNhY3RpdmUyID0g
Y29yZV9zY3JfcmVhZChTQ1JfQUNUSVZFKTsKKyAJaWYgKHNhY3RpdmUyICE9IHNhY3RpdmUpIHsK
KyAJCWRldl9kYmcoYXAtPmRldiwgIk1vcmUgY29tcGxldGVkIC0gc2FjdGl2ZT0weCV4IHNhY3Rp
dmUyIgorIAkJCSI9MHgleFxuIiwgc2FjdGl2ZSwgc2FjdGl2ZTIpOworIAl9CisgCWhhbmRsZWQg
PSAxOworIAorIERPTkU6CisgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmhvc3QtPmxvY2ssIGZs
YWdzKTsKKyAJcmV0dXJuIElSUV9SRVRWQUwoaGFuZGxlZCk7CisgfQorIAorIHN0YXRpYyB2b2lk
IHNhdGFfZHdjX2NsZWFyX2RtYWNyKHN0cnVjdCBzYXRhX2R3Y19kZXZpY2VfcG9ydCAqaHNkZXZw
LCB1OCB0YWcpCisgeworIAlzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlICpoc2RldiA9IEhTREVWX0ZS
T01fSFNERVZQKGhzZGV2cCk7CisgCisgCWlmIChoc2RldnAtPmRtYV9wZW5kaW5nW3RhZ10gPT0g
U0FUQV9EV0NfRE1BX1BFTkRJTkdfUlgpIHsKKyAJCW91dF9sZTMyKCYoaHNkZXYtPnNhdGFfZHdj
X3JlZ3MtPmRtYWNyKSwKKyAJCQkgU0FUQV9EV0NfRE1BQ1JfUlhfQ0xFQVIoCisgCQkJCSBpbl9s
ZTMyKCYoaHNkZXYtPnNhdGFfZHdjX3JlZ3MtPmRtYWNyKSkpKTsKKyAJfSBlbHNlIGlmIChoc2Rl
dnAtPmRtYV9wZW5kaW5nW3RhZ10gPT0gU0FUQV9EV0NfRE1BX1BFTkRJTkdfVFgpIHsKKyAJCW91
dF9sZTMyKCYoaHNkZXYtPnNhdGFfZHdjX3JlZ3MtPmRtYWNyKSwKKyAJCQkgU0FUQV9EV0NfRE1B
Q1JfVFhfQ0xFQVIoCisgCQkJCSBpbl9sZTMyKCYoaHNkZXYtPnNhdGFfZHdjX3JlZ3MtPmRtYWNy
KSkpKTsKKyAJfSBlbHNlIHsKKyAJCS8qCisgCQkgKiBUaGlzIHNob3VsZCBub3QgaGFwcGVuLCBp
dCBpbmRpY2F0ZXMgdGhlIGRyaXZlciBpcyBvdXQgb2YKKyAJCSAqIHN5bmMuICBJZiBpdCBkb2Vz
IGhhcHBlbiwgY2xlYXIgZG1hY3IgYW55d2F5LgorIAkJICovCisgCQlkZXZfZXJyKGhvc3RfcHZ0
LmR3Y19kZXYsICIlcyBETUEgcHJvdG9jb2wgUlggYW5kIgorIAkJCSJUWCBETUEgbm90IHBlbmRp
bmcgdGFnPTB4JTAyeCBwZW5kaW5nPSVkIgorIAkJCSIgZG1hY3I6IDB4JTA4eFxuIiwgX19mdW5j
X18sIHRhZywKKyAJCQloc2RldnAtPmRtYV9wZW5kaW5nW3RhZ10sCisgCQkJaW5fbGUzMigmKGhz
ZGV2LT5zYXRhX2R3Y19yZWdzLT5kbWFjcikpKTsKKyAJCW91dF9sZTMyKCYoaHNkZXYtPnNhdGFf
ZHdjX3JlZ3MtPmRtYWNyKSwKKyAJCQlTQVRBX0RXQ19ETUFDUl9UWFJYQ0hfQ0xFQVIpOworIAl9
CisgfQorIAorIHN0YXRpYyB2b2lkIHNhdGFfZHdjX2RtYV94ZmVyX2NvbXBsZXRlKHN0cnVjdCBh
dGFfcG9ydCAqYXAsIHUzMiBjaGVja19zdGF0dXMpCisgeworIAlzdHJ1Y3QgYXRhX3F1ZXVlZF9j
bWQgKnFjOworIAlzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlX3BvcnQgKmhzZGV2cCA9IEhTREVWUF9G
Uk9NX0FQKGFwKTsKKyAJc3RydWN0IHNhdGFfZHdjX2RldmljZSAqaHNkZXYgPSBIU0RFVl9GUk9N
X0FQKGFwKTsKKyAJdTggdGFnID0gMDsKKyAKKyAJdGFnID0gYXAtPmxpbmsuYWN0aXZlX3RhZzsK
KyAJcWMgPSBhdGFfcWNfZnJvbV90YWcoYXAsIHRhZyk7CisgCWlmICghcWMpIHsKKyAJCWRldl9l
cnIoYXAtPmRldiwgImZhaWxlZCB0byBnZXQgcWMiKTsKKyAJCXJldHVybjsKKyAJfQorIAorICNp
ZmRlZiBERUJVR19OQ1EKKyAJaWYgKHRhZyA+IDApIHsKKyAJCWRldl9pbmZvKGFwLT5kZXYsICIl
cyB0YWc9JXUgY21kPTB4JTAyeCBkbWEgZGlyPSVzIHByb3RvPSVzICIKKyAJCQkgImRtYWNyPTB4
JTA4eFxuIiwgX19mdW5jX18sIHFjLT50YWcsIHFjLT50Zi5jb21tYW5kLAorIAkJCSBhdGFfZ2V0
X2NtZF9kZXNjcmlwdChxYy0+ZG1hX2RpciksCisgCQkJIGF0YV9nZXRfY21kX2Rlc2NyaXB0KHFj
LT50Zi5wcm90b2NvbCksCisgCQkJIGluX2xlMzIoJihoc2Rldi0+c2F0YV9kd2NfcmVncy0+ZG1h
Y3IpKSk7CisgCX0KKyAjZW5kaWYKKyAKKyAJaWYgKGF0YV9pc19kbWEocWMtPnRmLnByb3RvY29s
KSkgeworIAkJaWYgKGhzZGV2cC0+ZG1hX3BlbmRpbmdbdGFnXSA9PSBTQVRBX0RXQ19ETUFfUEVO
RElOR19OT05FKSB7CisgCQkJZGV2X2VycihhcC0+ZGV2LCAiJXMgRE1BIHByb3RvY29sIFJYIGFu
ZCBUWCBETUEgbm90ICIKKyAJCQkJInBlbmRpbmcgZG1hY3I6IDB4JTA4eFxuIiwgX19mdW5jX18s
CisgCQkJCWluX2xlMzIoJihoc2Rldi0+c2F0YV9kd2NfcmVncy0+ZG1hY3IpKSk7CisgCQl9Cisg
CisgCQloc2RldnAtPmRtYV9wZW5kaW5nW3RhZ10gPSBTQVRBX0RXQ19ETUFfUEVORElOR19OT05F
OworIAkJc2F0YV9kd2NfcWNfY29tcGxldGUoYXAsIHFjLCBjaGVja19zdGF0dXMpOworIAkJYXAt
PmxpbmsuYWN0aXZlX3RhZyA9IEFUQV9UQUdfUE9JU09OOworIAl9IGVsc2UgeworIAkJc2F0YV9k
d2NfcWNfY29tcGxldGUoYXAsIHFjLCBjaGVja19zdGF0dXMpOworIAl9CisgfQorIAorIHN0YXRp
YyBpbnQgc2F0YV9kd2NfcWNfY29tcGxldGUoc3RydWN0IGF0YV9wb3J0ICphcCwgc3RydWN0IGF0
YV9xdWV1ZWRfY21kICpxYywKKyAJCQkJdTMyIGNoZWNrX3N0YXR1cykKKyB7CisgCXU4IHN0YXR1
cyA9IDA7CisgCXUzMiBtYXNrID0gMHgwOworIAl1OCB0YWcgPSBxYy0+dGFnOworIAlzdHJ1Y3Qg
c2F0YV9kd2NfZGV2aWNlX3BvcnQgKmhzZGV2cCA9IEhTREVWUF9GUk9NX0FQKGFwKTsKKyAJaG9z
dF9wdnQuc2F0YV9kd2Nfc2FjdGl2ZV9xdWV1ZWQgPSAwOworIAlkZXZfZGJnKGFwLT5kZXYsICIl
cyBjaGVja3N0YXR1cz8gJXhcbiIsIF9fZnVuY19fLCBjaGVja19zdGF0dXMpOworIAorIAlpZiAo
aHNkZXZwLT5kbWFfcGVuZGluZ1t0YWddID09IFNBVEFfRFdDX0RNQV9QRU5ESU5HX1RYKQorIAkJ
ZGV2X2VycihhcC0+ZGV2LCAiVFggRE1BIFBFTkRJTkdcbiIpOworIAllbHNlIGlmIChoc2RldnAt
PmRtYV9wZW5kaW5nW3RhZ10gPT0gU0FUQV9EV0NfRE1BX1BFTkRJTkdfUlgpCisgCQlkZXZfZXJy
KGFwLT5kZXYsICJSWCBETUEgUEVORElOR1xuIik7CisgCWRldl9kYmcoYXAtPmRldiwgIlFDIGNv
bXBsZXRlIGNtZD0weCUwMnggc3RhdHVzPTB4JTAyeCBhdGEldToiCisgCQkiIHByb3RvY29sPSVk
XG4iLCBxYy0+dGYuY29tbWFuZCwgc3RhdHVzLCBhcC0+cHJpbnRfaWQsCisgCQkgcWMtPnRmLnBy
b3RvY29sKTsKKyAKKyAJLyogY2xlYXIgYWN0aXZlIGJpdCAqLworIAltYXNrID0gKH4ocWNtZF90
YWdfdG9fbWFzayh0YWcpKSk7CisgCWhvc3RfcHZ0LnNhdGFfZHdjX3NhY3RpdmVfcXVldWVkID0g
KGhvc3RfcHZ0LnNhdGFfZHdjX3NhY3RpdmVfcXVldWVkKSBcCisgCQkJCQkJJiBtYXNrOworIAlo
b3N0X3B2dC5zYXRhX2R3Y19zYWN0aXZlX2lzc3VlZCA9IChob3N0X3B2dC5zYXRhX2R3Y19zYWN0
aXZlX2lzc3VlZCkgXAorIAkJCQkJCSYgbWFzazsKKyAJYXRhX3FjX2NvbXBsZXRlKHFjKTsKKyAJ
cmV0dXJuIDA7CisgfQorIAorIHN0YXRpYyB2b2lkIHNhdGFfZHdjX2VuYWJsZV9pbnRlcnJ1cHRz
KHN0cnVjdCBzYXRhX2R3Y19kZXZpY2UgKmhzZGV2KQorIHsKKyAJLyogRW5hYmxlIHNlbGVjdGl2
ZSBpbnRlcnJ1cHRzIGJ5IHNldHRpbmcgdGhlIGludGVycnVwdCBtYXNrcmVnaXN0ZXIqLworIAlv
dXRfbGUzMigmaHNkZXYtPnNhdGFfZHdjX3JlZ3MtPmludG1yLAorIAkJIFNBVEFfRFdDX0lOVE1S
X0VSUk0gfAorIAkJIFNBVEFfRFdDX0lOVE1SX05FV0ZQTSB8CisgCQkgU0FUQV9EV0NfSU5UTVJf
UE1BQlJUTSB8CisgCQkgU0FUQV9EV0NfSU5UTVJfRE1BVE0pOworIAkvKgorIAkgKiBVbm1hc2sg
dGhlIGVycm9yIGJpdHMgdGhhdCBzaG91bGQgdHJpZ2dlciBhbiBlcnJvciBpbnRlcnJ1cHQgYnkK
KyAJICogc2V0dGluZyB0aGUgZXJyb3IgbWFzayByZWdpc3Rlci4KKyAJICovCisgCW91dF9sZTMy
KCZoc2Rldi0+c2F0YV9kd2NfcmVncy0+ZXJybXIsIFNBVEFfRFdDX1NFUlJPUl9FUlJfQklUUyk7
CisgCisgCWRldl9kYmcoaG9zdF9wdnQuZHdjX2RldiwgIiVzOiBJTlRNUiA9IDB4JTA4eCwgRVJS
TVIgPSAweCUwOHhcbiIsCisgCQkgX19mdW5jX18sIGluX2xlMzIoJmhzZGV2LT5zYXRhX2R3Y19y
ZWdzLT5pbnRtciksCisgCQlpbl9sZTMyKCZoc2Rldi0+c2F0YV9kd2NfcmVncy0+ZXJybXIpKTsK
KyB9CisgCisgc3RhdGljIHZvaWQgc2F0YV9kd2Nfc2V0dXBfcG9ydChzdHJ1Y3QgYXRhX2lvcG9y
dHMgKnBvcnQsIHVuc2lnbmVkIGxvbmcgYmFzZSkKKyB7CisgCXBvcnQtPmNtZF9hZGRyID0gKHZv
aWQgKiliYXNlICsgMHgwMDsKKyAJcG9ydC0+ZGF0YV9hZGRyID0gKHZvaWQgKiliYXNlICsgMHgw
MDsKKyAKKyAJcG9ydC0+ZXJyb3JfYWRkciA9ICh2b2lkICopYmFzZSArIDB4MDQ7CisgCXBvcnQt
PmZlYXR1cmVfYWRkciA9ICh2b2lkICopYmFzZSArIDB4MDQ7CisgCisgCXBvcnQtPm5zZWN0X2Fk
ZHIgPSAodm9pZCAqKWJhc2UgKyAweDA4OworIAorIAlwb3J0LT5sYmFsX2FkZHIgPSAodm9pZCAq
KWJhc2UgKyAweDBjOworIAlwb3J0LT5sYmFtX2FkZHIgPSAodm9pZCAqKWJhc2UgKyAweDEwOwor
IAlwb3J0LT5sYmFoX2FkZHIgPSAodm9pZCAqKWJhc2UgKyAweDE0OworIAorIAlwb3J0LT5kZXZp
Y2VfYWRkciA9ICh2b2lkICopYmFzZSArIDB4MTg7CisgCXBvcnQtPmNvbW1hbmRfYWRkciA9ICh2
b2lkICopYmFzZSArIDB4MWM7CisgCXBvcnQtPnN0YXR1c19hZGRyID0gKHZvaWQgKiliYXNlICsg
MHgxYzsKKyAKKyAJcG9ydC0+YWx0c3RhdHVzX2FkZHIgPSAodm9pZCAqKWJhc2UgKyAweDIwOwor
IAlwb3J0LT5jdGxfYWRkciA9ICh2b2lkICopYmFzZSArIDB4MjA7CisgfQorIAorIC8qCisgICog
RnVuY3Rpb24gOiBzYXRhX2R3Y19wb3J0X3N0YXJ0CisgICogYXJndW1lbnRzIDogc3RydWN0IGF0
YV9pb3BvcnRzICpwb3J0CisgICogUmV0dXJuIHZhbHVlIDogcmV0dXJucyAwIGlmIHN1Y2Nlc3Ms
IGVycm9yIGNvZGUgb3RoZXJ3aXNlCisgICogVGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgdGhlIHNj
YXR0ZXIgZ2F0aGVyIExMSSB0YWJsZSBmb3IgQUhCIERNQQorICAqLworIHN0YXRpYyBpbnQgc2F0
YV9kd2NfcG9ydF9zdGFydChzdHJ1Y3QgYXRhX3BvcnQgKmFwKQorIHsKKyAJaW50IGVyciA9IDA7
CisgCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2UgKmhzZGV2OworIAlzdHJ1Y3Qgc2F0YV9kd2NfZGV2
aWNlX3BvcnQgKmhzZGV2cCA9IE5VTEw7CisgCXN0cnVjdCBkZXZpY2UgKnBkZXY7CisgCWludCBp
OworIAorIAloc2RldiA9IEhTREVWX0ZST01fQVAoYXApOworIAorIAlkZXZfZGJnKGFwLT5kZXYs
ICIlczogcG9ydF9ubz0lZFxuIiwgX19mdW5jX18sIGFwLT5wb3J0X25vKTsKKyAKKyAJaHNkZXYt
Pmhvc3QgPSBhcC0+aG9zdDsKKyAJcGRldiA9IGFwLT5ob3N0LT5kZXY7CisgCWlmICghcGRldikg
eworIAkJZGV2X2VycihhcC0+ZGV2LCAiJXM6IG5vIGFwLT5ob3N0LT5kZXZcbiIsIF9fZnVuY19f
KTsKKyAJCWVyciA9IC1FTk9ERVY7CisgCQlnb3RvIENMRUFOVVA7CisgCX0KKyAKKyAJLyogQWxs
b2NhdGUgUG9ydCBTdHJ1Y3QgKi8KKyAJaHNkZXZwID0ga3phbGxvYyhzaXplb2YoKmhzZGV2cCks
IEdGUF9LRVJORUwpOworIAlpZiAoIWhzZGV2cCkgeworIAkJZGV2X2VycihhcC0+ZGV2LCAiJXM6
IGttYWxsb2MgZmFpbGVkIGZvciBoc2RldnBcbiIsIF9fZnVuY19fKTsKKyAJCWVyciA9IC1FTk9N
RU07CisgCQlnb3RvIENMRUFOVVA7CisgCX0KKyAJaHNkZXZwLT5oc2RldiA9IGhzZGV2OworIAor
IAlmb3IgKGkgPSAwOyBpIDwgU0FUQV9EV0NfUUNNRF9NQVg7IGkrKykKKyAJCWhzZGV2cC0+Y21k
X2lzc3VlZFtpXSA9IFNBVEFfRFdDX0NNRF9JU1NVRURfTk9UOworIAorIAlhcC0+Ym1kbWFfcHJk
ID0gMDsJLyogc2V0IHRoZXNlIHNvIGxpYmF0YSBkb2Vzbid0IHVzZSB0aGVtICovCisgCWFwLT5i
bWRtYV9wcmRfZG1hID0gMDsKKyAKKyAJLyoKKyAJICogRE1BIC0gQXNzaWduIHNjYXR0ZXIgZ2F0
aGVyIExMSSB0YWJsZS4gV2UgY2FuJ3QgdXNlIHRoZSBsaWJhdGEKKyAJICogdmVyc2lvbiBzaW5j
ZSBpdCdzIFBSRCBpcyBJREUgUENJIHNwZWNpZmljLgorIAkgKi8KKyAJZm9yIChpID0gMDsgaSA8
IFNBVEFfRFdDX1FDTURfTUFYOyBpKyspIHsKKyAJCWhzZGV2cC0+bGxpdFtpXSA9IGRtYV9hbGxv
Y19jb2hlcmVudChwZGV2LAorIAkJCQkJCSAgICAgU0FUQV9EV0NfRE1BQ19MTElfVEJMX1NaLAor
IAkJCQkJCSAgICAgJihoc2RldnAtPmxsaXRfZG1hW2ldKSwKKyAJCQkJCQkgICAgIEdGUF9BVE9N
SUMpOworIAkJaWYgKCFoc2RldnAtPmxsaXRbaV0pIHsKKyAJCQlkZXZfZXJyKGFwLT5kZXYsICIl
czogZG1hX2FsbG9jX2NvaGVyZW50IGZhaWxlZFxuIiwKKyAJCQkJIF9fZnVuY19fKTsKKyAJCQll
cnIgPSAtRU5PTUVNOworIAkJCWdvdG8gQ0xFQU5VUDsKKyAJCX0KKyAJfQorIAorIAlpZiAoYXAt
PnBvcnRfbm8gPT0gMCkgIHsKKyAJCWRldl9kYmcoYXAtPmRldiwgIiVzOiBjbGVhcmluZyBUWENI
RU4sIFJYQ0hFTiBpbiBETUFDXG4iLAorIAkJCV9fZnVuY19fKTsKKyAJCW91dF9sZTMyKCZoc2Rl
di0+c2F0YV9kd2NfcmVncy0+ZG1hY3IsCisgCQkJIFNBVEFfRFdDX0RNQUNSX1RYUlhDSF9DTEVB
Uik7CisgCisgCQlkZXZfZGJnKGFwLT5kZXYsICIlczogc2V0dGluZyBidXJzdCBzaXplIGluIERC
VFNSXG4iLAorIAkJCSBfX2Z1bmNfXyk7CisgCQlvdXRfbGUzMigmaHNkZXYtPnNhdGFfZHdjX3Jl
Z3MtPmRidHNyLAorIAkJCSAoU0FUQV9EV0NfREJUU1JfTVdSKEFIQl9ETUFfQlJTVF9ERkxUKSB8
CisgCQkJICBTQVRBX0RXQ19EQlRTUl9NUkQoQUhCX0RNQV9CUlNUX0RGTFQpKSk7CisgCX0KKyAK
KyAJLyogQ2xlYXIgYW55IGVycm9yIGJpdHMgYmVmb3JlIGxpYmF0YSBzdGFydHMgaXNzdWluZyBj
b21tYW5kcyAqLworIAljbGVhcl9zZXJyb3IoKTsKKyAJYXAtPnByaXZhdGVfZGF0YSA9IGhzZGV2
cDsKKyAKKyBDTEVBTlVQOgorIAlpZiAoZXJyKSB7CisgCQlzYXRhX2R3Y19wb3J0X3N0b3AoYXAp
OworIAkJZGV2X2RiZyhhcC0+ZGV2LCAiJXM6IGZhaWxcbiIsIF9fZnVuY19fKTsKKyAJfSBlbHNl
IHsKKyAJCWRldl9kYmcoYXAtPmRldiwgIiVzOiBkb25lXG4iLCBfX2Z1bmNfXyk7CisgCX0KKyAK
KyAJcmV0dXJuIGVycjsKKyB9CisgCisgc3RhdGljIHZvaWQgc2F0YV9kd2NfcG9ydF9zdG9wKHN0
cnVjdCBhdGFfcG9ydCAqYXApCisgeworIAlpbnQgaTsKKyAJc3RydWN0IHNhdGFfZHdjX2Rldmlj
ZSAqaHNkZXYgPSBIU0RFVl9GUk9NX0FQKGFwKTsKKyAJc3RydWN0IHNhdGFfZHdjX2RldmljZV9w
b3J0ICpoc2RldnAgPSBIU0RFVlBfRlJPTV9BUChhcCk7CisgCisgCWRldl9kYmcoYXAtPmRldiwg
IiVzOiBhcC0+aWQgPSAlZFxuIiwgX19mdW5jX18sIGFwLT5wcmludF9pZCk7CisgCisgCWlmICho
c2RldnAgJiYgaHNkZXYpIHsKKyAJCS8qIGRlYWxsb2NhdGUgTExJIHRhYmxlICovCisgCQlmb3Ig
KGkgPSAwOyBpIDwgU0FUQV9EV0NfUUNNRF9NQVg7IGkrKykgeworIAkJCWRtYV9mcmVlX2NvaGVy
ZW50KGFwLT5ob3N0LT5kZXYsCisgCQkJCQkgIFNBVEFfRFdDX0RNQUNfTExJX1RCTF9TWiwKKyAJ
CQkJCSBoc2RldnAtPmxsaXRbaV0sIGhzZGV2cC0+bGxpdF9kbWFbaV0pOworIAkJfQorIAorIAkJ
a2ZyZWUoaHNkZXZwKTsKKyAJfQorIAlhcC0+cHJpdmF0ZV9kYXRhID0gTlVMTDsKKyB9CisgCisg
LyoKKyAgKiBGdW5jdGlvbiA6IHNhdGFfZHdjX2V4ZWNfY29tbWFuZF9ieV90YWcKKyAgKiBhcmd1
bWVudHMgOiBhdGFfcG9ydCAqYXAsIGF0YV90YXNrZmlsZSAqdGYsIHU4IHRhZywgdTMyIGNtZF9p
c3N1ZWQKKyAgKiBSZXR1cm4gdmFsdWUgOiBOb25lCisgICogVGhpcyBmdW5jdGlvbiBrZWVwcyB0
cmFjayBvZiBpbmRpdmlkdWFsIGNvbW1hbmQgdGFnIGlkcyBhbmQgY2FsbHMKKyAgKiBhdGFfZXhl
Y19jb21tYW5kIGluIGxpYmF0YQorICAqLworIHN0YXRpYyB2b2lkIHNhdGFfZHdjX2V4ZWNfY29t
bWFuZF9ieV90YWcoc3RydWN0IGF0YV9wb3J0ICphcCwKKyAJCQkJCSBzdHJ1Y3QgYXRhX3Rhc2tm
aWxlICp0ZiwKKyAJCQkJCSB1OCB0YWcsIHUzMiBjbWRfaXNzdWVkKQorIHsKKyAJdW5zaWduZWQg
bG9uZyBmbGFnczsKKyAJc3RydWN0IHNhdGFfZHdjX2RldmljZV9wb3J0ICpoc2RldnAgPSBIU0RF
VlBfRlJPTV9BUChhcCk7CisgCisgCWRldl9kYmcoYXAtPmRldiwgIiVzIGNtZCgweCUwMngpOiAl
cyB0YWc9JWRcbiIsIF9fZnVuY19fLCB0Zi0+Y29tbWFuZCwKKyAJCWF0YV9nZXRfY21kX2Rlc2Ny
aXB0KHRmKSwgdGFnKTsKKyAKKyAJc3Bpbl9sb2NrX2lycXNhdmUoJmFwLT5ob3N0LT5sb2NrLCBm
bGFncyk7CisgCWhzZGV2cC0+Y21kX2lzc3VlZFt0YWddID0gY21kX2lzc3VlZDsKKyAJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmYXAtPmhvc3QtPmxvY2ssIGZsYWdzKTsKKyAJLyoKKyAJICogQ2xl
YXIgU0Vycm9yIGJlZm9yZSBleGVjdXRpbmcgYSBuZXcgY29tbWFuZC4KKyAJICogc2F0YV9kd2Nf
c2NyX3dyaXRlIGFuZCByZWFkIGNhbiBub3QgYmUgdXNlZCBoZXJlLiBDbGVhcmluZyB0aGUgUE0K
KyAJICogbWFuYWdlZCBTRXJyb3IgcmVnaXN0ZXIgZm9yIHRoZSBkaXNrIG5lZWRzIHRvIGJlIGRv
bmUgYmVmb3JlIHRoZQorIAkgKiB0YXNrIGZpbGUgaXMgbG9hZGVkLgorIAkgKi8KKyAJY2xlYXJf
c2Vycm9yKCk7CisgCWF0YV9zZmZfZXhlY19jb21tYW5kKGFwLCB0Zik7CisgfQorIAorIHN0YXRp
YyB2b2lkIHNhdGFfZHdjX2JtZG1hX3NldHVwX2J5X3RhZyhzdHJ1Y3QgYXRhX3F1ZXVlZF9jbWQg
KnFjLCB1OCB0YWcpCisgeworIAlzYXRhX2R3Y19leGVjX2NvbW1hbmRfYnlfdGFnKHFjLT5hcCwg
JnFjLT50ZiwgdGFnLAorIAkJCQkgICAgIFNBVEFfRFdDX0NNRF9JU1NVRURfUEVORCk7CisgfQor
IAorIHN0YXRpYyB2b2lkIHNhdGFfZHdjX2JtZG1hX3NldHVwKHN0cnVjdCBhdGFfcXVldWVkX2Nt
ZCAqcWMpCisgeworIAl1OCB0YWcgPSBxYy0+dGFnOworIAorIAlpZiAoYXRhX2lzX25jcShxYy0+
dGYucHJvdG9jb2wpKSB7CisgCQlkZXZfZGJnKHFjLT5hcC0+ZGV2LCAiJXM6IGFwLT5saW5rLnNh
Y3RpdmU9MHglMDh4IHRhZz0lZFxuIiwKKyAJCQlfX2Z1bmNfXywgcWMtPmFwLT5saW5rLnNhY3Rp
dmUsIHRhZyk7CisgCX0gZWxzZSB7CisgCQl0YWcgPSAwOworIAl9CisgCXNhdGFfZHdjX2JtZG1h
X3NldHVwX2J5X3RhZyhxYywgdGFnKTsKKyB9CisgCisgc3RhdGljIHZvaWQgc2F0YV9kd2NfYm1k
bWFfc3RhcnRfYnlfdGFnKHN0cnVjdCBhdGFfcXVldWVkX2NtZCAqcWMsIHU4IHRhZykKKyB7Cisg
CWludCBzdGFydF9kbWE7CisgCXUzMiByZWcsIGRtYV9jaGFuOworIAlzdHJ1Y3Qgc2F0YV9kd2Nf
ZGV2aWNlICpoc2RldiA9IEhTREVWX0ZST01fUUMocWMpOworIAlzdHJ1Y3QgYXRhX3BvcnQgKmFw
ID0gcWMtPmFwOworIAlzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlX3BvcnQgKmhzZGV2cCA9IEhTREVW
UF9GUk9NX0FQKGFwKTsKKyAJaW50IGRpciA9IHFjLT5kbWFfZGlyOworIAlkbWFfY2hhbiA9IGhz
ZGV2cC0+ZG1hX2NoYW5bdGFnXTsKKyAKKyAJaWYgKGhzZGV2cC0+Y21kX2lzc3VlZFt0YWddICE9
IFNBVEFfRFdDX0NNRF9JU1NVRURfTk9UKSB7CisgCQlzdGFydF9kbWEgPSAxOworIAkJaWYgKGRp
ciA9PSBETUFfVE9fREVWSUNFKQorIAkJCWhzZGV2cC0+ZG1hX3BlbmRpbmdbdGFnXSA9IFNBVEFf
RFdDX0RNQV9QRU5ESU5HX1RYOworIAkJZWxzZQorIAkJCWhzZGV2cC0+ZG1hX3BlbmRpbmdbdGFn
XSA9IFNBVEFfRFdDX0RNQV9QRU5ESU5HX1JYOworIAl9IGVsc2UgeworIAkJZGV2X2VycihhcC0+
ZGV2LCAiJXM6IENvbW1hbmQgbm90IHBlbmRpbmcgY21kX2lzc3VlZD0lZCAiCisgCQkJIih0YWc9
JWQpIERNQSBOT1Qgc3RhcnRlZFxuIiwgX19mdW5jX18sCisgCQkJaHNkZXZwLT5jbWRfaXNzdWVk
W3RhZ10sIHRhZyk7CisgCQlzdGFydF9kbWEgPSAwOworIAl9CisgCisgCWRldl9kYmcoYXAtPmRl
diwgIiVzIHFjPSVwIHRhZzogJXggY21kOiAweCUwMnggZG1hX2RpcjogJXMgIgorIAkJInN0YXJ0
X2RtYT8gJXhcbiIsIF9fZnVuY19fLCBxYywgdGFnLCBxYy0+dGYuY29tbWFuZCwKKyAJCWF0YV9n
ZXRfY21kX2Rlc2NyaXB0KHFjLT5kbWFfZGlyKSwgc3RhcnRfZG1hKTsKKyAJc2F0YV9kd2NfdGZf
ZHVtcCgmKHFjLT50ZikpOworIAorIAlpZiAoc3RhcnRfZG1hKSB7CisgCQlyZWcgPSBjb3JlX3Nj
cl9yZWFkKFNDUl9FUlJPUik7CisgCQlpZiAocmVnICYgU0FUQV9EV0NfU0VSUk9SX0VSUl9CSVRT
KSB7CisgCQkJZGV2X2VycihhcC0+ZGV2LCAiJXM6ICoqKioqKiBTRXJyb3I9MHglMDh4ICoqKioq
KlxuIiwKKyAJCQkJX19mdW5jX18sIHJlZyk7CisgCQl9CisgCisgCQlpZiAoZGlyID09IERNQV9U
T19ERVZJQ0UpCisgCQkJb3V0X2xlMzIoJmhzZGV2LT5zYXRhX2R3Y19yZWdzLT5kbWFjciwKKyAJ
CQkJU0FUQV9EV0NfRE1BQ1JfVFhDSEVOKTsKKyAJCWVsc2UKKyAJCQlvdXRfbGUzMigmaHNkZXYt
PnNhdGFfZHdjX3JlZ3MtPmRtYWNyLAorIAkJCQlTQVRBX0RXQ19ETUFDUl9SWENIRU4pOworIAor
IAkJLyogRW5hYmxlIEFIQiBETUEgdHJhbnNmZXIgb24gdGhlIHNwZWNpZmllZCBjaGFubmVsICov
CisgCQlkbWFfZHdjX3hmZXJfc3RhcnQoZG1hX2NoYW4pOworIAl9CisgfQorIAorIHN0YXRpYyB2
b2lkIHNhdGFfZHdjX2JtZG1hX3N0YXJ0KHN0cnVjdCBhdGFfcXVldWVkX2NtZCAqcWMpCisgewor
IAl1OCB0YWcgPSBxYy0+dGFnOworIAorIAlpZiAoYXRhX2lzX25jcShxYy0+dGYucHJvdG9jb2wp
KSB7CisgCQlkZXZfZGJnKHFjLT5hcC0+ZGV2LCAiJXM6IGFwLT5saW5rLnNhY3RpdmU9MHglMDh4
IHRhZz0lZFxuIiwKKyAJCQlfX2Z1bmNfXywgcWMtPmFwLT5saW5rLnNhY3RpdmUsIHRhZyk7Cisg
CX0gZWxzZSB7CisgCQl0YWcgPSAwOworIAl9CisgCWRldl9kYmcocWMtPmFwLT5kZXYsICIlc1xu
IiwgX19mdW5jX18pOworIAlzYXRhX2R3Y19ibWRtYV9zdGFydF9ieV90YWcocWMsIHRhZyk7Cisg
fQorIAorIC8qCisgICogRnVuY3Rpb24gOiBzYXRhX2R3Y19xY19wcmVwX2J5X3RhZworICAqIGFy
Z3VtZW50cyA6IGF0YV9xdWV1ZWRfY21kICpxYywgdTggdGFnCisgICogUmV0dXJuIHZhbHVlIDog
Tm9uZQorICAqIHFjX3ByZXAgZm9yIGEgcGFydGljdWxhciBxdWV1ZWQgY29tbWFuZCBiYXNlZCBv
biB0YWcKKyAgKi8KKyBzdGF0aWMgdm9pZCBzYXRhX2R3Y19xY19wcmVwX2J5X3RhZyhzdHJ1Y3Qg
YXRhX3F1ZXVlZF9jbWQgKnFjLCB1OCB0YWcpCisgeworIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNn
ID0gcWMtPnNnOworIAlzdHJ1Y3QgYXRhX3BvcnQgKmFwID0gcWMtPmFwOworIAl1MzIgZG1hX2No
YW47CisgCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2UgKmhzZGV2ID0gSFNERVZfRlJPTV9BUChhcCk7
CisgCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2VfcG9ydCAqaHNkZXZwID0gSFNERVZQX0ZST01fQVAo
YXApOworIAlpbnQgZXJyOworIAorIAlkZXZfZGJnKGFwLT5kZXYsICIlczogcG9ydD0lZCBkbWEg
ZGlyPSVzIG5fZWxlbT0lZFxuIiwKKyAJCV9fZnVuY19fLCBhcC0+cG9ydF9ubywgYXRhX2dldF9j
bWRfZGVzY3JpcHQocWMtPmRtYV9kaXIpLAorIAkJIHFjLT5uX2VsZW0pOworIAorIAlkbWFfY2hh
biA9IGRtYV9kd2NfeGZlcl9zZXR1cChzZywgcWMtPm5fZWxlbSwgaHNkZXZwLT5sbGl0W3RhZ10s
CisgCQkJCSAgICAgIGhzZGV2cC0+bGxpdF9kbWFbdGFnXSwKKyAJCQkJICAgICAgKHZvaWQgKl9f
aW9tZW0pKCZoc2Rldi0+c2F0YV9kd2NfcmVncy0+XAorIAkJCQkgICAgICBkbWFkciksIHFjLT5k
bWFfZGlyKTsKKyAJaWYgKGRtYV9jaGFuIDwgMCkgeworIAkJZGV2X2VycihhcC0+ZGV2LCAiJXM6
IGRtYV9kd2NfeGZlcl9zZXR1cCByZXR1cm5zIGVyciAlZFxuIiwKKyAJCQlfX2Z1bmNfXywgZXJy
KTsKKyAJCXJldHVybjsKKyAJfQorIAloc2RldnAtPmRtYV9jaGFuW3RhZ10gPSBkbWFfY2hhbjsK
KyB9CisgCisgc3RhdGljIHVuc2lnbmVkIGludCBzYXRhX2R3Y19xY19pc3N1ZShzdHJ1Y3QgYXRh
X3F1ZXVlZF9jbWQgKnFjKQorIHsKKyAJdTMyIHNhY3RpdmU7CisgCXU4IHRhZyA9IHFjLT50YWc7
CisgCXN0cnVjdCBhdGFfcG9ydCAqYXAgPSBxYy0+YXA7CisgCisgI2lmZGVmIERFQlVHX05DUQor
IAlpZiAocWMtPnRhZyA+IDAgfHwgYXAtPmxpbmsuc2FjdGl2ZSA+IDEpCisgCQlkZXZfaW5mbyhh
cC0+ZGV2LCAiJXMgYXAgaWQ9JWQgY21kKDB4JTAyeCk9JXMgcWMgdGFnPSVkICIKKyAJCQkgInBy
b3Q9JXMgYXAgYWN0aXZlX3RhZz0weCUwOHggYXAgc2FjdGl2ZT0weCUwOHhcbiIsCisgCQkJIF9f
ZnVuY19fLCBhcC0+cHJpbnRfaWQsIHFjLT50Zi5jb21tYW5kLAorIAkJCSBhdGFfZ2V0X2NtZF9k
ZXNjcmlwdCgmcWMtPnRmKSwKKyAJCQkgcWMtPnRhZywgYXRhX2dldF9jbWRfZGVzY3JpcHQocWMt
PnRmLnByb3RvY29sKSwKKyAJCQkgYXAtPmxpbmsuYWN0aXZlX3RhZywgYXAtPmxpbmsuc2FjdGl2
ZSk7CisgI2VuZGlmCisgCisgCWlmICghYXRhX2lzX25jcShxYy0+dGYucHJvdG9jb2wpKQorIAkJ
dGFnID0gMDsKKyAJc2F0YV9kd2NfcWNfcHJlcF9ieV90YWcocWMsIHRhZyk7CisgCisgCWlmIChh
dGFfaXNfbmNxKHFjLT50Zi5wcm90b2NvbCkpIHsKKyAJCXNhY3RpdmUgPSBjb3JlX3Njcl9yZWFk
KFNDUl9BQ1RJVkUpOworIAkJc2FjdGl2ZSB8PSAoMHgwMDAwMDAwMSA8PCB0YWcpOworIAkJY29y
ZV9zY3Jfd3JpdGUoU0NSX0FDVElWRSwgc2FjdGl2ZSk7CisgCisgCQlkZXZfZGJnKHFjLT5hcC0+
ZGV2LCAiJXM6IHRhZz0lZCBhcC0+bGluay5zYWN0aXZlID0gMHglMDh4ICIKKyAJCQkic2FjdGl2
ZT0weCUwOHhcbiIsIF9fZnVuY19fLCB0YWcsIHFjLT5hcC0+bGluay5zYWN0aXZlLAorIAkJCXNh
Y3RpdmUpOworIAorIAkJYXAtPm9wcy0+c2ZmX3RmX2xvYWQoYXAsICZxYy0+dGYpOworIAkJc2F0
YV9kd2NfZXhlY19jb21tYW5kX2J5X3RhZyhhcCwgJnFjLT50ZiwgcWMtPnRhZywKKyAJCQkJCSAg
ICAgU0FUQV9EV0NfQ01EX0lTU1VFRF9QRU5EKTsKKyAJfSBlbHNlIHsKKyAJCWF0YV9zZmZfcWNf
aXNzdWUocWMpOworIAl9CisgCXJldHVybiAwOworIH0KKyAKKyAvKgorICAqIEZ1bmN0aW9uIDog
c2F0YV9kd2NfcWNfcHJlcAorICAqIGFyZ3VtZW50cyA6IGF0YV9xdWV1ZWRfY21kICpxYworICAq
IFJldHVybiB2YWx1ZSA6IE5vbmUKKyAgKiBxY19wcmVwIGZvciBhIHBhcnRpY3VsYXIgcXVldWVk
IGNvbW1hbmQKKyAgKi8KKyAKKyBzdGF0aWMgdm9pZCBzYXRhX2R3Y19xY19wcmVwKHN0cnVjdCBh
dGFfcXVldWVkX2NtZCAqcWMpCisgeworIAlpZiAoKHFjLT5kbWFfZGlyID09IERNQV9OT05FKSB8
fCAocWMtPnRmLnByb3RvY29sID09IEFUQV9QUk9UX1BJTykpCisgCQlyZXR1cm47CisgCisgI2lm
ZGVmIERFQlVHX05DUQorIAlpZiAocWMtPnRhZyA+IDApCisgCQlkZXZfaW5mbyhxYy0+YXAtPmRl
diwgIiVzOiBxYy0+dGFnPSVkIGFwLT5hY3RpdmVfdGFnPTB4JTA4eFxuIiwKKyAJCQkgX19mdW5j
X18sIHRhZywgcWMtPmFwLT5saW5rLmFjdGl2ZV90YWcpOworIAorIAlyZXR1cm4gOworICNlbmRp
ZgorIH0KKyAKKyBzdGF0aWMgdm9pZCBzYXRhX2R3Y19lcnJvcl9oYW5kbGVyKHN0cnVjdCBhdGFf
cG9ydCAqYXApCisgeworIAlhcC0+bGluay5mbGFncyB8PSBBVEFfTEZMQUdfTk9fSFJTVDsKKyAJ
YXRhX3NmZl9lcnJvcl9oYW5kbGVyKGFwKTsKKyB9CisgCisgLyoKKyAgKiBzY3NpIG1pZC1sYXll
ciBhbmQgbGliYXRhIGludGVyZmFjZSBzdHJ1Y3R1cmVzCisgICovCisgc3RhdGljIHN0cnVjdCBz
Y3NpX2hvc3RfdGVtcGxhdGUgc2F0YV9kd2Nfc2h0ID0geworIAlBVEFfTkNRX1NIVChEUlZfTkFN
RSksCisgCS8qCisgCSAqIHRlc3Qtb25seTogQ3VycmVudGx5IHRoaXMgZHJpdmVyIGRvZXNuJ3Qg
aGFuZGxlIE5DUQorIAkgKiBjb3JyZWN0bHkuIFdlIGVuYWJsZSBOQ1EgYnV0IHNldCB0aGUgcXVl
dWUgZGVwdGggdG8gYQorIAkgKiBtYXggb2YgMS4gVGhpcyB3aWxsIGdldCBmaXhlZCBpbiBpbiBh
IGZ1dHVyZSByZWxlYXNlLgorIAkgKi8KKyAJLnNnX3RhYmxlc2l6ZQkJPSBMSUJBVEFfTUFYX1BS
RCwKKyAJLmNhbl9xdWV1ZQkJPSBBVEFfREVGX1FVRVVFLAkvKiBBVEFfTUFYX1FVRVVFICovCisg
CS5kbWFfYm91bmRhcnkJCT0gQVRBX0RNQV9CT1VOREFSWSwKKyB9OworIAorIHN0YXRpYyBzdHJ1
Y3QgYXRhX3BvcnRfb3BlcmF0aW9ucyBzYXRhX2R3Y19vcHMgPSB7CisgCS5pbmhlcml0cwkJPSAm
YXRhX3NmZl9wb3J0X29wcywKKyAKKyAJLmVycm9yX2hhbmRsZXIJCT0gc2F0YV9kd2NfZXJyb3Jf
aGFuZGxlciwKKyAKKyAJLnFjX3ByZXAJCT0gc2F0YV9kd2NfcWNfcHJlcCwKKyAJLnFjX2lzc3Vl
CQk9IHNhdGFfZHdjX3FjX2lzc3VlLAorIAorIAkuc2NyX3JlYWQJCT0gc2F0YV9kd2Nfc2NyX3Jl
YWQsCisgCS5zY3Jfd3JpdGUJCT0gc2F0YV9kd2Nfc2NyX3dyaXRlLAorIAorIAkucG9ydF9zdGFy
dAkJPSBzYXRhX2R3Y19wb3J0X3N0YXJ0LAorIAkucG9ydF9zdG9wCQk9IHNhdGFfZHdjX3BvcnRf
c3RvcCwKKyAKKyAJLmJtZG1hX3NldHVwCQk9IHNhdGFfZHdjX2JtZG1hX3NldHVwLAorIAkuYm1k
bWFfc3RhcnQJCT0gc2F0YV9kd2NfYm1kbWFfc3RhcnQsCisgfTsKKyAKKyBzdGF0aWMgY29uc3Qg
c3RydWN0IGF0YV9wb3J0X2luZm8gc2F0YV9kd2NfcG9ydF9pbmZvW10gPSB7CisgCXsKKyAJCS5m
bGFncwkJPSBBVEFfRkxBR19TQVRBIHwgQVRBX0ZMQUdfTk9fTEVHQUNZIHwKKyAJCQkJICBBVEFf
RkxBR19NTUlPIHwgQVRBX0ZMQUdfTkNRLAorIAkJLnBpb19tYXNrCT0gMHgxZiwJLyogcGlvIDAt
NCAqLworIAkJLnVkbWFfbWFzawk9IEFUQV9VRE1BNiwKKyAJCS5wb3J0X29wcwk9ICZzYXRhX2R3
Y19vcHMsCisgCX0sCisgfTsKKyAKIC1zdGF0aWMgaW50IHNhdGFfZHdjX3Byb2JlKHN0cnVjdCBv
Zl9kZXZpY2UgKm9mZGV2LAorK3N0YXRpYyBpbnQgc2F0YV9kd2NfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqb2ZkZXYsCisgCQkJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2gp
CisgeworIAlzdHJ1Y3Qgc2F0YV9kd2NfZGV2aWNlICpoc2RldjsKKyAJdTMyIGlkciwgdmVyc2lv
bnI7CisgCWNoYXIgKnZlciA9IChjaGFyICopJnZlcnNpb25yOworIAl1OCAqYmFzZSA9IE5VTEw7
CisgCWludCBlcnIgPSAwOworIAlpbnQgaXJxLCByYzsKKyAJc3RydWN0IGF0YV9ob3N0ICpob3N0
OworIAlzdHJ1Y3QgYXRhX3BvcnRfaW5mbyBwaSA9IHNhdGFfZHdjX3BvcnRfaW5mb1swXTsKKyAJ
Y29uc3Qgc3RydWN0IGF0YV9wb3J0X2luZm8gKnBwaVtdID0geyAmcGksIE5VTEwgfTsKKyAKKyAJ
LyogQWxsb2NhdGUgRFdDIFNBVEEgZGV2aWNlICovCisgCWhzZGV2ID0ga21hbGxvYyhzaXplb2Yo
KmhzZGV2KSwgR0ZQX0tFUk5FTCk7CisgCWlmIChoc2RldiA9PSBOVUxMKSB7CisgCQlkZXZfZXJy
KCZvZmRldi0+ZGV2LCAia21hbGxvYyBmYWlsZWQgZm9yIGhzZGV2XG4iKTsKKyAJCWVyciA9IC1F
Tk9NRU07CisgCQlnb3RvIGVycm9yX291dDsKKyAJfQorIAltZW1zZXQoaHNkZXYsIDAsIHNpemVv
ZigqaHNkZXYpKTsKKyAKKyAJLyogSW9yZW1hcCBTQVRBIHJlZ2lzdGVycyAqLworIAliYXNlID0g
b2ZfaW9tYXAob2ZkZXYtPmRldi5vZl9ub2RlLCAwKTsKKyAJaWYgKCFiYXNlKSB7CisgCQlkZXZf
ZXJyKCZvZmRldi0+ZGV2LCAiaW9yZW1hcCBmYWlsZWQgZm9yIFNBVEEgcmVnaXN0ZXIiCisgCQkJ
IiBhZGRyZXNzXG4iKTsKKyAJCWVyciA9IC1FTk9ERVY7CisgCQlnb3RvIGVycm9yX291dDsKKyAJ
fQorIAloc2Rldi0+cmVnX2Jhc2UgPSBiYXNlOworIAlkZXZfZGJnKCZvZmRldi0+ZGV2LCAiaW9y
ZW1hcCBkb25lIGZvciBTQVRBIHJlZ2lzdGVyIGFkZHJlc3NcbiIpOworIAorIAkvKiBTeW5vcHN5
cyBEV0MgU0FUQSBzcGVjaWZpYyBSZWdpc3RlcnMgKi8KKyAJaHNkZXYtPnNhdGFfZHdjX3JlZ3Mg
PSAodm9pZCAqX19pb21lbSkoYmFzZSArIFNBVEFfRFdDX1JFR19PRkZTRVQpOworIAorIAkvKiBB
bGxvY2F0ZSBhbmQgZmlsbCBob3N0ICovCisgCWhvc3QgPSBhdGFfaG9zdF9hbGxvY19waW5mbygm
b2ZkZXYtPmRldiwgcHBpLCBTQVRBX0RXQ19NQVhfUE9SVFMpOworIAlpZiAoIWhvc3QpIHsKKyAJ
CWRldl9lcnIoJm9mZGV2LT5kZXYsICJhdGFfaG9zdF9hbGxvY19waW5mbyBmYWlsZWRcbiIpOwor
IAkJZXJyID0gLUVOT01FTTsKKyAJCWdvdG8gZXJyb3Jfb3V0OworIAl9CisgCisgCWhvc3QtPnBy
aXZhdGVfZGF0YSA9IGhzZGV2OworIAorIAkvKiBTZXR1cCBwb3J0ICovCisgCWhvc3QtPnBvcnRz
WzBdLT5pb2FkZHIuY21kX2FkZHIgPSBiYXNlOworIAlob3N0LT5wb3J0c1swXS0+aW9hZGRyLnNj
cl9hZGRyID0gYmFzZSArIFNBVEFfRFdDX1NDUl9PRkZTRVQ7CisgCWhvc3RfcHZ0LnNjcl9hZGRy
X3NzdGF0dXMgPSBiYXNlICsgU0FUQV9EV0NfU0NSX09GRlNFVDsKKyAJc2F0YV9kd2Nfc2V0dXBf
cG9ydCgmaG9zdC0+cG9ydHNbMF0tPmlvYWRkciwgKHVuc2lnbmVkIGxvbmcpYmFzZSk7CisgCisg
CS8qIFJlYWQgdGhlIElEIGFuZCBWZXJzaW9uIFJlZ2lzdGVycyAqLworIAlpZHIgPSBpbl9sZTMy
KCZoc2Rldi0+c2F0YV9kd2NfcmVncy0+aWRyKTsKKyAJdmVyc2lvbnIgPSBpbl9sZTMyKCZoc2Rl
di0+c2F0YV9kd2NfcmVncy0+dmVyc2lvbnIpOworIAlkZXZfbm90aWNlKCZvZmRldi0+ZGV2LCAi
aWQgJWQsIGNvbnRyb2xsZXIgdmVyc2lvbiAlYy4lYyVjXG4iLAorIAkJICAgaWRyLCB2ZXJbMF0s
IHZlclsxXSwgdmVyWzJdKTsKKyAKKyAJLyogR2V0IFNBVEEgRE1BIGludGVycnVwdCBudW1iZXIg
Ki8KKyAJaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAob2ZkZXYtPmRldi5vZl9ub2RlLCAxKTsK
KyAJaWYgKGlycSA9PSBOT19JUlEpIHsKKyAJCWRldl9lcnIoJm9mZGV2LT5kZXYsICJubyBTQVRB
IERNQSBpcnFcbiIpOworIAkJZXJyID0gLUVOT0RFVjsKKyAJCWdvdG8gZXJyb3Jfb3V0OworIAl9
CisgCisgCS8qIEdldCBwaHlzaWNhbCBTQVRBIERNQSByZWdpc3RlciBiYXNlIGFkZHJlc3MgKi8K
KyAJaG9zdF9wdnQuc2F0YV9kbWFfcmVncyA9IG9mX2lvbWFwKG9mZGV2LT5kZXYub2Zfbm9kZSwg
MSk7CisgCWlmICghKGhvc3RfcHZ0LnNhdGFfZG1hX3JlZ3MpKSB7CisgCQlkZXZfZXJyKCZvZmRl
di0+ZGV2LCAiaW9yZW1hcCBmYWlsZWQgZm9yIEFIQkRNQSByZWdpc3RlciIKKyAJCQkiIGFkZHJl
c3NcbiIpOworIAkJZXJyID0gLUVOT0RFVjsKKyAJCWdvdG8gZXJyb3Jfb3V0OworIAl9CisgCisg
CS8qIFNhdmUgZGV2IGZvciBsYXRlciB1c2UgaW4gZGV2X3h4eCgpIHJvdXRpbmVzICovCisgCWhv
c3RfcHZ0LmR3Y19kZXYgPSAmb2ZkZXYtPmRldjsKKyAKKyAJLyogSW5pdGlhbGl6ZSBBSEIgRE1B
QyAqLworIAlkbWFfZHdjX2luaXQoaHNkZXYsIGlycSk7CisgCisgCS8qIEVuYWJsZSBTQVRBIElu
dGVycnVwdHMgKi8KKyAJc2F0YV9kd2NfZW5hYmxlX2ludGVycnVwdHMoaHNkZXYpOworIAorIAkv
KiBHZXQgU0FUQSBpbnRlcnJ1cHQgbnVtYmVyICovCisgCWlycSA9IGlycV9vZl9wYXJzZV9hbmRf
bWFwKG9mZGV2LT5kZXYub2Zfbm9kZSwgMCk7CisgCWlmIChpcnEgPT0gTk9fSVJRKSB7CisgCQlk
ZXZfZXJyKCZvZmRldi0+ZGV2LCAibm8gU0FUQSBETUEgaXJxXG4iKTsKKyAJCWVyciA9IC1FTk9E
RVY7CisgCQlnb3RvIGVycm9yX291dDsKKyAJfQorIAorIAkvKgorIAkgKiBOb3csIHJlZ2lzdGVy
IHdpdGggbGliQVRBIGNvcmUsIHRoaXMgd2lsbCBhbHNvIGluaXRpYXRlIHRoZQorIAkgKiBkZXZp
Y2UgZGlzY292ZXJ5IHByb2Nlc3MsIGludm9raW5nIG91ciBwb3J0X3N0YXJ0KCkgaGFuZGxlciAm
CisgCSAqIGVycm9yX2hhbmRsZXIoKSB0byBleGVjdXRlIGEgZHVtbXkgU29mdHJlc2V0IEVIIHNl
c3Npb24KKyAJICovCisgCXJjID0gYXRhX2hvc3RfYWN0aXZhdGUoaG9zdCwgaXJxLCBzYXRhX2R3
Y19pc3IsIDAsICZzYXRhX2R3Y19zaHQpOworIAorIAlpZiAocmMgIT0gMCkKKyAJCWRldl9lcnIo
Jm9mZGV2LT5kZXYsICJmYWlsZWQgdG8gYWN0aXZhdGUgaG9zdCIpOworIAorIAlkZXZfc2V0X2Ry
dmRhdGEoJm9mZGV2LT5kZXYsIGhvc3QpOworIAlyZXR1cm4gMDsKKyAKKyBlcnJvcl9vdXQ6Cisg
CS8qIEZyZWUgU0FUQSBETUEgcmVzb3VyY2VzICovCisgCWRtYV9kd2NfZXhpdChoc2Rldik7Cisg
CisgCWlmIChiYXNlKQorIAkJaW91bm1hcChiYXNlKTsKKyAJcmV0dXJuIGVycjsKKyB9CisgCiAt
c3RhdGljIGludCBzYXRhX2R3Y19yZW1vdmUoc3RydWN0IG9mX2RldmljZSAqb2ZkZXYpCisrc3Rh
dGljIGludCBzYXRhX2R3Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpCisg
eworIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmb2ZkZXYtPmRldjsKKyAJc3RydWN0IGF0YV9ob3N0
ICpob3N0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisgCXN0cnVjdCBzYXRhX2R3Y19kZXZpY2Ug
KmhzZGV2ID0gaG9zdC0+cHJpdmF0ZV9kYXRhOworIAorIAlhdGFfaG9zdF9kZXRhY2goaG9zdCk7
CisgCWRldl9zZXRfZHJ2ZGF0YShkZXYsIE5VTEwpOworIAorIAkvKiBGcmVlIFNBVEEgRE1BIHJl
c291cmNlcyAqLworIAlkbWFfZHdjX2V4aXQoaHNkZXYpOworIAorIAlpb3VubWFwKGhzZGV2LT5y
ZWdfYmFzZSk7CisgCWtmcmVlKGhzZGV2KTsKKyAJa2ZyZWUoaG9zdCk7CisgCWRldl9kYmcoJm9m
ZGV2LT5kZXYsICJkb25lXG4iKTsKKyAJcmV0dXJuIDA7CisgfQorIAorIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNhdGFfZHdjX21hdGNoW10gPSB7CisgCXsgLmNvbXBhdGlibGUg
PSAiYW1jYyxzYXRhLTQ2MGV4IiwgfSwKKyAJe30KKyB9OworIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIHNhdGFfZHdjX21hdGNoKTsKKyAKKyBzdGF0aWMgc3RydWN0IG9mX3BsYXRmb3JtX2RyaXZl
ciBzYXRhX2R3Y19kcml2ZXIgPSB7CisgCS5kcml2ZXIgPSB7CisgCQkubmFtZSA9IERSVl9OQU1F
LAorIAkJLm93bmVyID0gVEhJU19NT0RVTEUsCisgCQkub2ZfbWF0Y2hfdGFibGUgPSBzYXRhX2R3
Y19tYXRjaCwKKyAJfSwKKyAJLnByb2JlID0gc2F0YV9kd2NfcHJvYmUsCisgCS5yZW1vdmUgPSBz
YXRhX2R3Y19yZW1vdmUsCisgfTsKKyAKKyBzdGF0aWMgaW50IF9faW5pdCBzYXRhX2R3Y19pbml0
KHZvaWQpCisgeworIAlyZXR1cm4Jb2ZfcmVnaXN0ZXJfcGxhdGZvcm1fZHJpdmVyKCZzYXRhX2R3
Y19kcml2ZXIpOworIH0KKyAKKyBzdGF0aWMgdm9pZCBfX2V4aXQgc2F0YV9kd2NfZXhpdCh2b2lk
KQorIHsKKyAJb2ZfdW5yZWdpc3Rlcl9wbGF0Zm9ybV9kcml2ZXIoJnNhdGFfZHdjX2RyaXZlcik7
CisgfQorIAorIG1vZHVsZV9pbml0KHNhdGFfZHdjX2luaXQpOworIG1vZHVsZV9leGl0KHNhdGFf
ZHdjX2V4aXQpOworIAorIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKKyBNT0RVTEVfQVVUSE9SKCJN
YXJrIE1pZXNmZWxkIDxtbWllc2ZlbGRAYW1jYy5jb20+Iik7CisgTU9EVUxFX0RFU0NSSVBUSU9O
KCJEZXNpZ25XYXJlIENvcmVzIFNBVEEgY29udHJvbGxlciBsb3cgbGV2ZXIgZHJpdmVyIik7Cisg
TU9EVUxFX1ZFUlNJT04oRFJWX1ZFUlNJT04pOwpkaWZmIC0tY2MgZHJpdmVycy9zcGkvbXBjNTEy
eF9wc2Nfc3BpLmMKaW5kZXggY2RkYmZjZSxjYjVhZWIwLi43N2Q5ZTdlCi0tLSBhL2RyaXZlcnMv
c3BpL21wYzUxMnhfcHNjX3NwaS5jCisrKyBiL2RyaXZlcnMvc3BpL21wYzUxMnhfcHNjX3NwaS5j
CkBAQCAtNTA3LDggLTUwNyw4ICs1MDcsOCBAQEAgc3RhdGljIGludCBfX2RldmV4aXQgbXBjNTEy
eF9wc2Nfc3BpX2RvCiAgCXJldHVybiAwOwogIH0KICAKLSBzdGF0aWMgaW50IF9faW5pdCBtcGM1
MTJ4X3BzY19zcGlfb2ZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3AsCi0gCQkJCQkg
ICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaCkKIC1zdGF0aWMgaW50IF9fZGV2aW5p
dCBtcGM1MTJ4X3BzY19zcGlfb2ZfcHJvYmUoc3RydWN0IG9mX2RldmljZSAqb3AsCisrc3RhdGlj
IGludCBfX2RldmluaXQgbXBjNTEyeF9wc2Nfc3BpX29mX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKm9wLAorIAkJCQkJICAgICAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2gp
CiAgewogIAljb25zdCB1MzIgKnJlZ2FkZHJfcDsKICAJdTY0IHJlZ2FkZHI2NCwgc2l6ZTY0OwpA
QEAgLTUzOSw3IC01MzksNyArNTM5LDcgQEBACiAgCQkJCWlycV9vZl9wYXJzZV9hbmRfbWFwKG9w
LT5kZXYub2Zfbm9kZSwgMCksIGlkKTsKICB9CiAgCi0gc3RhdGljIGludCBfX2V4aXQgbXBjNTEy
eF9wc2Nfc3BpX29mX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkKIC1zdGF0aWMg
aW50IF9fZGV2ZXhpdCBtcGM1MTJ4X3BzY19zcGlfb2ZfcmVtb3ZlKHN0cnVjdCBvZl9kZXZpY2Ug
Km9wKQorK3N0YXRpYyBpbnQgX19kZXZleGl0IG1wYzUxMnhfcHNjX3NwaV9vZl9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCiAgewogIAlyZXR1cm4gbXBjNTEyeF9wc2Nfc3BpX2Rv
X3JlbW92ZSgmb3AtPmRldik7CiAgfQo=
--001636920b8b27624f048d3509e1--
