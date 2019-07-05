Return-Path: <SRS0=eJvT=VC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94D1C46499
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 20:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9E4D2133F
	for <linux-next@archiver.kernel.org>; Fri,  5 Jul 2019 20:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="F16EAb3Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfGEUCK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Jul 2019 16:02:10 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:39470 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfGEUCK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jul 2019 16:02:10 -0400
Received: by mail-wm1-f54.google.com with SMTP id z23so10762645wma.4
        for <linux-next@vger.kernel.org>; Fri, 05 Jul 2019 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZJ+Ucq7eZdy6NtlGbSDSaHh0v3Gi044Xl/KmOJr3yik=;
        b=F16EAb3Y4UT3FanO2CpqekW9lj7rev9RUGAEqRf0kzdPUgXMqhhUB+5w7Xj/ErkxCw
         gZLgutqDcbwB5UtWHGxWTGbU70JUt+Q/SSNUR4Ckrj7YurwIj2v0Zv2GJiK4XET7+zHd
         o3+qi1/6KtwBhYX+gB/wizUmd8zW0t8tHAM3yPRO5CN/wVu85o1K8kmZYjiPldre0rcL
         h8LLK7EEu/bahk6osClXpzYbwzfBAxQi11D0KdXv8lwg7uJEttJMcnrntZzePkqOA8yz
         XDBNdcwHqZe2Rbd/KLn41hn0/VlCfYvLJBP9wEzZmSXoTTdWTDb/P1nmx3eFvnVcUCHP
         +QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZJ+Ucq7eZdy6NtlGbSDSaHh0v3Gi044Xl/KmOJr3yik=;
        b=ilypusd8sXMFLF/MhmTcsr6EFdOazu4cxnIKRtW5hoZcGt0aQM6iAhIIACxh5AbZsb
         TQFa8WHbJH7gCYiyjSom52ia/rPFcMMw0PGWr/W9/x7uDW1ZzBmb26zn94TMXVzBHtPi
         R48Gugp5nv2YHP6LETvAFItgfKwPg4HbVtw9BVZQ7Qq5aTCJKHrUzSb/dyG+hhfSN/iV
         VTeFHbbkaJuuXl29R+n6joo8YDSD+1mgXNXwsccbVl2dJj4iRTRAFaD+Xmtw1Q0IFvp/
         qpe11kkeTyhKj2m/o5Hq/GNERwEtwz+PKoBT+FEUDExUQ0amtb7OI0LrupAbxIde2+tB
         OKgA==
X-Gm-Message-State: APjAAAU9iA+x5VaKM/cjCWp4UhEB9MDmBn+bv4WL0DP0JV8kZeIS/DKw
        9JhhT8Sn01tyiHIN0vYeobr6mIGMDE+e3w==
X-Google-Smtp-Source: APXvYqySIPliVSRBSYj2TLvANxOwU+tXIRjul5jGiryfLwsrBuFQa80FTqR0NtzVpWUMK+ZAE1LrQQ==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr4820479wmb.112.1562356928621;
        Fri, 05 Jul 2019 13:02:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d7sm5960842wrw.0.2019.07.05.13.02.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 13:02:08 -0700 (PDT)
Message-ID: <5d1facc0.1c69fb81.ae1c0.204a@mx.google.com>
Date:   Fri, 05 Jul 2019 13:02:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc7-267-g92fe1791963c
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 231 boots: 5 failed,
 226 passed (v5.2-rc7-267-g92fe1791963c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 231 boots: 5 failed, 226 passed (v5.2-rc7-267-g92f=
e1791963c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc7-267-g92fe1791963c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc7-267-g92fe1791963c/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc7-267-g92fe1791963c
Git Commit: 92fe1791963c662f86747e8cce47c0b1a81641b8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 22 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 10 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: v5.2-rc7-250-g820e56d0=
5831)

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

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

---
For more info write to <info@kernelci.org>
