Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB875C0650E
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 19:34:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C289021882
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 19:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="wtTd/5O2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfGCTem (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 15:34:42 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:34612 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCTem (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2019 15:34:42 -0400
Received: by mail-wm1-f42.google.com with SMTP id w9so3636692wmd.1
        for <linux-next@vger.kernel.org>; Wed, 03 Jul 2019 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gPf2c1Kaoddtw88jhlqwanuJsc4PDBT4tlxppSgu2CE=;
        b=wtTd/5O2N7CI66j7/YQld7DPVGw8zjbtFmY0Wni6+kBt9IqIAhd74bmqge1HCsRDrC
         MyJ+B6RsVq9yuf5EICke7I39GtT/YfpByGdTCw9XtatkAT0ZxA56f5kWSfVVX9dQRErR
         EPqqdeCXX21YyfNo5UwTADn9Wk1eUE8kF2myJgZ2uju9y6ecW3jH1qAnYLRdSEvbVHFt
         UZyUGqJ4YqhflHn70/yTWj/exunH/PB8uVX7PMel1BjOXQ6Qdn7QdByGUYDnq5p68YyK
         9HJZJAaEKdXhKELBujP8TMwS84oQBewBwo9HO/HjMqg7rQqilPNvo6KXZG948XlY9QAO
         zKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gPf2c1Kaoddtw88jhlqwanuJsc4PDBT4tlxppSgu2CE=;
        b=MWrIjTVB58KIEZMBm+1K+WSEuxUZcvk7OKJGQeudVc/9f85fUcOZ8fjlgDQIMMYbjo
         i8e2lNMfJ0SHsSzaSsqDYJvjEqYSixrW6m+HAkfGMkj+BVl8EEoq6Fkl4c9MZVyLxvjo
         fKmU43+KEmYChmDB6DFSbNIl130uIgqNL1Et7DumYGjn1DfnFf0URBcawCCDxgH33HI4
         HjxeCcKFvvgC2c3jhygHCPEO1NpUDFqx05oltF0gBT0HW0BnXg5XTM1v8hMVNnJgON+v
         T3U5CU105taCAvYPc7SM4gJjz15GwXsP/3iUpk9e+mvHlqEFTNkN3RjGRj1EteNIV9Eu
         Kh7A==
X-Gm-Message-State: APjAAAVGmPoZWkoiifEBFWC6uQ+aY/ZBshAPGTnRL6EQeMQNhvIV+Nej
        p+TeSyldpIxE9pVo8sqX3+RpIgINSnGbaQ==
X-Google-Smtp-Source: APXvYqwz5kUTRjRIaI8mBYCyl1JjbfgEdmFy1s7cxYPe3LYvee8U3oI38f3wELGlR31gQTjZXVFJCQ==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr8318481wme.74.1562182479694;
        Wed, 03 Jul 2019 12:34:39 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b203sm4178608wmd.41.2019.07.03.12.34.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 12:34:38 -0700 (PDT)
Message-ID: <5d1d034e.1c69fb81.9de2c.8bdf@mx.google.com>
Date:   Wed, 03 Jul 2019 12:34:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190703
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 272 boots: 20 failed,
 250 passed with 2 untried/unknown (next-20190703)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 272 boots: 20 failed, 250 passed with 2 untried/unknown (=
next-20190703)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190703/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190703/

Tree: next
Branch: master
Git Describe: next-20190703
Git Commit: f9ca7f5a1eb9c24a5c0eb01090c7176b52fdcb3e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 27 SoC families, 21 builds out of 227

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 8 days (last pass: next-2=
0190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 12 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 12 days (last pass: next-=
20190618 - first fail: next-20190620)

Boot Failures Detected:

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            stih410-b2120: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
