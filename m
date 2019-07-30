Return-Path: <SRS0=AjV7=V3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345B0C0650F
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 12:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F173B2087F
	for <linux-next@archiver.kernel.org>; Tue, 30 Jul 2019 12:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="HWAKOiLU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfG3MSA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 30 Jul 2019 08:18:00 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:52344 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfG3MSA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2019 08:18:00 -0400
Received: by mail-wm1-f48.google.com with SMTP id s3so56922808wms.2
        for <linux-next@vger.kernel.org>; Tue, 30 Jul 2019 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SLv+9zu2bGltRU6XGRS4pVGSfdyiQk+2Mic+9K3sdjg=;
        b=HWAKOiLU7BRlPCLMyI91TRPo71cNI8Wyj5WVTRkCZcJ9OB+Jg9U5T/EmZXrFtweBn/
         hu0PffmGiJ+WYoS6IjDdbTA3ZGkTWBilEC1WdtkcJlHevvE7UEKXU6Xh/IlYuhcyWPaQ
         NyYiB+XHCvucVGUwVxiOXmaQCf0u4VSYVR0R4K5BJHfwTuxFH4DakXug75/bG1K4UOdP
         iLYOxas5CjR0H/jtGxUrlDxy5V2yy2nQG+Kq7MhqutCltzbRzG8eCqgOF2a8SapYQeZi
         6fjLX+kAB8Zii1Movzm8l+52PE+HbNzB4GryYI3aeyCEj7AN+iESN3K7VYTumOZmUNll
         FQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SLv+9zu2bGltRU6XGRS4pVGSfdyiQk+2Mic+9K3sdjg=;
        b=TxjnKMM3E4yR2HgEIGQvdTK6g1xvxJwUzohBGoj0E/XmbXVKOhkleU41V6V5++07c+
         pVUws49/7lMP2+ZuKi+dvGnZW6kHW/2GjVJBCqxqyO3OCz3tyZ3NjRR4N9PNJSw/VW6A
         8qVUofADRujyOh7s65Q9pKpNLb9unp0uFG/d3PMaehKA+RMDcA93EWfXHYMMi0N5fGnP
         wxG+TXwOe+AodVvGNj9wZau7auHwQMDhikAcyat8Ms1jK9/U2Lna4LO5SE2UJ1SWFhmY
         oymdtOoRQT8B8Ruu8cAJl/jOBO6qHAI3iiW5rMTdt/hZUFpYuIxlQ8nKFF9w2r9MWaE0
         oLEw==
X-Gm-Message-State: APjAAAVRDqXAk8UdWf3eC0//Ist8d4z3hNcVhrEP2qlwgi0hzhZc1n+u
        QNgtihSiIxt09baV4LgqAXeN4aoAm3o=
X-Google-Smtp-Source: APXvYqyzBAij45zKNzpSZF906Oa2vWcQYs0UK0mGj5e7fkFLgM2JUqSFrK+q8sOD5AlQHhvhvWXkcw==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr5279883wmk.101.1564489077304;
        Tue, 30 Jul 2019 05:17:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e6sm62682993wrw.23.2019.07.30.05.17.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 05:17:56 -0700 (PDT)
Message-ID: <5d403574.1c69fb81.02bd.9b21@mx.google.com>
Date:   Tue, 30 Jul 2019 05:17:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190730
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 265 boots: 17 failed,
 184 passed with 64 offline (next-20190730)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 265 boots: 17 failed, 184 passed with 64 offline (next-20=
190730)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190730/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190730/

Tree: next
Branch: master
Git Describe: next-20190730
Git Commit: 70f4b4ac1655dffd33cb38f369b31bdecc588daa
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 28 SoC families, 22 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            qcom-qdf2400: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            qcom-qdf2400: 1 failed lab

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
