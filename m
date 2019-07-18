Return-Path: <SRS0=DNjb=VP=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D693AC76191
	for <linux-next@archiver.kernel.org>; Thu, 18 Jul 2019 11:27:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6DFE21783
	for <linux-next@archiver.kernel.org>; Thu, 18 Jul 2019 11:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="WQh/PNXo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfGRL1U (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 18 Jul 2019 07:27:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38320 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRL1T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jul 2019 07:27:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id g17so28288431wrr.5
        for <linux-next@vger.kernel.org>; Thu, 18 Jul 2019 04:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rhDZINeTyMVK0jMs3RLbAsLCo4QFYM5xu1j6bDuJydQ=;
        b=WQh/PNXoquZ5nlrgIE5giZ1aLGrGTrvAyxzucOZXuFntVvQd0PiCaOoLSkWDUOQUUU
         cyB+fdfU62RkBmfxHZDTmIxIUm//bUeUX8mjTkVbUTo90qt8hNs4+NnjHylIwnRM1t5h
         Mo1H9y1q/vaHSmBo3nNZQ6Ngj/BpAQQWn/BreOUafKmAL0yXFhAkcEPAQTWUPF0n0QEO
         cscii1BPgKksjEDZqpqW9DpwIuv33lykVQPrUKfBJ4yWGD3zFOAN1SHlpwcYCaARvrxZ
         YcKfzcK2z2ibIZ0/PygtV5O7I6hjWDqXtsJPcB1a/Zo+C6I3A7n6v+oA8jZwpmXwE9CW
         kb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rhDZINeTyMVK0jMs3RLbAsLCo4QFYM5xu1j6bDuJydQ=;
        b=qUujZkR4CdXtQtSNWEywl7d3XbmiQ41KVDUFTGxgjSIap/N659DabbSNMDTZBC4xXv
         R0W2IJnx/LSh1DmTu9UZW2JeAofUG0bRLFG19CvgsMiaLyenw+w+iHLjQmvumdtOUXVE
         aILcasEzy5RoIM6Dxkmwvf6d2seeIFcHe+Wz/61OOIAqeDZ6VXK68KThcrgVclUeybMB
         3qYo+XyT9ruwnFG2mRJGEKxIhFCcJE2Usu12bktGgOGFdHq8lJjJBqqv0SGClOzFvuoK
         nKulAsLykscayCUPuEOLpo2qoN5FSINGTeTKhZddsqoAs2OFZiJT/nRAjXua0CJfu/7o
         DbNQ==
X-Gm-Message-State: APjAAAWV60juASLSGzyO6JypTT6S/5UGmbTT9CKWbqejsRDAZ+0ZATPK
        rRZ4iD1eE9Iu2QRxtE+jJD1XTDXyxFo=
X-Google-Smtp-Source: APXvYqyKxYZnuM66/x6QuA2cP3ANtua+pzOvrQEh2+aOd6xJoT3MyX5UYPlJpGvvnjOY74mgtO4mCg==
X-Received: by 2002:adf:efc5:: with SMTP id i5mr36299724wrp.158.1563449237519;
        Thu, 18 Jul 2019 04:27:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j10sm42876903wrd.26.2019.07.18.04.27.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:27:16 -0700 (PDT)
Message-ID: <5d305794.1c69fb81.e9bbc.51d1@mx.google.com>
Date:   Thu, 18 Jul 2019 04:27:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-11745-g319f1eed1210
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 224 boots: 8 failed,
 212 passed with 3 offline, 1 conflict (v5.2-11745-g319f1eed1210)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 224 boots: 8 failed, 212 passed with 3 offline, 1 =
conflict (v5.2-11745-g319f1eed1210)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-11745-g319f1eed1210/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-11745-g319f1eed1210/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-11745-g319f1eed1210
Git Commit: 319f1eed12103a0627f8a7c609398b4bf729b752
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 27 SoC families, 22 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 22 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: failing since 1 day (last pass: v5.2-8386-gdcbf=
79ebd5fe - first fail: v5.2-8586-gf96c1aec6d0e)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-85=
86-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-85=
86-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)

arm64:

    defconfig:
        gcc-8:
          qcs404-evb-4k:
              lab-bjorn: failing since 7 days (last pass: v5.2-1383-g580386=
62df39 - first fail: v5.2-3342-g43c27ecab3ce)

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
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
