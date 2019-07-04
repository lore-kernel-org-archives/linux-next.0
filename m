Return-Path: <SRS0=xL23=VB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5615AC0651F
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 18:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CCB12189E
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562263610;
	bh=7fdghqZb4hhI5vB3ctQqQiIj/E11N4bEWUA2zfJWg/I=;
	h=From:To:Subject:Date:List-ID:From;
	b=Upj6qc9yiiBUH2QhP0yGVk7Mg0eI4w1QCloxwoRV98DBwHXViaysOrm8pKLtNsRwm
	 enR+WAfht2WAPJZMhjBEK5PpRZHW4XU+Ay7cZ26xt3gMTg4r0Sf7kyHx78MPplGQ6v
	 3H0DeKk/RT6lbz2sc1CMMqTvkLU5+wNZenbb4cZU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfGDSGt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 4 Jul 2019 14:06:49 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45076 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfGDSGt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2019 14:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:Subject:To:From:
        Sender:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3a+yc1y/DDRrVBxvrPM+WPjGhED7or0VIu7OuBmLn3o=; b=I7xy18hNNQvd4iZWvEGZw8v/g
        2+6WfV75w7zsGIiSX+ouCCk1scY3xrtrPZEb3/VKI2jQks06CxyYqfA/Ql0XvsmtgxEC/WjBujQXR
        ooQfVoff2ylSzqYSKeSuKGZQxmm/hzrNfLe7IVq/u4B0G6aDTrJaYa/R//UgF/vNESkwk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=optimist)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hj687-0001jB-1T; Thu, 04 Jul 2019 18:06:47 +0000
Received: from broonie by optimist with local (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hj686-0005Wf-Bt; Thu, 04 Jul 2019 19:06:46 +0100
From:   Build bot for Mark Brown <broonie@kernel.org>
To:     kernel-build-reports@lists.linaro.org,
        linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org
Subject: next-20190703 build: 0 failures 12 warnings (next-20190703)
Message-Id: <E1hj686-0005Wf-Bt@optimist>
Date:   Thu, 04 Jul 2019 19:06:46 +0100
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Tree/Branch: next-20190703
Git describe: next-20190703
Commit: f9ca7f5a1e Add linux-next specific files for 20190703

Build Time: 145 min 29 sec

Passed:   11 / 11   (100.00 %)
Failed:    0 / 11   (  0.00 %)

Errors: 0
Warnings: 12
Section Mismatches: 0

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      2 warnings    0 mismatches  : x86_64-allmodconfig
      3 warnings    0 mismatches  : arm64-allmodconfig
      1 warnings    0 mismatches  : arm-multi_v7_defconfig
     10 warnings    0 mismatches  : arm-allmodconfig

-------------------------------------------------------------------------------

Warnings Summary: 12
	  2 warning: same module names found:
	  2 ../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  2 ../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	  2 ../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	  1 ../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	  1 ../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/staging/erofs/unzip_vle.c:264:29: warning: array subscript is above array bounds [-Warray-bounds]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:1823:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c:127:1: warning: the frame size of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../drivers/net/ethernet/google/gve/gve_main.c:42:14: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../drivers/net/ethernet/google/gve/gve_ethtool.c:109:14: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
x86_64-allmodconfig : PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
	../samples/seccomp/user-trap.c:50:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
	../samples/seccomp/user-trap.c:83:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]

-------------------------------------------------------------------------------
arm64-allmodconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../fs/cifs/smb2pdu.c:2603:19: warning: 'in_data_buf' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches

Warnings:
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm-allmodconfig : PASS, 0 errors, 10 warnings, 0 section mismatches

Warnings:
	../drivers/hwtracing/intel_th/msu.c:783:21: warning: unused variable 'i' [-Wunused-variable]
	../drivers/hwtracing/intel_th/msu.c:863:6: warning: unused variable 'i' [-Wunused-variable]
	../drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/google/gve/gve_main.c:42:14: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/net/ethernet/google/gve/gve_ethtool.c:109:14: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
