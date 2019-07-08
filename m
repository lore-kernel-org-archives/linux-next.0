Return-Path: <SRS0=9mSK=VF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D02C606D1
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 21:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90C632173C
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 21:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="unpKGE53"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732245AbfGHVDa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 8 Jul 2019 17:03:30 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:34360 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbfGHVDa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Jul 2019 17:03:30 -0400
Received: by mail-wr1-f45.google.com with SMTP id 31so1837092wrm.1
        for <linux-next@vger.kernel.org>; Mon, 08 Jul 2019 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IonTbXX6+wQbTNtMQ+gSsFSyZmoKkHMlLjNDMz+2SxU=;
        b=unpKGE531dBqdcOtdONp3o1tNeuWQY4JPcJWjRW4wCgdL+dfqlE10GRJIRQz77RwLt
         TzMhWjcup0oUHFLuFjLl4JehhQrf9/n2CJrKBziOrmkAd71R77311iZUgfBVz2rTLRRA
         aqFMkBMpjXxxntqRThTDLWN4CpXp4eO9Tc949CpD5jK84JcRuVvw/X7GJUNXFlu3Wvsl
         Mh7vJq3lNgBkJPZrB+DAtt2TQ7MmsYH3L1y8GVXO4qnb8mJ3l6VbZulrbnT4l8qjLMvg
         k4j38EEfSa98ETNEPraBbmHmNLxct6kiGj1swK8YhGb8dpWsciEb1Q/jVlYrCPpNNRBA
         ILyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IonTbXX6+wQbTNtMQ+gSsFSyZmoKkHMlLjNDMz+2SxU=;
        b=dEh71F3uyh2DCauD16leq3X4EzGyNxY/T9q+IwP4l69UJ6svEaJmxNwIETVlV3Chte
         1vSLDicP1ZtYx+y6Ns4h5yUXus5IPLoh2MTx4fMqiA97XFbX9q3Hp/AYL+3Bak8/AKcW
         Lv2L+8L4TQ5v+Y9Tr7wRxkaADuPhN6gSWhJB0InyVVO2g6YwOMbQYTyvu9ZIztqz7lF5
         gx5GBFnrZvC+YgZtma8fDphgOhiltZgRAncpEGwTIKHOEiQwggGiRsgXXlCNmsyF3QdZ
         Q4EkwVJOYR6/CAOUdjh6EjiOxj3fzctzycNx61/Tm7yCY2ZnQhiYC5KZEONPD8KVaHOL
         UFtg==
X-Gm-Message-State: APjAAAVmaP0PDh5KAJ5Lgg3eVeUiESgdjZEsyBgfbO109YR3FuFx7Rsb
        +IO6knZ0FBtr82OHrm9ohuNBPcwE0mpriw==
X-Google-Smtp-Source: APXvYqxaZ4wr1Z45TbFI4s5z5Y1a40gfyEd18ssTcFLx/9TaFJXrda8ggH7ZGS8ZhWJ8IV7ISQbWRA==
X-Received: by 2002:adf:deca:: with SMTP id i10mr17137940wrn.313.1562619808352;
        Mon, 08 Jul 2019 14:03:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r12sm29451681wrt.95.2019.07.08.14.03.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 14:03:27 -0700 (PDT)
Message-ID: <5d23af9f.1c69fb81.545c2.b0df@mx.google.com>
Date:   Mon, 08 Jul 2019 14:03:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190708
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 194 boots: 8 failed,
 185 passed with 1 conflict (next-20190708)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 194 boots: 8 failed, 185 passed with 1 conflict (next-201=
90708)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190708/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190708/

Tree: next
Branch: master
Git Describe: next-20190708
Git Commit: d58b5ab90ee7528126fd5833df7fc5bda8331ce8
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 73 unique boards, 25 SoC families, 20 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 13 days (last pass: next-=
20190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 17 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 17 days (last pass: next-=
20190618 - first fail: next-20190620)

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

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
