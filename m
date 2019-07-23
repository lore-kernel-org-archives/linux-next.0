Return-Path: <SRS0=gC0j=VU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E948AC7618B
	for <linux-next@archiver.kernel.org>; Tue, 23 Jul 2019 11:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC330223CE
	for <linux-next@archiver.kernel.org>; Tue, 23 Jul 2019 11:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="sCBZXlJf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbfGWLa0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 23 Jul 2019 07:30:26 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55936 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727983AbfGWLa0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jul 2019 07:30:26 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so38144181wmj.5
        for <linux-next@vger.kernel.org>; Tue, 23 Jul 2019 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hb3xea9d7ejRwsfnCgbPqNRqR55SmoHeHjo57ogg7hE=;
        b=sCBZXlJf2w763Vtlp0FwCnVrVS9AHCnfiBltlp9+lwmaGZtBMrIvft6JC3HjXuLhMY
         fMZS4qxpE09IY6+3lJY4EN1SCcBQZITr41AZ/HZ2LICCRg80/xM2AbG31j3hlCTIDYT8
         lXAgfP8i90OYzKxG27OqJQQ4Ko1XKMFiQoyM68FCKAA9JryNcdDHbu7GSBvzAoAYxt47
         ugd5HRc69NFCOyRzZEhw6Qq6+loQXRSGqpllQ1bEv+tGudduuPPCGqhIbbFSjjCA2/Ik
         QsY1MZCemU5GfawV7U8HJuedKZre5v2Nuf0kccj/ptcmrM5LdQlw/m6jBBCXXA/79WM5
         Q/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hb3xea9d7ejRwsfnCgbPqNRqR55SmoHeHjo57ogg7hE=;
        b=YAOgRMg/rrkbD6nu8HIyj0xOmYxB6TZixM8TRlc8yGPsEFwI2DhM5IymyT9HPmtDM0
         87G+sFfQ7s3NYuiYVfdlB1duZxQSgM2YjX7NrWqKUYMsxYffZyc0+/FKsS5sOoYE1Tfd
         N778YmOirvsl0RzfLez+gih9K3kbWnqszFZdPfkOfnZAvwpwS1Z16i0umIU068XpWIDo
         pU/LOdl/sikC9iLzLODj+/DGFvZj5ZqYyys2JPpyClSKMHzzI8MpBRnj+kolmtFIBbEq
         q4Aa0UrSg07OUOfEx4D3VI229+SyiGM3PWgfpx8Acew96krkGe6qHe5puAj+0a4vD/pk
         Xx8g==
X-Gm-Message-State: APjAAAXVgI/dqPC58TCA72rR9T921FRHKjZLCqTpaj/q2b2KVKfi8+K0
        BHvTQfefgI/badJvvMyz/jKo19S7Pds=
X-Google-Smtp-Source: APXvYqx7gnss5pfyd7l3p5FghsFIjvpBCgIqvFldZxj33TVxy2CEs7DT7VOufgR1NH6G8FfXZApn6Q==
X-Received: by 2002:a1c:2d58:: with SMTP id t85mr63647783wmt.61.1563881423950;
        Tue, 23 Jul 2019 04:30:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm72422398wmu.26.2019.07.23.04.30.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 04:30:23 -0700 (PDT)
Message-ID: <5d36efcf.1c69fb81.d5363.aedd@mx.google.com>
Date:   Tue, 23 Jul 2019 04:30:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190723
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 272 boots: 18 failed, 247 passed with 3 offline,
 3 untried/unknown, 1 conflict (next-20190723)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 272 boots: 18 failed, 247 passed with 3 offline, 3 untrie=
d/unknown, 1 conflict (next-20190723)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190723/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190723/

Tree: next
Branch: master
Git Describe: next-20190723
Git Commit: b010bb39ab1aead45df6858ddcb147630ce5a759
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 22 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 4 days (last pass: next-20190718 =
- first fail: next-20190719)
          r8a7796-m3ulcb:
              lab-baylibre: new failure (last pass: next-20190722)
              lab-collabora: new failure (last pass: next-20190722)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
