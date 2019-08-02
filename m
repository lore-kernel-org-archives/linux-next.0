Return-Path: <SRS0=XbQ9=V6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AC5C32750
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 12:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D064217F5
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 12:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="XKzjbotU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfHBMD5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Aug 2019 08:03:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37978 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfHBMD4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Aug 2019 08:03:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so44747357wmj.3
        for <linux-next@vger.kernel.org>; Fri, 02 Aug 2019 05:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SluutDbQPRsH8RXFopkHcKos0skclQGdTnnbB0QJZRs=;
        b=XKzjbotURfn75RU+NGn85SMhXrCNtR60ubYAV06DwIbFNLCyFsRiEI4KDbFBd+Ggm9
         T+BdZZzvQshUjR96CxhAYdfnzcsDMDU2l8Ph4VLGyj3U904STUxJoOUuHcJdYNQymXWK
         V1rkFd/vofiOcnO/zyP+7viAG728EVl7cSvV/s3Zd2PiXEio0M5uCnj9nwyHdj20mpkG
         +YHrdd1wF61g7QTfmiHSzrX+xL9A6DUF+omaJJmGncQbb8MBZjH9JopMxUqO7o4uk/Ap
         FQFasncXisNnLGBUJB9S/qHI8qFH/NG+kZx2n9RZqkFE0whpfQgsifmi8aCEBPxE3IDU
         kBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SluutDbQPRsH8RXFopkHcKos0skclQGdTnnbB0QJZRs=;
        b=NtG35ZCnO0lNkBS7Vm2LFCWAfltRzWxQ1TdjLLqStFoJUqBYU5tclpYE9sTxDIlnl1
         1tIu4dnJEq0mitTPafMmRC+VU+exANYxNOqypDmf4IUWe5o24au3+RqCDwawEIljagYw
         8qo05KNf3hbNTccnTYvA6l4yTiZdnLJlVIdeo6HjLZxC8ELgiUvs2F9nGzknQoszc6Qu
         RqNpdC9rjG5/OfbWxrhEUfjHQPaSa8wjYoNzoVtDiE+vXvSFM0N8uc6ZDZ6OmbOpgcmM
         6Kv/c/fI2lDCzKX0jdv6UraTb7ljdKPic5z+cV8hqtE7xsNpXhgsEdPn8ax/QEI4Xz6J
         H2JA==
X-Gm-Message-State: APjAAAVKU+H4RWnhWYhrk4vpetF/k7ckktlPhnWIvzu1f6mim7VU+KyS
        9+NH+j5uuAnNxgDE4m25iy2XjIzOIjU=
X-Google-Smtp-Source: APXvYqxQfzgKy7qAqKHbC8vMCR+mz60cNBECOrHJ1sqj1PROkLZ7ILj0cRjlHYeOESuh5hv07QRMFQ==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr4531839wmj.31.1564747431751;
        Fri, 02 Aug 2019 05:03:51 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z1sm89769288wrv.90.2019.08.02.05.03.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:03:50 -0700 (PDT)
Message-ID: <5d4426a6.1c69fb81.32ef2.804b@mx.google.com>
Date:   Fri, 02 Aug 2019 05:03:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc2-529-g9f8da40a9505
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 214 boots: 4 failed,
 143 passed with 64 offline, 1 untried/unknown,
 2 conflicts (v5.3-rc2-529-g9f8da40a9505)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 214 boots: 4 failed, 143 passed with 64 offline, 1=
 untried/unknown, 2 conflicts (v5.3-rc2-529-g9f8da40a9505)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc2-529-g9f8da40a9505/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc2-529-g9f8da40a9505/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc2-529-g9f8da40a9505
Git Commit: 9f8da40a95053be52a0bd3658ca8ddcafb319a55
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 79 unique boards, 28 SoC families, 22 builds out of 222

Boot Failures Detected:

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

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
