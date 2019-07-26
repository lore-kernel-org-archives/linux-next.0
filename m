Return-Path: <SRS0=o3JF=VX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D453C7618B
	for <linux-next@archiver.kernel.org>; Fri, 26 Jul 2019 12:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E31C22BE8
	for <linux-next@archiver.kernel.org>; Fri, 26 Jul 2019 12:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="IiCsfSOL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfGZMSE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 26 Jul 2019 08:18:04 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:54592 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfGZMSE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jul 2019 08:18:04 -0400
Received: by mail-wm1-f44.google.com with SMTP id p74so47806270wme.4
        for <linux-next@vger.kernel.org>; Fri, 26 Jul 2019 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CaY+abNlZYHpIcsQju9kSAmeT0WlgvpvXbCJ9nmasro=;
        b=IiCsfSOLR3Ez6n6VWzRNkSZimxfWyDOtoJ+HzRNwSruN/QmLceX3ews26aL8rieYcc
         m9AejErc6eWiKTjWMt/nNHRQqZ/569tSc3m/5HbLDl69ERBnswKBVm3RHxTJMK55MIET
         HRvw8T0nYzRlEh4bo4BMl0oS6722JquSKZD3D4V6mC2H/nULeaD5FBmryszJpQwiQfRb
         nW0fIcv1OBYnIgJhdsc1ANJYxz4RerXOBZ2/IFyJTOY10GEuu8vkv1+cwLgGdNj3nxUc
         GyNzDc7coFHqC3EBOGUA//fXLkEGEKyk88Yvf/s3x8ipbzPTY8kS9roQV0wP37wCwF8o
         kbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CaY+abNlZYHpIcsQju9kSAmeT0WlgvpvXbCJ9nmasro=;
        b=hQXdEVpczhIICi17e7sEn+T/LI91QHkb/XQaQzqqCMe1z3qkavQhGqWHS4hefc9j16
         9ewOXQ4u29OW/6rmTwB1Q71nF8EaoVDp+qro5YWwLExxXFQBO5uJbk53vyrMsYuKIuwx
         5p30zKrN64b6cjicGCi94Zzj/oR9onXP1TmKzJrBWNVp2TUewYjjW5cYWsnoCa+Z2RNJ
         t9J/U0ZqSaATsbs942D4k4s0fALnxl/RM8XzJOREIc5X96vg1KzqGGp/jHn0BLG18dfw
         nQsWI5DdXA9WjXjACNOewhRt6rrlWJKb8KGnTTuw6NhGz76nhwfZxeX4m3cGYQimVy8F
         5ELA==
X-Gm-Message-State: APjAAAUu0TIaAt2kYghU6n8f9cW6zxla8UftvcQVIfG+lHSAIjbQS122
        IrlVgek9qTyt/C+J3twdwfwMD9q3fLU=
X-Google-Smtp-Source: APXvYqymd5oiF9fkNmcU/Ra9SlHnJM0YLBqNx202y9GAz8RQ/tLx09QheZx44z1mm8nwjBeim2nMQQ==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr84766702wmc.159.1564143482002;
        Fri, 26 Jul 2019 05:18:02 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w14sm42193929wrk.44.2019.07.26.05.18.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 05:18:01 -0700 (PDT)
Message-ID: <5d3aef79.1c69fb81.b264e.6e29@mx.google.com>
Date:   Fri, 26 Jul 2019 05:18:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190726
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 254 boots: 16 failed, 231 passed with 4 offline,
 1 untried/unknown, 2 conflicts (next-20190726)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 254 boots: 16 failed, 231 passed with 4 offline, 1 untrie=
d/unknown, 2 conflicts (next-20190726)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190726/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190726/

Tree: next
Branch: master
Git Describe: next-20190726
Git Commit: fde50b96be821ac9673a7e00847cc4605bd88f34
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 27 SoC families, 21 builds out of 230

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
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-linaro-lkft: FAIL (gcc-8)
            lab-drue: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
