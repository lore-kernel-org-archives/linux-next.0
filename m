Return-Path: <SRS0=Vtnz=UZ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C94C48BD6
	for <linux-next@archiver.kernel.org>; Wed, 26 Jun 2019 21:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71996208E3
	for <linux-next@archiver.kernel.org>; Wed, 26 Jun 2019 21:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="Ejih5AYW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfFZVbY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 26 Jun 2019 17:31:24 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:44943 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfFZVbY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2019 17:31:24 -0400
Received: by mail-wr1-f43.google.com with SMTP id r16so4377382wrl.11
        for <linux-next@vger.kernel.org>; Wed, 26 Jun 2019 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mROPPIj/Kcjns3lS1AC2iFB9zqFqd7JNWQHrzaaZJYs=;
        b=Ejih5AYWrOxqQG9Tzhmd72WPfla6yEDMGIMjMHRkdnvo/caGeMFxa3W10Qwnwc3RyZ
         ta4Ho31TBlgbNsUYFyzP97vxiwyTHNl0XbJx/Q4HVpkPGmaMNKddaHEMX1xVwikYWOjO
         YqeAzt51RssUrRaHNcrY+b0xquqp6CVw60bJyCvuVw04efVbxdR53A+uJ10dlGeNBa+Z
         ojtApIGbGjhztKzeBpdJVdQLNCoXtpHR0fWBV94hMEh/ZqBQxozqCQSWMrW7SZkiXAJn
         saYMiAWDij4yreQO6xNs76X2HFBN2LdGrQ11sPScIXgc+6epPzG9iXSqeepVxv8FHwix
         hoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mROPPIj/Kcjns3lS1AC2iFB9zqFqd7JNWQHrzaaZJYs=;
        b=OnKHfEfsG09u7sqNlBOFG0mkmsEL+yNSEhu8cgTyKKpbo5xjOq0hLQPVYk31SN395W
         99L5k8Gan/nP7BzL76hzHGTvwBj/Js6EJlScm8+j5eg52X8DFCkajg3UCU+3Vi4HV4RC
         4eWClEP5IRRHpx8DFykB7wdfuuyMcDCdoidatfKrG2FKj3XVXU8x/EAIJic+Ba0qnhdU
         dBBwcPTHd0LEXqXkyzaH0iMrSsbJIZWOwePMD4yCeI1POj72Lox/t9GKfBgF8/69bVkZ
         WXiru/f9T96ZKlqOzjtv1aVMyaK6SvwUhDr+zs44ftPxZbx9dZYauENKnRX5al6GIM3j
         ReSg==
X-Gm-Message-State: APjAAAVsgGZyfBSH/L0S2dOkZCAerQLH7tzg2pSU+dwOLH5IYjI8SyGc
        S+k0wZBtJZp3S2TjCOk2tdsFQVSUbdbYbA==
X-Google-Smtp-Source: APXvYqyVVXX1Ppr6LFSq4wyK5nLaFAJELwR2d2MZeNw46pw77R+PUNlcQtmuyOa2MsBUNWjatmXckA==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr5563485wrr.63.1561584682157;
        Wed, 26 Jun 2019 14:31:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o6sm4924469wmc.15.2019.06.26.14.31.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 14:31:21 -0700 (PDT)
Message-ID: <5d13e429.1c69fb81.8fe83.b89d@mx.google.com>
Date:   Wed, 26 Jun 2019 14:31:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190626
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 294 boots: 21 failed,
 271 passed with 2 untried/unknown (next-20190626)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 294 boots: 21 failed, 271 passed with 2 untried/unknown (=
next-20190626)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190626/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190626/

Tree: next
Branch: master
Git Describe: next-20190626
Git Commit: 1dd45f170b7e905b442771efa04b55889af4c239
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 26 SoC families, 21 builds out of 230

Boot Regressions Detected:

arm:

    imx_v6_v7_defconfig:
        gcc-8:
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190624 - first fail: next-20190625)

    multi_v7_defconfig:
        gcc-8:
          exynos5250-snow:
              lab-collabora: new failure (last pass: next-20190625)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190624 - first fail: next-20190625)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190624 - first fail: next-20190625)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0190618 - first fail: next-20190620)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190624 - first fail: next-20190625)

arm64:

    defconfig:
        clang-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20190606)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190625)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190625)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: new failure (last pass: next-20190625)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        clang-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

---
For more info write to <info@kernelci.org>
