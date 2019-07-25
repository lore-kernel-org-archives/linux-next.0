Return-Path: <SRS0=hAv5=VW=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3F8C7618B
	for <linux-next@archiver.kernel.org>; Thu, 25 Jul 2019 11:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67CF222BED
	for <linux-next@archiver.kernel.org>; Thu, 25 Jul 2019 11:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="sPgUZdKY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbfGYL4c (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 25 Jul 2019 07:56:32 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:46000 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfGYL4b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jul 2019 07:56:31 -0400
Received: by mail-wr1-f42.google.com with SMTP id f9so50421402wre.12
        for <linux-next@vger.kernel.org>; Thu, 25 Jul 2019 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=289poNtSFPAGQGANr5nW3kAoU64zXbcel4XbU5scq7c=;
        b=sPgUZdKYJE5ewsbh9DxFOdx+9bBgMhrDtnQp/hpNnrvO4pMbzoW9hB3ombwI1Hfh8P
         r0HmotKmQv4H/N2k3AoK2hldiTroPDEtGwsldw8vlUOAfyMlUQdkaWIBVA4GqEfhK17D
         lnv7ME0yQbqoNfs4pflwt0pBejuNBkQ0O1dhdAOn7cXH1YiM55Aqhyfx/KXC6C1ovIn3
         9OcUvEsMWZ8fqunvlDhCTmCmsSNxH7+vWNEU4TPa7p0tEoyFqWMXhL65dFGN3Vnvy5X8
         RZ6BFl4v8laJ/6+qxZt+7GG7dWTSshmYoBanwWMvLgHVySTeYNJjrNXeOqz7m2mhiLMM
         azYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=289poNtSFPAGQGANr5nW3kAoU64zXbcel4XbU5scq7c=;
        b=p0j1ldFQsbb45pNIwlb+E4wr70elmqQSfi9+z96PifUxflFkqOUKZgGLlHR9I4aBKc
         rRonUsMTKboGeldHtlRDZufmR8dweRWeXRIYFnyKof09CrHtW8ipvn5z7/dl7SN3WUnI
         5RPPVaCjnyf1+FP3lPwvWmhwHs00GhD212ajAbtgm6rk2S3m+C32v5V1tl9djvrEHrj/
         j9g3Yis4rHO2oonvP/R+3CjI4HazhdqUcxJRMMGd+UOfwZv3yVbGqKYl5zavR9Yfuq7Y
         tOdhkcN0TcnG/v7iNaYzlEKRB6x5hwSaKslHlBzQlzoAddxfqSXvWzCu5/Kcr83LyBdM
         S3jg==
X-Gm-Message-State: APjAAAWJhHdI9/ynU+3VMZcrYTHqctDWM57jcS6svi6g6nFIFTT1MpD3
        G0aIRlK9Pg/5DmjGQP6q8zynxahuk8c=
X-Google-Smtp-Source: APXvYqxK1u2rIMpEvDtNkwcKep2oedkmuF5MuTkdG+xAukVCWrfYmPPM/H5izCQHqlna2CKFPT147g==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr6677671wro.112.1564055789114;
        Thu, 25 Jul 2019 04:56:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x11sm34874678wmi.26.2019.07.25.04.56.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 04:56:28 -0700 (PDT)
Message-ID: <5d3998ec.1c69fb81.714e6.ce07@mx.google.com>
Date:   Thu, 25 Jul 2019 04:56:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190725
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 295 boots: 15 failed, 273 passed with 4 offline,
 3 untried/unknown (next-20190725)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 295 boots: 15 failed, 273 passed with 4 offline, 3 untrie=
d/unknown (next-20190725)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190725/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190725/

Tree: next
Branch: master
Git Describe: next-20190725
Git Commit: 13bf6d6a51df4fbf57b0626a7e469b9232ed2d38
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 28 SoC families, 22 builds out of 229

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20190724)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20190724)

arm64:

    defconfig:
        clang-8:
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: next-20190724)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20190712)

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
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

---
For more info write to <info@kernelci.org>
