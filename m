Return-Path: <SRS0=eJvT=VC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01946C4649A
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 07:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C143B218BC
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 07:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562310078;
	bh=e35pntx9LuLKzm4yN6JZG3DzJup18WKwj+zYa6eQ/II=;
	h=From:To:Subject:Date:List-ID:From;
	b=chQVbdew1CxDZEJ8Que08fltvzVa4oXhXbHiCiFDjuUFX/SUTTdcfBb8Guxi/m7sH
	 FouMtL++hTTbSyi8AibFHxdPaa41wTMu2ALcqfNwAajtfMXzx3J46CWB0ErKwK/WOC
	 Yw2vqg/JbG0kLcPt5xXt6VlEueXwYEDPO74yNgRk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfGEHBS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Jul 2019 03:01:18 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47480 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfGEHBR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jul 2019 03:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=x9Tghn8m8GdYz142BRME3o4S8FUbIsh7p7B6z0JvqcY=; b=khvQ6ph25b77/WmnZO+lhQ4A3
        Ln+K7Hg50wkgVflL2/C/Wb1kCxmK/K66TkClTv+SWjpiasSAA8KaD0JxulsYUVkev5Ci+hVfyAj7F
        cWi/7Mw6veK9PXm4MBZ/Rr67afewEE49SSQkO1WOf+C2YUoIW2gNfchAUy1Jj6kZB/uzU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hjIDb-0003Fi-QB; Fri, 05 Jul 2019 07:01:15 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hjIDb-0003yh-5e; Fri, 05 Jul 2019 08:01:15 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: pending-fixes build: 0 failures 16 warnings (v5.2-rc7-250-g820e56d05831)
Message-Id: <E1hjIDb-0003yh-5e@optimist>
Date:   Fri, 05 Jul 2019 08:01:15 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: pending-fixes
Git describe: v5.2-rc7-250-g820e56d05831
Commit: 820e56d058 Merge remote-tracking branch 'drm-misc-fixes/for-linux-next-fixes'

Build Time: 139 min 34 sec

Passed:   11 / 11   (100.00 %)
Failed:    0 / 11   (  0.00 %)

Errors: 0
Warnings: 16
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     12 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      5 warnings    0 mismatches  : arm-multi_v7_defconfig
     23 warnings    0 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v4t_defconfig
      9 warnings    0 mismatches  : x86_64-allmodconfig
      1 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 16
	 24 warning: same module names found:
	  8 ../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	  5 ../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  4 ../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	  3 ../arch/arm/mm/init.c:453:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	  3 ../arch/arm/mm/init.c:452:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../fs/cifs/smb2pdu.c:2581:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/kpc2000/kpc_dma/fileops.c:58:35: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/staging/kpc2000/kpc2000/fileops.c:75:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/staging/kpc2000/kpc2000/core.c:149:36: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat=]
	  1 ../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

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

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:453:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:452:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
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
arm-allmodconfig : PASS, 0 errors, 23 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:453:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:452:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
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

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:453:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:452:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
x86_64-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

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

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
x86_64-defconfig
