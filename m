Return-Path: <SRS0=e2RY=UN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B88BC31E4B
	for <linux-next@archiver.kernel.org>; Fri, 14 Jun 2019 16:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC8642133D
	for <linux-next@archiver.kernel.org>; Fri, 14 Jun 2019 16:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="asOknm1W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbfFNQgY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 14 Jun 2019 12:36:24 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:34348 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNQgY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jun 2019 12:36:24 -0400
Received: by mail-wm1-f52.google.com with SMTP id w9so9277334wmd.1
        for <linux-next@vger.kernel.org>; Fri, 14 Jun 2019 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=K6akyVPWPm23t1GmcPvK2NVh19csAbGq1G2oHY4whmU=;
        b=asOknm1WpaV9Y+gSa8LwXGMZ77X9BSc8PA6A9MyW9yO50YBFJ4ckClQSd9UT1WMwL/
         3FyYg+hsLb3oNBIWmacv8Bgtre+wFPiD3EZkxHte/DVrTX12HFLJ/X2uUoCzrWe0P6LX
         k05xMeqtdW48HNZ5s9IU2LLOTF4nWLjf/wbYzrZUD6eArp3Wixh7aLDstKozXOnFNwfl
         EQQOoUKzcKoDIcV9QpyLdQwsdtZpJHsMf8wihTsyGogyfTl0g/CB/PcwZair9hrMFhVF
         5dDTuj1v4GAbFzJ6NV6ZHMgFRUQ0/iiDL/SRzYRURuVlfwMTiB1dIJaXdmnq7zrE4bxT
         BYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=K6akyVPWPm23t1GmcPvK2NVh19csAbGq1G2oHY4whmU=;
        b=MihMHaSiRBdLXS3JIJYujyb87xXK/5hOGmgqSVqwQsONvX8cxZVjTCEdesZ/RPQFLr
         VAY+1mnoIHYoypSsYGFQBS5yShEK+L/7yWj/30Pd3Y3N9Fcf5/aRH2gmgw3KfhaiZldx
         QpXvTV3kcUrxGJ5xusVYa2aG5vDvQpa20Z/0AhUFDcgo1XL014rxw8sKQ/3vyP7M9DQm
         1pN8u3/xneeOl5+571M6RooVPV+s7rSqD9BelgW9qtuiGn/DfgsWpsYx6XNVqkJdAx4j
         Y90u/f6ySMkYkkSeJZsYGR5JAGsvKtQv/Gk1IrOiFZx2FqMNfUA5LeIyfIT4QQzqAyBB
         8J4g==
X-Gm-Message-State: APjAAAU+qeBphRfdX+md1nSW02N29xBz+HokyOlNm2/GOG/VO2KHCW2O
        DSifmj7fwJjcnfysKvcjsWi7Hsf4oxBoeQ==
X-Google-Smtp-Source: APXvYqxNpqZaWzubigbVWbbe3lkmE4dbJKq2xGLarfr4ISfyu/7401NYncb7QEZIjgPsSDGYeZieHg==
X-Received: by 2002:a1c:e109:: with SMTP id y9mr8194508wmg.35.1560530180936;
        Fri, 14 Jun 2019 09:36:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 67sm3921470wmd.38.2019.06.14.09.36.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 09:36:20 -0700 (PDT)
Message-ID: <5d03cd04.1c69fb81.62e76.51fd@mx.google.com>
Date:   Fri, 14 Jun 2019 09:36:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc4-392-g79cf6427bda8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 193 boots: 8 failed,
 144 passed with 41 offline (v5.2-rc4-392-g79cf6427bda8)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 193 boots: 8 failed, 144 passed with 41 offline (v=
5.2-rc4-392-g79cf6427bda8)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc4-392-g79cf6427bda8/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc4-392-g79cf6427bda8/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc4-392-g79cf6427bda8
Git Commit: 79cf6427bda8c8a643367a8018a1eaf480d3c229
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 77 unique boards, 24 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 1 day (last pass: v5.2-rc4-273-g2=
6c91f14d441 - first fail: v5.2-rc4-333-gafcfc783dad1)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 1 day (last pass: v5.2-rc4-273-g2=
6c91f14d441 - first fail: v5.2-rc4-333-gafcfc783dad1)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 1 day (last pass: v5.2-rc4-257-g8=
75653b27b69 - first fail: v5.2-rc4-333-gafcfc783dad1)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.2-rc4-333-gafcfc783d=
ad1)
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 1 day (last pass: v5.2-rc4-257-g8=
75653b27b69 - first fail: v5.2-rc4-333-gafcfc783dad1)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.2-rc4-333-gafcfc783d=
ad1)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            bcm72521-bcm97252sffe: 1 offline lab
            bcm7445-bcm97445c: 1 offline lab
            imx7s-warp: 1 offline lab
            meson8b-odroidc1: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx7s-warp: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12a-sei510: 1 offline lab
            meson-g12a-u200: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905d-p230: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxl-s905x-p212: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12a-sei510: 1 offline lab
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
            meson-g12a-sei510: 1 offline lab
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

---
For more info write to <info@kernelci.org>
