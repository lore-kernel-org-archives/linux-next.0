Return-Path: <SRS0=lqV3=UK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD74C4321A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 15:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2A06208E3
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560267441;
	bh=FXTa251u2X8J7T/p0xM7j/rtSVb2wJbMKm+x4xgErEY=;
	h=From:To:Subject:Date:List-ID:From;
	b=ADkmF60edlw964tK/u9mBNjRmQJLombrCN/Z1kqGjXWUzTat6MtTk0TLkcBVdWBzC
	 P7UfCvqXSqCkSgTvprTykM7zG4Ulf53sfyDAOnkkKu1eWjSrGjVXXshS+s2JjOZRJo
	 0eOGpPTomOYVXa1c2NMiujCgQqiglR5LFmBixpbw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405141AbfFKPhU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 11:37:20 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44462 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405103AbfFKPhU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jun 2019 11:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kFc1GluWOofN48mQdTV3vDRV/CgvGJ+SoQhBhHVEiA4=; b=iQFs/mPMvlGe0ANJ40ubbtGpv
        4jFU27amDOtCW6f/4LCTL9SBVcNLpWNschtFVp5wWt/Bp4/7xKSc2AY5LvYCz91+jWlr22aELBqrr
        D2k4w2QJuemqKChJb583K9NIjxOSzjrkLRV0wB/6Cyr92evYjUICa6P1e7/VbcMerS8b8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1haipp-0008Tu-FP; Tue, 11 Jun 2019 15:37:17 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1haipo-0003Ae-CW; Tue, 11 Jun 2019 16:37:16 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: next-20190611 build: 1 failures 20 warnings (next-20190611)
Message-Id: <E1haipo-0003Ae-CW@optimist>
Date:   Tue, 11 Jun 2019 16:37:16 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: next-20190611
Git describe: next-20190611
Commit: f08776cae7 Add linux-next specific files for 20190611

Build Time: 140 min 44 sec

Passed:   10 / 11   ( 90.91 %)
Failed:    1 / 11   (  9.09 %)

Errors: 2
Warnings: 20
Section Mismatches: 0

Failed defconfigs:
	arm-allmodconfig

Errors:

	arm-allmodconfig
../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:206:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]
../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:385:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
     13 warnings    0 mismatches  : arm64-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v5_defconfig
      6 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
     16 warnings    0 mismatches  : arm-allmodconfig
      5 warnings    0 mismatches  : arm-multi_v4t_defconfig
     13 warnings    0 mismatches  : x86_64-allmodconfig
      2 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Errors summary: 2
	  1 ../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:385:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]
	  1 ../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:206:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings Summary: 20
	 16 warning: same module names found:
	  8 ../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	  5 ../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  4 ../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	  4 ../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	  3 ../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]
	  3 ../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	  3 ../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../fs/cifs/smb2pdu.c:2580:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads_termtbl.c:90:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	  1 ../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:96:17: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:140:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
	  1 ../drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:31:36: warning: left shift count >= width of type [-Wshift-count-overflow]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 13 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2580:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]
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
arm-multi_v7_defconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 2 errors, 16 warnings, 0 section mismatches

Errors:
	../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:206:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]
	../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:385:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]

Warnings:
	../arch/arm/mm/init.c:456:13: warning: unused variable 'itcm_end' [-Wunused-variable]
	../arch/arm/mm/init.c:455:13: warning: unused variable 'dtcm_end' [-Wunused-variable]
	../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:96:17: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c:140:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
	../drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:31:36: warning: left shift count >= width of type [-Wshift-count-overflow]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/misc/habanalabs/habanalabs_ioctl.c:143:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:229:45: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/regulator/core.c:4759:38: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads_termtbl.c:90:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]

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
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/video/fbdev/pvr2fb.c:726:12: warning: 'pvr2_get_param_val' defined but not used [-Wunused-function]
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
	../drivers/firmware/efi/tpm.c:78:38: warning: passing argument 1 of 'tpm2_calc_event_log_size' makes pointer from integer without a cast [-Wint-conversion]
	../include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
