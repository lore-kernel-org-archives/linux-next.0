Return-Path: <SRS0=/iKb=U7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B08C06510
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 16:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A943C20989
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 16:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="Vv2ytM+c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfGBQkQ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 2 Jul 2019 12:40:16 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:56041 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfGBQkQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jul 2019 12:40:16 -0400
Received: by mail-wm1-f53.google.com with SMTP id a15so1497436wmj.5
        for <linux-next@vger.kernel.org>; Tue, 02 Jul 2019 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Uc84hWG7/YAvXubNPMgyrU9eXqVugH/j0/tHZWLCrLw=;
        b=Vv2ytM+c89vvHxYfc8YOga0XxgmQLaue/e+H6mQUMa85EnBp2GB86AksVUuSDGG7GY
         SMJTbVNkad9fp7SThdioGYbMon6SUj40D7/DkpBB6oR0nQQuaHmFuXwl+q/cyPS1L0BM
         ZFMo0mG2/THQgseazvbwFUV4+ayNfgefGjS5f3MSR7a1hQ5VZn2AP92TcyHT/ADFzmbI
         Hw6OhRrEQVZJs7fxvaTaxcrRSOPZNU/YWdCx4NuH/7kezblipdtLhYf2NHyLAZ5AF6Z/
         8eT1ARP+0veOGaCWixEoXCqMthMg+ENWJCXKGUEQLog+CJFIC3daDHZ2rsljBrx/fEIK
         lgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Uc84hWG7/YAvXubNPMgyrU9eXqVugH/j0/tHZWLCrLw=;
        b=gEO/nHeMzVL/NKQeByPb+8Hvs7uHOKGSFGGMdanPLM95tXFSv70dMqq2qAgcCq+got
         bZGAq5nfIlZu23hp/HuivkNGlw/j6dK2EpkXC2LyrjQtF13pBQKV8uzfubt1F8zLPmf0
         XzqC9LCmktuHyrpEogB7feReY3ebBMcJVUewg8Du3PCefYkRhSXVUJTwjn8KMm1ZF7Ge
         PZ+HX+Sd/rUuE4UTxEjjXaRAeeg3cchqlQZh8naTl2PL+UyXDkmReXQAmTue4urvHaec
         qY5VDqpm04rX5jBgY8uZoTvCrzMLOjjN1lHsHUOStQIsBR99wDsrPMh5Wcx2SbranIvj
         OW9g==
X-Gm-Message-State: APjAAAW8d3UVjVx3AR5VfwaaOSKOcc3w2A4PUywxPJXfs3aa1aszx71x
        vE/T963MX9jd7/pCpkxsUudQ3cKT/1BLqA==
X-Google-Smtp-Source: APXvYqwWXKmJVU6BuYDaq3ACmGAqy4wuwa0Pa6T3oD5hjVQvZuTIb/1DGbZzIpDuydxEmoHtwEK53g==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr4072134wmc.169.1562085614236;
        Tue, 02 Jul 2019 09:40:14 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y133sm4422753wmg.5.2019.07.02.09.40.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 09:40:13 -0700 (PDT)
Message-ID: <5d1b88ed.1c69fb81.1176d.b0ee@mx.google.com>
Date:   Tue, 02 Jul 2019 09:40:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc7-176-gdb7b85e7458c
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 226 boots: 7 failed,
 218 passed with 1 offline (v5.2-rc7-176-gdb7b85e7458c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 226 boots: 7 failed, 218 passed with 1 offline (v5=
.2-rc7-176-gdb7b85e7458c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc7-176-gdb7b85e7458c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc7-176-gdb7b85e7458c/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc7-176-gdb7b85e7458c
Git Commit: db7b85e7458cbfa8935016cd2c286827c2bb1d75
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 27 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5250-snow:
              lab-collabora: new failure (last pass: v5.2-rc7-146-g5dc8dd92=
7a11)

    multi_v7_defconfig:
        gcc-8:
          am57xx-beagle-x15:
              lab-linaro-lkft: new failure (last pass: v5.2-rc7-146-g5dc8dd=
927a11)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 6 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am57xx-beagle-x15:
              lab-linaro-lkft: new failure (last pass: v5.2-rc7-146-g5dc8dd=
927a11)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
