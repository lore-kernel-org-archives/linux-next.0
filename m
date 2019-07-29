Return-Path: <SRS0=Nwgw=V2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DCBC433FF
	for <linux-next@archiver.kernel.org>; Mon, 29 Jul 2019 12:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 244FE214AE
	for <linux-next@archiver.kernel.org>; Mon, 29 Jul 2019 12:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="QCzkep66"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfG2MwU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 29 Jul 2019 08:52:20 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44290 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfG2MwT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jul 2019 08:52:19 -0400
Received: by mail-wr1-f50.google.com with SMTP id p17so61702952wrf.11
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2019 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HC5OC1Vpc4uRh0RFxplO8Ct+EsDz3fmkXwirEFu5T7U=;
        b=QCzkep66M/2QWRqKnUu9DavOvco8yZeRCBrAtgtbzGqNFibfGzXBosSKOiOStvCbZn
         h7xWlxyTkYH5BtAjM5A76J1SljlX/MAtyrrxPvTYISGcNeA9BzFsWocjB10mjuMi38nt
         KF47y6pEnGTErpHl8S/TdLr9qEAVkXx2S/cMRFJch2GUZv89th1oRuU/27liCc5zGI6u
         oSjdAg+aVdBacREJsSGaOxH4djzcNQffL2AeIz94AO+yBdMQ6f1ciWLmZ5NJW1tjZUnc
         +vUsPiEsa0s0lQxdUc/a3Szclk4nOC1dGb+x+cql3C8zpCJXch+rDLuUbhO598QbCrHM
         0/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HC5OC1Vpc4uRh0RFxplO8Ct+EsDz3fmkXwirEFu5T7U=;
        b=OC0WNxiTx8RW75sDaAczlGlVcCU5ZWyVel1yXB34PMBFHNxCRwEKHOXORrA0QE+AkZ
         fePaasb8aCtWCNdUx4pHxyKFqnJfLN4lTalg9yf1qwgK2s5PpuRSMEcpxG9TQM9w4nz9
         a57YXhpy1/Bl5qWJkETAxV0cf4doYsJgJGRXzTKwr+iZurKP+RGUBZTRC5wq1GdsRRlP
         7aaw7vYMmQenAx/xgqfyPUszQWsj7gnGrxDHDETiLwY04xEzIIl7/5z3QTqKYjpEcmhU
         iO9vnGKFeB678PPefHjW409PGlCj0NvFHM9MWbcGLY8HXe1am3tiwKUdti8O+TaXigd2
         a/aQ==
X-Gm-Message-State: APjAAAVIgAkkivsmvIUxB2O/K8pYoEeBwbLHHrzf+mmxwoxxKwFOiuOi
        9zTY/gkrTZ75TiaUtnLt/Qp/yVFw
X-Google-Smtp-Source: APXvYqwLw2jcH5Gg1dytOOj9NSe/IyJhGMwfhiNt2d0HZT4EWERIpfM+D5Ks/aawPZAIeIWV3eWwSg==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr45621167wrn.94.1564404736643;
        Mon, 29 Jul 2019 05:52:16 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g8sm59541982wmf.17.2019.07.29.05.52.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 05:52:15 -0700 (PDT)
Message-ID: <5d3eebff.1c69fb81.5c064.b962@mx.google.com>
Date:   Mon, 29 Jul 2019 05:52:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190729
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 193 boots: 4 failed, 124 passed with 64 offline,
 1 conflict (next-20190729)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 193 boots: 4 failed, 124 passed with 64 offline, 1 confli=
ct (next-20190729)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190729/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190729/

Tree: next
Branch: master
Git Describe: next-20190729
Git Commit: 0d8b3265d9a6376b416b3ba86f758a5c6a85a6df
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 73 unique boards, 25 SoC families, 20 builds out of 229

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
