Return-Path: <SRS0=/h+o=XZ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC59C4360C
	for <linux-next@archiver.kernel.org>; Mon, 30 Sep 2019 09:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1D4821855
	for <linux-next@archiver.kernel.org>; Mon, 30 Sep 2019 09:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="x++U3BIL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfI3Jad (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 30 Sep 2019 05:30:33 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:40482 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbfI3Jad (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Sep 2019 05:30:33 -0400
Received: by mail-wm1-f46.google.com with SMTP id b24so11871224wmj.5
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2019 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CZC+XsWBOxWxSy8W3kcl3MVOo0lF+j1nQe7a3PjlzCc=;
        b=x++U3BILW8Y2gcsjo8iarHAOBVIOCcOrt59qrmxkLX7dfN73jXkzcVzIZG7Yjyzot+
         RAqw1tyyZnkH30oqKyLfCy3rL+6++JUQmz6vZVwJ6BpV9GqnIbcRhETOgzTCpYokKOCF
         JEnYqRJHrrCXMExgI6k4an2/hghKX3jmem2/iI3Yzl1W+SurR4Ys7Ymo2N5W0EWMOF8n
         MZxpJpswL/Eh3XXbMk+qhppZeog8DEyVmmQJXsXkabqjIPyr3QQb1M+pTHVsL/KjSdsG
         HOzLi93IiF02Yt+pqff9IqPoA4QPRY2SxNgi3FJRo/hHHRgjXhbktzUZSJMVNCdvfpE6
         9glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CZC+XsWBOxWxSy8W3kcl3MVOo0lF+j1nQe7a3PjlzCc=;
        b=bE/rnBuvf2KciUeZeqJFNxSvu6JKVWKOhpMhnc1jmZ2+zbCyddVcTtsguYiE8uKcxN
         tA4f/7ywIkfJBPTjOR5L5eIH/zNg6IVGTvpvYnuRRBkv0w1GdxcMQBr58KqSL4pXgCsb
         lYuy6k7Y8xeK3NYlv0MOEKuNllsfouhGJH4VASFuNg5GqkUGsuk5oAyUOaFJMGIJtAlG
         fChbZDYRXNiqGvTqJAuZ22Y8GwC0mu65LtHjfWa1eAMXwAxpHT04jm9b4AdwE3FPxXon
         h9TewAat88DPR/14zMTLluHR72ZjzVQ+Ly2LAkVRLwk3ZO/Vxz7Mkb6sH0+rMa+8P410
         UqvQ==
X-Gm-Message-State: APjAAAUDVUBsi2AeFabmiPJvGff46ZZzLSEbX2uxrnNnMsQA4yVJFXwl
        8HmgiLi6vcb763sbrTVvyaGnC/5iVlc=
X-Google-Smtp-Source: APXvYqyD5wCGyhjbxIhS+iTgLi01dK16kaCZ/SKkO0ST+C84Xn+PwooHC7knTXYYIRycCQce6oPjPA==
X-Received: by 2002:a1c:2144:: with SMTP id h65mr17272157wmh.114.1569835829634;
        Mon, 30 Sep 2019 02:30:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o22sm33225272wra.96.2019.09.30.02.30.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 02:30:28 -0700 (PDT)
Message-ID: <5d91cb34.1c69fb81.fcb83.5eab@mx.google.com>
Date:   Mon, 30 Sep 2019 02:30:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190930
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 199 boots: 7 failed,
 191 passed with 1 untried/unknown (next-20190930)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 199 boots: 7 failed, 191 passed with 1 untried/unknown (n=
ext-20190930)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190930/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190930/

Tree: next
Branch: master
Git Describe: next-20190930
Git Commit: 8b0eed9f6e36a5488967b0acc51444d658dd711b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 46 unique boards, 16 SoC families, 21 builds out of 218

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20190926)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190926)

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        clang-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
