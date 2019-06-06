Return-Path: <SRS0=OytO=UF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E37C04AB5
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 08:08:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6D8520673
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559808515;
	bh=iyyv4o4GmvVjacp7FniW3Vzt0BdoUo+ckgRO8YQ16yM=;
	h=From:To:Subject:Date:List-ID:From;
	b=t/xtOToCeEPYqHD73oZwmTNLZUefShrpiqe42ncexYpXV9Lr0jXt4Qmomzmsx+uE1
	 zaWP+8FLkNecYXDkVM8LjzZ2Z97+E+F+EfRIf05KN5atnTayZKb/5dqb96bP4MgXLf
	 60hxsuWgmSgxfd6JVzRwe6nID1JscV9xjw2Q7JRs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFIIf (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 6 Jun 2019 04:08:35 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44588 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFIIe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2019 04:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2B67AWglefQtjyJrU8+lz5Z2vXVRzkJ/P4WcXu4N5uo=; b=pwOxw1PFJcfv8b5p3+4FEzt3h
        ZV1+YP2XvuX9RWXBonG2mZocYjQ89RTxdjFyrfXJLSGqtiaOlHo4RXXrA6obl+RmalmCDIeSlm52p
        VrK5zS1SX9Ypp6ZSsNw993cnCiqogeKyrqFMOhrsML23y86nk4WIA5kuKSeTYJU9OTXUU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYnRo-0004fS-7f; Thu, 06 Jun 2019 08:08:32 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYnRm-0001wl-ER; Thu, 06 Jun 2019 09:08:30 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: pending-fixes build: 0 failures 18 warnings (v5.2-rc3-298-gefd8de4f40d0)
Message-Id: <E1hYnRm-0001wl-ER@optimist>
Date:   Thu, 06 Jun 2019 09:08:30 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: pending-fixes
Git describe: v5.2-rc3-298-gefd8de4f40d0
Commit: efd8de4f40 Merge remote-tracking branch 'drm-misc-fixes/for-linux-next-fixes'

Build Time: 278 min 16 sec

Passed:   11 / 11   (100.00 %)
Failed:    0 / 11   (  0.00 %)

Errors: 0
Warnings: 18
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     16 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
     28 warnings    0 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v4t_defconfig
     13 warnings    0 mismatches  : x86_64-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 18
	 36 warning: same module names found:
	  8 ../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	  5 ../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  4 ../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	  3 ../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	  3 ../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../net/ipv4/fib_semantics.c:1023:12: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/cifs/smb2pdu.c:2581:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/kpc2000/kpc_dma/fileops.c:58:35: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/staging/kpc2000/kpc2000/fileops.c:75:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/staging/kpc2000/kpc2000/core.c:149:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat=]
	  1 ../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 16 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2581:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 28 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/staging/kpc2000/kpc2000/core.c:149:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat=]
	../drivers/staging/kpc2000/kpc2000/fileops.c:75:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/staging/kpc2000/kpc_dma/fileops.c:58:35: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
x86_64-allmodconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../net/ipv4/fib_semantics.c:1023:12: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
