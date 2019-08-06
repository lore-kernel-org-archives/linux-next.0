Return-Path: <SRS0=AeLc=WC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983BBC433FF
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 12:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6331E20B1F
	for <linux-next@archiver.kernel.org>; Tue,  6 Aug 2019 12:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="lZEYFT7O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbfHFMDm (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 08:03:42 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:36816 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfHFMDm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Aug 2019 08:03:42 -0400
Received: by mail-wm1-f52.google.com with SMTP id g67so72093622wme.1
        for <linux-next@vger.kernel.org>; Tue, 06 Aug 2019 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bV41UdEzuGgtBq7uPzqscF5r4H1ir+vHb9no60FQ8D4=;
        b=lZEYFT7OxS3heVDpGHFBx/ZcceM5nU6heEc1SSfpxfCdTlczF73bP/rnbPjUhLC0aO
         OzdtdWsYRBYYTA1s6XVkrNGa/PGmhRoVxWH6LNGs+hQoZ2E63kzinlUSRao0Nt2/aeXq
         GyyCIVUZJzTIqlq/WrXS4wWKSbAM5sGFgrB0iRUNDZkQ7qqolS+0JPD+uGnrrXzTesO3
         JTQZhNNwbWfDdDnbA/5Fg8ppxgcNoWtzZvOidRpJOskovk6+JHDTO5vTVmz1y3rz5Y3S
         97BqXIrGvoIr9OrZLfu1FLoY9yOFDWmix+ktIGCYNNPFfwEee61lxEQqxABq05SAf3c1
         TgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bV41UdEzuGgtBq7uPzqscF5r4H1ir+vHb9no60FQ8D4=;
        b=K0N7UVTkMGJ4UILEuOShdAnhCyy8DfUbRk5ymUZom9veJqHEcl00kc0KChVlkVWZiP
         0ZQL689jXj0JlwoLQe4afp6KSObtvYZJSU5wJRHNU3vYkyK+yRYIKYIMHyRHCOJ931+M
         0H3ee/8rmSWjWETYbz92Htg6pomse/Y634914/BLJJibZSm5oBl6vgPe9QrORsdHJzCz
         d3vsQ4I2ZSxk1FUvf1G4ixegylnUvlPV2fMD7enkx//chId4uKj7b9/rGeaQYwZEgLdB
         XWfh0ljkb7OCqTzs9xV2lk0MqWASrooLm3mtXY0In6rRSMY1vsh5up9nnuCcjCSgFPid
         iAXQ==
X-Gm-Message-State: APjAAAU/sEdZlWuv1KKGDBXjJHbgENYuMVH5Br6eNIEdDnpOVDQgCgKs
        Qr7Mwnr/3d6buCNxEUHhonx3YrJXIvA0iQ==
X-Google-Smtp-Source: APXvYqz7RaJN5WBefg7GynowDoF+8XDJDHcPSZakMqATKbnHlBTEQQbg0GXwJbNGpbUvTIEJmORO2Q==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr4643565wmb.19.1565093020941;
        Tue, 06 Aug 2019 05:03:40 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g19sm158032163wrb.52.2019.08.06.05.03.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 05:03:39 -0700 (PDT)
Message-ID: <5d496c9b.1c69fb81.e1be2.ae1b@mx.google.com>
Date:   Tue, 06 Aug 2019 05:03:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc3-394-gd777ca65dd5a
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 174 boots: 6 failed,
 148 passed with 20 offline (v5.3-rc3-394-gd777ca65dd5a)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 174 boots: 6 failed, 148 passed with 20 offline (v=
5.3-rc3-394-gd777ca65dd5a)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc3-394-gd777ca65dd5a/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc3-394-gd777ca65dd5a/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc3-394-gd777ca65dd5a
Git Commit: d777ca65dd5aca46749723cb8e5a919aedce77b7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 25 SoC families, 20 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab

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

---
For more info write to <info@kernelci.org>
