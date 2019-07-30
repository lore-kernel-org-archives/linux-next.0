Return-Path: <SRS0=AjV7=V3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE994C0650F
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 12:03:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8645C208E3
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 12:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="mSaifvDH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfG3MDu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Jul 2019 08:03:50 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43839 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbfG3MDt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2019 08:03:49 -0400
Received: by mail-wr1-f53.google.com with SMTP id p13so65455749wru.10
        for <linux-next@vger.kernel.org>; Tue, 30 Jul 2019 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Pfg3FbFTREO0kem5ea1ldk5/6KVoTQTUhtVbuvENr5w=;
        b=mSaifvDH8u+3VGqatU6B0tseLnboM2Xn0kafCmkH99jc795/Nt7hpVXRiQ2KigsJq+
         YfQY0b2n+vHDOZCQg2FfqXBCuZjzJc6sW5lj/OD28CuNc3QJY5yiyGLuE8d3LCqQ9Be0
         wdnSVjSuEhWBZvAI2HfU7LKLkrcqoUxOTGKFOeoxdvaIDwNhyArTOD4kZT/OjsNjYF2r
         1cXz1LECFTfCO49D8BGOdOwnIxxfuXL+0ZRF/X48ccPtnQj0LBjwL4tfOV5JpZ5nFYVt
         QplJPGHJ43vXtJw7HkzgFUP6JJPtV6pIMnTeSld8MsqY29nD6wmLuF/U4ovtIvQAeeVp
         Is8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Pfg3FbFTREO0kem5ea1ldk5/6KVoTQTUhtVbuvENr5w=;
        b=a14R+ogUpD33arJi1pJ/ZjDRBVd4AwMyr5cFXX+sUfIZJYZIg1BaYQStkLdkW7H8C7
         PgRYFbKUBjQNFBB6nZY4WPNoAGaahWGVI7tb4nnzUl8mOx1mKU37mCZ5zx0Rvv4Nh1+7
         Nzng85Qj4ph955ae45fdwPHXZ1r42Rb8Kbznyf4dFoYxIQ4ptLXSQuZK9YyE83kB1aXe
         2w1InU+pxW74HEz+teYbqPKVVqD04Oz6r8tYAB/CiZPlqY6B9MEd/yer548EEc14U8Vv
         g+xvks0Ih54Ez8RM9alEYuFpx8HelbiC1yFpgpSX73+Dx2DI/QVgBlRNnTKrYQpx5WQU
         bucg==
X-Gm-Message-State: APjAAAXmiPQYLM3tXaK7ZAyJGz+s4PdAmJhWSswo4WajUsphmw2OYLT4
        /utTW6YMtEOYG0zFdI7fkJ2gVelf8/4=
X-Google-Smtp-Source: APXvYqxPB3HG4A3YuR1Y6+wGpZ1Uo50g2XWfdiwGXdLhFspCAH/QQAKuLn8IUSbfQ5qvAObp1Uv+kA==
X-Received: by 2002:adf:f450:: with SMTP id f16mr95267283wrp.335.1564488227327;
        Tue, 30 Jul 2019 05:03:47 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v16sm49193617wrn.28.2019.07.30.05.03.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 05:03:46 -0700 (PDT)
Message-ID: <5d403222.1c69fb81.19d4e.c134@mx.google.com>
Date:   Tue, 30 Jul 2019 05:03:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc2-311-gc89ef2371cc7
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 216 boots: 5 failed,
 147 passed with 64 offline (v5.3-rc2-311-gc89ef2371cc7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 216 boots: 5 failed, 147 passed with 64 offline (v=
5.3-rc2-311-gc89ef2371cc7)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc2-311-gc89ef2371cc7/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc2-311-gc89ef2371cc7/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc2-311-gc89ef2371cc7
Git Commit: c89ef2371cc7a1f5bd816e91b8e5f6b573fa8e98
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 28 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

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

---
For more info write to <info@kernelci.org>
