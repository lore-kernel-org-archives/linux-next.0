Return-Path: <SRS0=t6Jm=UQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8711DC31E5B
	for <linux-next@archiver.kernel.org>; Mon, 17 Jun 2019 17:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A6AD20657
	for <linux-next@archiver.kernel.org>; Mon, 17 Jun 2019 17:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="VAHcRCG+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFQRTn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 17 Jun 2019 13:19:43 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:55050 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQRTm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2019 13:19:42 -0400
Received: by mail-wm1-f44.google.com with SMTP id g135so204644wme.4
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2019 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Oj2XjPqu4xE2Bi2AwkdqOlrRXaybpZybsT531tG9rfg=;
        b=VAHcRCG+WVk1ADoPVCXu+kzYeLpGq5lCEWkKb327+XuYCNHl5Q/ja1g8m2aEXCJyAP
         /gO7H5cynHC+Yk2EseuDcvuMCMsd7yDwk0ECKtP5BkW9KnZL3lwVPqq42LEnPjd8sSzb
         KncCIMNKgxRnIUDJf7WC2kfdkRf0ccC5EwWqMdjouMH8vQXqD1XHciso8nh2cv4CRbSz
         L8vET1iZxi9vCVSixgDlKAJfu5qTUsf9d5MfAO/q9zIxY0fl5Bv/pGjKFvUniiBj0vU8
         qhncE0qPTib8LXKuLTYgD4SPzysBQNpo6JjVswutCIkN+NCPJxLhk9Bw0zE0nSFChG2d
         rERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Oj2XjPqu4xE2Bi2AwkdqOlrRXaybpZybsT531tG9rfg=;
        b=exdT47zR9wWDl+W8ZK5cY0U+Gj9Okh9IJkQ4Qu1e0uvb3UAejRHjCIjrOxY/W3pHt9
         fz+BasOSIWNXoA5gr6QWa1Zr5NYIm9/9jXXbZuxEvNufGl9KOnipg8zIfh0S8aJBs5BS
         6taz0bwpCHCh4oTnIj1ITikFandM+DijIOPnaBaaQ/gXUn1VZJRd3vHrDxqlH6Rh8TFI
         9hXgSGU6/OyYRH7kJijN6wxFDPpEGoztMTe5SAZyB2T0v+F2k+V0ajnN1ypP5qcTbj0o
         P7jhHu91lYl1xBZTIprd5xz9pILaWSUDdzDmMwe7Vbc/VVSJzUxny8bryoZ02W2qYeZx
         0cdQ==
X-Gm-Message-State: APjAAAWysUBX0Saame//MAwiEX3becJ9rGSaepZCNWCdZ3nSgK5RvED0
        2Bhfre3sRLsTUn/OkTTb0e4TIKJTuLlc2g==
X-Google-Smtp-Source: APXvYqwJtH+at8EbqShmrksskL/gE3O1QwWuMXwD7Aa3frtV4QEIpXOFjdgUr4s7jstvSULbcjA6+w==
X-Received: by 2002:a1c:39d6:: with SMTP id g205mr18782020wma.85.1560791977789;
        Mon, 17 Jun 2019 10:19:37 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j4sm10065855wrx.57.2019.06.17.10.19.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 10:19:37 -0700 (PDT)
Message-ID: <5d07cba9.1c69fb81.b219d.3c97@mx.google.com>
Date:   Mon, 17 Jun 2019 10:19:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc5-280-g8c96c1dbb38c
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 174 boots: 6 failed,
 168 passed (v5.2-rc5-280-g8c96c1dbb38c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 174 boots: 6 failed, 168 passed (v5.2-rc5-280-g8c9=
6c1dbb38c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc5-280-g8c96c1dbb38c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc5-280-g8c96c1dbb38c/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc5-280-g8c96c1dbb38c
Git Commit: 8c96c1dbb38c026990312697922d86eeada0e667
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 24 SoC families, 20 builds out of 222

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 4 days (last pass: v5.2-rc4-257-g=
875653b27b69 - first fail: v5.2-rc4-333-gafcfc783dad1)
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc4-333-ga=
fcfc783dad1)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: failing since 4 days (last pass: v5.2-rc4-257-g=
875653b27b69 - first fail: v5.2-rc4-333-gafcfc783dad1)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: failing since 3 days (last pass: v5.2-rc4-333-g=
afcfc783dad1 - first fail: v5.2-rc4-392-g79cf6427bda8)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

---
For more info write to <info@kernelci.org>
