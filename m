Return-Path: <SRS0=26vq=UG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F7CC2BCA1
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 13:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B7B520840
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 13:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="R6e89J7z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbfFGNFY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 Jun 2019 09:05:24 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:38433 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfFGNFY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jun 2019 09:05:24 -0400
Received: by mail-wr1-f43.google.com with SMTP id d18so2109475wrs.5
        for <linux-next@vger.kernel.org>; Fri, 07 Jun 2019 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WvUC+h4eXU9OV57AoesRmfTXgpcCIMNqX8xrDeVkfFs=;
        b=R6e89J7ziu9iTAXQryyjyL6R6aLfTH5YZEefe3av7/Scz87+EPyJv14nGNVFyLBj8Y
         bkT2d2l61xmATkX40gCMxAg0wPq+kGZd2ytfjSz7cOqqzE+89+GBDmCGdpRAqhbGduSq
         POqXwka72yK2cRwuc/j6sbjlnKJTS5iXA603KBv4AVd+G6FY80oWfRm2I69FY68O9Joe
         tnNjdrYjQ9xh21en6jYfh/9sQwe65pyHzAo1lMx89WpMf5ibyxR7L5f54FJj0FTVAmdi
         BhhMt7nlDyT+1TbwB/S0ySKXb2vtkiPt3Qcs73C+hDhbY3F0FSV+wniPRBEP8GvEQMBQ
         v3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WvUC+h4eXU9OV57AoesRmfTXgpcCIMNqX8xrDeVkfFs=;
        b=tg15BE/azvAxNiSsEA8lgujnfkBIc8NCHn1dLMLPQNRzO38CNLI5yz2QrtBw1FhVMG
         /gFxf6UCdBwcTumWC8XC89OB0PQCMz5wyux1bdmSShd2JhE7I+ZsJAV7P4GFxWWYOmjp
         nex6RuggIcJ/T6qPACNLI0uJ5xmjSYm/XEavcefgjculxvcXB6RjBPvfCnUYJF5TFhcF
         h0LZHTbDlAoH5DCN18NCFUkFaIqLzswKO8oz1vpGlvRRMwW85DeOpEYztVlawyoBvr0T
         7p1FK9gh8FAZohZBozqXOOl/8v0J96f5cZn5xzxaRs9KAKfoyqymsT1/Wv8KkKLDUlq9
         2HLA==
X-Gm-Message-State: APjAAAXmogVxdiEPknKNqHIX/+tT+WvLZQgGyoZfQkvz5COTljZ6JgGM
        4HqIA0macZ73MsO2nqeepM7CN7I1hnW1Yw==
X-Google-Smtp-Source: APXvYqzzw8bgBKGg5lUC5OWxp5LnGMQA4argZ3O+OSpTAFzakHYMxVEubL6aygwB9O5y2wVsUZCplw==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr34655757wrq.9.1559912722237;
        Fri, 07 Jun 2019 06:05:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s63sm2100295wme.17.2019.06.07.06.05.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 06:05:21 -0700 (PDT)
Message-ID: <5cfa6111.1c69fb81.ccdb9.d0f2@mx.google.com>
Date:   Fri, 07 Jun 2019 06:05:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190607
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 215 boots: 12 failed, 183 passed with 19 offline,
 1 untried/unknown (next-20190607)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 215 boots: 12 failed, 183 passed with 19 offline, 1 untri=
ed/unknown (next-20190607)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190607/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190607/

Tree: next
Branch: master
Git Describe: next-20190607
Git Commit: 3f310e51ceb146cfdd4c8872452a1f7fa059af1c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 24 SoC families, 20 builds out of 231

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: next-20190606)
              lab-baylibre-seattle: new failure (last pass: next-20190606)

    imx_v6_v7_defconfig:
        gcc-8:
          imx53-qsrb:
              lab-pengutronix: new failure (last pass: next-20190606)
          imx6dl-riotboard:
              lab-pengutronix: new failure (last pass: next-20190606)
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: new failure (last pass: next-20190606)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: new failure (last pass: next-20190606)
          imx6q-wandboard:
              lab-baylibre-seattle: new failure (last pass: next-20190606)
          imx6ul-pico-hobbit:
              lab-pengutronix: new failure (last pass: next-20190606)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 10 days (last pass: next-20190523=
 - first fail: next-20190528)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 10 days (last pass: next-20190524=
 - first fail: next-20190528)

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: next-20190606)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 2 failed labs

    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx53-qsrb: 1 failed lab
            imx6dl-riotboard: 1 failed lab
            imx6dl-wandboard_dual: 1 failed lab
            imx6dl-wandboard_solo: 1 failed lab
            imx6q-wandboard: 1 failed lab
            imx6ul-pico-hobbit: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

Offline Platforms:

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxl-s905x-khadas-vim: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxl-s905x-khadas-vim: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxl-s905x-khadas-vim: 1 offline lab
            mt7622-rfb1: 1 offline lab

---
For more info write to <info@kernelci.org>
