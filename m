Return-Path: <SRS0=W9k0=V4=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D36BC433FF
	for <linux-next@archiver.kernel.org>; Wed, 31 Jul 2019 14:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26E522089E
	for <linux-next@archiver.kernel.org>; Wed, 31 Jul 2019 14:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="LeLM4E13"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbfGaOha (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 31 Jul 2019 10:37:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51011 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbfGaOha (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Jul 2019 10:37:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so61108094wml.0
        for <linux-next@vger.kernel.org>; Wed, 31 Jul 2019 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0MsRppYRm8PvnSUkB8nfvQduamjZQVI86G7V5GbgoNc=;
        b=LeLM4E13jm6LVhBYxa7E/0zgVMNwSCrlxF+arHvx0hmMkSq1oqAu0nFV/L92xWLmvc
         AEsWCS1D60wvbLRufykYVK4SvFRn5ZaBQ+EMU36flQcMikqqfbNsJEwUHM74WVU826XA
         U6QNKt1TCfTVJunKP5ltbKGoyw5HBFj8+XlyDikEVL37eLarEgpjXG6OqzFOnnxn5olK
         UMJvK/IXyx0hpBD6zpd8jR9BRXLOFAzvzga0jF8jeaE/NuwSNQS1vZ2qjaBsqNDPaAKL
         8AvuBmXLjjDQez5/sbi69zccMrJwdbKLTKnP9LExDiRqBCyGNB+q7eUrKA6O0QifrkxH
         aerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0MsRppYRm8PvnSUkB8nfvQduamjZQVI86G7V5GbgoNc=;
        b=XhT9UQXz2JBjl+rDaFcERH0h2qZ65zByfrKbG30Ox72mVUdLuyBAvQM/uBFf7Pd2QF
         V7kdZnMpXYBgXlISQR25OAVOg83zvCpGj6s1P8pFrYMExSfyiJqapca+ya+VRd33m8h5
         dUzyxUe5sffuuBrOvrhSOaKF4tQHJx0k9qF5+U9CYl9AgPiHwl8ReffDgwhy+lmC6ejr
         1VKLcF7RUhfTeUgitGJrIoetHBq1kEOhen6WViKFkR3P9djvop6PqkVJTOG8ortbY+qQ
         uI3DSqbeEWksAcP+IaRT++W2SvxWP3vaidmYPXoY/H6bvekWK36OmO9qrghFreAJ0bP1
         K4PA==
X-Gm-Message-State: APjAAAUHUVLJjqMITOGqBDr0GaUSDjsm/be/vUE+ucnHRzVJmKXUgWx9
        SkjTN69ddiB/Sm6051Hu+MnAV+tpSrE=
X-Google-Smtp-Source: APXvYqzZFwLUbfJcEnbZbAGT1zV57YW9h9yhIbVmQk04aT+D+8FTRtrjLvF7V4kfL8f1/40SqSBmEw==
X-Received: by 2002:a1c:305:: with SMTP id 5mr82031188wmd.101.1564583847173;
        Wed, 31 Jul 2019 07:37:27 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x6sm71506855wrt.63.2019.07.31.07.37.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 07:37:26 -0700 (PDT)
Message-ID: <5d41a7a6.1c69fb81.2f7f9.9daa@mx.google.com>
Date:   Wed, 31 Jul 2019 07:37:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190731
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 258 boots: 15 failed, 181 passed with 61 offline,
 1 untried/unknown (next-20190731)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 258 boots: 15 failed, 181 passed with 61 offline, 1 untri=
ed/unknown (next-20190731)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190731/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190731/

Tree: next
Branch: master
Git Describe: next-20190731
Git Commit: ce96e791d6a7e11078f279273213c5c2e906f401
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 20 builds out of 221

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcom-qdf2400: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            qcom-qdf2400: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

Offline Platforms:

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
