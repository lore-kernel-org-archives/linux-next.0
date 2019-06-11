Return-Path: <SRS0=lqV3=UK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A027DC06508
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 17:16:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A64421734
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 17:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="rqWfoQiW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405226AbfFKRQh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 13:16:37 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:36539 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405941AbfFKRQh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jun 2019 13:16:37 -0400
Received: by mail-wm1-f46.google.com with SMTP id u8so3773243wmm.1
        for <linux-next@vger.kernel.org>; Tue, 11 Jun 2019 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2QV4HrYVQPXooOydmVLf7v4JqJGOrp23PMO3Gj3SBXw=;
        b=rqWfoQiWbT+YFbrNXBa+3TCz2riFPRq8tKh1oPYJcZTXYFA73bqfuQgIw7kw4lFJNR
         zIr/U9Ksj7e+fyrjOoZTwrPEiT2TpfKxTXFDN4R1cJCsRG/b2/C/yn6TgrAE4eSbMMLL
         kzSZSPtGWa23KxtBW9YR5YaV0zrlweIeUPwAppIwF1l42kxaLz0lwSDehz3z9p0QqC8d
         qCmUrefYtJmv6uPmMeaOEJyWLOBGTOPL2cVtNXPlCswVeOxvAq+njnDXnESARFtsiKJC
         1mLBvyIjKWjXUVVz5ietw1ixtUAHOd7lYSWrTIvxt57bGjMIfJv0JxhLEOqXjNIWzPTN
         rvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2QV4HrYVQPXooOydmVLf7v4JqJGOrp23PMO3Gj3SBXw=;
        b=Qp3hyerh/D50zrE7albgDo/bRxWYJ5E3ZiTe9kIC2WSXlL4cdpdnhi4aX9uH8Blwkq
         FNmkT6Q9NsyWEl1kq2BIatOZqvaLeX1HNJsisMja1SywUuMxZIp1vwSrhkai3/IwvYTJ
         gWaav0PHzNU7ppCsGpr/okc/60I+WMXJH4lO1p7hAUwolxI1Q5gNfI3YfRd1g7063xmg
         knwHiqCgTJE240ZwxSHtF8VdkvOpjFd1gG5fkQM3Rseab1BRpU4Uk5JyNTyW7H5b9IYn
         YS9eCbaMyn/Xo9j3lUdrWXMV5UKnibfmbWLVOxzNcb+ruer56xfdnXzWBCqQRllzPQhf
         p+sg==
X-Gm-Message-State: APjAAAXnhXYTdcPgHZA97OXQlxaUTUy5p0+bKAcmMzmfOXSR36ffETaC
        fQaeTqdcTJ7OCORYxya9TRJvgZ4/44NDww==
X-Google-Smtp-Source: APXvYqxyTaqnaGUCkjgdKIG6JVzd0MA4BMPCI4I/Nwj+hAevBHT2+gO8SIO2KMTAvmPSgRAFoP58qw==
X-Received: by 2002:a1c:c145:: with SMTP id r66mr8887010wmf.139.1560273395050;
        Tue, 11 Jun 2019 10:16:35 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u12sm12961253wrt.13.2019.06.11.10.16.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 10:16:34 -0700 (PDT)
Message-ID: <5cffe1f2.1c69fb81.c9f9c.ae59@mx.google.com>
Date:   Tue, 11 Jun 2019 10:16:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190611
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 225 boots: 2 failed, 218 passed with 1 offline,
 2 untried/unknown, 2 conflicts (next-20190611)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 225 boots: 2 failed, 218 passed with 1 offline, 2 untried=
/unknown, 2 conflicts (next-20190611)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190611/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190611/

Tree: next
Branch: master
Git Describe: next-20190611
Git Commit: f08776cae7f5ab26f0f239b9ec58aa60fdbb9a1a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 24 SoC families, 20 builds out of 230

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0190605 - first fail: next-20190606)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0190605 - first fail: next-20190606)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

    defconfig:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
