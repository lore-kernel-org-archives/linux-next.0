Return-Path: <SRS0=Z6PR=VN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508E7C76188
	for <linux-next@archiver.kernel.org>; Tue, 16 Jul 2019 11:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2235920880
	for <linux-next@archiver.kernel.org>; Tue, 16 Jul 2019 11:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="VHfnIrHX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfGPLt5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 16 Jul 2019 07:49:57 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:41371 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPLt5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jul 2019 07:49:57 -0400
Received: by mail-wr1-f49.google.com with SMTP id c2so17412211wrm.8
        for <linux-next@vger.kernel.org>; Tue, 16 Jul 2019 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NY3TA8tSLYx/umZ+Zhj0qH5L5Z4PHAScIMDWgDeFpYI=;
        b=VHfnIrHXQHi2VCRZM9T57Ho5hHcq+lS2XvszsZVT/g8S7Rf2LmMSMKLqG78KnXDgvb
         qWQfpt+L8pdeYPnWswBQtAOzR18GCIQeC5u48uGWL5aIQObJAjqGZhXH19CE0yK9KGM4
         I5vjXNFslHx16crKFrvyNK7v8bxabhnVVwYks0kqZmI6NsueinZpnc6rkpXPEGzcRpQm
         xZujLVbtOEsaQhcbG/z3rjCTbI9/Z6cjZCfuXC1HvMdknQUuDtwZdhaEjTX91Tra0SwQ
         lvAJnvOdJOPuUcFlKhe2XtQQdhgh1cFXK09fVj1U7tv9v7YSN7NyNFlTCUjGEpG9ZTQ1
         F1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NY3TA8tSLYx/umZ+Zhj0qH5L5Z4PHAScIMDWgDeFpYI=;
        b=DJpPB5n3DMmJkPXd0GLbbEg1Nd9CEZfRjC8km08u5gRUmRUrah6WIn6DUgKhHJR59D
         BNGCnF6zjdx3R9ViZ9C4NQfZ7pTTwBnlbJlEUPhD9CICJlImMlYmkMCJC2ceUeSYWXPp
         K6Q1Nho+tY5+1xO9I+XIhV0dnx1+SEMvO6EEsCEA4PHkQa6xHVIiHCaqITdm+m0Ns6c5
         ffxZZWBSMds8aNNjNyjsukKq1Br1S+/mlBrWW/slhY1ONyDBcXhWmL40v7vBvJEmpDKC
         wRg36JpWLimZLpEFMW7QS0gvTRYhCS6W8vQWWbZ/ZeZklj4YNje1iWiUoQNTqwNJG7cP
         lb5A==
X-Gm-Message-State: APjAAAVyMC8EJxVqQYsmGsjNuye1u9pKbgBnxHLEpLZvD8mhQyCOh0ol
        UL9XzxsXoGodGE6yQWc+3MpIWgP8SwQ=
X-Google-Smtp-Source: APXvYqyp1vV59hV8Xt1e7apyZGJRroMliE0bVOyMFHG/gmEaPCzU+1yUR4ItyPbBic0mbbmvYnaBjQ==
X-Received: by 2002:adf:e4c6:: with SMTP id v6mr34143371wrm.315.1563277794877;
        Tue, 16 Jul 2019 04:49:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o185sm19375596wmo.45.2019.07.16.04.49.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 04:49:54 -0700 (PDT)
Message-ID: <5d2db9e2.1c69fb81.d2d9f.e474@mx.google.com>
Date:   Tue, 16 Jul 2019 04:49:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-8586-gf96c1aec6d0e
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 212 boots: 8 failed,
 202 passed with 1 offline, 1 conflict (v5.2-8586-gf96c1aec6d0e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 212 boots: 8 failed, 202 passed with 1 offline, 1 =
conflict (v5.2-8586-gf96c1aec6d0e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-8586-gf96c1aec6d0e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-8586-gf96c1aec6d0e/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-8586-gf96c1aec6d0e
Git Commit: f96c1aec6d0e8c660613196e1b0fda667c65da58
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 80 unique boards, 27 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 20 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: new failure (last pass: v5.2-8386-gdcbf79ebd5fe)

arm64:

    defconfig:
        gcc-8:
          qcs404-evb-4k:
              lab-bjorn: failing since 5 days (last pass: v5.2-1383-g580386=
62df39 - first fail: v5.2-3342-g43c27ecab3ce)

Boot Failures Detected:

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
