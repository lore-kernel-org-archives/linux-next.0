Return-Path: <SRS0=laWK=VT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D035AC76188
	for <linux-next@archiver.kernel.org>; Mon, 22 Jul 2019 10:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A701721911
	for <linux-next@archiver.kernel.org>; Mon, 22 Jul 2019 10:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="jDcb+JkU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfGVKfZ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 22 Jul 2019 06:35:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42237 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbfGVKfZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jul 2019 06:35:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so23859425wrr.9
        for <linux-next@vger.kernel.org>; Mon, 22 Jul 2019 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kEBz8sg7jB/P+H/pc1LjFQ5ruQ0I6mbGVGrYmplV3rc=;
        b=jDcb+JkUE32CuKH+lPKDG7sKMp/uJS3Zzzbe3SsTKXO0pnO+oVakdcFbjz2O1IAwn1
         eOe45VIC9ZTYORooSTSP9DdMb827abJvHScJCRgK0qiqU9zOOQnWcwl/1K4U1sKocpro
         +DMWHuGWwG6mz/HS5NI6BWR+w3951fhz0esd7Lw0uSMAGwg3g12D8Qk094q+CF1IgN3a
         e98bNFTs5iG0QNCFtlz3BEOueTqGpx1pYlZKifNAmKXPGiGbU/NBNJfmyGUatgkNhT/n
         72ha5lqJjoyiXXwU/7eM1sYNt1MMfEIkdOC1UVmBrW4E+RO/YH0JE0kdsY55WeSVuJrW
         vghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kEBz8sg7jB/P+H/pc1LjFQ5ruQ0I6mbGVGrYmplV3rc=;
        b=sPzqKlZSoQ2su4W2kk2ICoNbJ6mJveO/RtCxcR6HawqjC+P+Ro3pxOKURoSxsW+6yb
         JL3fSrvjZ82hOj21W9OU9+3ho32mg0WxfQxbSxhdrPNj/DZBmeKD+aPYMG9itk+MH0e2
         nB0QoaCT0BjChfQnAB4mAJEsvQg4sjpfVM5PFi6R7F5sEsYMvkQ7baQSnlRHM2KvPnes
         Ghiduwp5LIbXeKwrjNnnbhzECIoJDSkIr0DoXDkeDgob1D7ClBNv5uQh+fDzuQbP+PrC
         bPdDTXyV6jFRQInxe3risLSuVX+rRvNlGmS+M7w62jy++bzU/YulDuu7xZ1ziyA3cCJ6
         lBAw==
X-Gm-Message-State: APjAAAVwKHKCWqszjCE8m5DzG5nomMyer7Cf4Zl4SoEddrmiz4tome77
        4B57lGsCE9Dfa6ZsAL//ThcXpx0lpLI=
X-Google-Smtp-Source: APXvYqzUJKskBCWbjHn0X1TiNPV6ftD+xD67tY/eeSZi8rChFMPGIOItEUu05hdQ6rPNbM7yAdK09g==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr16353142wrw.131.1563791722560;
        Mon, 22 Jul 2019 03:35:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t6sm41483552wmb.29.2019.07.22.03.35.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 03:35:21 -0700 (PDT)
Message-ID: <5d359169.1c69fb81.8aec5.6f9f@mx.google.com>
Date:   Mon, 22 Jul 2019 03:35:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190722
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 193 boots: 12 failed, 175 passed with 3 offline,
 3 conflicts (next-20190722)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 193 boots: 12 failed, 175 passed with 3 offline, 3 confli=
cts (next-20190722)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190722/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190722/

Tree: next
Branch: master
Git Describe: next-20190722
Git Commit: 94e2bc9ee2859690fa5756bdc5ee590413060e96
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 25 SoC families, 20 builds out of 229

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          apq8016-sbc:
              lab-mhart: new failure (last pass: next-20190719)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          apq8016-sbc:
              lab-mhart: failing since 3 days (last pass: next-20190718 - f=
irst fail: next-20190719)
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 3 days (last pass: next-20190718 - f=
irst fail: next-20190719)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
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
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

arm64:
    defconfig:
        apq8016-sbc:
            lab-bjorn: PASS (gcc-8)
            lab-mhart: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        apq8016-sbc:
            lab-mhart: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
