Return-Path: <SRS0=JB9f=U2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C9EC48BD7
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 18:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EFD720B7C
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 18:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="tNLRGsyL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfF0SzU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 27 Jun 2019 14:55:20 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:37908 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF0SzU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jun 2019 14:55:20 -0400
Received: by mail-wr1-f52.google.com with SMTP id d18so3718381wrs.5
        for <linux-next@vger.kernel.org>; Thu, 27 Jun 2019 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bnxamY+kMedraQXtnR2FFUD9mAIP+4De8YCtlrYnDvs=;
        b=tNLRGsyLW0QWUN7IzYCAW8RZhOxqTn76U9wRuDADFeKLKTYhYpCPUiC9RoAdfyTq/I
         ii6/iGzFzwcLbW5PKcRgOWsS7c/eiO93CAOzmfdLC5kKFLcT8S8F9F1uui+dRXj759Wi
         aBDCY6WqB3z5RsCKLrqqC/fsx0aGPeRSg5q7EsD4X9zgCN7BVDpbVMUoMAkfCnYeYnLs
         vNTMDuQCO2n97AFBd30tOYM4AYp9BZxlUnB6ivePtwUJrGZIajTMxxIzV+EwXZJ7cy9Z
         xTOOr3Mz+joVUgTHfClQWOYeSDF3ElsRSHx0G9waDQpGie3fAIZqPw9NnP1LyeIw782f
         RsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bnxamY+kMedraQXtnR2FFUD9mAIP+4De8YCtlrYnDvs=;
        b=gNTqcRTjAlZUlrEalPaADIxBjvLyedZEReUnKA4hX8757AQ/9rJ1DAPy/Xqr3GSdVr
         tlYZtakNEc5yP/KUYOVp8vu89j/1TPLLX8BN2H66pS09tsWsNMArGm0okX5dFBvIsIKK
         IiE4ejIT5gLd80l9W9pflpEKdTrDH0076Lpy8yGlhFIcGMF+jAUAyh3S0+S+umV2WXXt
         z7YjG/Vc19PCZ3GZs/GS7ljJcdrXC/1LqhlKmhVLSbj/LapfVw7VPraZwUO/q40H7eNN
         RQ8kZCO0VVuPdGPMQ7mhGoSeJbFyr52xYp61VKUq23cXi61yg6sfwLx+d8Mcy/5LBFzW
         Ipkg==
X-Gm-Message-State: APjAAAVsFCQSI9LzCl2TogJj/Dyfsi5mBhT6nSGZ4+mQGQwcLsbCT8k9
        SQWCFvaGtTxALHkbYqSB1lwfqdG/czUJrQ==
X-Google-Smtp-Source: APXvYqw4yFwmaWc4U7eDhkLk8h/jdpkQm+HeO0ojSoajdTmrCKgoGbiBpWq0/vFWUDoFu4qCDAG2wQ==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr4700127wrv.76.1561661718221;
        Thu, 27 Jun 2019 11:55:18 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g131sm3808643wmf.37.2019.06.27.11.55.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 11:55:17 -0700 (PDT)
Message-ID: <5d151115.1c69fb81.232ec.3d6a@mx.google.com>
Date:   Thu, 27 Jun 2019 11:55:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190627
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 298 boots: 21 failed,
 276 passed with 1 offline (next-20190627)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 298 boots: 21 failed, 276 passed with 1 offline (next-201=
90627)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190627/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190627/

Tree: next
Branch: master
Git Describe: next-20190627
Git Commit: 8087b004bd099367c29d3a163950bc4b162ebc3c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 26 SoC families, 21 builds out of 230

Boot Regressions Detected:

arm:

    imx_v6_v7_defconfig:
        gcc-8:
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0190624 - first fail: next-20190625)

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0190624 - first fail: next-20190625)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0190624 - first fail: next-20190625)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 6 days (last pass: next-2=
0190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 6 days (last pass: next-2=
0190618 - first fail: next-20190620)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0190624 - first fail: next-20190625)

arm64:

    defconfig:
        clang-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: next-20190606 - fi=
rst fail: next-20190626)
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190626)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190626)
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: next-20190626)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190625 - first fail: next-20190626)

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
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            rk3399-firefly: 1 failed lab

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-g12a-x96-max: 1 offline lab

---
For more info write to <info@kernelci.org>
