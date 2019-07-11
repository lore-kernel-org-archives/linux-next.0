Return-Path: <SRS0=APSk=VI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2AAC74A35
	for <linux-next@archiver.kernel.org>; Thu, 11 Jul 2019 16:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 657CE2084B
	for <linux-next@archiver.kernel.org>; Thu, 11 Jul 2019 16:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="UAw8Fglu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbfGKQKl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 11 Jul 2019 12:10:41 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:41196 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbfGKQKl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jul 2019 12:10:41 -0400
Received: by mail-wr1-f42.google.com with SMTP id c2so3727749wrm.8
        for <linux-next@vger.kernel.org>; Thu, 11 Jul 2019 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Iea6Kb5Si39/QpowbmHszz6ibiQGpN+2qhShRe68NNE=;
        b=UAw8FgluNsWnMIb4pU8TH/zAk8nOh4nfnZxjCwaIbjVmmZTG2Lou0nMrnJYbVNa74j
         CByWtVU0TujPz3+BrWuStUcJrwL8kRURNul2tGIjtAp17UpdvEFfcf9CvLiFx2Iinvv8
         b6p6SFAYzPSZ37Mf90ryGCXC6vyrPHDKVQrfkFvfVXxfe/WFSYynbkOy+4YSXaop5Hx6
         ci/x98H6ZIlR7LGj9fUBFx9D74fVJ9N2iXDxPTC7P5N+2zxKBNmC4/kZzse/AYhR40xj
         IG8clLfrayrDakSHf1PCcWqVgfW/rqjDpHkNoCA8Pl2UqKwEDEMoICVIWNi2DxU38DhQ
         ta6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Iea6Kb5Si39/QpowbmHszz6ibiQGpN+2qhShRe68NNE=;
        b=B95FGAZGMF2vcYbMKluky0D0sJAAjlOzTO9wUFfgd/oVuMCxgBZiKk57WjK/INRtmA
         SZBqtbMAGD5QZEdl9PSUIxLDLn9tz5gpdW4RuraDI+46v7mihzpjvCccLAmjJsg7f4Uz
         QDBQNQv440tiEgYKwjMuPNgzH6HYJUeINmPGQagfe+7/+TiUQ6mYGUSDypp688rVcxbQ
         4Jd44GJw/5KazIfYwsDbf01hpmnDUr7OHTl1rY2+8sHmPvRrIv4KFWmNoFieeb/x2E8S
         YnazakH5FlaOrDw/OZiSIJvwkWKvXSwjh82ganVE9gs69idXODGwL7jGJG5Ogns24865
         b+WA==
X-Gm-Message-State: APjAAAW0/hAz8Z8mc0Ui4uEv7srjlwICdQIIJ+TRsqUr5z0bPTKLGv2j
        L4NEk92pMEvA7fH3cLapQuUFKiai2/Y=
X-Google-Smtp-Source: APXvYqxlubVwfnoCRSfetvr3WENigzvhlAa3RosgZwgU6o4dSRHRxhY8y9fauzqccDz7rrN3vp01+A==
X-Received: by 2002:adf:a70b:: with SMTP id c11mr6241819wrd.172.1562861439784;
        Thu, 11 Jul 2019 09:10:39 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm8751403wmu.26.2019.07.11.09.10.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 09:10:39 -0700 (PDT)
Message-ID: <5d275f7f.1c69fb81.d5363.3d05@mx.google.com>
Date:   Thu, 11 Jul 2019 09:10:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190711
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 211 boots: 8 failed, 200 passed with 1 offline,
 1 untried/unknown, 1 conflict (next-20190711)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 211 boots: 8 failed, 200 passed with 1 offline, 1 untried=
/unknown, 1 conflict (next-20190711)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190711/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190711/

Tree: next
Branch: master
Git Describe: next-20190711
Git Commit: 1481057642d5bfe4f8a9d9144ab62ccf7c5f7517
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 79 unique boards, 26 SoC families, 20 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 15 days (last pass: next-=
20190624 - first fail: next-20190625)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: failing since 1 day (last pass: next-20190705 -=
 first fail: next-20190710)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 19 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 20 days (last pass: next-=
20190618 - first fail: next-20190620)

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20190710)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-nanopi-k2:
              lab-baylibre: new failure (last pass: next-20190710)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190710)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
