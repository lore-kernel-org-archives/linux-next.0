Return-Path: <SRS0=0/zj=VJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DF7C742BA
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 13:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD1D52080A
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 13:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="p23kI1lA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727371AbfGLNRS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 12 Jul 2019 09:17:18 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:40751 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbfGLNRS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jul 2019 09:17:18 -0400
Received: by mail-wr1-f42.google.com with SMTP id r1so9930236wrl.7
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2019 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2Hi4Xu3INZpGAFH3sqxa1SFR18WIbLEnjp7m7jbIcjE=;
        b=p23kI1lA3AImpFhc5ZPDRAo9snNUvEjYYkWFPWpgeAAAjsM3y8eK5ZhIIu/HeuMZJL
         e6KVo21PopTqx/e0eNswSk5O+4HQIP2IFzZcaOIzS2AYHYWT18GKKWKq8yuzrrswYvrr
         dUsjjGUPQTy3XIPXxAmCWPT5SP4FHoEmKz2P0Z4gG5IHuItJKnn4Wyu88Ji6NyXGYMdJ
         xqfZsFikcwv+0ZvyctDDOQRgT1qstPShoJ2TEUBlfmYIzUWTu8n1fF61r/ZAnHztqJcI
         SMaNZI2DLFZGI+WaynH/5ZzzbKykLAZj2FhFt7PoNCs///Lvq7QRua+uHIqlf+WHCzzQ
         5fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2Hi4Xu3INZpGAFH3sqxa1SFR18WIbLEnjp7m7jbIcjE=;
        b=XtjJgjlNY+g9ZtmNlLmP7gBG/0t8I0+dEM8M+WcJpMMhO9lcYJzD8jVAECTkKYy6Wy
         BIi0xuOoL6Z4JGjr/VmFP+JJdtCSldGE6xiayZ2y9RcP2HjAeBjVwNUGwPOjPQzdZmty
         0mIlHI7IYtsXQFQYV3bxXTzt1V1+oEr7QQE+2oAC69iBiJz1NpO3LOu/N1yB16SmBX6x
         CV1qRNj9VsB7XMMlJ00EfwptgcgoWc51Bgsbpony6DicMh00xf04nF22gcQ6K/+zZ45r
         FE9uLJ9iuc7kMCKflMj328cCcr3v9B75h/ePFbPieAxJSDdfmfsMjleFCtkeCYkN5tch
         5t3w==
X-Gm-Message-State: APjAAAXgGtZ1204Nc84Ibqlf7iJeBBbQHk56icDt9fp1LRkOS5Y5Mzoa
        KMBhFtoBdY1bpJMRGXPwWMh+rNvmzec=
X-Google-Smtp-Source: APXvYqy5p40bPOMTDauyIhDK5iXG4ay1mKTLgTTr1q7Aahq59doqACAb4k0p5x4fVLBbe7irAaqS1w==
X-Received: by 2002:adf:dbc4:: with SMTP id e4mr4831974wrj.308.1562937435668;
        Fri, 12 Jul 2019 06:17:15 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x20sm17001502wrg.10.2019.07.12.06.17.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 06:17:15 -0700 (PDT)
Message-ID: <5d28885b.1c69fb81.73dc2.207a@mx.google.com>
Date:   Fri, 12 Jul 2019 06:17:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190712
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 242 boots: 13 failed, 229 passed (next-20190712)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 242 boots: 13 failed, 229 passed (next-20190712)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190712/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190712/

Tree: next
Branch: master
Git Describe: next-20190712
Git Commit: 2c51253c171447ec896072c50c037c4f984582f7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 78 unique boards, 25 SoC families, 20 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 16 days (last pass: next-=
20190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 20 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 21 days (last pass: next-=
20190618 - first fail: next-20190620)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

---
For more info write to <info@kernelci.org>
