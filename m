Return-Path: <SRS0=p9M6=VM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0A3C76191
	for <linux-next@archiver.kernel.org>; Mon, 15 Jul 2019 11:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3111A206B8
	for <linux-next@archiver.kernel.org>; Mon, 15 Jul 2019 11:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="gFveygmI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbfGOLFg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 15 Jul 2019 07:05:36 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:36245 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729755AbfGOLFg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jul 2019 07:05:36 -0400
Received: by mail-wr1-f54.google.com with SMTP id n4so16645129wrs.3
        for <linux-next@vger.kernel.org>; Mon, 15 Jul 2019 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=g9oBskwWCOEnbIeeot8sV9Wm8mJtoUuVXOMbu2NF2TM=;
        b=gFveygmIS+c4unJ0uSKEjXfeTvprGfPHt52uIOgc/z/Dv1ubn/lkkFeUtjBuWxinw9
         bSlbwR6AkTK0lOVAmvK1IugGINEUOLbsPO4UVX0rPX5HkrtbNbanlv8MQ64ivhVhv4QC
         8epQXsIrj+8OoWtDNiK8mfyEEmqoNYgtDSiZeN1drnwNvqHAjMTA9Gxn5FFn1GBFHpqk
         lCJNaQEalZBSAuRNgUVpsxxvf25R0FLrxcSPWLGS8zMhl/5wSHvA+UjkF3O88fNDyKBz
         qCVr9CB96ciAi3qbYj8f5tsGkFv596SE4u9VRd21iF3+gcCiKToulov0MyleB6cLG3bA
         6xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=g9oBskwWCOEnbIeeot8sV9Wm8mJtoUuVXOMbu2NF2TM=;
        b=HFyZKHDF8jxTaWERCftkGIJ02GIig4i8InEsDfreO3UJaWKiQWtnJCiMuUkxNOq/LQ
         Uk+0uxwodOUhPzMVtHkw9e0alWylSKFWAvfnvOPEks12VKVeMsHImeSuf7NLmGNEBS4n
         kPP6iWN6J3EI06nqECsZoS1EHpzAnfmN67nBUmWsTHM63uqYOjyD7RK4ASQZjgxKVDoo
         dApbO7wA74sdHEc5wfbNNAlco79EGlk9hFFkTqL6LEPOcazErDdVFeLLROwNxUYkEbqO
         7D0Of5SjXXUsyCY5X5EH4sFM836iyOp/qVeKRBI1qh7NHAASq7wOAYruI/JDVfHPGg4N
         KdlA==
X-Gm-Message-State: APjAAAWvgwihHsXj/CZLqFHzSKttGxcvomhLOj+91cbTlnTppcpvscZT
        u+JWNArk/JXjS+uHgDnl3+qQtWmH1X0=
X-Google-Smtp-Source: APXvYqzVGA/F4mbNPYAh8H7zW8hafgIcd7d3hcVdfPvL0NU47KI91Q0sFoMeeus63xiU7MgCzENoHg==
X-Received: by 2002:a5d:62cc:: with SMTP id o12mr22628588wrv.63.1563188734326;
        Mon, 15 Jul 2019 04:05:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e6sm17640920wrw.23.2019.07.15.04.05.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 04:05:33 -0700 (PDT)
Message-ID: <5d2c5dfd.1c69fb81.02bd.392d@mx.google.com>
Date:   Mon, 15 Jul 2019 04:05:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-8386-gdcbf79ebd5fe
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 203 boots: 5 failed,
 195 passed with 3 offline (v5.2-8386-gdcbf79ebd5fe)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 203 boots: 5 failed, 195 passed with 3 offline (v5=
.2-8386-gdcbf79ebd5fe)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-8386-gdcbf79ebd5fe/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-8386-gdcbf79ebd5fe/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-8386-gdcbf79ebd5fe
Git Commit: dcbf79ebd5fe67c2a8174d92c9a812b74b11cc48
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 79 unique boards, 26 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 19 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

arm64:

    defconfig:
        gcc-8:
          qcs404-evb-4k:
              lab-bjorn: failing since 4 days (last pass: v5.2-1383-g580386=
62df39 - first fail: v5.2-3342-g43c27ecab3ce)

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

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab

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

---
For more info write to <info@kernelci.org>
