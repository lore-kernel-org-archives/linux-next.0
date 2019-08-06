Return-Path: <SRS0=AeLc=WC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA777C433FF
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 12:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE54520B1F
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 12:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="pwFPuUiY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfHFMiN (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 08:38:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36788 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfHFMiN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Aug 2019 08:38:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so87827842wrs.3
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eePA13VNd2GmenVwEYBjjdcVgISfmnFGRcT9wPnZPQ0=;
        b=pwFPuUiYOy2/SgTaHpevQCLhBsiSr1qimotdmBE9fHWNkpOouHAlEUMA+t0rlej3nU
         vzIVzzZR9zuREMYUF56eduS4Yo5HNX8CfGTwyIDwhy27S9gr8Ff985AyOLauk/cD9qfI
         hA5Haq6soiIXnSb5IioDVLVJSXMPbB3Lpv1NmsUmQa2PZGa/L8s/QeCQiU+Z51vennZL
         1CqtWuN+DGVdP27sut8hBme//0FJVCSMYojXWoASKmZUME7zx7rjoC6RvmHEdt5EmvT4
         3Keql+BdQBaEv64FbdMtK3BO0qc0ICKiHK/+oUGObBqRjNeR8wdmowhxvgOJUD1ti5fx
         2h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eePA13VNd2GmenVwEYBjjdcVgISfmnFGRcT9wPnZPQ0=;
        b=IOTuKA49nJUUHioNO6YG2DPM6N7FIggQayfOfSZEe3T69Vu3pNhSl1CYVrScXeRhhf
         l2EsGYnmKx6AQA6MA0CHPs8yUeImMOcrG1pnvljTlRuqV+2fug0+q9crz5ei1T+M4l4P
         QrkNoFzKg/5LtcwH3eorGqtWlcvMX1Edi4BvKuN/yhNF6mA8p3VWjtt78gpZvQDJWt90
         Q40eJ4I0MVqOmz2hq5QDvgzXSYF+q76sSdviJY1EQJEv4YVQyMxspOoTYIOwbR4Hs1c9
         YQchPQTjGrudNgZEcchKvP9knSIde4yzfEAtt7/Cg0m0G5/o0o6CO/Jio8k6U8yKsdRP
         Zi4A==
X-Gm-Message-State: APjAAAVqMoSnN37KmVYWDIrgziRoDSuRvDEEbP9dbNjfkq2asnX6Ktxv
        I/PhmDDaZ41wpUV+F/Sv7Pn8A1sWXfCjcA==
X-Google-Smtp-Source: APXvYqxRBBBFjEWWs+hWwMpXS/pmrXTYzB9wQI/kUexW4eZAjzAUbPFDpBxfKd/QZNriMWycCN9HQQ==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr4760714wrn.168.1565095090189;
        Tue, 06 Aug 2019 05:38:10 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f204sm146362219wme.18.2019.08.06.05.38.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 05:38:09 -0700 (PDT)
Message-ID: <5d4974b1.1c69fb81.57582.5b30@mx.google.com>
Date:   Tue, 06 Aug 2019 05:38:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190806
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 194 boots: 5 failed, 167 passed with 20 offline,
 1 untried/unknown, 1 conflict (next-20190806)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 194 boots: 5 failed, 167 passed with 20 offline, 1 untrie=
d/unknown, 1 conflict (next-20190806)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190806/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190806/

Tree: next
Branch: master
Git Describe: next-20190806
Git Commit: 958eb4327c1761c609bde8e9f7c04e9d1c6fbb96
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 25 SoC families, 20 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
