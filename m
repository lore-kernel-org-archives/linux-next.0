Return-Path: <SRS0=O5gy=VV=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4D1C7618B
	for <linux-next@archiver.kernel.org>; Wed, 24 Jul 2019 11:02:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1A6722387
	for <linux-next@archiver.kernel.org>; Wed, 24 Jul 2019 11:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="eZPU/3DP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfGXLC3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 24 Jul 2019 07:02:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39300 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGXLC3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jul 2019 07:02:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so46455097wrt.6
        for <linux-next@vger.kernel.org>; Wed, 24 Jul 2019 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oBPxcJvCLEliafL7OxLwHPFKEKkVF/T9zQ/4iXYxJ88=;
        b=eZPU/3DP/2Cra49m6XkAprsKqbMnHCTF2ytD5Or+Eh9sU2SukbMlKLL2N9SExHA7qF
         Hfww5SpUZ/SLRKNqljLAywLIYdl2+XOzcBsu01iHXqa0NfuJmrztPU04j21aT8xUhrrI
         MPIrQ0IlExE4AskKmIQgTW3HDSVSJhTC4Wl+NR2Q97jwx+It+XEoOPV+kF3XHCqtoOFL
         H6EWmulaILMgYGm6jhwHPRWzyQq3vFDUgsJvXzAdy3jpmVBcnhF/VQH+0Rn2YvUfeH6M
         ivKm9n+EZ1fy3EAvqvaiUJpt+KYIjl89dokzjQ0Tz5VumomGcXIj+Hev6iEojWiMHE5Z
         yMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oBPxcJvCLEliafL7OxLwHPFKEKkVF/T9zQ/4iXYxJ88=;
        b=diuTqOoMH4CBhDULME9FYnFN35sV+mCK1+JxOIzMJiD8EBgCBGiLM0aJaEFTlBQGWD
         ThXjUg6X4Bodf+RK5/HmExd8dRzwyMIq49G8qgVYvfT7qM+RAyLe+q++zncCNx4DOXR5
         Qlba5lmMlaCvILoVAavQDNCbtv4d9fQ4TCD+5FP0HCcxLuSyv7qIFgu/tn2XTnTd8VdG
         5QFYkID/2oqJs3kpne+fG5Zkmt7zhk1FkKqYq/XaNeMKkfcakFJDTboJrvPuQFeYNBF/
         nYrgHaQuqrALMphXDfB8VR8vfsZQyRL8oEBQV3F/3Ji3ikG7N+/yHQP7qcgNd8jzbV/Q
         St6g==
X-Gm-Message-State: APjAAAW+tj8xMSvq2xOxg8+Cxy7dsP7rTlgor2fcrCPikUtN1xw6U7Sx
        0rCD0lDRZlL4Vr2LYe485HPnoI2yAG8=
X-Google-Smtp-Source: APXvYqx0JmBMiX24/Qr9lOvNJDZR1BmuiVzyM8/tSgRDYqhH8Hgq/JvvcQ/o0GTNOuo7SsZu6lBGzQ==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr82250992wrt.227.1563966146616;
        Wed, 24 Jul 2019 04:02:26 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c78sm66058211wmd.16.2019.07.24.04.02.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 04:02:25 -0700 (PDT)
Message-ID: <5d383ac1.1c69fb81.88e8f.5293@mx.google.com>
Date:   Wed, 24 Jul 2019 04:02:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-337-gad76983bea69
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 220 boots: 7 failed,
 209 passed with 3 offline, 1 conflict (v5.3-rc1-337-gad76983bea69)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 220 boots: 7 failed, 209 passed with 3 offline, 1 =
conflict (v5.3-rc1-337-gad76983bea69)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc1-337-gad76983bea69/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc1-337-gad76983bea69/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc1-337-gad76983bea69
Git Commit: ad76983bea6955ba8bc30a6a05048e5fa8ddfca8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 28 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 6 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 6 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)

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
    defconfig:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

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
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
