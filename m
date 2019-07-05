Return-Path: <SRS0=eJvT=VC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530E0C46499
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 13:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 166BC218C9
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562333953;
	bh=Tg1NHqF4ebZs3txqtJZZF/tSHPry9eUXNJ+/qGA1x9I=;
	h=From:To:Subject:Date:List-ID:From;
	b=lcjQcXWP36A3V7q5fmhrJcj/4kVNfKEuz3mTew8HltucB9/J2LuPwdEsHoX0sUDg+
	 mLBiCYCvQQ+xpFQXLeyMG09IzcKbMxPVbi6NaSRxMhJChKlHYlMdfzULMClnbYiBBk
	 bFlkPFAyKzj+2YcE3kdoP5Lvww5p9L1qzt6wHK8M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfGENjM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Jul 2019 09:39:12 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60936 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbfGENjM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jul 2019 09:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Wso07WAPVAFjgqDAW5HVQ9jtx+v5s7Wzej8PHplm5u8=; b=Vl+I9vD9bYUsP8FmCvUNtT6uy
        0IajWtgsSNMwRproyPJAbb5E5rHgzE3XtdbO+9hkYnavznvARPJ7z6crjzvGuMlikPwVU09dtPELw
        g9Q4XVs4W2TKyxSPilguCgyuZWZXj6D6VJFx0DiIHPD2CejKcte3WTpnHUaTZ64nZ1lUQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hjOQf-0004EX-5w; Fri, 05 Jul 2019 13:39:09 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hjOQd-00015j-I0; Fri, 05 Jul 2019 14:39:07 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: next-20190704 build: 0 failures 12 warnings (next-20190704)
Message-Id: <E1hjOQd-00015j-I0@optimist>
Date:   Fri, 05 Jul 2019 14:39:07 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: next-20190704
Git describe: next-20190704
Commit: 16c474c9ba Add linux-next specific files for 20190704

Build Time: 145 min 23 sec

Passed:   11 / 11   (100.00 %)
Failed:    0 / 11   (  0.00 %)

Errors: 0
Warnings: 12
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      4 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v5_defconfig
      2 warnings    0 mismatches  : arm-multi_v7_defconfig
      1 warnings    0 mismatches  : x86_64-defconfig
      9 warnings    0 mismatches  : arm-allmodconfig
      6 warnings    0 mismatches  : x86_64-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 12
	  5 ../fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-variable]
	  3 ../fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [-Wunused-variable]
	  3 ../fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but not used [-Wunused-label]
	  2 warning: same module names found:
	  2 ../mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/erofs/unzip_vle.c:264:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1823:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:127:1: warning: the frame size of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but not used [-Wunused-label]
	../fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [-Wunused-variable]
	../fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	../fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but not used [-Wunused-label]
	../fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [-Wunused-variable]
	../fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/staging/erofs/unzip_vle.c:264:29: warning: array subscript is above array bounds [-Warray-bounds]
	../drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:127:1: warning: the frame size of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1823:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	warning: same module names found:
	warning: same module names found:

-------------------------------------------------------------------------------
x86_64-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
	../mm/percpu.c:2929:9: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../fs/orangefs/orangefs-debugfs.c:193:1: warning: label 'out' defined but not used [-Wunused-label]
	../fs/orangefs/orangefs-debugfs.c:204:17: warning: unused variable 'ret' [-Wunused-variable]
	../fs/ubifs/debug.c:2812:6: warning: unused variable 'err' [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
arm64-allnoconfig
arm-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
