Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D688C5B578
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:12:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5C53218A3
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="idbjsq4D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfGCVMs (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 17:12:48 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:54775 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfGCVMs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2019 17:12:48 -0400
Received: by mail-wm1-f44.google.com with SMTP id p74so587820wme.4
        for <linux-next@vger.kernel.org>; Wed, 03 Jul 2019 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/lG3nnBE+o0XB//vjDMrJacbroGy97b7eyEF0yxqigw=;
        b=idbjsq4DE6JHo7/xYNCnW6cVNwB+u7r/IDlyD56PTZIBLAVLoqZHz9RQ2xrNLLUdHE
         mkbnANx+/mvitMdHat1JH9IO3468liRXDh1/DUEcFyAI2Zi+3uHBnA1bL1RZScvJfp1V
         JEUEOImZnTnquB7ZnO5AmWLZmjXa7uFeKqN1Ce/m7W64+X6FUicqOWB2TJFlbccIlMQV
         RtOEj42qX8Gy23jE07WbNU37SqPy5FadtkURnatf7oQCn8JnFDyiGPcq8AP7GlgjaQw3
         oWUIjsezpnGNZYrY5liG80uJhRtK7Jk9ptPYM2Avf1wBovPNzHhTXFHMMlG9LlZKhPck
         U4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/lG3nnBE+o0XB//vjDMrJacbroGy97b7eyEF0yxqigw=;
        b=EilT8OzwOQb2Onk/CvTkQIz0FaSOIZ1GrMqBq2ZeL7BdZGyxaXqG0AfIcb7LkD6B9K
         ukeky7TqB5u1qIxoBvP2J8Z7qsG18H44RNTNf0mfQcWc/OY4gllg03kPpj2h4zRAMjNO
         TUNq5cKJqCswNWClp6KMAs0EljZi6OUbxPTYdvE3JfAvy3z18dkXlkd2R18H5eugEoTl
         rKAt7B8N8tb23+c5uERmc1b+oOGHelVydMkL1pcoIADRJJ31P9nAQXw7mzU5B35bJPTd
         qv2LhRZtzX078w/2jKylfSK4yZ4wFhP7BzqP/kwvf8anYP1yPtd07urCdr03zFCZ8Q0o
         AKow==
X-Gm-Message-State: APjAAAWYTsDzWvGlR9BOYMgPiWnIEZU2qpZEPKX00vPvotOuHucFllJZ
        KP1s1ftIA1Ea6u/BY/+lTD/BDpFvcEg=
X-Google-Smtp-Source: APXvYqzGgXiohMT8/fyzvMqAH6Bfp4apAg2C03Ce2sVwb9yXN5ien5Gbjijnt4ZDodn173RVf/7F5A==
X-Received: by 2002:a05:600c:2385:: with SMTP id m5mr771719wma.4.1562188365889;
        Wed, 03 Jul 2019 14:12:45 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q12sm3507774wrp.83.2019.07.03.14.12.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 14:12:45 -0700 (PDT)
Message-ID: <5d1d1a4d.1c69fb81.7cf2.5f42@mx.google.com>
Date:   Wed, 03 Jul 2019 14:12:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc7-219-g533718d28544
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 224 boots: 6 failed,
 218 passed (v5.2-rc7-219-g533718d28544)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 224 boots: 6 failed, 218 passed (v5.2-rc7-219-g533=
718d28544)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc7-219-g533718d28544/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc7-219-g533718d28544/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc7-219-g533718d28544
Git Commit: 533718d28544aac68371e338d535749b272542f8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 27 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 8 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

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

    multi_v7_defconfig:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab

---
For more info write to <info@kernelci.org>
