Return-Path: <SRS0=jfJ0=WB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF0AC433FF
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 13:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4558C206C1
	for <linux-next@archiver.kernel.org>; Mon,  5 Aug 2019 13:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="hXXae1Nb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfHENAk (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Aug 2019 09:00:40 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43067 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfHENAk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Aug 2019 09:00:40 -0400
Received: by mail-wr1-f53.google.com with SMTP id p13so9762898wru.10
        for <linux-next@vger.kernel.org>; Mon, 05 Aug 2019 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IgT5OCWCi/yjogpb35xTH8NMRSqx6V0R65hQd1m1kgk=;
        b=hXXae1Nbb2ltNRdOoFRoMCcyMOfjSEZeirhvcmF2Rm28X5e0V9qUaJq9tPywDUm/Bn
         trUyQ9h6NwPB03m5zHKIFEAu88huceykNLtSgwEnZ0Z9hcjeYlZQy903uHR8FB7pX4hm
         aQf05559syTMVq5QSe3cInoZFpPYHjLPUSMo3pP5peKRhamUKqAUxz+sGPCRchdK8kgz
         Yf+MTtZ2MZpuVjxDPAYtyYthCgVubbqrtb/BUaQjJwxHbxpckAuagtOJNPlP01zqJtJ4
         EqemXR+KAW/5DQC3XBKIm3QvIWXqKx2ITmwx48ATp+l0HO1H+qO9E6id1vmU7xEgjDVK
         dquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IgT5OCWCi/yjogpb35xTH8NMRSqx6V0R65hQd1m1kgk=;
        b=ZkMEkfqn4vGyvSwOcULnXp1wJLRoJhtDbWy+8x2aTvjLzntii8j6GWKlnvKsi6o8Sx
         AXtHWV/PaZlq9sUk0yagGIvVygDYePR6EZj8ovMWgWJG+jNHuBZsVKEIcmqEmQG41qzF
         /N9E/phSSB24zLYYo38Quj3v6cqsffTlsAXN9tLsF66wEOAB1FOO7EO2vBZVU673m0El
         WwUjsGBOVAhaYLIuQfMT/tb6Han3bLgV/axCYUl+YtC4uYdyAz3WpNlUmzDaV68+VNJx
         cAgNs43NSLJj4/iSh9KOqjQsw4zK3B84yllzqN+x2ksuEh/Wi4uwfQnbg3rb3mdfVAMU
         QpbQ==
X-Gm-Message-State: APjAAAWkZ12Vvjf6KDrg78IMwdOOwCmLE7muiBxrTN3+rFUZIIzf1rID
        kt5JdAX/g6WVKggKJHaHDa6auiypglU=
X-Google-Smtp-Source: APXvYqyHtpRlu05llzkYAWo27mdQcRNoE1yoihxjKgFqxJ40iTgy1EdiwWFJvl0P4DyEKfBdIj9O8A==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr107529323wrt.278.1565010038037;
        Mon, 05 Aug 2019 06:00:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o26sm179242565wro.53.2019.08.05.06.00.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 06:00:37 -0700 (PDT)
Message-ID: <5d482875.1c69fb81.59e8f.f625@mx.google.com>
Date:   Mon, 05 Aug 2019 06:00:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.3-rc2-691-g40030595ebaa
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 218 boots: 3 failed,
 143 passed with 72 offline (v5.3-rc2-691-g40030595ebaa)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 218 boots: 3 failed, 143 passed with 72 offline (v=
5.3-rc2-691-g40030595ebaa)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc2-691-g40030595ebaa/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc2-691-g40030595ebaa/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc2-691-g40030595ebaa
Git Commit: 40030595ebaa57a52740137a1b1cc159fce3cb96
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 28 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc2-529-g9=
f8da40a9505)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc2-529-g9=
f8da40a9505)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: v5.3-rc2-529-g9=
f8da40a9505)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

arm:
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

---
For more info write to <info@kernelci.org>
