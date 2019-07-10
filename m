Return-Path: <SRS0=fDmY=VH=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37C6C74A35
	for <linux-next@archiver.kernel.org>; Wed, 10 Jul 2019 22:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD31021530
	for <linux-next@archiver.kernel.org>; Wed, 10 Jul 2019 22:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="PWsyEjdh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfGJWex (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 10 Jul 2019 18:34:53 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:37846 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfGJWew (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jul 2019 18:34:52 -0400
Received: by mail-wr1-f47.google.com with SMTP id n9so4107342wrr.4
        for <linux-next@vger.kernel.org>; Wed, 10 Jul 2019 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/6j/C3AMPjtDBjrS4gU25o0NmqkNHn5en8pnGBDusAo=;
        b=PWsyEjdhNdobUnQgV+BMLRCdDMHolLPMdr0RKV1WogZXD2k/K8/lg35OEBc/tG06xj
         oqh/JnNZ3sXQKNyMNpgYEfNozrue6000tXm58eFFvjHr5w8+QZjypJiC1ILlRiQ4j94a
         DBUbahulWcEJ3LQHmExDVO3v/p4ImjLt9Mu1LU60IV/jVsESFLBYRin7VASEX8Pw5pee
         mQkW6DfAKyZyD7rKoHbT1v0iYf/ZUooZFuE8KNE0ZOJscf2KRw39w+WmaBnVhVuNgcCm
         FASMn/Ir9LB59RHyICiMC00fZ7ga/ZqBoTRepSFpOo2+dm454q+Z+wCe5T5eVHG4HeXP
         LX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/6j/C3AMPjtDBjrS4gU25o0NmqkNHn5en8pnGBDusAo=;
        b=D3EUmNgpdUIwuHpBawWr858yiEx/jE5ES01loAGEVTaDGWEKXkzgD2Yz4CxOgzedxo
         KQNmpvM8x/6htKhqqa8mdezWqYFIedMhAOQoVJ+Fm2J7ILyr6nPIGr3Qj2KtBXA8C1GZ
         hOpjEf+wfwQH+eFbR3+w5OJSU3yuz/WYzRb+wyQYMbA+Aa5HQDsPoJ97apoWip9s5o0W
         q/3vQ09Xyzc38FFm6aGQcTEU2uaRZvo19SPxKZXWDIuyFIqqOZtwqJ8HjYC4/50daZ2p
         7UaFCsweLNdDEkIaM2NsUqf+1/ez485nS/qOD83G519oGe6UUGfUXxAACBmRwHZwkXjy
         HSlA==
X-Gm-Message-State: APjAAAXRCUKoRLFQYZNZB6WTpg+P6q1D6w7xpFRAR4WXn2n5RsDnGjxy
        UXiuoAQ9tSz3ujMQjblJDSgpkttQljY=
X-Google-Smtp-Source: APXvYqz7UH+sB0FzB8PdNy8l67FL32yof9rraZ+DjjTJTDip2ykG/YhlaeOoRYJremB1mPVcxlw4jQ==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr29648wrp.203.1562798090269;
        Wed, 10 Jul 2019 15:34:50 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j9sm196024wrn.81.2019.07.10.15.34.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 15:34:49 -0700 (PDT)
Message-ID: <5d266809.1c69fb81.16b9e.14ef@mx.google.com>
Date:   Wed, 10 Jul 2019 15:34:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190710
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 240 boots: 12 failed, 226 passed with 1 offline,
 1 untried/unknown (next-20190710)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 240 boots: 12 failed, 226 passed with 1 offline, 1 untrie=
d/unknown (next-20190710)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190710/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190710/

Tree: next
Branch: master
Git Describe: next-20190710
Git Commit: a77f5c70e3d27df87dce07920fce0423ed9e7804
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 78 unique boards, 26 SoC families, 20 builds out of 227

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 15 days (last pass: next-=
20190624 - first fail: next-20190625)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: new failure (last pass: next-20190705)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 19 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 20 days (last pass: next-=
20190618 - first fail: next-20190620)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 8 days (last pass: next-20190625 - f=
irst fail: next-20190701)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20190702)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20190702)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
            meson-gxbb-p200: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
