Return-Path: <SRS0=XbQ9=V6=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE1CC32750
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 12:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8F7021841
	for <linux-next@archiver.kernel.org>; Fri,  2 Aug 2019 12:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="vE/FiuIf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388834AbfHBMNf (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Aug 2019 08:13:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33284 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389119AbfHBMNf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Aug 2019 08:13:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so77049034wru.0
        for <linux-next@vger.kernel.org>; Fri, 02 Aug 2019 05:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nWckPHSirOqlDTAGCTdb3h/5YBLxWPzDoCpYMTF8cfY=;
        b=vE/FiuIfiCHqHXsVsTqWaZ4hsWlBqn9OfzMC52IoXjzwiLqxqYvj7x1Qm0YF28TOpr
         2QKWfRYl2Y3wJ/g9FL0zz8ui/GZs3wMc+xvTIfS+OXV0zv1G57jbImnpZziZzYNX8VIW
         EX/f7YUwg9BQJsZRfAjJqeeU+HdCwfxNFyWGvS3gPbw529uKXDQSaMBk8J8sATep0w+w
         sF2n2B/6CyE2lANODANWi8jYx0WfoO8gGUM6mTnFJWiGFkTT6MRVUY2ANdhCzk8f7qa/
         hr5r7QnIfWgbzN7Bkfh0b5QY1UmssQrQzmZeChgxG+KvLJV2Ai1upYgNmjmfHg0kU2Lr
         OILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nWckPHSirOqlDTAGCTdb3h/5YBLxWPzDoCpYMTF8cfY=;
        b=KvzlYm9eTJ6oLM6CfNjO7Ws8RTUUL/hUkz1okGTXm7miRdkUVe/5ikFgdfRxKkvDLy
         4yn3G5mpYn+iZCUinwjp9dWyIpVb7uUwzayc8TN8Rv8yJnaoRV7WnWKvXgrtNX9jTRp4
         NLNQlB3dUH/SkajzRCvsPjZFThDQ6jyaYg7+8ihWppHjEziW/TJPxJF6vkXp6XgoVFgG
         avwJ3p/6EpFRIkuajNwgekM2Mmudc1rcLopAYvbCE5+3xCovKyF8IrOUdGhuUc0cDKVt
         CSffEJsXkvZSMBpIWhSk6y1nU/iPF++RnY1qNBBkWbrPQ4yJtxgDgo5+kw1NxCNHtzRz
         kKZg==
X-Gm-Message-State: APjAAAX5Qr/Yd5/7dsN0BqW+C8sNo5VIrGLfW+1hTURxH/17ZJMrbUAX
        FQxrt/xRYbMAS9Gxcpsgl3hnsDmse6o=
X-Google-Smtp-Source: APXvYqyfzWcEabrvdqezTJun9QSeDwYGEcWsZQ5WcLBDnmuA27E31ThFm7MHzrk0j4OPKMxBDoPcHA==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr30185085wrl.134.1564748011710;
        Fri, 02 Aug 2019 05:13:31 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x8sm63368527wmc.5.2019.08.02.05.13.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:13:30 -0700 (PDT)
Message-ID: <5d4428ea.1c69fb81.cbcb1.7251@mx.google.com>
Date:   Fri, 02 Aug 2019 05:13:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190802
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 263 boots: 11 failed, 186 passed with 64 offline,
 1 untried/unknown, 1 conflict (next-20190802)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 263 boots: 11 failed, 186 passed with 64 offline, 1 untri=
ed/unknown, 1 conflict (next-20190802)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190802/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190802/

Tree: next
Branch: master
Git Describe: next-20190802
Git Commit: 7b4980e0bcf46f797e8ba6ca38e15418df253647
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 80 unique boards, 28 SoC families, 22 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
