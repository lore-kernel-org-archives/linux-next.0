Return-Path: <SRS0=jfJ0=WB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD46C0650F
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 13:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB7B82067D
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 13:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="sdcFd0hs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbfHENM1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Aug 2019 09:12:27 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:39973 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfHENKZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Aug 2019 09:10:25 -0400
Received: by mail-wr1-f45.google.com with SMTP id r1so84319200wrl.7
        for <linux-next@vger.kernel.org>; Mon, 05 Aug 2019 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QENKcouiSMFsLCg/djMML3RVpGaqbvV4iBXVW0vdfrM=;
        b=sdcFd0hs1Bqqx3JFql+nLijLeslNnvFj8+oaaKPDYE1Jibe6yhE2XsrE929zpiasoG
         pCdi/gR660npfso0vEXPdLHUENCy2ZKjGIwlYNAb6qxCWGfckJtbpY9GX1r2ncVBZ071
         LwSZLK4mBmSM6Q9Q9p8ZeWnLIiSrBAY4Ll+JK7g8ifY0bTC90isJXVNlNKarddKraRk2
         npwzOlooAuaRO0VrD/NoCItxlOj3+GWU7ePrVZv77iT87G5bFjMaHVmhGCm4ifO3NbS/
         ESvl+VdI9+92rr2CsY1oxE79l8tx39Vg/yKPPHJ6I+aj9mI8uoSxgJ728IhmBoMbuwp4
         NYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QENKcouiSMFsLCg/djMML3RVpGaqbvV4iBXVW0vdfrM=;
        b=X2xSe9yfire/PVD3tnjMNy5gJATjfFEIUtdU7hgQh3x5ifiwItgNvK4SW+nppN2JgN
         WDYZop1T7SmFhQExu+QL0i/teDo85UU8oR2lGaicj0rlV0cOroBAFbGPjVmCeP0lZl+M
         AKS7lCVTUSbDIRbPZYodoUGVBDMtP1++jHiPubHTpiBCNtX2/F4ujakwd11FfPRGrcvr
         LXJCfyNUpSeMvIlx8gp4xnWpv8e4jyxMfNnCb0zfHJuzpPqp+ASUg+XcwY7viU/ZEHkm
         Sgkh+qm/B3SO6h4/MEeK5YKOyJdesJ2Z3ac7OCHkGGhS+ZSlmJEtT8lTjkLHlOjmqHvB
         hrpg==
X-Gm-Message-State: APjAAAV0BZ986jW5o5D355ypS15jMRNgmOn2VF4VyofprG1urwtLvnYj
        bseNmcJHJb3Yy7FCrkLDsye0A74aKrU=
X-Google-Smtp-Source: APXvYqyqI+rdvcJxOYCjZMlx79NWCFlFQqmxYMErWFxfwrKGCCE5ykwPvFNfKjAG5jV85NT2GxH0tQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr61815115wrm.25.1565010623780;
        Mon, 05 Aug 2019 06:10:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h16sm97983352wrv.88.2019.08.05.06.10.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 06:10:17 -0700 (PDT)
Message-ID: <5d482ab9.1c69fb81.12b6b.dab2@mx.google.com>
Date:   Mon, 05 Aug 2019 06:10:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190805
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 256 boots: 6 failed, 177 passed with 72 offline,
 1 conflict (next-20190805)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 256 boots: 6 failed, 177 passed with 72 offline, 1 confli=
ct (next-20190805)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190805/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190805/

Tree: next
Branch: master
Git Describe: next-20190805
Git Commit: b1645c0cbd486ccebf76e0c3d4d2439f846316b0
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 28 SoC families, 22 builds out of 230

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20190802)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: next-20190802)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20190802)

    tegra_defconfig:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20190802)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab

arm:
    tegra_defconfig:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

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
            apq8016-sbc: 1 offline lab
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
            apq8016-sbc: 1 offline lab
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
            apq8016-sbc: 1 offline lab
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
            bcm4708-smartrg-sr400ac: 1 offline lab
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
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            stih410-b2120: 1 offline lab
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
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
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
