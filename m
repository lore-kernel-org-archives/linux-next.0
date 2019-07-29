Return-Path: <SRS0=Nwgw=V2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4508C7618B
	for <linux-next@archiver.kernel.org>; Mon, 29 Jul 2019 12:40:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A97A4206E0
	for <linux-next@archiver.kernel.org>; Mon, 29 Jul 2019 12:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="uGa843yH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfG2Mkx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 29 Jul 2019 08:40:53 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:35931 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfG2Mkw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jul 2019 08:40:52 -0400
Received: by mail-wr1-f52.google.com with SMTP id n4so61764370wrs.3
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2019 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5eQ1jrR2Rvkuvl3rpSRuQ4QDo8HaGHXTozAl8Ci6LRk=;
        b=uGa843yHU62z4AKilda0ovIPeHzmRNT6nB3S3Dj6ZqJtC3KAzHL7ONG7ny6SIaIUkw
         vgqiutnMAlaFximaWAfQ4oIz5+GAgbNT8J8mgstFS9FyS4aMPp51dL+6ZBSWbJh2aAEd
         S2+9Icj8o51mZLMT521lutWTuW3i6KHRpvhny1nm9OMebvwfyvjmsfV3+NUQhFsjo6Hk
         LHxP9UwwkldqrvxxMmU/gEBP0Y/ctXkwMxdvFpfWWrNcrMG9e8ncGNdoRfiafonDjLOD
         ZrGduhyAi0UzxJZ7NyGb31osTdhhXiZ8k68XWyF0EN+1Vd64fa1I/00e/iYM8d9fvOQw
         B3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5eQ1jrR2Rvkuvl3rpSRuQ4QDo8HaGHXTozAl8Ci6LRk=;
        b=tpKtm8+jYR+Qydl3Q9V4epdP4NhHoKUtwjWdGGFstNqs7ZbmMTSKM00PJjwWtXREWf
         CBAJ+vZLjJm4bd6STvi5TKE+W11X46EFbYcci8VqE8kwDvGpAuV8KxRDjbLw+gu5PhEg
         mbvnKeGkg3EM+JAxofsaZuIgiJbZ9NJ10W4Vbq8oUoR6yUhforT3FXltJNOK5NEfyHl6
         gD7OCHGy1rzldpmcGehZjjZGHbQUSxvXbzDh9bkt/9tAMCCNcGdejg0YM4mBKe2gNJJD
         f0bKF8dE1yVkrlz10h2hjy9bZ4v6plfODYfQEZflUXIpGCF9JLWJ7cIqA7vV0kh7kfIs
         0k3Q==
X-Gm-Message-State: APjAAAWqhMNjcR7IORZeer6qEevNmkmqkuvivK+Gc8OwBLJazcIjVsE1
        Vue+P+0uxa4GcmtoQ003Xhkuif9w
X-Google-Smtp-Source: APXvYqwoL2+8Wrv8PyBzs0RNdT2at7rAU79i+MsZX1Aso3CEEe4/6zbhi5CJnCHp0V43Z1PjqdZcQQ==
X-Received: by 2002:adf:f6d2:: with SMTP id y18mr44866235wrp.102.1564404049838;
        Mon, 29 Jul 2019 05:40:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x20sm140449251wrg.10.2019.07.29.05.40.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 05:40:49 -0700 (PDT)
Message-ID: <5d3ee951.1c69fb81.73dc2.906d@mx.google.com>
Date:   Mon, 29 Jul 2019 05:40:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc2-246-ge69123aa8cf8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 193 boots: 5 failed,
 123 passed with 64 offline, 1 untried/unknown (v5.3-rc2-246-ge69123aa8cf8)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 193 boots: 5 failed, 123 passed with 64 offline, 1=
 untried/unknown (v5.3-rc2-246-ge69123aa8cf8)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc2-246-ge69123aa8cf8/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc2-246-ge69123aa8cf8/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc2-246-ge69123aa8cf8
Git Commit: e69123aa8cf865cf8b4e47afd16fbd5fec7bdc04
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 26 SoC families, 21 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
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
