Return-Path: <SRS0=0/zj=VJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB66DC742BB
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 12:58:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E956208E4
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 12:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="cgXHurH+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfGLM6J (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 12 Jul 2019 08:58:09 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:46872 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfGLM6I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jul 2019 08:58:08 -0400
Received: by mail-wr1-f51.google.com with SMTP id z1so9848405wru.13
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2019 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9POwDFphB3pVSWLWL2HSOzuLKJzZ6HClQ5Hk97LKDck=;
        b=cgXHurH+GdF3ETCqIXy6wfy/AWr2cIIqrt0WiIGh7Cs3Tw1tHPC/6Ywk1AS38vU5C8
         SK59KBgOaV+5uDbWmoWoLqLsayr0yPLoSd/PZyIKys/50nMyE+EApSKZkQWWJifmr/np
         CQRDEGjbWwVg6CYc1bYlejwyqGZYreHYgKsHG6+8IjTyWRx+Nkk0M78sM6UyNRothfwY
         2wyKmN8KTvrXKlF9R+7xMh+vLjXHUL+MQVhQDXdjRDURlcG4jhMrrvZy46RmoXRqz1ZE
         FYoUcRoxTOxBd64ptR27175CIqSpYSM1dS1WfL7gCVMHpr4x9rHllhBQmpq2FU0bAJk4
         KjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9POwDFphB3pVSWLWL2HSOzuLKJzZ6HClQ5Hk97LKDck=;
        b=Xo12SXvGzIn/0x8y8BsMyEHIcfvgk3bBkwbbsRadkVigD7MiwbHoPgSwBBqX+d2QdP
         ibDBxv7RrO9TuHFBPb18q/+2t1d4kAalV0olzceruA7hxPuM91aF2AbM4A1lULBJe38Q
         D7TQ8qmWKb9uVezDXfgbx7eej2IPK8gnGEdtSqRKvcUJb6sF2ACg6Siv3REaO11GSb/G
         5A7FSI/LHSzGXWSuaY7Z+qG85arnA1mRS3KMhIDtMAasmIf4ewBhWmW7ZqAAPR+4nDTX
         DSbSTFE497Nq5JkMhsKMj2w4D+lq4WJ9OiEZm/JANFQ6+hSS4bfgr9LjfjPQVVbe7Q9+
         cb0A==
X-Gm-Message-State: APjAAAVeGoQS5QotYwE7XDkyR2AahCLZXA006dRpOWRE4ezFLrMKPMVY
        0ELVIZQKLVTF9HkNnct4VqO4c0R6deg=
X-Google-Smtp-Source: APXvYqyMymGLoH6KB6T2ywY+MWgVT9k19j9lbz56JpQaJcbJYDq8GSj77i/v4pdkbgdmbf6f5tjyUg==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr12393766wrp.245.1562936286537;
        Fri, 12 Jul 2019 05:58:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j33sm16097668wre.42.2019.07.12.05.58.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 05:58:06 -0700 (PDT)
Message-ID: <5d2883de.1c69fb81.a4d2f.c5dd@mx.google.com>
Date:   Fri, 12 Jul 2019 05:58:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-5780-g5996ce994f27
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 210 boots: 6 failed,
 204 passed (v5.2-5780-g5996ce994f27)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 210 boots: 6 failed, 204 passed (v5.2-5780-g5996ce=
994f27)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-5780-g5996ce994f27/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-5780-g5996ce994f27/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-5780-g5996ce994f27
Git Commit: 5996ce994f2733c622303eac3a5a1676f687adf7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 78 unique boards, 26 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 16 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

arm64:

    defconfig:
        gcc-8:
          qcs404-evb-4k:
              lab-bjorn: failing since 1 day (last pass: v5.2-1383-g5803866=
2df39 - first fail: v5.2-3342-g43c27ecab3ce)

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
            sun7i-a20-bananapi: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab

---
For more info write to <info@kernelci.org>
