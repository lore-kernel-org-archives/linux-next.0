Return-Path: <SRS0=26vq=UG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A37C2BCA1
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 13:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27E1920840
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 13:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="zZRfkvFG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbfFGNDd (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 Jun 2019 09:03:33 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:35916 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfFGNDd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jun 2019 09:03:33 -0400
Received: by mail-wr1-f49.google.com with SMTP id n4so2108558wrs.3
        for <linux-next@vger.kernel.org>; Fri, 07 Jun 2019 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vkZqTLvWdbWmlCO2PR6nT5OynkEZivUair+qYuHOt/U=;
        b=zZRfkvFGLt5Q7M1Ds+n7vLYDitE0jlZczgTOXkf7rqeb82J5r4CcJHClKb27s0GhxR
         5m1G4jMVAKoRa6Y/JER3UrqzWW2MkOa9tms+AP+KYjnzMoXzojzYhL5nKvEtR2g3/C5k
         lZjcAmez6pv/uZ3laVzFCxVDZIpIb4Acwa2StfwJgv74tm8L3u4KJ4sYco4BM1TGsJ2I
         RnJ9RJ+l67a9uBOytHZWiZtZFGYbR3PBdnyhQYoEkPgummeEbf5mYIhC2aXcOEwkXkAU
         ++k613qb917BK1Y6JsSi6wP94XIUj3daURyzwvtPUjYoWCCng68UAJiu9M8DQcmWlpJr
         3u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vkZqTLvWdbWmlCO2PR6nT5OynkEZivUair+qYuHOt/U=;
        b=NTIplVPcJpyXq2w0TcHAphea1sFdwXZRLvJ2vm+vjAe4iwmG96C32y6MEFcJVYJw+N
         MV01rrH14qVSNtw1Y0QzvStN3FO+vwVIzlpUfaNiPD7eAWUTKFQ/mzzq7nLSE8FRR4sy
         YAEGrVS3PcOLqpRis8iahNaVyNyU09IGw64k4YddxUpD/mw+8K6feaAs9FX+gaCDLd3D
         6IXpnJ4HmtxrbXGB6KfkI9wdWW/9uo3cSshDMBZ/Pl7NOA5pV8Y2EaAX/VL7VkcP1byL
         nyEALK++F+j9NXanOmxzf2Z6CQWgYTt2hJxiyEY7u+Spvt5Qb1tTNVRzCnZZb4QjTe83
         3+rg==
X-Gm-Message-State: APjAAAVobz0iZ8b0OEmZCUZNN3yFrMEzp2zS9LeNgk/VdCS2rDEaCtUB
        xBKQHnMFyde3w9JI+I6c8Tm/65CEZLiupA==
X-Google-Smtp-Source: APXvYqwunJQUaG5IjQB50I6pVVorag9pEQIKlYmf9L7+95+lqbtixoHolzq5Ektmkl8JStH586iXkg==
X-Received: by 2002:adf:c982:: with SMTP id f2mr5377850wrh.235.1559912611335;
        Fri, 07 Jun 2019 06:03:31 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h200sm2322564wme.11.2019.06.07.06.03.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 06:03:30 -0700 (PDT)
Message-ID: <5cfa60a2.1c69fb81.b1d03.e073@mx.google.com>
Date:   Fri, 07 Jun 2019 06:03:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc3-429-gaa494f467cc3
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 215 boots: 3 failed,
 193 passed with 16 offline, 3 conflicts (v5.2-rc3-429-gaa494f467cc3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 215 boots: 3 failed, 193 passed with 16 offline, 3=
 conflicts (v5.2-rc3-429-gaa494f467cc3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc3-429-gaa494f467cc3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc3-429-gaa494f467cc3/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc3-429-gaa494f467cc3
Git Commit: aa494f467cc326f3aa8f6316644d61b7e33fd45b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 24 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 10 days (last pass: v5.2-rc1-444-=
g4ef1cc845da3 - first fail: v5.2-rc2-257-gb0251876abbf2)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 10 days (last pass: v5.2-rc1-444-=
g4ef1cc845da3 - first fail: v5.2-rc2-257-gb0251876abbf2)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-rc=
3-298-gefd8de4f40d0 - first fail: v5.2-rc3-336-gfd5c57db249c)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-rc=
3-298-gefd8de4f40d0 - first fail: v5.2-rc3-336-gfd5c57db249c)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-rc=
3-298-gefd8de4f40d0 - first fail: v5.2-rc3-336-gfd5c57db249c)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

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

    defconfig:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
