Return-Path: <SRS0=/iKb=U7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC54C5B578
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 00:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB2292173E
	for <linux-next@archiver.kernel.org>; Tue,  2 Jul 2019 00:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="vo7EfOzW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfGBAoW (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 1 Jul 2019 20:44:22 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:41539 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbfGBAoW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jul 2019 20:44:22 -0400
Received: by mail-wr1-f50.google.com with SMTP id c2so15714476wrm.8
        for <linux-next@vger.kernel.org>; Mon, 01 Jul 2019 17:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4Ej7JXv99MfdPqkeb835skLqP2yNinK3oARelKMvvyg=;
        b=vo7EfOzWTIYopzo0q06F8trMuQvaofea6lQDOkNl3LMd2cQlpPizCwzU/O/MJhYR9n
         CWsx0CbRii6LimB9M29x8ggFCrqOSOCTdhSGBQ+XMzdMWXaUEebpwBgkMJgJYfwB5z/O
         IkMBUvXeKb7bV1XgAH+GrulD6T3bVcST8+02gxmiBpD98ZF6qtY3FgyZN9MpC+dtaMcK
         7bE87iVVZUx5a6Dze7EC3ZP4e5RLhSvljXE2V86ecA/+FKcIHfI+X31/9vhOXjDlEX4N
         ej7klQRLCv/wDTrx2K5nIQ1TcCivMMU+CdCrWkMeJATxeAHTTXU1hko4icRvFadmg9oM
         C/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4Ej7JXv99MfdPqkeb835skLqP2yNinK3oARelKMvvyg=;
        b=nUwSXZvqthtultgHa3F5/3yIWgTnCjGiGw5aeD9NfdWPSqlV6jtAmPnrhGvWTn5+9U
         LgWY/s8VupYEA6oYlSz7Fo01NJickDg4f1Q/oOA9QjWnUp0YneV7ZT+5iwxbw76WETbi
         hc88NhNBbEq/It+9rQJgvYbVA1f7XHfyp8CtYB8nS3sbOJxyqBCYbsId1zn4ebDoazdy
         cu/UbmSfZUE9b5OF21IXDqHl1ijiQDJd+DqenuOAAJWLA6ceQtHndAJiK5h9swFDRN9O
         CVanGEB0WUf3R1CEsKxINR0bDYL1smNk+IifIVBnhwRqB7SP/1NwS/dcEF9BbmnyPDxm
         D+rQ==
X-Gm-Message-State: APjAAAXowI922Kd7E2SYW3Std1UBU+2BOp1imp9/Y0jJNGayYmEKE/ee
        C54ZAfvuaW40lYY1gnNOJvSB2BIx2CeW6A==
X-Google-Smtp-Source: APXvYqx6z3cRNI7yeHoQws7/QXojr+Hz+ai7jWQqpvURos1wT3Namm9FlELRGoe00w6RZQ/zOkSZQA==
X-Received: by 2002:adf:dd89:: with SMTP id x9mr15863616wrl.7.1562028260049;
        Mon, 01 Jul 2019 17:44:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v4sm1015056wmg.22.2019.07.01.17.44.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:44:19 -0700 (PDT)
Message-ID: <5d1aa8e3.1c69fb81.27edd.676b@mx.google.com>
Date:   Mon, 01 Jul 2019 17:44:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190701
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 278 boots: 22 failed, 254 passed with 1 offline,
 1 untried/unknown (next-20190701)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 22 failed, 254 passed with 1 offline, 1 untrie=
d/unknown (next-20190701)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190701/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190701/

Tree: next
Branch: master
Git Describe: next-20190701
Git Commit: 48a8a5f9a326d1c1a5505d51fb98086e5003f37e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 27 SoC families, 21 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am57xx-beagle-x15:
              lab-linaro-lkft: new failure (last pass: next-20190628)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 6 days (last pass: next-2=
0190624 - first fail: next-20190625)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am57xx-beagle-x15:
              lab-linaro-lkft: new failure (last pass: next-20190628)
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: next-20190628)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 10 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 11 days (last pass: next-=
20190618 - first fail: next-20190620)

arm64:

    defconfig:
        clang-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190628)
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20190625)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0190625 - first fail: next-20190626)

Boot Failures Detected:

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
