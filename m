Return-Path: <SRS0=W9k0=V4=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F210EC32751
	for <linux-next@archiver.kernel.org>; Wed, 31 Jul 2019 15:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC60D206B8
	for <linux-next@archiver.kernel.org>; Wed, 31 Jul 2019 15:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="UhJ2WzW0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388394AbfGaPDv (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 31 Jul 2019 11:03:51 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:37871 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388393AbfGaPDu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Jul 2019 11:03:50 -0400
Received: by mail-wm1-f53.google.com with SMTP id f17so60128509wme.2
        for <linux-next@vger.kernel.org>; Wed, 31 Jul 2019 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lSCkL3EcRqLZ4H3E7LDUDZY8qGyDmwxWto29+atKk9Y=;
        b=UhJ2WzW0fz6/EHkLpYL6v77Tkv6BIBg8Zd/zObMMyZ8FeVGLGVU9M873jnjjEc6Xuw
         m2kd2NS+11KvpndxFnGc58zqarR9x7nKY36shge0wkR+xjGG8ZlXZwzxh+nA5RWtAuS+
         XASTJpSqLQtvrlLM8hZbLZ3HeKpzqUuH0hLQhFMRUTvLqMo/+25tR2CHXimvcnM4momw
         OLLmB2aEjVrffAsqDTUfDDk+TSpnpxtimBDuLsnUYnhxbCi0Nz9868QJPungXMOELsaO
         uP3+sdc7Mg0fcosepaXhcWHQgL16reMH9Z6M/vV1SSJPFwAQ1WNWRY/GUJrfVhqYIBBo
         SR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lSCkL3EcRqLZ4H3E7LDUDZY8qGyDmwxWto29+atKk9Y=;
        b=tSul7UkkQbFnaMFvBpjadRcyhZEjAuTvCtGbwIhg0wXFwUF37sd96vmqf8UIr11O3T
         DSbB2W/Fx2LVUZJBNbrOBGJIcf/B1yOEAuAqPVBm1P4BhIer4TUxxsB07LuAfd/MB2sL
         0HSBlh8Bfq7U1sxALWGkPDiwl6v2SSNnr4vVJJtptAdiXvldllt/bwcKIIPuH1Xj4C0n
         96AdCv1U5+U4vPdcMR9E6NJ8PHgy2JEhOWS/oECL0EjH2jUiIhVg/VViw7y5Yx505Wv4
         LbPumGzh/xdHUpKDfgR0q6fenRR53gqHdM+qYv9MLChMEheOnloOaGpFRcxceO7EtYHb
         VmiA==
X-Gm-Message-State: APjAAAVBgWD3mugs37rrUiCiGppWEIBu3iJLCEoqKc7wHXrrVXJ49z8T
        7FhvSiufC2AS+Ii6HrF3GJQRxQWjnhU=
X-Google-Smtp-Source: APXvYqxwgzWhJZbqMZtgNh7r9JBwNOWYBXZhL9sGKY23PahYEnbEMFLjsFlj1kTuoFgBNJVcMZCK1w==
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr111623407wme.29.1564585427913;
        Wed, 31 Jul 2019 08:03:47 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o6sm141984651wra.27.2019.07.31.08.03.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:03:47 -0700 (PDT)
Message-ID: <5d41add3.1c69fb81.409b9.0d94@mx.google.com>
Date:   Wed, 31 Jul 2019 08:03:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc2-408-gf683e02ddcfb
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 201 boots: 5 failed,
 139 passed with 56 offline, 1 untried/unknown (v5.3-rc2-408-gf683e02ddcfb)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 201 boots: 5 failed, 139 passed with 56 offline, 1=
 untried/unknown (v5.3-rc2-408-gf683e02ddcfb)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc2-408-gf683e02ddcfb/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc2-408-gf683e02ddcfb/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc2-408-gf683e02ddcfb
Git Commit: f683e02ddcfb3bdb3b4d8fa844af0b55c58c5e92
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 28 SoC families, 20 builds out of 217

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

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
