Return-Path: <SRS0=dKUF=VG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C2AC73C46
	for <linux-next@archiver.kernel.org>; Tue,  9 Jul 2019 17:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B75720651
	for <linux-next@archiver.kernel.org>; Tue,  9 Jul 2019 17:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="Pu8CdjUf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfGIRyI (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 9 Jul 2019 13:54:08 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:34448 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfGIRyI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2019 13:54:08 -0400
Received: by mail-wm1-f42.google.com with SMTP id w9so2946357wmd.1
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2019 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8q/TFc+tKVDUVQRshbAPrWUIWvQjICX7PdRvlqBw9IE=;
        b=Pu8CdjUfOm8oJfTkIpeKsxOuvPUDOnH0Hvhrf0mRcjDA3bTc46nE2in3ZevIbnI9kU
         3bA2uv45dUL7Q/6RPF3r1LQJNRA0nCJFkrOy5BYv6TutdEO7H9iDnE3gm6l43SFdeD+H
         emUSEnFFryRdp5dfiXnaTXf9+sKCxgpY1O29hFhaLNEiALpc6ydxpq9jZxyDlCbtjfMM
         HlVZm/FCND2fFK4HgvruD5fOgo8wlKI1Lrhits8dYRFM1E0YcruhGJoJZsKdtDBiiEoN
         zb+Bgw9+5n1o3Q5Prl0WlfWl8oJ/8oWzxd5vFhK8DrhAqSnUSyYdq97WwU1g8i79TiEv
         YIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8q/TFc+tKVDUVQRshbAPrWUIWvQjICX7PdRvlqBw9IE=;
        b=Y8zkg1LDTuy9Chbg/pYD3KsFk0cw7LIO5XwZ+n/1ggBNTgZQe6xnxPG8ilWyDYzYaG
         e1gmHxts1ZfY54eao5xMmVoYYs6/+6dZxeGmHGNRKis+iBzfB76PL2NzmkKcJrBho2JE
         x8OlApvmsdHNZIv5L18GhC/6eW24JnsFPDj/uswQvykXAqO8VDy6/ThgQ045RLPt/Xe3
         7fs7Xaoc9xvGHdY0zw4CivvA46AXMHS2HE6tRxi45l7KN1CWyQuTjTRaNjqpmJHvKMZu
         pCx6xA8pryOaFxtS8mIE9EFQymhyLZuNO+GNuCChusP3zMBAWp220cxBpU0F8gIQyalN
         sztw==
X-Gm-Message-State: APjAAAX/dvMJpek+Up/OYzt7qY7gHmZdBulErvjVdXE74djTBceRi/qm
        cglyoLX5bcEQWav887w+QSVIXS4afP9ryA==
X-Google-Smtp-Source: APXvYqzWBK30EzDbmO0rCyzBDeObPohvS9/204ipWeHYmPtwg0rrYpSzYuIZcoApCMIccfGcXutYuQ==
X-Received: by 2002:a1c:6454:: with SMTP id y81mr908656wmb.105.1562694845512;
        Tue, 09 Jul 2019 10:54:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g11sm17706564wru.24.2019.07.09.10.54.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 10:54:04 -0700 (PDT)
Message-ID: <5d24d4bc.1c69fb81.888f.1706@mx.google.com>
Date:   Tue, 09 Jul 2019 10:54:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-1383-g58038662df39
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 176 boots: 4 failed,
 172 passed (v5.2-1383-g58038662df39)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 176 boots: 4 failed, 172 passed (v5.2-1383-g580386=
62df39)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-1383-g58038662df39/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-1383-g58038662df39/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-1383-g58038662df39
Git Commit: 58038662df39b7e1b3edef59d20ff75d70babfb4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 74 unique boards, 25 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 14 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

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

---
For more info write to <info@kernelci.org>
