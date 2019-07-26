Return-Path: <SRS0=o3JF=VX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858DAC7618B
	for <linux-next@archiver.kernel.org>; Fri, 26 Jul 2019 11:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49E6E229F3
	for <linux-next@archiver.kernel.org>; Fri, 26 Jul 2019 11:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="oi7A0wsb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfGZLqa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 26 Jul 2019 07:46:30 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:40885 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfGZLqa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jul 2019 07:46:30 -0400
Received: by mail-wm1-f52.google.com with SMTP id v19so47462405wmj.5
        for <linux-next@vger.kernel.org>; Fri, 26 Jul 2019 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KUldFV9DEnkEACAg34QzX9WgfeBd2qAyo/vpVl5WenA=;
        b=oi7A0wsbSm/8rmtRCIfjeUrmSqMxYkrsD0vE23JF2C5aFp1FLHCBOdt0SaM33kq2vg
         1/1aAgtvb4eIGK9RfIWdxY8QrYQI6uRhl1vUzRlelqpIAMjLS3kgcg52Ju63saRAScfb
         Sb0YLlPslnqxXlVyL2NZYi6JiGr4Zs2PxlEvJA5Nscg7AQXxcyhpqy+FgakvUahun8SK
         LEr6hfoXN2eJQCWowqzkQ4IUzwotpnzFJMuSot71QabCKG/1AnLiJVyKsKJ+oBZWh+3f
         BJ7LMFW2Xj/roU9Xl/Bs0Axb2yWKlSVF30r/hfqE2BtCkyD3OrZzKY20g4i1E36lxGtr
         sP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KUldFV9DEnkEACAg34QzX9WgfeBd2qAyo/vpVl5WenA=;
        b=kT9Y67Lp3wPuCVNcvEarcr0qKQ8gNNvnZ0FsFfjVIwNEORUbW+EAPxbSe/yHVcRsQZ
         1sxW7qk8ShyCyUBKE/F/mFv1E7mjv/uaV1wlOtLVg0toK7zF+xXQ+L1cJ36dqob5/3KQ
         eEIVfF2YK5BcfWpXl1937Ork8VxKVdDUd0ZGlqvanJabA9yJNnOlLOsRL6b+u1NAhRcV
         llr28I0de231/MitRXLYlENiVsilu6WPegO1RJwHAXkf746w/H0TrDg6tXKCxdQ2+5R9
         FY2QHvGznG4eleOZNHpxjNiB0tXcZXE7S4ahw/EGUmY2nxy9iZ+HDr5cHU/A9fpzA16c
         cdmQ==
X-Gm-Message-State: APjAAAVUlzqXEwWTOcnp4rDNt/J+E9/5lORxUDv655Cullb+9vpzn17b
        oZFNAN5b4FNLF+0oxh/vLqdqSjpxo9c=
X-Google-Smtp-Source: APXvYqym7sLZrHwue420KzHrChCcYqpg+4dtpwOdSubSOnOUDGDHuKSu5/nKUoTeZ+UZzd5U0F3uKg==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr84594645wmj.155.1564141588288;
        Fri, 26 Jul 2019 04:46:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f12sm57818951wrg.5.2019.07.26.04.46.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 04:46:27 -0700 (PDT)
Message-ID: <5d3ae813.1c69fb81.b1ff5.23fb@mx.google.com>
Date:   Fri, 26 Jul 2019 04:46:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-440-g910ffd8e3b6b
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 218 boots: 10 failed,
 202 passed with 4 offline, 2 untried/unknown (v5.3-rc1-440-g910ffd8e3b6b)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 218 boots: 10 failed, 202 passed with 4 offline, 2=
 untried/unknown (v5.3-rc1-440-g910ffd8e3b6b)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc1-440-g910ffd8e3b6b/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc1-440-g910ffd8e3b6b/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc1-440-g910ffd8e3b6b
Git Commit: 910ffd8e3b6b17acb2a4f6c4d22edbb616cc2599
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 27 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 30 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 9 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 9 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

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

---
For more info write to <info@kernelci.org>
