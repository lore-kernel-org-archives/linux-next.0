Return-Path: <SRS0=26vq=UG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2584C2BCA1
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 11:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6289E2080C
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559906495;
	bh=vgsQ34as36QGZClhpLQeueNjb6Vj/KcyevL+h13KMJc=;
	h=From:To:Subject:Date:List-ID:From;
	b=OGsfHy+D1tZsTzLYyWWF+a/YUW1Tb+iwQQMEM0lqPnMwDJuVi9LQyndinLxiSLbmr
	 9DHRrkjxR1ju6EE1Ixp/jejOuwbNKq3f4xOGjdK/JGpf4Br+mngG+l1QfnMjH5zGuQ
	 PuUSNagJpZ1iWdQOdamaCyLYLanXWhzm8AIUAXi0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfFGLVf (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 Jun 2019 07:21:35 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47970 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfFGLVe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jun 2019 07:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ydm5E3eeuD7wWpznzd4mzuVybjvBZQ2rG2FHuriQRoA=; b=guPUvUvXu7UFX4+clwJDf7I2X
        Pv73QxhqGtuTe9R5m4VJRVgs4bQuxSjM4TnvoxhsNMby6Y13K0jsg4uSyczofwLHG4GdoalghvrON
        zfBz0QMuf4rMPaxysfBD1f7pg/UfdRAwhFlo+X70JiETx+jHm93Lq476W31YTdvEoFmXk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hZCw7-0001kC-MY; Fri, 07 Jun 2019 11:21:31 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hZCw6-0006hO-J4; Fri, 07 Jun 2019 12:21:31 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: pending-fixes build: 0 failures 18 warnings (v5.2-rc3-336-gfd5c57db249c)
Message-Id: <E1hZCw6-0006hO-J4@optimist>
Date:   Fri, 07 Jun 2019 12:21:30 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: pending-fixes
Git describe: v5.2-rc3-336-gfd5c57db249c
Commit: fd5c57db24 Merge remote-tracking branch 'drm-misc-fixes/for-linux-next-fixes'

Build Time: 192 min 5 sec

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
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/kpc2000/kpc2000/core.c:149:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat=]
	../drivers/staging/kpc2000/kpc2000/fileops.c:75:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/staging/kpc2000/kpc_dma/fileops.c:58:35: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
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
