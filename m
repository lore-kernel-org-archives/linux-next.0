Return-Path: <SRS0=dKUF=VG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A160C73C53
	for <linux-next@archiver.kernel.org>; Tue,  9 Jul 2019 18:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7A962166E
	for <linux-next@archiver.kernel.org>; Tue,  9 Jul 2019 18:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="h/Zsmuqz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfGISIH (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 9 Jul 2019 14:08:07 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:34387 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728092AbfGISIG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2019 14:08:06 -0400
Received: by mail-wm1-f49.google.com with SMTP id w9so2970657wmd.1
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2019 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kEgjqvQgOBoiGXV8G2nLNcnM5gr/slypEXW9zDL8F0s=;
        b=h/ZsmuqzgnUJ4NMqxtd0yUwYigxh93bJHDnU2HVfNGAHJ3J/B87CQgFMCdpgo7Mcyy
         YRSWSMnmSyJpJajZ38V6a3/aQOdMHxGrDWgyO1AHqeHHCtGzhex64+sXFFWCt+TwvqZb
         iqvV8GtT+wRNIfu3+iEUuptDcpUXkuHkIwxE05QfSg8SGNEiK1IxT37Fa9M012KnMNqF
         jyoL745rBSaATKqSfXw/3X9ZSPd4TcYCqbbK7l4bE14CFnjiJ3j2c31EiFGGvYbOU1/T
         KXsRflGez958vZFSx9lceQrzYaDhvmAJEMIEtnWet+nRLj4bLwfV8LHgmTi7i821+JE3
         FFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kEgjqvQgOBoiGXV8G2nLNcnM5gr/slypEXW9zDL8F0s=;
        b=MxCJx0hasWFibyvXwBgOTMj5SthmgqYDuNJu9M0L6Dffi4namlbbdYxWVmMPratPDh
         gKQWlPUqK/wSXC1B+r34aO1UXSDBmqnxD700/AXPM1UhvNauBYtiyIKDvf//drI+/dNt
         CbSfPBY+HjJKO9gd2nmHYU4rTEHWrlUiX2Be5Zj6c08KVMfk4DtDXw5uMPdqb9Vzsijh
         ivxJsHvAq0CVCrmyPnnknN2NtBEW2ttuEapMyjznBfRbKhcuHCwwvH+tKXSvIQBt6ifk
         DSP6pQt4KaCy7VDh7Iq6aXY83YFBB7vy3KdVs4V9UcMYYQDeEHK9RcJQvLjaFnvPQC3M
         tcHw==
X-Gm-Message-State: APjAAAXSZnrUJU/3VpldfRPhpE3gjQteddj+EeSECiiSiAJQkTkICxu1
        ls9Juhb45mCr2Z7jMg+r1nlGK7XfM1Y=
X-Google-Smtp-Source: APXvYqw6Wef9iy4mOCFpvhJkVVZjYQ7mcRZjtSw2Byqmo7xsoisR8cjhAIAtkyVOf9BK4XnupPoh7w==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr1009223wms.8.1562695685118;
        Tue, 09 Jul 2019 11:08:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a84sm4025860wmf.29.2019.07.09.11.08.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 11:08:04 -0700 (PDT)
Message-ID: <5d24d804.1c69fb81.a02b0.6c2f@mx.google.com>
Date:   Tue, 09 Jul 2019 11:08:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190709
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 198 boots: 6 failed,
 191 passed with 1 offline (next-20190709)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 198 boots: 6 failed, 191 passed with 1 offline (next-2019=
0709)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190709/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190709/

Tree: next
Branch: master
Git Describe: next-20190709
Git Commit: 4608a726c66807c27bc7d91bdf8a288254e29985
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 75 unique boards, 25 SoC families, 20 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 14 days (last pass: next-=
20190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 18 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 18 days (last pass: next-=
20190618 - first fail: next-20190620)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 7 days (last pass: next-20190625 - f=
irst fail: next-20190701)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
