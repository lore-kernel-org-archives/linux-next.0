Return-Path: <SRS0=OytO=UF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9EAC04AB5
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 13:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0C4C2070B
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 13:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="YFCaNy3L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfFFNPa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 6 Jun 2019 09:15:30 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:47019 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfFFNP3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2019 09:15:29 -0400
Received: by mail-wr1-f49.google.com with SMTP id n4so2349309wrw.13
        for <linux-next@vger.kernel.org>; Thu, 06 Jun 2019 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ags0Vzw5THB8ClCP+KKv8MyFwRpbtlewzlG8ATHy+Ek=;
        b=YFCaNy3LWhT1gDJhaHxIfIWBlLg2rxI3Vo7HRwSR6WYoHurHZO1ojWwS0j3bQYS3PX
         Dd7MJRk/xJ91gNBX1Xwo+VuXspbTS5I/AdMYO595DzogphNzc199qbC5n4rCfuQhK9+F
         lOP3Lp5wFUu+eySUq42gDX3hIbXYfgwPn7lP4dVEv9bV3A+b4pKm613rA5eAEyphdZ96
         q8D+keQLYA1enqMQsfG0A0R+5Ot7AIUG2zf4Gu6mtjXvTLxAwyZx/i4xTDY+pRhiH824
         qQpVBNL5nIBitYjznbx7nK/Rv1KurMZ5HUlyHHoz1C0AadsLGxmNWkzpwZUeZp7ypIQg
         PjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ags0Vzw5THB8ClCP+KKv8MyFwRpbtlewzlG8ATHy+Ek=;
        b=V1OGiwryef+v4pJrpD+i4TZFtHBdk2Ys7FS24x5cLAZRTWlvQTpr8rEXLVYLeQWjM9
         TZ21yjXn2DAer8VTkgCIjHs3WKEnsPvdBJvqv5bERKD+ZBOppeNL6UVlCpfMRpIrdavK
         eo45ynx2j2kpLVJAtFb5FSVh15i/52lt/g4WA2kFPWyecZNE9b+pphBzAf+FenauONLg
         ymlB1Z94gbzv++nBGabEdJNdkMJbbpSAxqr04zTaFe/mFNUd4CWdrZzC8n98wG2je49d
         y7WCk8kxRoMLBdc1hbNwKxaqXGolEIoal0XRmshx7EH1IRcRx0/6HEcn72tigzl8lpAH
         GagA==
X-Gm-Message-State: APjAAAX0gGoHaAuk1+r9/wlp72d/VlLhpNKqMA2Ds7IsIZzelJWQnVfj
        O43tCmAj0KQ3q9dYJVzRlR0P5T0KfC9nSQ==
X-Google-Smtp-Source: APXvYqxU+GnSLmcM219UVIHEy1ubHENC0aSx3vd77iiXvoZ/dnrQdCNXl+PcEvgI89yi6RyE9EswZA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr29939274wrn.204.1559826927228;
        Thu, 06 Jun 2019 06:15:27 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n7sm1872339wrw.64.2019.06.06.06.15.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 06:15:26 -0700 (PDT)
Message-ID: <5cf911ee.1c69fb81.7e7f0.c214@mx.google.com>
Date:   Thu, 06 Jun 2019 06:15:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190606
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 267 boots: 12 failed, 234 passed with 16 offline,
 3 untried/unknown, 2 conflicts (next-20190606)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 267 boots: 12 failed, 234 passed with 16 offline, 3 untri=
ed/unknown, 2 conflicts (next-20190606)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190606/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190606/

Tree: next
Branch: master
Git Describe: next-20190606
Git Commit: 8b4d1d5740481f10addc3620c6bcfaf00437caa7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 24 SoC families, 20 builds out of 231

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: next-20190523 =
- first fail: next-20190528)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: next-20190524 =
- first fail: next-20190528)

arm64:

    defconfig:
        clang-8:
          hip07-d05:
              lab-collabora: failing since 1 day (last pass: next-20190604 =
- first fail: next-20190605)
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: new failure (last pass: next-20190605)
              lab-baylibre: new failure (last pass: next-20190605)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: new failure (last pass: next-20190605)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          hip07-d05:
              lab-collabora: failing since 1 day (last pass: next-20190604 =
- first fail: next-20190605)
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: new failure (last pass: next-20190605)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 2 failed labs

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
            hip07-d05: 1 failed lab

Offline Platforms:

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
