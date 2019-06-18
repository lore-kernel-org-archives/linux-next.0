Return-Path: <SRS0=kTZn=UR=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E75AC31E5B
	for <linux-next@archiver.kernel.org>; Tue, 18 Jun 2019 17:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A5AF20863
	for <linux-next@archiver.kernel.org>; Tue, 18 Jun 2019 17:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="QxXy3qBa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfFRRlL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 18 Jun 2019 13:41:11 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:40685 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbfFRRlK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jun 2019 13:41:10 -0400
Received: by mail-wr1-f47.google.com with SMTP id p11so422946wre.7
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2019 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M9WAGGUYWGrvTWSFZF4XT6od8x/j5fjDkOgaSQJjt0E=;
        b=QxXy3qBazEdLYHUAOGRDE3Jp/yZPgeJfUfXcgegZbVd5FEUCF5SWe5hapnmsRYHWx+
         o5e5mmPqZu5PvfwiNoXHnbSBrJ53qQzWGIcsiHfnGpLqd0pxo2+DiINHSeCSGb3TvZD5
         AFUgLWgvCukKEO6z1EgA1Tf1AkLdqE36BSEgk80BFtOlwdid/xCi5dHGoWbOVOzlN2nE
         BITOL72D3Wjm3W3pM0nZ1HPG+j7zek7D/kefi8+9hGOosDE9cPg+3k99o8cyDeKJ2C5V
         a4q0nwZsuN7SUMZFNNyFIi2L+2l4K9bmj5OVTNA8g3rM4RjeQbfEt7gsFT8GY5PGkLnC
         ImYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M9WAGGUYWGrvTWSFZF4XT6od8x/j5fjDkOgaSQJjt0E=;
        b=YDFgp7aOcBK2a3BliKQOT+CbzmmY5CI6jhI7aKwJPzptB63M/pu0Na9WyyHFoSmjKD
         9kWx6ZeC/C2HB1UuVqnqaQ834QJfJcPLB8tp9lZ7+dYFtRQApCrwLZl3YZ86XErZlCO7
         mJQ2XQZzEuLONsG2Qc1b12n2M8naQjo9ZHgzU9UvqjQBqXrS0KXlgsOCufSZ4HpdYS61
         9n9qXZYbav6O66Drq2RqznIT0tMp9nyWckoNHqs9jaP7X9gKSnQlyEYYOqGiQHxuawXP
         G/05fO+W6/bD9lcT0h1TEjqn+fostbBuqk3AhErhz5XxEnqsYjrsnCPZQR/3sX2DFwKP
         dFRA==
X-Gm-Message-State: APjAAAVsUP1z9ul4xiWo7WNPBFhkET8OWV6B6mq/9KVPKEySBIfTkVjW
        AIQ8U7mLHUVG+htnOyoctBuJU3TYpHygAA==
X-Google-Smtp-Source: APXvYqxCHjp3DVdvvFZ9ODdL6vbfj2pU2ha4g7LcVeYZxNpDEJ6HB08Xb1u3n3EuJmfp4aZc+st77Q==
X-Received: by 2002:a05:6000:110:: with SMTP id o16mr4803611wrx.200.1560879668649;
        Tue, 18 Jun 2019 10:41:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f3sm13052400wre.93.2019.06.18.10.41.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 10:41:07 -0700 (PDT)
Message-ID: <5d092233.1c69fb81.26aed.4f77@mx.google.com>
Date:   Tue, 18 Jun 2019 10:41:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190618
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 88 boots: 13 failed, 75 passed (next-20190618)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 88 boots: 13 failed, 75 passed (next-20190618)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190618/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190618/

Tree: next
Branch: master
Git Describe: next-20190618
Git Commit: 1c6b40509daf5190b1fd2c758649f7df1da4827b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 41 unique boards, 19 SoC families, 13 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190614 - first fail: next-20190617)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 1 day (last pass: next-20190613 -=
 first fail: next-20190617)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 1 day (last pass: next-20190613 -=
 first fail: next-20190617)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 1 day (last pass: next-20190613 -=
 first fail: next-20190617)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 1 day (last pass: next-20190613 -=
 first fail: next-20190617)

    qcom_defconfig:
        gcc-8:
          qcom-msm8974-sony-xperia-castor:
              lab-bjorn: new failure (last pass: next-20190617)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190614 - first fail: next-20190617)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 1 day (last pass: next-20190613 -=
 first fail: next-20190617)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 1 day (last pass: next-20190613 -=
 first fail: next-20190617)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
190613 - first fail: next-20190617)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-msm8974-sony-xperia-castor: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

---
For more info write to <info@kernelci.org>
