Return-Path: <SRS0=K3uQ=UU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B856C43613
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 16:56:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E5E82089E
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 16:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="JMbr5clr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfFUQ43 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 21 Jun 2019 12:56:29 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:38419 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfFUQ42 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jun 2019 12:56:28 -0400
Received: by mail-wr1-f43.google.com with SMTP id d18so7271457wrs.5
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2019 09:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4fQxFLQNut5uwfg44FXTvVaIB5oMSMovpr+wQmkpXYc=;
        b=JMbr5clrp9hctgsODk9PXZwrIM1gZUB7FxG5XS1pcmaSt4VfoSjxWEqepMGD7HCI7k
         xQq0NfjXTLR4c3RX1I/sVx226tvYaQZtsd0u5qFtpdqr1KIVtaM+bhvTBugJiY+vEZ+d
         LJir04Fh7mzMdlBdqPZaY/qVUeMjvMykM9FpakeOV/cuV5+JE0S8dM12eQxNv7gMW0f3
         XxiXpYj5D1YUOXjYCBBbAdB7C4PRlN7zM3gAuPjzykme4m5OLtMkzpsrNj7qYO3L2Q6H
         VVFU5jjGJqagY4etVyFy5Amop2A8b1PMiRnAHsRmmkdVb4RNJtOo1p9ekdBcXP21pGFT
         urwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4fQxFLQNut5uwfg44FXTvVaIB5oMSMovpr+wQmkpXYc=;
        b=pDSyGuFakTrK6sMvCsXWD9q1G9XLvAsrr7f2fVZ3EWenKIcXqvqmBjMAtnFzoGKOo5
         31VuK9D+VHPj/ndjXn2jqgyfwWHITni4MNveiaV1XLCPlvvMdj2cUpfdB1dO3JYHHA4Q
         NdlKO6aKdkRS1rI0wIhtHQdQx1PbtY/70tE+UxGw9E8Ilj9RQVX29Qm6VuMTGRSjXRtv
         o2XSvnORH4CeiMF5NNMaXUzam+Pru44AHdXuu8k1kkyFlpwNl8MQBLJ+QgWcvFmddnr5
         FbPEK1YKDX9aTDNiiT3GiRW/nR1qb1mDY0YZ2AImVrbSbJzWbdEPjjHpEtNMYGvsMDR9
         zLGw==
X-Gm-Message-State: APjAAAUguMvX7ddiyP9ic6UDd7KF2ZUBQRbZzjL6BVoa9W+JDrsqb0xZ
        R9nLRU/ynUKXToKLfXG5rcTKHsvLZQPTRw==
X-Google-Smtp-Source: APXvYqxXy3RhPSLTMAqgRFfdQY8IoQO7nBHwIXcvV1iJ+wqUqaUIFBjhZ2BTCWART8VjlPC5XaPyDQ==
X-Received: by 2002:a5d:6583:: with SMTP id q3mr105399369wru.184.1561136186439;
        Fri, 21 Jun 2019 09:56:26 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m9sm4066067wrr.14.2019.06.21.09.56.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:56:25 -0700 (PDT)
Message-ID: <5d0d0c39.1c69fb81.f9db.77fc@mx.google.com>
Date:   Fri, 21 Jun 2019 09:56:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190621
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 252 boots: 12 failed,
 229 passed with 11 offline (next-20190621)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 252 boots: 12 failed, 229 passed with 11 offline (next-20=
190621)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190621/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190621/

Tree: next
Branch: master
Git Describe: next-20190621
Git Commit: e2d28c40292bdc35553d599e5bbbeaefbab49416
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 24 SoC families, 17 builds out of 230

Boot Regressions Detected:

arm:

    qcom_defconfig:
        gcc-8:
          qcom-msm8974-sony-xperia-castor:
              lab-bjorn: failing since 3 days (last pass: next-20190617 - f=
irst fail: next-20190618)

arm64:

    defconfig:
        gcc-8:
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
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
