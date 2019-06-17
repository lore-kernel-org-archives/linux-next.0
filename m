Return-Path: <SRS0=t6Jm=UQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE99C31E5B
	for <linux-next@archiver.kernel.org>; Mon, 17 Jun 2019 17:04:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF50A20652
	for <linux-next@archiver.kernel.org>; Mon, 17 Jun 2019 17:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="xftJpCIT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfFQRE6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 17 Jun 2019 13:04:58 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:44594 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFQRE6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2019 13:04:58 -0400
Received: by mail-wr1-f54.google.com with SMTP id r16so10767118wrl.11
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2019 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SBNUWc1UyTlfVnwAa8AtpQ8ws3BGhN00YExz/8N6whk=;
        b=xftJpCITnkGpgwVk9ihFDZSRS5jih6jQtgg0uNt9t3YDBZrC0rBRDASBJ7QDRw1IvC
         P/ksqJE1OdudqrMH0/QQdDhpGg0zXpTS5HzF9/sb0DT9FIDNTjSp5vy+78h8SuTfps5H
         Q8xbILRiE9hPQ27KukBJ4DRk6gWAB8O+V3/9gDliSc0T8l1SHSEily6y07If6UTngq+y
         Ou7A0ZQ4oq90aUSKI1uiJwTp9xX81qcAzqJVdHdsM04cdsp1+xrBqifIbIYRyjLMWCaI
         dt9locLcONB8of5afloaQVwcqNVDRD/Jrj8Jhz2wB6iSWu7aGktRUKPt7YjmOs57lxou
         Csqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SBNUWc1UyTlfVnwAa8AtpQ8ws3BGhN00YExz/8N6whk=;
        b=hFvGX43sHlogfOO5kXTwDzRhNWcr/Pg+RUywkGsuznq9MJvLrI+zpEG2gOHoXk5/Ib
         r5G2Hq0qQxxrLZu8rekSn5PJxdKMQGa/NXp5lO0DPbczxM3h2sg0TQPFrF4A6mgL15La
         GDqNoKY/K8tPK1CZKkC8vYE1ShUvTW8F/gGRZbz6N4JpcFXCtaOG6vZ/epULa1w2PQeH
         XmO9RyH1Ow9OjBYFRnvcl+eMfy60VTta/U1Gq4+JFANkwdOYUoc9+O0V4UTcGxANF8DO
         P9V5QA1eTK7SH3nbN8V5TjW71/K1NMLqSneRkhIH5UAO84njR2s3laRKtVxjWZMpilxN
         nVew==
X-Gm-Message-State: APjAAAWQXsI7qnuB1SJFgjijAXNJc7SeuOVOZkR/3lACilsNrFOn5IMf
        lDyQ0QgMY9tZvgUmR06dBA04HY0KbhsX1w==
X-Google-Smtp-Source: APXvYqxOyoA0tJrt7UmjDt/3+PjwINSlhmEVFWQ74p+KMKedK5WbmzONqH/tbydrW1iXQUZMmfamtg==
X-Received: by 2002:a5d:4cc3:: with SMTP id c3mr1177864wrt.259.1560791095687;
        Mon, 17 Jun 2019 10:04:55 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b203sm17744975wmd.41.2019.06.17.10.04.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 10:04:55 -0700 (PDT)
Message-ID: <5d07c837.1c69fb81.49a65.fe9a@mx.google.com>
Date:   Mon, 17 Jun 2019 10:04:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190617
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 234 boots: 27 failed, 203 passed with 3 offline,
 1 conflict (next-20190617)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 234 boots: 27 failed, 203 passed with 3 offline, 1 confli=
ct (next-20190617)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190617/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190617/

Tree: next
Branch: master
Git Describe: next-20190617
Git Commit: a125097c841039deef9dd589b86467f7d20f4b3d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 76 unique boards, 24 SoC families, 20 builds out of 231

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          meson8b-odroidc1:
              lab-baylibre: new failure (last pass: next-20190613)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20190614)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20190614)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: new failure (last pass: next-20190613)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190613)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20190614)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20190614)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20190614)
        gcc-8:
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: next-20190614)

mips:

    pistachio_defconfig:
        gcc-8:
          pistachio_marduk:
              lab-baylibre-seattle: new failure (last pass: next-20190613)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            rk3399-firefly: 1 failed lab

mips:
    pistachio_defconfig:
        gcc-8:
            pistachio_marduk: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-g12a-x96-max: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-g12a-x96-max: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        meson8b-odroidc1:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
