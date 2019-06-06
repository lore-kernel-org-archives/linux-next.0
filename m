Return-Path: <SRS0=OytO=UF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA12C04AB5
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 12:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEE9F2070B
	for <linux-next@archiver.kernel.org>; Thu,  6 Jun 2019 12:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="afw4sbhF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfFFMyL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 6 Jun 2019 08:54:11 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:55954 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbfFFMyL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2019 08:54:11 -0400
Received: by mail-wm1-f45.google.com with SMTP id a15so2019084wmj.5
        for <linux-next@vger.kernel.org>; Thu, 06 Jun 2019 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=K/WTzJDVn8HI4j8ZSLFyLIxxRzyjSNcagRVVo5H0+8U=;
        b=afw4sbhFlbMn3tT9pWpYwQAqZZHnJzeAM35OeeaT7snfpPzgMIXdx7TfV8LGduLKje
         RVbC9pddX0VM6xUqJU/BPgZyO7YYTf8iD1HkinOGarbJLYRpCOMZYewGu7Z1DLqBJlgi
         XuX7v2ww4MZ+gxHHniHyijETc8qr0jvkGobHd+fO05KFQcZUZwcKZEkWrlPqmXn2K0uY
         Roka2YNQhp2cYUk6fCiiRRz5AyqFpHCyfD1yWo31VFU0fQi3IMfk8krQ/oOltwoQHSBp
         38zgGwMZzQYPxs2LCqi/6H+amS082u7ir3EP4S99iU8T9Gotclw/x7O/6LWSSldb3x8n
         MvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=K/WTzJDVn8HI4j8ZSLFyLIxxRzyjSNcagRVVo5H0+8U=;
        b=eVK7UyuIW3Gx44SUocSyby3mvZl9QrnMoZ8oPIp5S2o2UJGdmINNKurSw4qIhxqGC6
         JUvSm/s+MQpiuNYhlPuyFRiyhZeMsa+pt2Ld1HWjX/hwDUq/me8/U5JGiX++/RpecQ9Q
         QZrQGwOeBrz9tbK5H74lsSiSEklBIRqLfTSkH0YGSZ7ZHPMCR0fA8G0oQUvWVH304eMq
         uBQ7atzDg0+l2Vcn3PdjeaHjkYcupMWQ48hkj3yEaRMlG21DdZ/jvmStyNkpDsfKSrp1
         Tj2+ISsGqunN5ajPYpc7Qf9w1I+TG1j5inZri4wLlJpPjCjgseYk6mdVQse4K752oEFL
         VEDw==
X-Gm-Message-State: APjAAAVW1xw8omq36+Kggs3yPJqGg6NWVA5ZvFF17W0B8GNtcagRHGjY
        mgmCSn2ajcXnaeY9cP/J+ewf0sIlfQ8p+g==
X-Google-Smtp-Source: APXvYqzGieCoo5lA7ITT/dBfdcmyKNE2bowkFGls051ZCuG06m9lh3CaDKGVsNsf9Wmssr4NtGG/hw==
X-Received: by 2002:a1c:7a15:: with SMTP id v21mr26534667wmc.82.1559825648723;
        Thu, 06 Jun 2019 05:54:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f10sm2228176wrg.24.2019.06.06.05.54.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 05:54:07 -0700 (PDT)
Message-ID: <5cf90cef.1c69fb81.e441d.e4fc@mx.google.com>
Date:   Thu, 06 Jun 2019 05:54:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc3-336-gfd5c57db249c
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 223 boots: 5 failed,
 197 passed with 16 offline, 3 untried/unknown,
 2 conflicts (v5.2-rc3-336-gfd5c57db249c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 223 boots: 5 failed, 197 passed with 16 offline, 3=
 untried/unknown, 2 conflicts (v5.2-rc3-336-gfd5c57db249c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc3-336-gfd5c57db249c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc3-336-gfd5c57db249c/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc3-336-gfd5c57db249c
Git Commit: fd5c57db249c77971d11e3cd1cb12d7737bb20da
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 24 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: v5.2-rc1-444-g=
4ef1cc845da3 - first fail: v5.2-rc2-257-gb0251876abbf2)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: v5.2-rc1-444-g=
4ef1cc845da3 - first fail: v5.2-rc2-257-gb0251876abbf2)

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc3-298-ge=
fd8de4f40d0)
              lab-baylibre: new failure (last pass: v5.2-rc3-279-g8e8436fc2=
596)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc3-298-ge=
fd8de4f40d0)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc3-298-ge=
fd8de4f40d0)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 2 failed labs

Offline Platforms:

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
