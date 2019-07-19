Return-Path: <SRS0=eN3K=VQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B07C76188
	for <linux-next@archiver.kernel.org>; Fri, 19 Jul 2019 08:50:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A4B92184E
	for <linux-next@archiver.kernel.org>; Fri, 19 Jul 2019 08:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="OzMFwePj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfGSIuc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 19 Jul 2019 04:50:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39017 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfGSIub (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Jul 2019 04:50:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so17857198wmc.4
        for <linux-next@vger.kernel.org>; Fri, 19 Jul 2019 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pYCb2pGMwSGcIdFCz+5acZEbK1CUDrBtw/DRQKW3n94=;
        b=OzMFwePjrVqtcqFbHjBzquOVcsX1o1uEs0sPxLLyFa32LByX8sYeg+d90JfjKLvG+T
         5+ktPd00PGUrUEHgKELYxNkWh07ocdzVOBPtkxDPBjmDysAKe+G0pl3tDiJl9EeNqZrh
         wdApWRTR9mzEbDYuDuiJ5U0Axlguh6t7fWdbO3crVHOwpH41o6tdfdW8gIlxEmVUcx+w
         axMTNl6BhQCkyrrrDl8YwixLr0uLA3nZKe3QgxDCaDA5ZnPAfpip7uycqEV8Wn4C/EfZ
         0M2JoFPoOoGe6+XWgvEYKiREJCFtXHetPGH44q0hk72yHXqtk/tNUSuk0fR2FugELy6H
         +Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pYCb2pGMwSGcIdFCz+5acZEbK1CUDrBtw/DRQKW3n94=;
        b=FLbp4JHXg7LIBEN7dhvAA9NnyDor78s8MUagX67y0C6eax0Tg9+mThVpArAD38gcXC
         pZbdouB9fIcK+0RW5nkCg5roeBR+JU9qQrSxkf9+B2BX4OYqHaxA/C9ffDXwAXxr2gCb
         pR9nayJ1yxgtASbbG4LfvIzwnxVM3CdsW2Nt4B11cySCocHW7Mx4STWTLVf8aZlpujkV
         +Nsk8psdLKZP+xUlcxXZkysmPFJDB56Ekeveqge2MODdIkKlGwZxigHLXTFocCRQFFEx
         jfzmF9ER6219lczbI2d1jhgB+x/VKt0PStxROgsfpLSCkNTipoJLqe1EBAJt2KJR/AG2
         xK0g==
X-Gm-Message-State: APjAAAVZsvUSsd3rcP2cruZbYiJ3my4H00c+TRuEvIlBMGYKWrQyLil/
        ALjECCuO5yy85fOo2HNO43yPT3YfyY8=
X-Google-Smtp-Source: APXvYqz4MA+uK1aga9OOBbg2jvHfPn5bJu2jOFwpGEy7lTW0s3MuBNOyNl7QZLJ/J8Ehv0NgBTMTNA==
X-Received: by 2002:a1c:c1c1:: with SMTP id r184mr46551067wmf.9.1563526229927;
        Fri, 19 Jul 2019 01:50:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r11sm34369907wre.14.2019.07.19.01.50.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 01:50:29 -0700 (PDT)
Message-ID: <5d318455.1c69fb81.7b0a2.3773@mx.google.com>
Date:   Fri, 19 Jul 2019 01:50:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190719
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 263 boots: 19 failed, 236 passed with 3 offline,
 5 conflicts (next-20190719)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 263 boots: 19 failed, 236 passed with 3 offline, 5 confli=
cts (next-20190719)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190719/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190719/

Tree: next
Branch: master
Git Describe: next-20190719
Git Commit: 54efad203f37d23bd2872a11b4f15fd9a17a1ede
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 28 SoC families, 22 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190718)
        gcc-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: next-20190718)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190718)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: next-20190718)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190718)
        gcc-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: next-20190718)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190718)

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
            meson-gxm-khadas-vim2: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            mt7622-rfb1: 1 failed lab

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

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

arm64:
    defconfig:
        apq8016-sbc:
            lab-mhart: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        apq8016-sbc:
            lab-mhart: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
