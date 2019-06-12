Return-Path: <SRS0=4G8J=UL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BB5C31E46
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 13:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90CCF20866
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 13:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="DUlb67Gi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfFLNe3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 12 Jun 2019 09:34:29 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:39263 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfFLNe3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jun 2019 09:34:29 -0400
Received: by mail-wr1-f50.google.com with SMTP id x4so14296324wrt.6
        for <linux-next@vger.kernel.org>; Wed, 12 Jun 2019 06:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+0l7O6htp+jhhx/YURTXX4aItSifkizmqD4vZsXVP7s=;
        b=DUlb67GigfkEEHybetEbiP2ci5YPBtTrAkkQjTOfLiDuvoFqPMfKZ6P5UncbzC7cVZ
         /1Eozy5nn2Y1DQHxMzDYojRcqIEkVXidzw76iDiKhB4nJz9GAJc3uDFi5Tfks1KetWbv
         cqUtQ7kguOSwY5WxoQhzfWcO8EFiAF/NSqrZqcJVuHssi370QB3icVraQ+B9LOZ6X9SA
         FlrqrKyLBl/n6d5dP3020wIm+ZDyVwUdSbT35NCNl/gKIB7pFwXgebjjT3EUGYjhhuVQ
         TEQrh8Rp513OsjiTteZsp4odFi232dInwU0Vod1AJyMZccvRLzuP0ANgzMEMV0VuevMu
         RANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+0l7O6htp+jhhx/YURTXX4aItSifkizmqD4vZsXVP7s=;
        b=S/WQ1LrSBL04uAqjUsOgpKov6NxKeG0fGlP21AbM6TpnjvxpVNosyrGCKd5NqhUn5/
         QQmjiilPTsU3ffN2lFV8caX0lFIQagAn8/dz2zkreDI1Uiqtcs5WvHpmEioJWXgB2WR+
         ONfaT2HqfWro3iJsZf5cT1rEugyAyhB/hOzIdEWpXYVQom6JRuGZGfbd2jykmRI6Wql3
         gNAmtcEQRTtucLwpVvvrC97FMmTgEdklElFyQx3D+TMFguIFGkC7cK4nAL9Y4Oxbmixc
         okqi96q6HOWNoBOCtEFABdCiyO1W0JhD9VuV+jwtl6ec3N/33t/Buf/GQeuafes2Kt3T
         v+6w==
X-Gm-Message-State: APjAAAUnNCIm1lex8aARrQw2XWQersPE8MR4nvUEO196ZEblzLRkVwx/
        fHORBxFBZKRNJts4FM3/G9ivTopixR6vqA==
X-Google-Smtp-Source: APXvYqxzg/HbdsUSVeU9KLYv4B4tXVrbXCsFDMDGL8cdhyGRuKb1f3fkrZcL2vi7jpleQUWqv+vVFQ==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr4778066wrw.62.1560346466978;
        Wed, 12 Jun 2019 06:34:26 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y184sm22252wmg.14.2019.06.12.06.34.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:34:26 -0700 (PDT)
Message-ID: <5d00ff62.1c69fb81.e8ea8.01e7@mx.google.com>
Date:   Wed, 12 Jun 2019 06:34:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190612
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 222 boots: 2 failed, 220 passed (next-20190612)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 222 boots: 2 failed, 220 passed (next-20190612)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190612/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190612/

Tree: next
Branch: master
Git Describe: next-20190612
Git Commit: 81a72c79224f83af18e26dc0c599f917312e6c78
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 24 SoC families, 20 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: next-20190611)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

---
For more info write to <info@kernelci.org>
