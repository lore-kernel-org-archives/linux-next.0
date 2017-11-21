From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20171121 build: 0 failures 2 warnings (next-20171121)
Date: Tue, 21 Nov 2017 07:18:39 +0000
Message-ID: <E1eH2pL-0000q9-J8@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59528 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbdKUHSl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Nov 2017 02:18:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20171121
Git describe: next-20171121
Commit: aa1fbe633d Add linux-next specific files for 20171121

Build Time: 122 min 30 sec

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
	  2 ../fs/cifs/smb2pdu.c:2677:18: warning: unused variable 'rqst' [-Wunused-variable]
	  1 ../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2677:18: warning: unused variable 'rqst' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/btrfs/tree-checker.c:273:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32 {aka unsigned int}' [-Wformat=]
	../fs/cifs/smb2pdu.c:2677:18: warning: unused variable 'rqst' [-Wunused-variable]
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
