Return-Path: <SRS0=Z6PR=VN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DEBC76188
	for <linux-next@archiver.kernel.org>; Tue, 16 Jul 2019 12:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B40FD20880
	for <linux-next@archiver.kernel.org>; Tue, 16 Jul 2019 12:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="HvIxh3oz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfGPMYn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 16 Jul 2019 08:24:43 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:38380 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGPMYn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jul 2019 08:24:43 -0400
Received: by mail-wm1-f45.google.com with SMTP id s15so18497113wmj.3
        for <linux-next@vger.kernel.org>; Tue, 16 Jul 2019 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3MRcmV7j/6KbnCHXbA2ruaFKaXprNMTENZX8IraTm8I=;
        b=HvIxh3ozF5exc3KvkxsYP7KkhHP+R1u6J4luYtxmxKsatTD0PkV4kA+cY10B1PCJgp
         W8IJ1n4PbI9L9MQ4RucIiqmdy/WaMoiuCwTY9nVAsWm6GGut2v6MFpT5lkPvycco3i5t
         wH9MXKnSo6BzXb0MwkOCKLdAX6tYv26lIUF2oBy8PNFpky9/tPNgH5uHXns1WXJBcjNG
         i58/FE7OfUYuGdiQBFMWGHGgxDqpVZoTq7+fuPrPz1IRGFAh9eLR7oqjlzM2yZPMyy5Z
         nur4LyqP1dzGnI0TzRkdjvYd3yy3SN+0swcky4dBEeoWKQhYjIhAHHhEIkKjjFu8J3kr
         pvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3MRcmV7j/6KbnCHXbA2ruaFKaXprNMTENZX8IraTm8I=;
        b=OKZXu4K8Nwu4D1gSJlpABL9C0FyBh4b4CHU+jhzLxgeG1F0X+ZHH3a0oypj0gIBsNd
         +ty6CBdfVWwuULkUeby5qL6FXQ5oYJERqmkhXtCs7cjodSN1fH4/SKYTEhnog4Tm/Q7J
         MTCm7L6MJoa85CIXs1OHqRtJFXLA7bUIhec+QwDFu2kFHhAT85sKBJ85xFbJPpXafZ7S
         6z4pTzre2C22Xaagjy1HImCRt0eqLWYi7kea/S2kH/yhz/fiGOiKPSbVO9bl7TsQ2PFM
         8anp5ZZ2qKx1AQ9o243+qEoIsPKZFYDTJIVJGWWQxrP5XE8eWd6l2OH2NfK1zqWZ55Ew
         kvIw==
X-Gm-Message-State: APjAAAX5EpAr7MIXqCYrj9wC3+M92alWXn6DKAAcxZ+FjU3HlZWI2x40
        4xpltD6Q5zOkSAeikrmZWG97Mqnmj/I=
X-Google-Smtp-Source: APXvYqw+KM+/sdngoBWI4w+FJf8S7GpKsofpVZlfEOzMq2glSglkONg2y2lwyO8OpZy+m7zlADQi1Q==
X-Received: by 2002:a7b:c398:: with SMTP id s24mr31060021wmj.53.1563279880779;
        Tue, 16 Jul 2019 05:24:40 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r12sm24678304wrt.95.2019.07.16.05.24.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 05:24:40 -0700 (PDT)
Message-ID: <5d2dc208.1c69fb81.8b2b9.e9d5@mx.google.com>
Date:   Tue, 16 Jul 2019 05:24:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190716
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 252 boots: 12 failed,
 239 passed with 1 untried/unknown (next-20190716)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 252 boots: 12 failed, 239 passed with 1 untried/unknown (=
next-20190716)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190716/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190716/

Tree: next
Branch: master
Git Describe: next-20190716
Git Commit: 1438cde7c87cb5d59c4caa292f3d32e4ee06b763
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 27 SoC families, 22 builds out of 230

Boot Failures Detected:

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab

---
For more info write to <info@kernelci.org>
