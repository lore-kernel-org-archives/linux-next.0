Return-Path: <SRS0=/iKb=U7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191AFC5B578
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 00:11:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D967A21479
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 00:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="TsmX6V1v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfGBALL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 1 Jul 2019 20:11:11 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:44349 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbfGBALK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jul 2019 20:11:10 -0400
Received: by mail-wr1-f47.google.com with SMTP id e3so6118825wrs.11
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2019 17:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8oRJkZCF0fSm39DqzKtADXAYHcKmoybGzXvuWTDGX1s=;
        b=TsmX6V1vbL4hFPQdTzh3xLEFO4m8UQah4E/pLKn/bXYPs4/83pgTBRIuFXOC/lXOpY
         jJOnTIxjlhyWqZ33dyuFFf+Aa3zXuPLqEewJn8IREw4QfZBn1uhP1OASYmwANI2qGaZ0
         S5Yck53tciu3M3WjpYDBwsJiJhLvBp2I2rwo4yghTqBoIkreQoZlfDuWYnsuHjuSJ4wE
         HiLuT6L96y4dCcc1s88SY9CFvrJoUudneWAVBgKoRna3jURx7vwPNZ3Ok1uWDxdYBXpf
         1DpmmRW1H/Y9amQRMBHbqMiTsZYCTSsJrQQwCcybXU/3MBMZB3JwPM35eRYzVbx8hGuY
         4Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8oRJkZCF0fSm39DqzKtADXAYHcKmoybGzXvuWTDGX1s=;
        b=F9f++q91BgFCzCd3MZtBKvriLyPdBILpuQx8CwPggGgV6+WheJEkeA2x7NIxfaFrx7
         7qGrYAVGsgHxVl+GgbCCf/3tjKEPR6lGAL4NX/UEKm6sekmVHxjI7hiXaECwKnXFSpJ9
         3MIvXtsLX5mm17CnrZ8nurW0/7Rr91tUsk6CoNfNsr4JM2YzOgtNJ5UZFWrL5pz7RGeZ
         4HSDmOgRtGUT0riWLhgPbhj+UblEkWi3kjclhPdw5v1qsOjCDbDXBtt1oHi3adtmvVPQ
         yRPDjdBxeZ2rJ8wgUm50Fl4e8KAPnmkr/irS1tv9LlKR2IQgIOdUBVpEpRE4SE3gRDEH
         dCiA==
X-Gm-Message-State: APjAAAV/Jvfopoe1EP+m7MASrrlTm3zy8U6+5C5aX63oRkzwDlMdsLZP
        9H3MrFyLDXPt2ItEEHjSLSlb6ZrhvTaH9g==
X-Google-Smtp-Source: APXvYqwsrniLDUR7LsY0jYuqi5yuOOCzV2rKDdgwzWBIsnwJUI3+JLg+61AXZlivpaJk3Jh3RpTvWg==
X-Received: by 2002:a05:6000:1c9:: with SMTP id t9mr8556606wrx.187.1562026268734;
        Mon, 01 Jul 2019 17:11:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s188sm721586wmf.40.2019.07.01.17.11.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:11:07 -0700 (PDT)
Message-ID: <5d1aa11b.1c69fb81.a94c4.4903@mx.google.com>
Date:   Mon, 01 Jul 2019 17:11:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc7-146-g5dc8dd927a11
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 229 boots: 5 failed,
 222 passed with 1 offline, 1 untried/unknown (v5.2-rc7-146-g5dc8dd927a11)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 229 boots: 5 failed, 222 passed with 1 offline, 1 =
untried/unknown (v5.2-rc7-146-g5dc8dd927a11)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc7-146-g5dc8dd927a11/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc7-146-g5dc8dd927a11/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc7-146-g5dc8dd927a11
Git Commit: 5dc8dd927a117ebe85e0166698745a0a60d5de5f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 27 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.2-rc6-190-gd8fb83281=
cfd)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 6 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.2-rc6-190-gd8fb83281=
cfd)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
