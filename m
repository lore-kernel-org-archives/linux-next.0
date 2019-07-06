Return-Path: <SRS0=unQx=VD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8272DC5B578
	for <linux-next@archiver.kernel.org>; Sat,  6 Jul 2019 09:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 539D9216B7
	for <linux-next@archiver.kernel.org>; Sat,  6 Jul 2019 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562404983;
	bh=RokX/D/0hmGF7N5MzWlUJ7ZYAGkh8mH3jfmvTaFzk2Q=;
	h=From:To:Subject:Date:List-ID:From;
	b=AuR5g0joQZ8NU7q5SnSNpJnkAf56rbqsjt4/KyyveWRtPDxXO0gEsVET1nLmsoD5I
	 FJmAd6xhA9ikT0aI5pvsxs7u1HaJZJGlj5GcF/eseliyrD2o7bybmTc+yezCsXCYQG
	 wzkl5c6EeOVnGjhKZrDf570Y4x5sbLUJh6lUWcRY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfGFJXC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sat, 6 Jul 2019 05:23:02 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59622 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfGFJXC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 6 Jul 2019 05:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WTPoEiwCtYQ4Ww+snWVBnLJEIgUHmAuxtebhlHSopZY=; b=EeckGgqdK1Z81GGOlOE8wpVh6
        T6bAFRgq13ldgqW4SV/czSUj/OpTGIzCNdH45MX4ZlauEZaP5RtE6BlSC6fonp/DkEq91EKNFiLwc
        2WA9tgtqYPTZ2uQUXCf2/tZVj30rSUTTsiXm8wl0W1Hub46MFW34P0Xqh50Sum6pDmyQE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hjguK-0006Yj-EE; Sat, 06 Jul 2019 09:23:00 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hjguJ-0004zU-QZ; Sat, 06 Jul 2019 10:22:59 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: next-20190705 build: 0 failures 9 warnings (next-20190705)
Message-Id: <E1hjguJ-0004zU-QZ@optimist>
Date:   Sat, 06 Jul 2019 10:22:59 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: next-20190705
Git describe: next-20190705
Commit: 22c45ec32b Add linux-next specific files for 20190705

Build Time: 149 min 20 sec

Passed:   11 / 11   (100.00 %)
Failed:    0 / 11   (  0.00 %)

Errors: 0
Warnings: 9
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : x86_64-allmodconfig
      1 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
      7 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 9
	  2 warning: same module names found:
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/erofs/unzip_vle.c:264:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1823:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:127:1: warning: the frame size of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/misc/habanalabs/goya/goya.c:698:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/misc/habanalabs/goya/goya.c:698:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
	../drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:127:1: warning: the frame size of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1823:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/staging/erofs/unzip_vle.c:264:29: warning: array subscript is above array bounds [-Warray-bounds]
	warning: same module names found:
	warning: same module names found:
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

arm64-allnoconfig
arm-multi_v5_defconfig
x86_64-defconfig
arm-allnoconfig
x86_64-allnoconfig
arm-multi_v4t_defconfig
arm64-defconfig
