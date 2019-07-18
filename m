Return-Path: <SRS0=DNjb=VP=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC530C76191
	for <linux-next@archiver.kernel.org>; Thu, 18 Jul 2019 11:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B93621783
	for <linux-next@archiver.kernel.org>; Thu, 18 Jul 2019 11:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="vJQHIYb8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfGRL2L (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 18 Jul 2019 07:28:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44455 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRL2L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jul 2019 07:28:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id p17so28246264wrf.11
        for <linux-next@vger.kernel.org>; Thu, 18 Jul 2019 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=um4GQUpQpTlKuQsVX+k/gN565E55V0KGcC+nTSx44Ww=;
        b=vJQHIYb8f4RPG+n1JVGJfOeRfp1nr1r2/lOSlQPEIGGmd8d96cnymjs+seal42zjlM
         6E0QH9ipKpgzouATjQcCIiuZpfxtbQ8Dq25mWDt9fspq3KKoBRYjx4qTdarH2gmTXvXa
         cf6CePOTKEsdtFbY6BHyaCyMowaTgbIMGuUsxEJHEuODwkgn+LkJ8uEeH58ltOXNU9Pk
         qbQyqdhjIW1RhY91YMM94FlRm7Vr6aCrjptaYzQw0XWWtLSL0aaermGUxQ4ymN9j9Gnb
         U6V/SIs0Kpd4JmK3cHKBDxuTtuL0jmDt9/1Zhg7fpVH6xw5tBltwK4ODNZjQNYevzaCH
         LeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=um4GQUpQpTlKuQsVX+k/gN565E55V0KGcC+nTSx44Ww=;
        b=BYxK0TJVCEcq+BS+62JG3dF9zUUGlZucZ57O+l+EgVM6nuSS/zKOk4v8NhHieW+Ad+
         +8hYQ7bFzObVXu17+8m09Bs9leENKpcJGVyuPXoncfFzLzBDIltglD7Q5M8uiswnvJFB
         8bK74xnBl9W1XdFqYMlPiZJaPdQEBWYph5MBHWSk2W/AaUoFRJfmZclSerEuxsJrJhP4
         wKTEnmrcG/KjjWwTgi8jIMQt8dk38Lt/T+EoptNwlp3e12Jok18RNn2mWns4d37C2rt6
         WyoGl+W9jjEPpVEkIQfyUgOiXBEVNicEDcA2DltiwEVVMjLicYm/rZvFjvrRuNLCMdfP
         4Hng==
X-Gm-Message-State: APjAAAUYEDK0EoMQegFcmA8js4XnOdt6FSrD5znzKWLDMy/oposu7lnI
        mFxbrM+9nMNfoag6xcQvhXJU/rbrrp8=
X-Google-Smtp-Source: APXvYqxFAO57NkcwgYtnqvjrjAJu6qYF528TULH/pHgj55KyjK6KnAxnC15zu4SknIXWW/wum5JIvg==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr47714811wrq.194.1563449288222;
        Thu, 18 Jul 2019 04:28:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c11sm46259468wrq.45.2019.07.18.04.28.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:28:07 -0700 (PDT)
Message-ID: <5d3057c7.1c69fb81.69fe8.9c04@mx.google.com>
Date:   Thu, 18 Jul 2019 04:28:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190718
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 285 boots: 16 failed, 264 passed with 3 offline,
 1 untried/unknown, 1 conflict (next-20190718)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 285 boots: 16 failed, 264 passed with 3 offline, 1 untrie=
d/unknown, 1 conflict (next-20190718)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190718/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190718/

Tree: next
Branch: master
Git Describe: next-20190718
Git Commit: 6d21a41b7b1f46d5d5c3ddc26b55c5c4a6a826b9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 27 SoC families, 22 builds out of 229

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20190717)
          sun50i-h6-orangepi-one-plus:
              lab-clabbe: new failure (last pass: next-20190717)

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
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            rk3399-firefly: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab
            sun50i-h6-orangepi-one-plus: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

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
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
