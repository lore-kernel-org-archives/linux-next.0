Return-Path: <SRS0=r9su=UX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8024BC43613
	for <linux-next@archiver.kernel.org>; Mon, 24 Jun 2019 19:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FEC5208CA
	for <linux-next@archiver.kernel.org>; Mon, 24 Jun 2019 19:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="VWJGofaL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbfFXTh4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 24 Jun 2019 15:37:56 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:34084 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbfFXTh4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jun 2019 15:37:56 -0400
Received: by mail-wr1-f54.google.com with SMTP id k11so15188495wrl.1
        for <linux-next@vger.kernel.org>; Mon, 24 Jun 2019 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sJsWODmRFUsPY0mr1FqmOTiJ1c3Ey0b1GZFJAf+tF/I=;
        b=VWJGofaLkqntPZC5KLZyzxhA4jogB31jHtX6mgNH/C7hrOJBw9Dcm6JKh7uXfkUMMi
         wNqTFPIpwjdLBeGmcA3/nJQsLvseuums1vTUSogW4Dan5b0iJ+AKsDgbbBHD9vyNLzHm
         hZJDTWO6ZTMP1iswjgSuNH01Wj0PEO+HYNvcnjBPjBmfA1ToeXZKqqElmBZfQst5tIbs
         6L+CjitpH7n5l++w+8FdmjqopA2T99/r5d3eytHTJBUrPd+hA25LtVxftL4XV6X64Zei
         RM/UKv3cbBeMhaHLH5fno44JTGEovdxZS7welhIj8tWbIfM3/F2l4aKW63eNLFt2hppM
         LBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sJsWODmRFUsPY0mr1FqmOTiJ1c3Ey0b1GZFJAf+tF/I=;
        b=bh9lpFlQLlEWhs5jAmApbs+nzmPVwZtaSdid8uUXucdj7zgUQdAwFjSXEVrxRCs0VU
         8J30UAZ0AZpd5BQfOKytE3OoUKcbE0dcziZZ8FC/R5+1UXExtByjZlQYQr7DTEeOYgn8
         sTmPe2ZjmZTxpVpE17Kg9cBk6VM66qPgRw68ITNL1usQlXW6qQtWa7gCzZHaMfgwqqug
         V0DbM0XA6g3A2wTTv7OEXAqqjjkOw8nWfF3e7X8Vgt2HOXLwDvR9k6FSSKPtCFv9qWGR
         Sy5hcdMsLKr5q/XL+Ll99m/RlIhyoE1mRuG1HIhAeuRG0v4xODJnHv+HQdYSB10zs9sI
         GO2Q==
X-Gm-Message-State: APjAAAVgzZuEhXzrYLtDZWGTG5gR4xoiVGde4F2lNVloM1VEduc66PTy
        45g4w9lcqRiZGX+WLvbi+wfWqdkeAi79XA==
X-Google-Smtp-Source: APXvYqxZw8/amWIjbG3ioKGOqZgZA14hV7bPL9NT2hGwbWkcfOh0VrxsbVfDEx30RbEoHtAwmyYJlw==
X-Received: by 2002:adf:f544:: with SMTP id j4mr40484080wrp.150.1561405074470;
        Mon, 24 Jun 2019 12:37:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y18sm490723wmi.23.2019.06.24.12.37.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 12:37:53 -0700 (PDT)
Message-ID: <5d112691.1c69fb81.df3ab.2c43@mx.google.com>
Date:   Mon, 24 Jun 2019 12:37:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190624
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 260 boots: 13 failed, 237 passed with 9 offline,
 1 untried/unknown (next-20190624)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 260 boots: 13 failed, 237 passed with 9 offline, 1 untrie=
d/unknown (next-20190624)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190624/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190624/

Tree: next
Branch: master
Git Describe: next-20190624
Git Commit: 9ffadb46f3dbdef0a5e86e0bf1b8038ca4dc97a2
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 24 SoC families, 20 builds out of 229

Boot Regressions Detected:

arm:

    qcom_defconfig:
        gcc-8:
          qcom-msm8974-sony-xperia-castor:
              lab-bjorn: failing since 6 days (last pass: next-20190617 - f=
irst fail: next-20190618)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190621)
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: next-20190617)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-msm8974-sony-xperia-castor: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
