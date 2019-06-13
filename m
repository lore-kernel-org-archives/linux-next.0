Return-Path: <SRS0=xExw=UM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1727C31E45
	for <linux-next@archiver.kernel.org>; Thu, 13 Jun 2019 17:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A00862053B
	for <linux-next@archiver.kernel.org>; Thu, 13 Jun 2019 17:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="Ui0Poktd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfFMRTl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 13 Jun 2019 13:19:41 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:37645 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFMRTk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Jun 2019 13:19:40 -0400
Received: by mail-wr1-f43.google.com with SMTP id v14so21621135wrr.4
        for <linux-next@vger.kernel.org>; Thu, 13 Jun 2019 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DNQyVRBYZbZBtMj4EEGsqykp0U0EJeBoE0WEF3Fs70A=;
        b=Ui0PoktdySQm1mm9N/fdh2iArV3PhdJqYOjxsQ/Yl1UQTssBKQTjhujXQFnnP+BwLR
         sljVc9jxXtBX1NxuPfngvnjXKtU7pxGpRqEUY3zWplTAj2mOi873dewsIP1Jhbh96dnN
         pZCcIOhSpalQpOa7VZ0iXg168fytaHexHyFalLp17mJU3Fh8nkME5xKhSwwxorA/CfIO
         g+oxijg7ChDVd5983dkQJlAuKEmnNz/0p2bPwzH428wlGGJ+Uml1UHTDX4di800eT+LM
         vH/HWfQzDyJq0SBhsEgwBT41P3k0NnFT+61n7Yk6gu/UZa6Stho3fXZSeLSAaBUjhzNm
         LBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DNQyVRBYZbZBtMj4EEGsqykp0U0EJeBoE0WEF3Fs70A=;
        b=HBdQhvDOMyiErqGyTs4D22umN4u8KmcJuyFuxoXNQi80SNgu9SmkK7WWSijLFfXlzH
         T5SS6WDkmBwTJxckicFQHnkf6Ol2LeQol/qDv0i9xBzcQ2Of8j+DRvlbaB+Hg+kMymJW
         90n1H4oxhAxmbPpSVjiyJPX7C+wGy7vCxBywXs9tIecXvIpTBhhPihjyt8xGlTmqHaHi
         mGYS2fthUjnuKqtiwLK5j7U3ginvX4q/vqaoaYUTuIsI8+VSdTYmifCqNmrJdp/kTiOf
         QWOauqLxSXsp+zky0JD5FBbvlPp6Wp4d1gfUSHVnKe7tClB1/d3S/S2gkL4BMEp/GE9q
         aKfg==
X-Gm-Message-State: APjAAAWNTB3/yXvdP7T/fDpXbDL9jHaZauvT4EaIf1nFHOuXGcp8Fp1m
        hVqy7hsjvEYw6lyzgbRd9LkuhAzWHjJq6A==
X-Google-Smtp-Source: APXvYqxToKDeHMoTSxTgCJ34ywKseYYpPRG/XU57HZKCsL2qcDp+M49XMTF85VpIm0iYcvvToWfJAw==
X-Received: by 2002:a5d:5448:: with SMTP id w8mr27499606wrv.180.1560446378933;
        Thu, 13 Jun 2019 10:19:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a10sm404699wrx.17.2019.06.13.10.19.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 10:19:38 -0700 (PDT)
Message-ID: <5d0285aa.1c69fb81.6c449.278d@mx.google.com>
Date:   Thu, 13 Jun 2019 10:19:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190613
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 255 boots: 14 failed, 241 passed (next-20190613)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 255 boots: 14 failed, 241 passed (next-20190613)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190613/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190613/

Tree: next
Branch: master
Git Describe: next-20190613
Git Commit: da151e650328dcd37176cf49fc626a7f42bfbe17
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 24 SoC families, 20 builds out of 231

Boot Regressions Detected:

arm64:

    defconfig:
        clang-8:
          hip07-d05:
              lab-collabora: failing since 8 days (last pass: next-20190604=
 - first fail: next-20190605)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190612)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          hip07-d05:
              lab-collabora: failing since 8 days (last pass: next-20190604=
 - first fail: next-20190605)
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20190612)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
