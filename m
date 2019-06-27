Return-Path: <SRS0=JB9f=U2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A411C48BD6
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 00:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41CA421852
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 00:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561595901;
	bh=TnTbj8oHVE+mJosEzayZbq2Q/iMnjAZofLrMhjXXlpY=;
	h=From:To:Subject:Date:List-ID:From;
	b=ttH/1y1eRe9gF4zGjZ9zvyN5KcYoxHuU6n/YxmnC1Ol854WsvFLGzYAOjMpqkJ3c5
	 r82eGOmzuJ6z7Utg8+ShfLq+JHjsWhLNaBGT+KiF94L1ecBLf8AYCijcbWpOpiqUJU
	 8kgdRj42xil5qOBiSt7whgQ16GpGc9Stqvr4ETkU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbfF0AiU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 26 Jun 2019 20:38:20 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45950 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfF0AiT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2019 20:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=r1DcWqelUOvqKUJgigmPuYf+SMuhdiVvXLnKzSd3tqE=; b=nC34LMoN4tyd8pad2dVaOCaDS
        MYrtNhQzMO9nn48IVJRApCc+qdht0wGplIItpqogichcuoBJYI3q2AVLFA3U18CWZM2mZg6g33C+o
        JotWs/GIr9XnfPAgpOvP+3HuezS9yj2mIVvzPHmOF6LaUrWmt7eEP2sdLZyNqDql4uruw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hgIQa-0002Pm-LJ; Thu, 27 Jun 2019 00:38:16 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hgIQa-0002H1-0z; Thu, 27 Jun 2019 01:38:16 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: next-20190626 build: 3 failures 16 warnings (next-20190626)
Message-Id: <E1hgIQa-0002H1-0z@optimist>
Date:   Thu, 27 Jun 2019 01:38:16 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: next-20190626
Git describe: next-20190626
Commit: 1dd45f170b Add linux-next specific files for 20190626

Build Time: 118 min 52 sec

Passed:    8 / 11   ( 72.73 %)
Failed:    3 / 11   ( 27.27 %)

Errors: 1
Warnings: 16
Section Mismatches: 0

Failed defconfigs:
	x86_64-allmodconfig
	arm64-allmodconfig

Errors:

	x86_64-allmodconfig
.tmp_kallsyms1.S:2:0: fatal error: when writing output to /tmp/ccBQb7Iv.s: No space left on device

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : x86_64-allmodconfig
      4 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
     12 warnings    0 mismatches  : arm-allmodconfig
      2 warnings    0 mismatches  : arm-multi_v5_defconfig

-------------------------------------------------------------------------------

Errors summary: 1
	  1 .tmp_kallsyms1.S:2:0: fatal error: when writing output to /tmp/ccBQb7Iv.s: No space left on device

Warnings Summary: 16
	  2 warning: same module names found:
	  2 ../drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: "CONFIG_ACPI" is not defined [-Wundef]
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	  1 arch/arm/configs/multi_v5_defconfig:258:warning: override: reassigning to symbol ASPEED_LPC_SNOOP
	  1 arch/arm/configs/multi_v5_defconfig:257:warning: override: reassigning to symbol ASPEED_LPC_CTRL
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../include/drm/drm_print.h:366:2: warning: 'real_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/drm/drm_print.h:366:2: warning: 'real_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../include/drm/drm_print.h:366:2: warning: 'div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads_termtbl.c:90:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/gpu/drm/armada/armada_crtc.c:887:22: warning: 'desired_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allmodconfig : FAIL, 1 errors, 2 warnings, 0 section mismatches

Errors:
	.tmp_kallsyms1.S:2:0: fatal error: when writing output to /tmp/ccBQb7Iv.s: No space left on device

Warnings:
	../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: "CONFIG_ACPI" is not defined [-Wundef]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 12 warnings, 0 section mismatches

Warnings:
	../include/drm/drm_print.h:366:2: warning: 'div' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/drm/drm_print.h:366:2: warning: 'real_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../include/drm/drm_print.h:366:2: warning: 'real_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/gpu/drm/armada/armada_crtc.c:887:22: warning: 'desired_clk_hz' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: "CONFIG_ACPI" is not defined [-Wundef]
	../drivers/staging/erofs/unzip_vle.c:263:29: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads_termtbl.c:90:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v5_defconfig:257:warning: override: reassigning to symbol ASPEED_LPC_CTRL
	arch/arm/configs/multi_v5_defconfig:258:warning: override: reassigning to symbol ASPEED_LPC_SNOOP
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
