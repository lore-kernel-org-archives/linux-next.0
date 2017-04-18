From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20170418 build: 0 failures 2 warnings (next-20170418)
Date: Tue, 18 Apr 2017 16:01:26 +0100
Message-ID: <E1d0UdB-000284-5L@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55496 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752531AbdDRPBd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Apr 2017 11:01:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20170418
Git describe: next-20170418
Commit: 495ff9e5a9 Add linux-next specific files for 20170418

Build Time: 196 min 49 sec

Passed:   10 / 10   (100.00 %)
Failed:    0 / 10   (  0.00 %)

Errors: 0
Warnings: 2
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      1 warnings    0 mismatches  : arm64-allmodconfig
      2 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 2
	  2 ../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
	  1 ../drivers/net/ethernet/faraday/ftgmac100.c:1048:12: warning: 'ftgmac100_nway_reset' defined but not used [-Wunused-function]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../drivers/net/ethernet/faraday/ftgmac100.c:1048:12: warning: 'ftgmac100_nway_reset' defined but not used [-Wunused-function]
	../drivers/scsi/osd/osd_uld.c:457:2: warning: ignoring return value of 'scsi_device_get', declared with attribute warn_unused_result [-Wunused-result]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
arm-multi_v7_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
