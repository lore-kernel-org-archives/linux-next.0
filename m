Return-Path: <SRS0=z0z5=UY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A85FC48BD5
	for <linux-next@archiver.kernel.org>; Tue, 25 Jun 2019 17:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1423D20644
	for <linux-next@archiver.kernel.org>; Tue, 25 Jun 2019 17:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="IIT9mewh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbfFYRgI (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 25 Jun 2019 13:36:08 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:37238 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbfFYRgI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jun 2019 13:36:08 -0400
Received: by mail-wm1-f49.google.com with SMTP id f17so3828489wme.2
        for <linux-next@vger.kernel.org>; Tue, 25 Jun 2019 10:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KfOSCK75fSf0lpCJIHKlTVZ/uINA2qpeEqYdHPksmso=;
        b=IIT9mewhAqHs3D/2PdMG2s3LN1wV8t2FPGenz/B28vVJisaZg+GdOhjN4+//NGYyGK
         7lq5gQt0fgFEP416GHNFQx/tTpZQMG09su6AG7h8O9KpUN6P4xXhU8WW4XKiFKCyOnyN
         cey/+znXxmUAb4uAmm8ypcfh3FFIdTMC1PBUH2HpDjYIAsBNRzhSxGLTcRq8wGJy8ady
         q0Kl4JA4YgC9pzF+8mBhtW0OYwmwBpELQcU987+oI+4u4p3MSoR5mhRt/H/NUOVN4rw5
         OzrOzg5k5SvmHRVBjXOfS8gfQgNNZXXOr2pUpHLVmH0/Fwcvc6ZfbVo0ku0NjMOod7RW
         xLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KfOSCK75fSf0lpCJIHKlTVZ/uINA2qpeEqYdHPksmso=;
        b=GIRbBwGKXMWQldLdSkmBajP3qXeh+cgEVsY4drkhQWblhIyofRzJynwq8peO8kMfF8
         cDpnwGO5c4V60x+A0s9EP+5l/zWxmD34Uaqpw3zs7k1/vxTVwaMdvCYbA9UyVIXQycjU
         SrShZ6QlF0jMfjLpnCFtkTNbq2i4JE9hb/8QSRbIhsAUsYc3iGF6Fec96WxsL3aQHg8x
         MDI6Fh/dRNnWJ5WBgvJPS/5sSfhiJ/eqWq19jRLvRkn9fAv/T1osIDPlISJ3H9hvXJaV
         HO/nD97CGTBYYVL3pZiZ4jx1Hq4uCWfmw2aY/p39hv6StJRT60/u9IUxqNfG84pC3TLZ
         0sFw==
X-Gm-Message-State: APjAAAXODTHCX5sysNA6SywbAqeNxNRLK6LiMpzaESSgGJrI7lSCEbrx
        t1kLfsnCeXsfM0N6gE1+bvz+Tqn9WYN7eA==
X-Google-Smtp-Source: APXvYqwWtbn5zHMrNErBNw0fL4Y0lUFqnmg1Y3BKfH5fO5UKnF/XtfRzoaOtr1MLJNlnIoa/6KUtgA==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr21361715wmh.165.1561484166178;
        Tue, 25 Jun 2019 10:36:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x8sm32067077wre.73.2019.06.25.10.36.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 10:36:05 -0700 (PDT)
Message-ID: <5d125b85.1c69fb81.96729.08ae@mx.google.com>
Date:   Tue, 25 Jun 2019 10:36:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc6-130-gddc352bc91de
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 235 boots: 4 failed,
 231 passed (v5.2-rc6-130-gddc352bc91de)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 235 boots: 4 failed, 231 passed (v5.2-rc6-130-gddc=
352bc91de)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc6-130-gddc352bc91de/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc6-130-gddc352bc91de/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc6-130-gddc352bc91de
Git Commit: ddc352bc91de5409baced9e0d8549935f0bdb2d9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 26 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc6-99-g69=
0c98f37a5e)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc6-99-g69=
0c98f37a5e)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc6-99-g69=
0c98f37a5e)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

---
For more info write to <info@kernelci.org>
