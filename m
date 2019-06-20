Return-Path: <SRS0=ROA6=UT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3E2C48BE3
	for <linux-next@archiver.kernel.org>; Thu, 20 Jun 2019 23:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AAB52070B
	for <linux-next@archiver.kernel.org>; Thu, 20 Jun 2019 23:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561074276;
	bh=Oa7nSBYd+hGAvMnNXIHSZlNhInLHWW10ZQIYUMXWYVk=;
	h=From:To:Subject:Date:List-ID:From;
	b=fNiqc7L9fNi7bWSowPRxEZFKtluJUo/HYpqLkpmZjwYV/sQI4hPiQoakuLqEaQ0S6
	 9BJtFCm8M0ETs9FcHcCNSaFM0Fm/NbZ+vJkyip60WSxsOvcySshmIc9NXRf46hNi5v
	 EPU3hSuMxiWda7q13R7qT00zoC3VR3F0Zm9gw7xQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfFTXog (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 20 Jun 2019 19:44:36 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42256 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfFTXog (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2019 19:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wXZUAhYXXQmc9+UWV1fHo6/1YrI/s09b5LjqVPuNPNI=; b=WDKHuY2RkXMUphoxOnxGYHAg7
        OBjujlpsLyw4X598D3sqZVXVZeAneGLvoWySoVUp2bSeSMPEoWGYrie5Iqf51oKW3t6AaZDaQAW9L
        fK3zT9hrPVhYVux8DGBjsPKmVRISpZTxfwcuRYXAq4kGRXjywtnrtUnq0C6htE4I7bL0I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1he6jH-0001ZY-U1; Thu, 20 Jun 2019 23:44:31 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1he6jH-0007hM-5x; Fri, 21 Jun 2019 00:44:31 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: next-20190620 build: 2 failures 25 warnings (next-20190620)
Message-Id: <E1he6jH-0007hM-5x@optimist>
Date:   Fri, 21 Jun 2019 00:44:31 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: next-20190620
Git describe: next-20190620
Commit: dc636f5d78 Add linux-next specific files for 20190620

Build Time: 134 min 9 sec

Passed:    9 / 11   ( 81.82 %)
Failed:    2 / 11   ( 18.18 %)

Errors: 4
Warnings: 25
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig
	arm64-defconfig

Errors:

	arm-allmodconfig
ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!
ERROR: "__bad_udelay" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

	arm64-defconfig
../net/ipv6/netfilter.c:237:26: error: '__cookie_v6_init_sequence' undeclared here (not in a function)
../net/ipv6/netfilter.c:238:21: error: '__cookie_v6_check' undeclared here (not in a function)

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      8 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     21 warnings    0 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v4t_defconfig
      8 warnings    0 mismatches  : x86_64-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 4
	  1 ERROR: "__bad_udelay" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
	  1 ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!
	  1 ../net/ipv6/netfilter.c:238:21: error: '__cookie_v6_check' undeclared here (not in a function)
	  1 ../net/ipv6/netfilter.c:237:26: error: '__cookie_v6_init_sequence' undeclared here (not in a function)

Warnings Summary: 25
	  8 ../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	  5 ../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  4 warning: same module names found:
	  4 ../drivers/regulator/core.c:4758:38: warning: array subscript is above array bounds [-Warray-bounds]
	  4 ../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	  3 ../include/linux/dma-mapping.h:608:34: warning: 'sg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  3 ../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]
	  3 ../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	  3 ../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../include/drm/drm_print.h:366:2: warning: 'real_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/drm/drm_print.h:366:2: warning: 'real_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/drm/drm_print.h:366:2: warning: 'div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/cifs/smb2pdu.c:2580:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads_termtbl.c:90:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/armada/armada_crtc.c:890:22: warning: 'desired_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:96:17: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:140:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:31:36: warning: left shift count >= width of type [-Wshift-count-overflow]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2580:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../include/linux/dma-mapping.h:608:34: warning: 'sg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4758:38: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4758:38: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 21 warnings, 0 section mismatches

Errors:
	ERROR: "__aeabi_uldivmod" [fs/f2fs/f2fs.ko] undefined!
	ERROR: "__bad_udelay" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:96:17: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:140:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:31:36: warning: left shift count >= width of type [-Wshift-count-overflow]
	../include/drm/drm_print.h:366:2: warning: 'div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/drm/drm_print.h:366:2: warning: 'real_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/drm/drm_print.h:366:2: warning: 'real_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/armada/armada_crtc.c:890:22: warning: 'desired_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads_termtbl.c:90:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4758:38: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/dma-mapping.h:608:34: warning: 'sg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]

-------------------------------------------------------------------------------
arm-multi_v4t_defconfig : PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:228:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4758:38: warning: array subscript is above array bounds [-Warray-bounds]

-------------------------------------------------------------------------------
x86_64-allmodconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

Warnings:
	../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/linux/dma-mapping.h:608:34: warning: 'sg' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
arm64-defconfig : FAIL, 2 errors, 2 warnings, 0 section mismatches

Errors:
	../net/ipv6/netfilter.c:237:26: error: '__cookie_v6_init_sequence' undeclared here (not in a function)
	../net/ipv6/netfilter.c:238:21: error: '__cookie_v6_check' undeclared here (not in a function)

Warnings:
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
