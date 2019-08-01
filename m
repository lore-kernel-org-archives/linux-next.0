Return-Path: <SRS0=Uj9k=V5=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7727C19759
	for <linux-next@archiver.kernel.org>; Thu,  1 Aug 2019 14:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A069C2080C
	for <linux-next@archiver.kernel.org>; Thu,  1 Aug 2019 14:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="hcn8kOI7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfHAOpQ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Aug 2019 10:45:16 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:33799 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfHAOpQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Aug 2019 10:45:16 -0400
Received: by mail-wr1-f50.google.com with SMTP id 31so73929048wrm.1
        for <linux-next@vger.kernel.org>; Thu, 01 Aug 2019 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HOmLxzx3kIgRjoucKzRGPe+tGp9mCUu3eHsEdz2UICA=;
        b=hcn8kOI7V10PvXC0mdu3cwsFoozL5qVlmZSDnr7NqvAI4h9SwKWEavyii5JRf3HFM7
         sqFbaeMw1/NW52xnbiNR0cBGUYHgKedFTzeH8Gq8FpP4v3LgPBpPILwYmXryIFrPhQqX
         UYZn3eCRUh6eiQ29O2p5sZ1IJQE+yTMSmyaucbbmXfc0cEma/E4o14hsUetrf5o/FkZ/
         ZmLK97fbNmI+PZAI+7G0e8NISMWh7q/ZQQWbNg+UbiePZe3PPbnROAllYO77yJHjc6Ad
         /lL7slmcuCoTH+3MLigNfhd4S0R+AwgdkT45DZKss+URV2HimJG7CTh1FeIFKEedMHx1
         sOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HOmLxzx3kIgRjoucKzRGPe+tGp9mCUu3eHsEdz2UICA=;
        b=OvdnT0KZrNvMS0TgJKj9nzn3nBKR9hLVFF3KKtLMQznrb5L9TYwqV1L8H9KVv2eTBW
         zippc4HTIcnYw4nnuMd3pJFEv8NxC62pbWMbC+PZNFEvwgTAjX58eA7paZ+hw4Oi6Nz3
         GCU9naijzRVVONr5tRDzdjX8/NMbQo4FXpCFCrNyDw32OU3MuKjvAYa6Aa/4KdSlZFs6
         +xL7Nb77X7RUa+4KIt0ly0eR+4g4s0wE3iUVpZfmZS8fwOt4e2c5aAL/jHFX9hh5HOL3
         4q/Kz1qoxx9zngMyRwuRJIh3Kge21aqrBbAXfkPXoquGlPWLa993Jm9ub27m1813uB1d
         R2lQ==
X-Gm-Message-State: APjAAAW6PUa+e4rekp5U4MX2WmsVitIVwIexc9Itj8HdumLNozIE0Iw9
        u4M9jGeTz7YmVf7T0rHPE12BFsDIBOQ=
X-Google-Smtp-Source: APXvYqw2vkYGAuVI51d931PSidnfnHq7OeAc84anWV8/too27BB0JeLURW45vOwnRdGT4gOG+68PZw==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr56733266wrn.244.1564670713449;
        Thu, 01 Aug 2019 07:45:13 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o6sm150171152wra.27.2019.08.01.07.45.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 07:45:12 -0700 (PDT)
Message-ID: <5d42faf8.1c69fb81.409b9.851d@mx.google.com>
Date:   Thu, 01 Aug 2019 07:45:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc2-480-ga3c1b42417fd
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 209 boots: 6 failed,
 137 passed with 64 offline, 2 untried/unknown (v5.3-rc2-480-ga3c1b42417fd)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 209 boots: 6 failed, 137 passed with 64 offline, 2=
 untried/unknown (v5.3-rc2-480-ga3c1b42417fd)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc2-480-ga3c1b42417fd/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc2-480-ga3c1b42417fd/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc2-480-ga3c1b42417fd
Git Commit: a3c1b42417fde4258605188a616c8e1eb6f18672
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 27 SoC families, 22 builds out of 222

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
