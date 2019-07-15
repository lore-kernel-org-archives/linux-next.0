Return-Path: <SRS0=p9M6=VM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF7AC7618F
	for <linux-next@archiver.kernel.org>; Mon, 15 Jul 2019 11:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD3F720665
	for <linux-next@archiver.kernel.org>; Mon, 15 Jul 2019 11:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="aY5pabU5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfGOLII (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 15 Jul 2019 07:08:08 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:36974 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729674AbfGOLII (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jul 2019 07:08:08 -0400
Received: by mail-wr1-f44.google.com with SMTP id n9so16634538wrr.4
        for <linux-next@vger.kernel.org>; Mon, 15 Jul 2019 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yr2OmIr8dXV1iKJAkt2ZxDCx1TTQAyJ7uVUBX/beeDc=;
        b=aY5pabU53u1IfgzEOMRpM/xVaxMR9u/aP1vfAaAfRfwvekLhGQ7WIMyobLk7BeAe9v
         Ug2hFxgZ/DzwAyV89XVBO25UVD3mlPwNwrF735J6VQmvj8SXBfnYnaTL4FDr7x89oVUR
         E/4AIstMghcI5acA9hy7uYYYc9kRO/EZ+SutP4M4w467C3C5oarAVUe+oq2jsUxgKIN5
         5IR1/wpneO0PXq9OQ6xBmaFD7AQaZbLbgLftg3+z3ReLzshVDTHiBL39H0UhjmFC0FhU
         NmHL9mvYKjWq283g9FS21wx/5DKKtNwv8N2C1NtKxCPnz4tUopnZGIcKymoa3pENtex2
         Cosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yr2OmIr8dXV1iKJAkt2ZxDCx1TTQAyJ7uVUBX/beeDc=;
        b=KMTjXsqtTyTVYl/XbXqXY0q+bot3xYWFCSnhEyGk21oZgej2ubWbk3Py2YRaukSe0R
         /HW+T2utI87NaCnV4E0KJtnWyRPYClWBmVulZK5m7V7x+imdc+qKuJTARV/mn09pcIkf
         CmbPoQq+TvB5qu37pKk7awv4ZgakuNRhuytq8erPqSPlEppghACrXCAggmXxfYgnFcub
         VJqEZGuZru9EUPtD3YocZqXu6kLq4D+JHzYW0hPebv9H7PmnRqNCYghQLhoQtjoVA8fZ
         hMeYv5GBAR6xYxDNYbH2ImC4RKC3Ywz3qWC/vsc9LTVUJRWdw9kDiMw1/6YOTJOJFov1
         Z4SA==
X-Gm-Message-State: APjAAAUC2YRM1IbVEu9bvtqHWA/o+Ao7jr80eeN525OuTDE2pIS0hrfO
        jthuDj1OeaFK1ExatsNgqEMbA6HgeUY=
X-Google-Smtp-Source: APXvYqyX0MF1hPnj+6i+IXZHx6ghG+U98YmqUHl5Vw0IjDpyuJBqSNxVnCBTCGjwmgVUPPufdvUEMw==
X-Received: by 2002:adf:ed0e:: with SMTP id a14mr27527145wro.259.1563188885747;
        Mon, 15 Jul 2019 04:08:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e5sm17067942wro.41.2019.07.15.04.08.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 04:08:05 -0700 (PDT)
Message-ID: <5d2c5e95.1c69fb81.4bb98.fe2f@mx.google.com>
Date:   Mon, 15 Jul 2019 04:08:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190715
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 235 boots: 10 failed,
 222 passed with 3 offline (next-20190715)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 235 boots: 10 failed, 222 passed with 3 offline (next-201=
90715)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190715/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190715/

Tree: next
Branch: master
Git Describe: next-20190715
Git Commit: e689ed79e479fb754a28957a7a58218893d57cb1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 80 unique boards, 26 SoC families, 21 builds out of 230

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 19 days (last pass: next-=
20190624 - first fail: next-20190625)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 23 days (last pass: next-=
20190619 - first fail: next-20190621)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 24 days (last pass: next-=
20190618 - first fail: next-20190620)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxbb-nanopi-k2: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-nexbox-a1: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-gxbb-odroidc2: 1 offline lab

---
For more info write to <info@kernelci.org>
