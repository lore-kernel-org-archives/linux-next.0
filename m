Return-Path: <SRS0=9mSK=VF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B26C606D1
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 20:34:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09A7C21707
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 20:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="gP/gtYBs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbfGHUeP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 8 Jul 2019 16:34:15 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:36254 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727517AbfGHUeP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Jul 2019 16:34:15 -0400
Received: by mail-wm1-f53.google.com with SMTP id g67so878781wme.1
        for <linux-next@vger.kernel.org>; Mon, 08 Jul 2019 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=neomgWpHqXCM60x5t6DW5M0hxZBzb1T9JNopsdPWgN8=;
        b=gP/gtYBsdghBH8nYvOUXaNYaWHgCVDbNt43wyp1965Ph74s9TBNKq/R7N/Mf1T8lY3
         ht31R405dPDPe+TkMSNhTUXo1+ho3Vq4aX7pCvdD/9Omzase9duVSgq057tLDQZgLVTl
         iSn3InGxyC4Pql+f/Hmc+kswRCXrh3JJkUqUfAQp40ofyVo7mxheAZ/thb2WLjE2VuNJ
         o4ROR5+9gVpInLie0yJgriH2ZWcg2iu6BiU+awP9vbxS9CdKSdLFisuc1UK7Xkk7DPk3
         JVuwvFfmbC54ofZ4QAtjjQfm6s0M37ncnsKoXD94TfJKJCpiLw8rfYLYO1NGolWdgtfh
         ScgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=neomgWpHqXCM60x5t6DW5M0hxZBzb1T9JNopsdPWgN8=;
        b=sKbiCnMAd2s15DhDjDCU14VmES1SS1kyjGo5rWgC+iPLlKXdWNnDYyhbUPYdDVtggl
         YQYzfGWrKAyA+8Mz6efwF5T5zgGMCT9jSoZOjpCGzQFLwZFErg39fLR1IhsX2I7BTrYr
         72qc1VvBtuUtRmMCnRk/RptvZpfuHf4mYh429COytjoKKNHRtpoBBioOi3kREJb00CkU
         5ZTReh+K3XzBMIMoRsPw55pLInywdLHQE8sSIrgWx6lWQAQlzVxqWvlkp8Qpl0LsXGYM
         P9vMVeMe4R8OOjDSKEVu0znatXcKDj18TrDDwTbl4nap5ut6OrRw3iS4xwVUsIiY1f2Q
         RGaQ==
X-Gm-Message-State: APjAAAWBIkZHknWnrzH7r4CMGaf9LzE0F33JjRrAyg1DsNukWpbBs18O
        RVaY/e4KH/WIAM1L6alOiJ3xU1Z/pfnLyw==
X-Google-Smtp-Source: APXvYqx9HkCaTFAOd3mP47k7N0kMV44uUExrAK0jRddBmxrweOm3p3prR5jk5RqFeTLvI/WlxLpuQw==
X-Received: by 2002:a1c:7d08:: with SMTP id y8mr19340937wmc.50.1562618052996;
        Mon, 08 Jul 2019 13:34:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x6sm18059943wrt.63.2019.07.08.13.34.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 13:34:12 -0700 (PDT)
Message-ID: <5d23a8c4.1c69fb81.46a33.a2c1@mx.google.com>
Date:   Mon, 08 Jul 2019 13:34:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc7-308-g8caf72b14e6d
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 171 boots: 4 failed,
 167 passed (v5.2-rc7-308-g8caf72b14e6d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 171 boots: 4 failed, 167 passed (v5.2-rc7-308-g8ca=
f72b14e6d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc7-308-g8caf72b14e6d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc7-308-g8caf72b14e6d/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc7-308-g8caf72b14e6d
Git Commit: 8caf72b14e6d52d5ff1f19e8a80d854853b7f29b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 25 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 13 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

---
For more info write to <info@kernelci.org>
