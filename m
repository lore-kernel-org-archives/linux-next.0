From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170605 build: 0 failures 4 warnings (next-20170605)
Date: Mon, 05 Jun 2017 12:06:58 +0100
Message-ID: <E1dHpqc-0001nw-1z@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40988 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751632AbdFELHF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jun 2017 07:07:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170605
Git describe: next-20170605
Commit: f0090bfcf1 Add linux-next specific files for 20170605

Build Time: 119 min 40 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 4
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     11 warnings    0 mismatches  : arm64-allmodconfig
     10 warnings    0 mismatches  : arm-multi_v7_defconfig
     13 warnings    0 mismatches  : arm-allmodconfig
     10 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 4
	 40 ../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	  2 ../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	  1 ../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
	../drivers/scsi/qla2xxx/qla_init.c:6407:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	../drivers/scsi/qla2xxx/qla_init.c:6709:7: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
	../drivers/usb/dwc2/hw.h:230:0: warning: "GUID" redefined
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
close failed in file object destructor:
sys.excepthook is missing
lost sys.stderr
