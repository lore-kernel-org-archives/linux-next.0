Return-Path: <SRS0=eN3K=VQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEECBC76188
	for <linux-next@archiver.kernel.org>; Fri, 19 Jul 2019 09:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90F0021849
	for <linux-next@archiver.kernel.org>; Fri, 19 Jul 2019 09:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="t1mt7/N3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfGSJBY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 19 Jul 2019 05:01:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44489 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfGSJBY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Jul 2019 05:01:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so31427863wrf.11
        for <linux-next@vger.kernel.org>; Fri, 19 Jul 2019 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SygkQwb/2mXNJ0Y4SkPOwXaqJPCPAhTv9fPCaAGuhzI=;
        b=t1mt7/N3wBtGaE09GQ4dxEK9WTaTv6VwPXAK4/o9BKFi/pLMlEsIHhkNTMS5J+773/
         LkksQrMBB4zZe5/pA9YteRvuewv57Fvkjfg7mY/7xFGhMGjveGu4JOZqc1RV2N4dRcbz
         p/NwbAtMiXrZPzNaYmCOhlr7keSF1PlmkP4XCtJi9CczTRbVMqiasm2NihbfrRAyWS5a
         dU2rlsUkBuDQvjOJERU0sOLFcty3Edj4f6D1shA5KPm+acLk9g8Js6xVEbpmAxgFk/II
         kFbJm6Ie5IbDo6joW9rIiWASGeaKq8Uft5RKw5SiNxSu+2XlsUdv2i6y8uBUukyg+T8Q
         zRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SygkQwb/2mXNJ0Y4SkPOwXaqJPCPAhTv9fPCaAGuhzI=;
        b=c+L0j0K+F9yhpmTi2axF0Ix43QG+9RxTDSrc4IEDSxof/HFcQxpS1HpKfFoIMWce4m
         NxZtzokpfPN+hkNdu3DpcHZGWwlOxlph8W6IUERWCn2yOx+3kewUTQCWIifsh7REAjX4
         2LS6nTPXPRi3DUha3RFGBcf4K77XIYJL+Dy47EhhuQscX/vgt1fochC5d5VCosMLxGlk
         F7Qoe5co++9UOm9I3YEQOPKi+KPKEJcMBtL6qiqakB2WOY150huyIP5axSKXNPclSrnA
         xnMTIegPcppgzdk9o5T+JWOE68clOYEdjibqj5ZR3cG4US5prmT3ImVqufrOAf3seViG
         DpjQ==
X-Gm-Message-State: APjAAAXdDvYYhXGLd2zQExwCpqALBt/6AC1fLq/Jpqm2WRaTWzqB81KV
        aFAf4th3zZhn0vnKXyZqmLTu5I2XB2w=
X-Google-Smtp-Source: APXvYqxYfqWo5Jd94oPRrbDHLWpeiYN9JMkfY9EUMZuC/+Gx/cOO1bRlxiDe3g3mA7DHm8bsGArBBw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr16769197wrv.219.1563526882088;
        Fri, 19 Jul 2019 02:01:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g19sm31138427wmg.10.2019.07.19.02.01.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 02:01:21 -0700 (PDT)
Message-ID: <5d3186e1.1c69fb81.f8288.f55a@mx.google.com>
Date:   Fri, 19 Jul 2019 02:01:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-12083-gdccb77398ddf
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 215 boots: 8 failed,
 203 passed with 3 offline, 1 conflict (v5.2-12083-gdccb77398ddf)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 215 boots: 8 failed, 203 passed with 3 offline, 1 =
conflict (v5.2-12083-gdccb77398ddf)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-12083-gdccb77398ddf/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-12083-gdccb77398ddf/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-12083-gdccb77398ddf
Git Commit: dccb77398ddfbb9451cd948308160bea9675c162
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 27 SoC families, 22 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 23 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-85=
86-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 1 day (last pass: v5.2-85=
86-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            qcs404-evb-4k: 1 failed lab
            rk3399-firefly: 1 failed lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
