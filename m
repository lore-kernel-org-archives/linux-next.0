Return-Path: <SRS0=xL23=VB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F41C0651F
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 19:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9438321738
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 19:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="soecKKjP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfGDTvB (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 4 Jul 2019 15:51:01 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:40148 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfGDTvA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2019 15:51:00 -0400
Received: by mail-wr1-f54.google.com with SMTP id r1so1349236wrl.7
        for <linux-next@vger.kernel.org>; Thu, 04 Jul 2019 12:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pIZCVXymqG9mx4TwTPvSGqVrkbXHWq1f/2ZVWZsX1Eo=;
        b=soecKKjPGKRcKBZfAGi5/ZvCK68blwDkdXrYyJw4VtvnaBeNoU/+o0IKyOjuc6BuON
         3Rl+Zl833oJg+ZXwh3fV8k5awS4oI/+/w6tbap2YH4XngMjHHvkDKvMCuwcqnmZ6Ga4P
         6udK8qqkLnOgso7N2DojFT+F49u3wKRg5QNKVgtmbN5iSEX9yfUOBMwnh2Wl92B9Nny5
         /84Jl7fM4zIgEJT3ci5qT8A1FrMWJoF913EfeZF2ILVZ5vaMVNyxD5saLAMZOFrwrLFP
         L/HDhmpB/MrWIsCFNJXmaK6WduASA36OG1G1AsDRQ1Xaxm81g2QpIjH6X5855DmO4GKf
         q1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pIZCVXymqG9mx4TwTPvSGqVrkbXHWq1f/2ZVWZsX1Eo=;
        b=tdGVy1vGeYg6/2QhpVRCtkCcC95pyi6bRNWGhETsWLZx3q3+3Jws7U+qZXJVbFRKJW
         67qaAzXt9BywWgKVEXvo8d7D6H4D8aGW/m6wn9CGAGB/SbOulmgGkNoGgMJxy45UYyE2
         VXPldAQ125l18geg1+0l4wnOMyhlRoyc+wuYL5aMwUEKRgSGk2jJdhpE8w4Y1d3TlNaC
         HPxHKZaXQsN33LX50yHTOBNuEqV1xn6mUtASBABQcgv7jjHug8aDLGNtdJ6fvroEa71l
         ZPQR8pP3EwogJ8cy3J1GsVx3V9tOdYEdiWMQZ6rfCfv9GHZrVBkLPZYLGQs3SBeqXj+w
         +xPQ==
X-Gm-Message-State: APjAAAVG5tJSeqTYRRZk4vOkpeMUoWryy3NZv11B55WRuMe8nJ7/FykC
        ZwgKbmEFK9NXhEhcrk4dRr8Xp71FoknMWw==
X-Google-Smtp-Source: APXvYqy02oinXDIONk6x4dZBdpzJTv5ZceoqphMbLcnU9x5Zbm7zXUD5rmOSDGxXQHdjG6Nco7+OYA==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr180807wre.248.1562269858107;
        Thu, 04 Jul 2019 12:50:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f12sm7400477wrg.5.2019.07.04.12.50.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 12:50:57 -0700 (PDT)
Message-ID: <5d1e58a1.1c69fb81.4e829.a38c@mx.google.com>
Date:   Thu, 04 Jul 2019 12:50:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190704
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 271 boots: 16 failed, 253 passed with 1 offline,
 1 conflict (next-20190704)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 271 boots: 16 failed, 253 passed with 1 offline, 1 confli=
ct (next-20190704)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190704/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190704/

Tree: next
Branch: master
Git Describe: next-20190704
Git Commit: 16c474c9ba39ede5fd1cd835ac52b3760d7820b7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 27 SoC families, 21 builds out of 229

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 9 days (last pass: next-2=
0190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 13 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 13 days (last pass: next-=
20190618 - first fail: next-20190620)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 2 days (last pass: next-20190625 - f=
irst fail: next-20190701)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190703)

Boot Failures Detected:

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

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
            stih410-b2120: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-g12a-x96-max: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
