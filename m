Return-Path: <SRS0=JB9f=U2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D90C48BE4
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 18:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82FAD205F4
	for <linux-next@archiver.kernel.org>; Thu, 27 Jun 2019 18:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="s/eaXGEO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfF0ScW (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 27 Jun 2019 14:32:22 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:46854 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfF0ScV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jun 2019 14:32:21 -0400
Received: by mail-wr1-f54.google.com with SMTP id n4so3618690wrw.13
        for <linux-next@vger.kernel.org>; Thu, 27 Jun 2019 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Lg1oEiT0UjNIS/yBcqTQztxiWEt5OVVp0/etp5wtJZE=;
        b=s/eaXGEONL5wmYMvSmGqG7qlYkZ8v6MzSllzeu3hhEE9Vx/ZmoaUT4SRv4LrUUyqc0
         3fuKJf7Ub+fC5mJLkjM5kr3/BEoCy9sPES3l2BpLQHpEQUZw3t47Jjj0GarohInaCB9k
         ObVmd0f5kUEgpevWxRll/1cCUFYHOCaZynR5AQOch96epMDYrz4XEMjkn9VhViBBVinl
         0EAGikbc6fEp4cGdNwjiLYrCIkrXzXuTXKBvmnnArgjAHaJHfEeuIRXA+j1TQnpIB2ct
         CYF28ojs+hOcc6JqWeN5OG6u4TdbeNdY36CA7FG7P71Pc/PgGXW5yj+UWYSl5Z/q73Ln
         +duQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Lg1oEiT0UjNIS/yBcqTQztxiWEt5OVVp0/etp5wtJZE=;
        b=UhJ+P3nEjQDENAr9zxWa2zt+Ojg0kRo5Y7i2GVCNhYzypUjnbxWJDZjqDzwjbWeiZp
         BgT9jwfW2Ylx4cS1x8zvJ4ZHJAKKTEpPE2bCxQUGG9b8fOufdtJeToaLM7gNUKhjJ0VZ
         veG2NucJ/+0QeGpEJX3qJmimQrB8CehcUhiwnXadd3hPoanwlGDYV0Q6F0ZnNQFaJ5wJ
         RAZ5d0lzHlZrluiCvowvwhAE9Aymn/sSC0fXO2EN1lqUeFKg+HXvirRrisSd0Auaa8k+
         /RvX+5x86TLer7i/SOAkXqai4FtSVaem6gZKb6f4/UG12nVHqdDp0lsTGKzH7bPjGt7S
         sSDQ==
X-Gm-Message-State: APjAAAVFFzV9X3zulYZdrFIONdHZx7JXZJMfBo9Vh1Rce7h05XXvRF1L
        fFtXPKndD9/NVXokQ+L4juiO73YHzeb+ig==
X-Google-Smtp-Source: APXvYqyg+eh1RL/EQHUsdSAun3ABBmKe6BEp5dpnX/Shpne2cdR6LfnriV+DNkhbw2iwVonB04u9hg==
X-Received: by 2002:adf:f591:: with SMTP id f17mr4572596wro.119.1561660339302;
        Thu, 27 Jun 2019 11:32:19 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v15sm2531288wrt.25.2019.06.27.11.32.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 11:32:18 -0700 (PDT)
Message-ID: <5d150bb2.1c69fb81.9ac93.dfe3@mx.google.com>
Date:   Thu, 27 Jun 2019 11:32:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc6-160-g5b60bd5824cb
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 244 boots: 5 failed,
 238 passed with 1 untried/unknown (v5.2-rc6-160-g5b60bd5824cb)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 244 boots: 5 failed, 238 passed with 1 untried/unk=
nown (v5.2-rc6-160-g5b60bd5824cb)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc6-160-g5b60bd5824cb/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc6-160-g5b60bd5824cb/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc6-160-g5b60bd5824cb
Git Commit: 5b60bd5824cbca0b50f8c1de5bdc5fb10137f728
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 26 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 2 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 2 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 2 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc6-136-gd=
ba89a35f087)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

---
For more info write to <info@kernelci.org>
