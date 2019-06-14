Return-Path: <SRS0=e2RY=UN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29789C31E4B
	for <linux-next@archiver.kernel.org>; Fri, 14 Jun 2019 17:09:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F16332183F
	for <linux-next@archiver.kernel.org>; Fri, 14 Jun 2019 17:09:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="BxfdV3JJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfFNRJM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 14 Jun 2019 13:09:12 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:40631 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNRJM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jun 2019 13:09:12 -0400
Received: by mail-wr1-f41.google.com with SMTP id p11so3303325wre.7
        for <linux-next@vger.kernel.org>; Fri, 14 Jun 2019 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r8EkqKf9Tgpw0l6DmWtUlhJdxJThLr+1+soIg+NoiuA=;
        b=BxfdV3JJTaj8ThlrCqr31tZb4sapecYK9LUHwOh64HRgGFphY0X1m6wnUOr2+0IFQM
         JzfXWLQqao2W4Vm7CV1K4Dfue2AzYU297lgOexCqTrwV3EMWfQJGu4oVqEt0crVi5q4n
         OyIaPMJ/2VpbxYIJ4MEM0tpqGphx4ozOYLpV3G12fbJxb7/ibc1umqSNFl0NViMBs61k
         HHBOOlWgOpi0aVmJUbQAbNl2M8EdQUTebVGuVIBa2NjeznniHBFwyNIj9FQCp+z2QYfa
         fvKcj5EBfK5oEfdqnaTAtB3xoe4Qj/YLWrfAafXZYER0u7mHu8biEUa7FGADwysHYDkQ
         4cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r8EkqKf9Tgpw0l6DmWtUlhJdxJThLr+1+soIg+NoiuA=;
        b=BYb5rtfBtvRgcIbp2hpJXl9v6U5KnrZaFvLZItVYEdGMS4dTS8vHq0v23pJwU8rkCB
         PVXQFe00MLAzGHahls+Hemr9IKNVneANI68zY/fsgorQj8RyooNYxgnvxkkt8w1RwaVs
         Cb8Xe8uSh93ft/rHHTcD31SS9zbnDdOl8PVFZ3OXYEiQcKCW/QhAMCuYGM+5AmOT1Oz1
         Z29pZkBvEyJAhqRFXJCX59Jm8gvUZa2qKOr1IhQcudW0gmbKXU/wQaTBW+YXjUjp33jq
         BoMqP+6BcP4aLHkayKUkVOW+kAAwy//mV2s3QnHeyPzTQkDSJO1Wpn3oyMpQVHLUJ0gn
         fikw==
X-Gm-Message-State: APjAAAUa0wxnNZycovun8e/tf8ZcrwcLzwWXnvrU4RuEO4DyBlglUOp+
        83d2mQC1I2yGWrwj+PAYKalbrcWRSsZfkg==
X-Google-Smtp-Source: APXvYqzx2DDkmBQFvj6zONjJ6tUI91Mje9CkGOOp94QtbxqTEob2qHIRYCqDYsPnfI2JGIfhr/vF2Q==
X-Received: by 2002:adf:f30b:: with SMTP id i11mr3059949wro.299.1560532149915;
        Fri, 14 Jun 2019 10:09:09 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g11sm3107696wrq.89.2019.06.14.10.09.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 10:09:08 -0700 (PDT)
Message-ID: <5d03d4b4.1c69fb81.b1f8b.0941@mx.google.com>
Date:   Fri, 14 Jun 2019 10:09:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190614
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 217 boots: 15 failed,
 158 passed with 44 offline (next-20190614)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 217 boots: 15 failed, 158 passed with 44 offline (next-20=
190614)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190614/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190614/

Tree: next
Branch: master
Git Describe: next-20190614
Git Commit: f4788d37bc84e27ac9370be252afb451bf6ef718
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 72 unique boards, 23 SoC families, 20 builds out of 231

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          hip07-d05:
              lab-collabora: failing since 9 days (last pass: next-20190604=
 - first fail: next-20190605)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190613)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190613)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190613)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          hip07-d05:
              lab-collabora: failing since 9 days (last pass: next-20190604=
 - first fail: next-20190605)
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190613)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

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
            meson-g12b-odroid-n2: 1 offline lab
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
            meson-g12b-odroid-n2: 1 offline lab
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
            meson-g12b-odroid-n2: 1 offline lab
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
