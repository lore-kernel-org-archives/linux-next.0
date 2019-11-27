Return-Path: <SRS0=JDXR=ZT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8650C432C0
	for <linux-next@archiver.kernel.org>; Wed, 27 Nov 2019 02:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 958712075C
	for <linux-next@archiver.kernel.org>; Wed, 27 Nov 2019 02:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="zixsgHvu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfK0CrZ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 26 Nov 2019 21:47:25 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:55939 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfK0CrY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Nov 2019 21:47:24 -0500
Received: by mail-wm1-f41.google.com with SMTP id a131so1103658wme.5
        for <linux-next@vger.kernel.org>; Tue, 26 Nov 2019 18:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/xtaanggXioxAOgn/aZChdCER3BLnwkivEmlEhDVnko=;
        b=zixsgHvuw0Qs757f09SNu3GnzPUywTXBQHej1RGydAR6/IK2PM1Pjl389i90WxPlnY
         AAaaW6OY0hP9+MUEb8DAqK4jDry2S2wyc2PxBbUEGvqRTp9i/hn8lm+z9Z5w0f9DV87r
         mL7P4ys6wYQkhPsx8FEY3J1pFAsvulCVcA+pEXmlbMsIoWW8Vxntmr1D1Ic4HZB5TnHJ
         jf5s+NyR0JmAh1Ob+uP5qYAc/YW4FH1UTX6GPm1gw6fJN+af5rEkOe/secY4ox9RWhE+
         HLT7fnnfo4f9/uF+sX82KC94UI3pcKxoYM09nM0p9SrVT3eY6jwscyrPTT1VwszCS66L
         kr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/xtaanggXioxAOgn/aZChdCER3BLnwkivEmlEhDVnko=;
        b=RcxtdO9glB4kUhfodDHAwRc9c0GMLeQJ1FnuA0bxtLsLBV+jtcVQOdFRYWKXi/iDH+
         J2dyWUN+gSZGZFaWWcs7HqVrQU3dDVKFrmkiHthpwskBhq9bbGnlhQQne43oh87bBdqw
         cRMSmqWHpRGUKdVniRPOg6uUwPA+9oiv5zZsfhIZ3ba5Cm098CYnHPa/rchecpYY5QcF
         RF0HVA1M0WQ9ovHafL7qA568LWeXN23M1zZr6nuV3pg9V4H7J+xIegEG3yJ1UKFT9pRr
         Sy/8cp+hr3jK1PVXD1rbLHyvsx1H2sk1zA61ikqoFs05+EKOIeEq1NYFkx9tRuBmVme3
         Tfrw==
X-Gm-Message-State: APjAAAVRyo0gNwLcxObli6SrFv6v+o37Km7op+dE9tljUXWEuJpaKzRp
        uniIw7tfQJSK28KkHsMwYFljIpoW+GqJgA==
X-Google-Smtp-Source: APXvYqwhZKQKhBXYPtKl1ksNrOULT0eKTtg5xVQfy4JxNPF4BDi7BQylBZ9+rCtYXSaqxKm4BNENzg==
X-Received: by 2002:a1c:dc44:: with SMTP id t65mr1839252wmg.169.1574822842372;
        Tue, 26 Nov 2019 18:47:22 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u69sm5558120wmu.39.2019.11.26.18.47.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:47:21 -0800 (PST)
Message-ID: <5ddde3b9.1c69fb81.bf773.b37e@mx.google.com>
Date:   Tue, 26 Nov 2019 18:47:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-4416-gf0d11b9fd5c9
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 274 boots: 2 failed,
 265 passed with 7 offline (v5.4-4416-gf0d11b9fd5c9)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 274 boots: 2 failed, 265 passed with 7 offline (v5=
.4-4416-gf0d11b9fd5c9)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-4416-gf0d11b9fd5c9/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-4416-gf0d11b9fd5c9/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-4416-gf0d11b9fd5c9
Git Commit: f0d11b9fd5c9014d623f559c22c82a9353bc32cc
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 26 SoC families, 28 builds out of 216

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
