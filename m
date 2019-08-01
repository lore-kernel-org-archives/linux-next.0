Return-Path: <SRS0=Uj9k=V5=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB135C433FF
	for <linux-next@archiver.kernel.org>; Thu,  1 Aug 2019 14:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAE0F206B8
	for <linux-next@archiver.kernel.org>; Thu,  1 Aug 2019 14:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="pq466Wpj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731238AbfHAOeO (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Aug 2019 10:34:14 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:44491 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731205AbfHAOeO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Aug 2019 10:34:14 -0400
Received: by mail-wr1-f54.google.com with SMTP id p17so73833855wrf.11
        for <linux-next@vger.kernel.org>; Thu, 01 Aug 2019 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=e8lfN4TIqX0OcBBXvNa4PDj8PTPJFV1iq5FsMbpQOhE=;
        b=pq466WpjgWH4OC4dP8FtI7Y7juB4evtUjWyiXsRFW7ypW/vkl01mMwSxmTUCGzlPrL
         2a/lDt9oysXe0onEuVV5gjAmv2HK+MommOBmdv96CL/bSgeSnV3eaK8aSOVcq4drCOUv
         i8HwB+q354le9SP7cZqMDAwER/pAGCylCafM2Fx44kMHhP6okS3dPHlivBPC/uWqp9KJ
         h7MJC5LyTaZr1uhdTisJPeT06V4arLV25hCkqrHtTL6fq1GY9AJfkZ3iA4xF7VXlMtUG
         K98vrfxzAe1VrJh0GFgCzQ/Hkzo/GFpwQiecHKaf/cdJWHNuaShAEkpJ2lf1AFl34lmW
         MIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=e8lfN4TIqX0OcBBXvNa4PDj8PTPJFV1iq5FsMbpQOhE=;
        b=LCt6AYlyi5bsXaw+sQFb6eKtet5/551OLylkKDNnYzbvqhXAPRmhfSD0JijQhMcD6p
         nhoBiLsBFXw0T/LAiyPZqblkT9Jaiztaqjeyp74MQnkgcGW1NWBcTOtbePNJxQwp4yfN
         00+8bklzPo+bkzzqFbjS2RLe/vaXZrk/7Fhxno1vc5cFw1LmkXrNkrzpJ8NglRM828Sz
         N5nKjnHo+/LPnzKTPrFFQjRtzFn9tbiHL2lF4rKZ9MsWgEk4CuWBbQCAuap6sjJWItHB
         sSFsOY7nsDkXW4G3iBhoAoBku+iDv+zBfNQYC7MvZhxYr/HnJ+KuJQauZBZyy3+jf1sX
         ceXw==
X-Gm-Message-State: APjAAAVwsAb8hfHHod99c2/enIHGiFJRd8i6piPNprmmAUililoWWvB4
        vCsJK+xFH7Rgzii9M9l+NovFrT64QkA=
X-Google-Smtp-Source: APXvYqyEj/fVImG79UvWQrZxVSNJMufWiTQzS0dBkxv77wRfysFu9Dus8xQ0nxzFC0MLLeHy+V/EPw==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr5743708wrw.345.1564670050892;
        Thu, 01 Aug 2019 07:34:10 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r11sm113545051wre.14.2019.08.01.07.34.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 07:34:10 -0700 (PDT)
Message-ID: <5d42f862.1c69fb81.7b0a2.13c6@mx.google.com>
Date:   Thu, 01 Aug 2019 07:34:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190801
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 264 boots: 12 failed, 182 passed with 64 offline,
 6 untried/unknown (next-20190801)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 264 boots: 12 failed, 182 passed with 64 offline, 6 untri=
ed/unknown (next-20190801)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190801/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190801/

Tree: next
Branch: master
Git Describe: next-20190801
Git Commit: 882e8691130bd75fd0ab540896db26e25eedf476
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 28 SoC families, 22 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12a-u200: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905d-p230: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxl-s905x-p212: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            rk3399-firefly: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12a-u200: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905d-p230: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxl-s905x-p212: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12a-u200: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905d-p230: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxl-s905x-p212: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            rk3399-firefly: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm:

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            bcm72521-bcm97252sffe: 1 offline lab
            bcm7445-bcm97445c: 1 offline lab
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            imx7s-warp: 1 offline lab
            meson8b-odroidc1: 1 offline lab
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            stih410-b2120: 1 offline lab
            sun4i-a10-cubieboard: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-ifc6410: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            imx7s-warp: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun4i-a10-cubieboard: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
