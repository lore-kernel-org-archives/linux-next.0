Return-Path: <SRS0=O5gy=VV=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60D3C7618B
	for <linux-next@archiver.kernel.org>; Wed, 24 Jul 2019 10:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 918B521743
	for <linux-next@archiver.kernel.org>; Wed, 24 Jul 2019 10:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="MV0z4TDN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGXKYy (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 24 Jul 2019 06:24:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37446 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfGXKYx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jul 2019 06:24:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so21289220wrr.4
        for <linux-next@vger.kernel.org>; Wed, 24 Jul 2019 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/dKo7czYXzrr/JlleuuKM+vsZdqf2XL6JFdb15aqjv4=;
        b=MV0z4TDNZePcB5MIdSbAePa4zBtpWhmIuwsUIsJ3MLR6N+cxvpTA/fDs0Ija1HW6i2
         Ejdd56UICJ9s8EuOOpks/WGwXPijXXnCCnFDJ9kGVKM4KNh0pccVtY1vSs1DFt68noi2
         f2WTqOz/xYRJCHBv5a4ipLMe+uEsOOUTMJ2/RXNm0Q1ZAp8FGNpdTkt8w6cN7gczBuDz
         Wfn4AGuJ3rt+eZBBVLnhaOQm8ozv7Y6ifJStZbkFtkVy9gN47WPQnbJNBR5d7NYyT95i
         hUF2BQvnQyd7u1hp35d9hjikJM9Irr7HCLrEraHJpTYw8r/y96psbGSHAHe0UvCZqntH
         AtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/dKo7czYXzrr/JlleuuKM+vsZdqf2XL6JFdb15aqjv4=;
        b=b9j8iS4K4mFm/rhvhmNsE8+kISHAK0xXftR0utFMuYR89z8PtH/2BC7jdHyIaGfhgP
         4iBCLdOeN6tfJLdD/S0RSkC2PSJJtnGsrPrPtRCb5FaxUB7Fxbs0nWT+rOydVTfP9ehO
         CUomw/RzqDbnXS/YNSAT4dBIl+dxGkX0y2i223YFQLXyAUgi0mMheF0zrlknJ6l+8Ktb
         EEPAclNXwCar2IP/ZZOJX4UaRY0TQpCVuRzfnyuIc4L7GIub9ZSzTIVc5Kc9RstLCdXB
         M65bZvM20LuVbMHN7z+ePNPzzBEYf5+Mrd/a2iCG3ydt1mhbZfPeMQtmwGlHmxahq/hT
         bWnQ==
X-Gm-Message-State: APjAAAWa7gvn1wHZ/wIc/KZ1F8CZ26CQx+jibI4jaVfR79C0Ef8JPZ+c
        YrNjzBDJEZovLRsAYVZEr41T5ZDfuHQ=
X-Google-Smtp-Source: APXvYqyv1Asfd+DD8Qd+At4w5YCsMIZxflz6xFzQmxDImA5bchezA9vcwZHQK5VvG795t2/3OSI5og==
X-Received: by 2002:adf:e343:: with SMTP id n3mr47485363wrj.103.1563963892255;
        Wed, 24 Jul 2019 03:24:52 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v65sm51496983wme.31.2019.07.24.03.24.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 03:24:51 -0700 (PDT)
Message-ID: <5d3831f3.1c69fb81.24541.243c@mx.google.com>
Date:   Wed, 24 Jul 2019 03:24:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190724
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 267 boots: 15 failed, 246 passed with 4 offline,
 2 conflicts (next-20190724)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 267 boots: 15 failed, 246 passed with 4 offline, 2 confli=
cts (next-20190724)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190724/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190724/

Tree: next
Branch: master
Git Describe: next-20190724
Git Commit: 9e6dfe8045f85f9b5aade47e4192482927e2791a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 22 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190723)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
