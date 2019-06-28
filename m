Return-Path: <SRS0=YJ6U=U3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52082C4321A
	for <linux-next@archiver.kernel.org>; Fri, 28 Jun 2019 21:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 208A8208CB
	for <linux-next@archiver.kernel.org>; Fri, 28 Jun 2019 21:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="U012xK0m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfF1Vry (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 28 Jun 2019 17:47:54 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:44655 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfF1Vry (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jun 2019 17:47:54 -0400
Received: by mail-wr1-f41.google.com with SMTP id r16so5798835wrl.11
        for <linux-next@vger.kernel.org>; Fri, 28 Jun 2019 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+qQ0vseFhjkKzpc1EAa7I68qVK5bWudgnIvPJnhFT5c=;
        b=U012xK0m/2+4YNdyDOiOXMvzP3EYw7A2T55Il9WVW/3ut4i/061FZf36IcZ6YQMfla
         cog4Qck6QiG7hhB7OZaK20mgYCr5DcrB4/WEZ7HkfODTNravXzCcXcGXdNukvKj9bdHJ
         M+916aelfiC6wKAnKecb+u3P0jCrTHFK8UKqP/8Ynz4qt7ggSIZDvaxpeY2QTfe52i9w
         yZf3+5k0pYvZS27j6Hnqw6XtuKNmEKk3EAzXDHHK4qCmm28Z9L9JAZ8MIRLsfidL/Xl/
         VUjRUEHTYQudnqBcAhws4JKFy34VrtltBX3YIqzi/hsiIUfxf5jNiBc93H6p0M4mg4Yy
         syLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+qQ0vseFhjkKzpc1EAa7I68qVK5bWudgnIvPJnhFT5c=;
        b=HMC9AvajVa3JEFrf5MMg5JfoMTV3tQUx95QrZX4dCUvuKm+Kc8sSYBFvS9mAWUFXOZ
         fLoW5bRxwXPVbtf4Oar1vXwNjnaM5uSrI+p1S4QXYg6V3Rekd5w5vADzNKPnfqp53b0o
         fTsMAxn/GKNgVAFrZ+qyXVkIfu6v3cq3XOJYDnzw1mxSiZ5ZcdTZeJgoMDhvdeaTz13p
         601FhRNJoJBEBaNtzzAMOUmCJbpElliWzpM1Va3SNn4L6NKiNzPUfSv4PVs54M+wN9WT
         pGe6f7Ih8sXzdg7F1IEBwyV0cER89ouagTowoOASNsXrGJUdV09isCnshlhQxL9lxJsg
         MShw==
X-Gm-Message-State: APjAAAUboyN7G4mRzNeYw9t2jASoca/oM3+LXdNgWAIfouUZs6O9BOOl
        9deQVSL4BSbQMfe/MlVPDGNPdtEDdNJKPg==
X-Google-Smtp-Source: APXvYqySlV3n1SUPxgNBiytPykG7ffMgU6aOsBmWetIBwbTSWmFkrBujUqq4GsaKCzaPvQlZdquyVQ==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr9856522wrr.330.1561758472503;
        Fri, 28 Jun 2019 14:47:52 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l124sm3969433wmf.36.2019.06.28.14.47.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 14:47:52 -0700 (PDT)
Message-ID: <5d168b08.1c69fb81.8ae02.8324@mx.google.com>
Date:   Fri, 28 Jun 2019 14:47:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190628
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 296 boots: 21 failed, 271 passed with 1 offline,
 3 untried/unknown (next-20190628)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 296 boots: 21 failed, 271 passed with 1 offline, 3 untrie=
d/unknown (next-20190628)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190628/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190628/

Tree: next
Branch: master
Git Describe: next-20190628
Git Commit: 48568d8c7f479ec45b9c3d02b4b1895f3ef61a03
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 26 SoC families, 21 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 3 days (last pass: next-2=
0190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 7 days (last pass: next-2=
0190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 7 days (last pass: next-2=
0190618 - first fail: next-20190620)

arm64:

    defconfig:
        clang-8:
          apq8096-db820c:
              lab-bjorn: failing since 2 days (last pass: next-20190606 - f=
irst fail: next-20190626)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190627)
        gcc-8:
          hi6220-hikey:
              lab-mhart: new failure (last pass: next-20190627)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190627)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190627)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0190625 - first fail: next-20190626)

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
        clang-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-g12a-x96-max: 1 offline lab

---
For more info write to <info@kernelci.org>
