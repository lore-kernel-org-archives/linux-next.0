Return-Path: <SRS0=DgJi=VO=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087E6C76186
	for <linux-next@archiver.kernel.org>; Wed, 17 Jul 2019 10:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0EF121743
	for <linux-next@archiver.kernel.org>; Wed, 17 Jul 2019 10:55:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="011u9ORx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbfGQKz1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 17 Jul 2019 06:55:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54375 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfGQKz1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jul 2019 06:55:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so21665303wme.4
        for <linux-next@vger.kernel.org>; Wed, 17 Jul 2019 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=asIGYYCAAyiW2I6FU2XnKJI7KWhw2wBmBbIPXRT71bg=;
        b=011u9ORxJtBVkPz1n2mPCr6Eet594EifYfemRNsK5wkCN+uzQFul0GCoJBMaVLsMa1
         8jYivsjL8UU2UJHAPuFWl4Vub/tHixaj5hVM6SACTt4q94LGmNP65IVhmfi0Tu/lZx/K
         uOZpKXdDzDWGQXSLzeKsEqB5hZJH1Lq5D3eXnoT1keontFNREcBp9xK0vJl2qtS8ET0Z
         ITrjEy8o+g6q7nKwXexmMRXRfYYp+eyPVOAIrSJdgPzl372qMOC/dB3RbNxWjTbb1uXO
         ETLpFVLMfpQdTDkHC6HJ1Gssg0MSZEIkcUZ/J1xEEs8lsDzvA/lBrg/CM/J7ig7VmP28
         uS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=asIGYYCAAyiW2I6FU2XnKJI7KWhw2wBmBbIPXRT71bg=;
        b=okT/OwO1vI7XUJLve0GLC5Z6npTSmtba8g7NkdskdZgXl+H0CyDsEs2Oi7c/5mCcSi
         k93c9zFjnd64sEemC0mp+9WEXkLJWFh7H3GKY3bmMT6Br/diXXZ+lJ6Mz+5k4a0LMqlY
         s1c9hY3KRC1PiENTSMyV7+sW4Ms9AKs0mmDCoaHcOfn5+2qvFGVoTAtLZr7xnXngonu5
         yoxjtioGpIIWYzw8NfOLpoa4rp8tYmAg+RpOdvXnoIcHncEsq5ut7CcWP4tqiil/asDR
         7Vx9z88wPUBNL3azYTX2TeiYE2lHAtqjc/5XQW22eWLBX+qkaOsvU8xozgzQV4d5C+05
         IJNw==
X-Gm-Message-State: APjAAAXSBF1Mz/voqdaqN3ivz6zj/bcGWLdaJz/IaN3UB+FKMmyCC2Er
        ginNSEZ8MBIYiBfeT/MtonLRtTBzoMU=
X-Google-Smtp-Source: APXvYqziNXgDxPhzZCk89bDTlkt/asiJOHM6ei1/THIp5hjzlKCQpHwpT0BASQhtxZ+hpa7POn8i1g==
X-Received: by 2002:a05:600c:114f:: with SMTP id z15mr35717243wmz.131.1563360925349;
        Wed, 17 Jul 2019 03:55:25 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e5sm24786914wro.41.2019.07.17.03.55.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 03:55:24 -0700 (PDT)
Message-ID: <5d2efe9c.1c69fb81.4bb98.aa0f@mx.google.com>
Date:   Wed, 17 Jul 2019 03:55:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-11081-g48f391c6cc7e
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 225 boots: 9 failed,
 211 passed with 3 offline, 1 untried/unknown,
 1 conflict (v5.2-11081-g48f391c6cc7e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 225 boots: 9 failed, 211 passed with 3 offline, 1 =
untried/unknown, 1 conflict (v5.2-11081-g48f391c6cc7e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-11081-g48f391c6cc7e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-11081-g48f391c6cc7e/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-11081-g48f391c6cc7e
Git Commit: 48f391c6cc7e691e78b9455dc9b5ae6058f8f4bd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 28 SoC families, 22 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 21 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: failing since 1 day (last pass: v5.2-8386-gdcbf=
79ebd5fe - first fail: v5.2-8586-gf96c1aec6d0e)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: new failure (last pass: v5.2-8586-gf96c=
1aec6d0e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: new failure (last pass: v5.2-8586-gf96c=
1aec6d0e)

arm64:

    defconfig:
        gcc-8:
          qcs404-evb-4k:
              lab-bjorn: failing since 6 days (last pass: v5.2-1383-g580386=
62df39 - first fail: v5.2-3342-g43c27ecab3ce)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          hip07-d05:
              lab-collabora: new failure (last pass: v5.2-8586-gf96c1aec6d0=
e)

Boot Failures Detected:

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab

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
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
