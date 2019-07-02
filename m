Return-Path: <SRS0=/iKb=U7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD2DC06510
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 16:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A8352063F
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 16:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="ia1HUdth"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfGBQsU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 2 Jul 2019 12:48:20 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:40696 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfGBQsU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jul 2019 12:48:20 -0400
Received: by mail-wm1-f46.google.com with SMTP id v19so1760490wmj.5
        for <linux-next@vger.kernel.org>; Tue, 02 Jul 2019 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DUHQvZrVjDVrS9TFkfPnS035A8qES94NWXEQCdm1hIo=;
        b=ia1HUdthJ23kKdx2lSJrM8f3uS16k2JynsnXv/mHjoR/hoVNyIVtwcwcA4TWfm/xyb
         37962EZF8aHnxXmDLvahJPWJkSQR1Ll+C5P+oLxkeH+ClvmbiC4ufgnAvB1UKAIXym2N
         vpBNQ/guFWUepkRJ+pxkZAHdYywpzvpjYTQ/EzY7PYeJjKU4X2v1oYlNEOOHRejC7OqK
         mAYDD91qFFfgvqQ3ZIU65vOlgaRH8ogjiyILD0sNyrMrBpgb0hdxmZbCH64f4QWOZxND
         gg0eo4pbPR4bIKFBkyR+5heTlfbOVAmq2ZCEuQoppJHTKwlQSeRLZ3VUBSdF5ldZWo/k
         w8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DUHQvZrVjDVrS9TFkfPnS035A8qES94NWXEQCdm1hIo=;
        b=t7yEzZ17qj1AM+S2DTqidntBP76HvV5xL+KTy9MmOIVA8IrSY5PC8RoddRxYa1xSX+
         BguovnSaNu+SgC/y/dvF66xkgTvaTEO+/T5BUJojiuQP9YoaRQdSev6aif2QA/ohtuMh
         7KPGL9VVDGZhSXuXS4/Yw/erBP6qbwpCdEM1ZHqNEOyK/VgX28zKz2MNIaUJ+LCIZhw2
         ALIHaqnExrc7cDmtCgLNYg0KTLSGOlAbzz+rWaqJJHRJe3mIPVOBTgvtUJiUr8ijbN0x
         z2QZvHeIynAolM2tT2toZPn0zWzRtQklbhO6NkOmwxSQZjpjqKfKJbmqapc9cggxvTSk
         rfOg==
X-Gm-Message-State: APjAAAVKKBAE48/KBUivbCVRsviTnVuUOAa89DF+Vm0ZTvvSsTiqVLTl
        6U4qndkKkbJrG8w6Vx8L44Ev1CLGukk=
X-Google-Smtp-Source: APXvYqy5Yd6G61wTVhMY2fU/nx2HQheWNmhcCdIo0rP1BTNIZ/+bqrJs7zcJHjtftQn+4eajNMea8A==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr3892135wmc.175.1562086098464;
        Tue, 02 Jul 2019 09:48:18 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id p4sm16005939wrx.97.2019.07.02.09.48.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 09:48:17 -0700 (PDT)
Message-ID: <5d1b8ad1.1c69fb81.5079d.fd73@mx.google.com>
Date:   Tue, 02 Jul 2019 09:48:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190702
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 277 boots: 18 failed,
 257 passed with 2 offline (next-20190702)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 277 boots: 18 failed, 257 passed with 2 offline (next-201=
90702)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190702/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190702/

Tree: next
Branch: master
Git Describe: next-20190702
Git Commit: 4fc74c2c8af7d875523d9fa2dd9a18cbcf5ee5f9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 27 SoC families, 21 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 6 days (last pass: next-2=
0190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 10 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 11 days (last pass: next-=
20190618 - first fail: next-20190620)

arm64:

    defconfig:
        clang-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20190701)
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: next-20190625 - fi=
rst fail: next-20190701)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0190625 - first fail: next-20190626)

Boot Failures Detected:

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            stih410-b2120: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-ifc6410: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-g12a-x96-max: 1 offline lab

---
For more info write to <info@kernelci.org>
