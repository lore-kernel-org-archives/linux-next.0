Return-Path: <SRS0=hAv5=VW=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D614C7618B
	for <linux-next@archiver.kernel.org>; Thu, 25 Jul 2019 11:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8DA922BE8
	for <linux-next@archiver.kernel.org>; Thu, 25 Jul 2019 11:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="ftp4sAFq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391486AbfGYLCg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 25 Jul 2019 07:02:36 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:34459 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391478AbfGYLCg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jul 2019 07:02:36 -0400
Received: by mail-wm1-f48.google.com with SMTP id w9so35498773wmd.1
        for <linux-next@vger.kernel.org>; Thu, 25 Jul 2019 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ez5zlHYzWAJzoofJvnpMB8w8d4qTjIV00l5lIBzHnsg=;
        b=ftp4sAFqOiDYxl83IQ5RwKz2kdm2SBjrVvUXKhRK2igw1n8VO62PjSEstG7WI5lEI5
         C6ascKtQsau4OrHcSPJuNUK1+yCYkh82ct6UH5NpQu9qnVxcZq048U1sq8l8Y2mcJVv3
         7ZM4E7JZgpfoSPtHpku3uL7XRkcHAbByalXVqQDwWAqCUDdAjmfU1PBtWd61/mz51iRv
         d5MrDxibYiarl72tWl9x69qklEar4sCHjSQ+62K2VOaqk0U5RjckJUSTi1nO+FQiTdNc
         Hx+NivOksQk12tNUcE/G7+IvTfVkyuBuO0kEYt/9WBHH6bOvwUpmWFl4xB3SB9DqzUBy
         b1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ez5zlHYzWAJzoofJvnpMB8w8d4qTjIV00l5lIBzHnsg=;
        b=DqxJr3Ef2v28aFGnQWgvnyZSkcA9ot69srCKOlqLAx7Mw9fanPYypJP1tMQHfPmN/9
         CDauOlFbhQGavEFCdZjtV+cOApRACPmggJ+kq1HJRVPrTPQRAv/0Zax8dJW6eGuks+Ba
         PKLtLA9PTySiQyd0R4EWcMpaLSfvglUnC/w94kOLEhdG4Q9xDuLACWWvk8ZqbpgfHkMB
         xUZqBMbT7oVvX1myCtN6HdQuq6qpEiLa9y03rHBiLrdctfAbOa62qwrdcU9A/RLm+CdC
         MAZZilUT4j5PjyNGtvmFLhGGeYQlBClMQvY8nmT4Kr1DqBFo4sEqxO2EZYN7QqpmbXU9
         ffgw==
X-Gm-Message-State: APjAAAUBuX6I6G3WcJhbuDH3EtHYz1Bt+mOUuyrUkJYfig+vnk4Gt7uA
        IBD+62FCop2YbSO6InGraJby1tG79Yo=
X-Google-Smtp-Source: APXvYqw4dbO+JuPvlLPvbAWTwEvp8zksgJUMqOYXFDr0h1ww8H8sBU9QGfeLkIY7ALWyokMpHIVJqg==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr72330988wmk.24.1564052553419;
        Thu, 25 Jul 2019 04:02:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o3sm40303411wrs.59.2019.07.25.04.02.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 04:02:32 -0700 (PDT)
Message-ID: <5d398c48.1c69fb81.2be33.cc46@mx.google.com>
Date:   Thu, 25 Jul 2019 04:02:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-380-g074d4925d74b
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 231 boots: 10 failed,
 218 passed with 3 offline (v5.3-rc1-380-g074d4925d74b)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 231 boots: 10 failed, 218 passed with 3 offline (v=
5.3-rc1-380-g074d4925d74b)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc1-380-g074d4925d74b/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc1-380-g074d4925d74b/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc1-380-g074d4925d74b
Git Commit: 074d4925d74bcd62416daab0a03ed708b2af41ef
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 29 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 7 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 7 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.3-rc1-337-gad76983bea69)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc1-337-gad76983be=
a69)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.3-rc1-337-gad76983be=
a69)

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
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

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
