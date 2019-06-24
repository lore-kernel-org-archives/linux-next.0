Return-Path: <SRS0=r9su=UX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC76C43613
	for <linux-next@archiver.kernel.org>; Mon, 24 Jun 2019 19:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7581020645
	for <linux-next@archiver.kernel.org>; Mon, 24 Jun 2019 19:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="inE8tPU0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbfFXTVV (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 24 Jun 2019 15:21:21 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:33468 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbfFXTVU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jun 2019 15:21:20 -0400
Received: by mail-wm1-f51.google.com with SMTP id h19so643557wme.0
        for <linux-next@vger.kernel.org>; Mon, 24 Jun 2019 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ApjHtooBTiWmWKHOh32NExsJsaGkHK+vOB6D+tzH4ZQ=;
        b=inE8tPU0vVI9r/rjNh+cXrxaOXGHhLoK4/uZWqQXnZhRhkNa6g1ACu7sJLCE3dgtGM
         bYFquR+CqarqqFEC4qdlI+nN9XJtC5GKmHIKWMi6Hk6UNtMe1XM5wa/4soPl4Di3lZ6m
         ELta+BrYpF2dGa3Fl+Bb7BIrDhVlyknIZEsglFOryRhd6BaqjjROJe9z3Vt2OICWR6NZ
         /yg2p7rhpZQsg51FF7dQoRPmX7ViZwYNIRU3avSXkvTn5BNkm3oogH576XeKeR+XbLAV
         M6esfp/ZawRjdFA15ojeX9awbG2jM2q7/0Db7JbAE7LVAX1E8BkZTj6j5+LVr8Yr9BAd
         dqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ApjHtooBTiWmWKHOh32NExsJsaGkHK+vOB6D+tzH4ZQ=;
        b=ka9tfaS1jpObzGbDrhwattxkAwMrDr+x2FoB375pMCSLEodUAx32orT4O4F327zOYR
         dgilmSn3/PH9AUg7kzOKCiPOfXON5bJKC8rYcBC8D1TEkDtF8YH1GaMGBUP2Tu2hxVso
         +/wsNJ46UqgxIQzzh2P0FYNqT7jIrFZb1UOAbolduRYHRLN3qAAxSN22dQSzyZyGdfBj
         F9pQypNmwnhy4a0A1doTQNZBdtZ2OQ2XpMWQBe/zi0fKJIXGJKSuncalsD48nMxND0Qb
         bMQpmeYFLOpLVxcdWPS9XLy+GyboD0tp+2BB6+6ogjdWry7HJ+4bEGeydpBQeIfvBBPb
         P60A==
X-Gm-Message-State: APjAAAVWsLm/1XkjqxxJB3tAYvSl7R9pbj0fiNWdbfagIA617ovbFXo1
        39vReLejXr0VetOswYn2wEsajCDMOsEP7Q==
X-Google-Smtp-Source: APXvYqzn8NbyGUEZiwGBKjj9P2A7hWQMXbfLylTVFMnzJqaV6zBSs/+ChutVKybRn8mDn28iIOIk9Q==
X-Received: by 2002:a1c:808b:: with SMTP id b133mr16056283wmd.160.1561404078134;
        Mon, 24 Jun 2019 12:21:18 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v18sm9377511wrs.80.2019.06.24.12.21.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 12:21:17 -0700 (PDT)
Message-ID: <5d1122ad.1c69fb81.a3896.1e49@mx.google.com>
Date:   Mon, 24 Jun 2019 12:21:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc6-99-g690c98f37a5e
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 220 boots: 3 failed,
 206 passed with 9 offline, 1 untried/unknown,
 1 conflict (v5.2-rc6-99-g690c98f37a5e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 220 boots: 3 failed, 206 passed with 9 offline, 1 =
untried/unknown, 1 conflict (v5.2-rc6-99-g690c98f37a5e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc6-99-g690c98f37a5e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc6-99-g690c98f37a5e/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc6-99-g690c98f37a5e
Git Commit: 690c98f37a5e473eaf0e08199933ae39e7de5b73
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 24 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-baylibre: new failure (last pass: v5.2-rc5-374-gae1b7dafe=
f4c)

arm64:

    defconfig:
        gcc-8:
          rk3399-firefly:
              lab-baylibre-seattle: failing since 3 days (last pass: v5.2-r=
c5-413-gd10f6f2d3e41 - first fail: v5.2-rc5-463-gca1a9d7e4d17)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.2-rc5-463-gca1a9d7e4=
d17)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        exynos5422-odroidxu3:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
