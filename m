Return-Path: <SRS0=z0z5=UY=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA641C48BD5
	for <linux-next@archiver.kernel.org>; Tue, 25 Jun 2019 17:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A349520644
	for <linux-next@archiver.kernel.org>; Tue, 25 Jun 2019 17:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="r5yIK16H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731856AbfFYRgi (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 25 Jun 2019 13:36:38 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:35104 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbfFYRgi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jun 2019 13:36:38 -0400
Received: by mail-wm1-f45.google.com with SMTP id c6so3844185wml.0
        for <linux-next@vger.kernel.org>; Tue, 25 Jun 2019 10:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Iqc9QFR1IK0JGj/oVoochUySlicQaNdSjIMbGcqsnQU=;
        b=r5yIK16HGXbIiY3izqFBW8gmxXPHDzqqz1iEN9fu0LPucgF/DyQOqy9jQw+94vxlbG
         2zjMMSpEAwIPzalls4r/sBAoXcM/o9SE29rCt75lrV4lNvybiWOx7YF+JNnhGAXjF2IO
         pGHo0cjk1qZmIyJ4XIrxxnY7z8Bsu+wrh44JdhLao60CUfpGCVF/1GdnaPHv8xWD6oZB
         oEpA2F8NmXabVs87UEsRkZHDttxSammQkxYNRbQZ70gZZ2s2C31ZALlDPfVfBDClqGCV
         +oAnZln0PHGlvm26a23wDyZN/j2N/c7WcqrXnAXUkfHDs75I8H0SGZP6fNUPTcyuAzBb
         /ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Iqc9QFR1IK0JGj/oVoochUySlicQaNdSjIMbGcqsnQU=;
        b=ngLmEtcBvG35eCVpXJqQVxCmOkZbUfgZBnQrsLuV0TZ2sjGj/9pB7XKAWmQ5OEWdkx
         UB5ozDshIzrahoYPg2xBfsRiMHjhe4kqnRFzXIw5dpCnG+0DdWrbyZeQwWkzNHlGMKx5
         UAgz9Z6s2wV6M2s0mLv11XdO//YcOv2z6SPyxn2Rw08q7hVZFhH4XXZPyKGyJjxQ8748
         Em2RWcJ5zBH/spoAUiFaNJddyTxwgOS8NkEe6VjLgDV5AS82vW1mk59wloqWO0FCvuO/
         jGjgbWJqqzC9vOZwrsVNWwOSuZZcCCpqy7GH6yfQoL+t2Co3ByePBi7Qy3lsZ5bE4xc2
         cfXQ==
X-Gm-Message-State: APjAAAX1YzV013w/05iXhqdb3ujhmLx4sEw6qLp+FIhSGrysNP0751F4
        8gryz46tuVPfeCbfFvY1ngKPFGCPibGdNg==
X-Google-Smtp-Source: APXvYqyecmdXSeNvmxRiROvG126xT38lXustDksm7hTM8x/yAMOI9SITm/2uFBtQy5Ita4U8lQ042w==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr21793202wma.90.1561484195929;
        Tue, 25 Jun 2019 10:36:35 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 32sm28749460wra.35.2019.06.25.10.36.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 10:36:35 -0700 (PDT)
Message-ID: <5d125ba3.1c69fb81.84578.f860@mx.google.com>
Date:   Tue, 25 Jun 2019 10:36:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190625
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 299 boots: 19 failed, 280 passed (next-20190625)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 299 boots: 19 failed, 280 passed (next-20190625)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190625/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190625/

Tree: next
Branch: master
Git Describe: next-20190625
Git Commit: 902031767aec2eaa529fdbf3daf77615e3bc3a62
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 26 SoC families, 21 builds out of 229

Boot Regressions Detected:

arm:

    imx_v6_v7_defconfig:
        gcc-8:
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: new failure (last pass: next-20190624)

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20190624)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: new failure (last pass: next-20190624)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: new failure (last pass: next-20190624)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 4 days (last pass: next-2=
0190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 4 days (last pass: next-2=
0190618 - first fail: next-20190620)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20190624)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190624)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190624)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

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
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

---
For more info write to <info@kernelci.org>
