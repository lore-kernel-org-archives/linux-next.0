Return-Path: <SRS0=DgJi=VO=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5704C76186
	for <linux-next@archiver.kernel.org>; Wed, 17 Jul 2019 11:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9AC120880
	for <linux-next@archiver.kernel.org>; Wed, 17 Jul 2019 11:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="fczuCjdw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfGQL17 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 17 Jul 2019 07:27:59 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:38719 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfGQL16 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jul 2019 07:27:58 -0400
Received: by mail-wr1-f48.google.com with SMTP id g17so24412425wrr.5
        for <linux-next@vger.kernel.org>; Wed, 17 Jul 2019 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Mn3gcrpdxPeBWkuBYSZTt+TWOIIflbhBRt4vACtNLMc=;
        b=fczuCjdwXXklGWTmmNNQ0b5ezFVh2hf7qqw/pk22yktktdNUTn59L84EzUEDaOjdIh
         C6OQD9RMS9nJwJ22FbGUb6+sRJ1bH/ai4LA/ifvUmwIcioHXrim4mTICBQ3oyru4dsYq
         JxczuCYawWSWOIE2z7Yr4S+EcUZyY1x4NgfFbcj+Vl7ZpAE5X7jt0h8HpiFPTTy7ZaAP
         3W84mtLI2TpF3m7PNpR2NyeZEOHNmHgCLUQzW4zYkgSlT5HV531rdjm70HfUgbx3HLI6
         WymhUSWLpWb5fzZOUYeRatT5apWwRwd2TrpFiDaDc4yrSP7geVzb/3+y8+9kmqVOjZdX
         cqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Mn3gcrpdxPeBWkuBYSZTt+TWOIIflbhBRt4vACtNLMc=;
        b=dhdYpIILTIATjpsWcCAOPOffaFhSsu4Xcu1DC0rqQEJhqWcBDt65ZwG33qvc9tD+Gi
         cZ20dC3XnkSIFGpYGLsNwRUnWDPBjqJ61OZBSi1ZglLKllLCbshdR4NGeowqg9YK8PKO
         0uzq5SP1GSOf0InnX2U+UI6TEkkNRIcqMwW1biuxgVpYROEii8I1DL5NxRxT3GJUdtDQ
         LuBirWskUhi36CHTznHaRSGRPPVo1xXYbozHf/udV+O8zw5as25J10oYO2XsUy2PqtJ1
         /vFN/uzp4AxXAtK+QCPPBl4kKNj8fDiTSS9Wd83EGKRpbOx9nhnPBfyJ4jHerXkD5OXs
         OsDA==
X-Gm-Message-State: APjAAAV4ZsWx5Ym0dkT3zpplz9QVKy/9AQEYFNYVR8yhszgY67buCFe1
        gLHvWOelrdA3HFn3DK7JJofPNhMMR9Y=
X-Google-Smtp-Source: APXvYqwxmV8NLb3WTHt1R8LfMUhWyh570EHK5kfxxCesT5CPU38h6eJkuOWjKng0RtcpeaXFWzQWng==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr42905362wro.112.1563362876666;
        Wed, 17 Jul 2019 04:27:56 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u186sm36879310wmu.26.2019.07.17.04.27.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 04:27:56 -0700 (PDT)
Message-ID: <5d2f063c.1c69fb81.d5363.4f85@mx.google.com>
Date:   Wed, 17 Jul 2019 04:27:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190717
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 265 boots: 17 failed, 243 passed with 4 offline,
 1 conflict (next-20190717)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 265 boots: 17 failed, 243 passed with 4 offline, 1 confli=
ct (next-20190717)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190717/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190717/

Tree: next
Branch: master
Git Describe: next-20190717
Git Commit: e40115c06b1d3a6059ba379041e4661dbb6b02b8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 27 SoC families, 22 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190705)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190705)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190705)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

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
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

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

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

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
