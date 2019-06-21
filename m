Return-Path: <SRS0=K3uQ=UU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA4C43613
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 16:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1CC620665
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 16:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="ndzAK+9j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfFUQpX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 21 Jun 2019 12:45:23 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:33774 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfFUQpX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jun 2019 12:45:23 -0400
Received: by mail-wm1-f46.google.com with SMTP id h19so9526287wme.0
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2019 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XC8ZDyuKfL+WWJuHQ9inRW5dQmWUpMYvN1Z7VkZugf8=;
        b=ndzAK+9jGsFuMh4jlsRvbfd4G5mWvXqiiCTndcvbXsu8P2tXMd2C/xtW8y00iDWHPk
         dOAhY6/tWkKjds7hRAGbgwuaoOD4qztMTzH68lGnRcGqVr7uZ+PSaQ345mdkDyX/ZLBO
         PECFoLeEJ+6h1CoMnod10twEVL7sGrsgLryMWkNMXix/P9ctUGrKVdhwgfc2FHS1bg/+
         uUji0lkA8R/+zHfus3JD9h3ShXEOiVgAV42pgcpq+vo8q4w6Fy2irCzCPbVhqdUa9iKP
         AgkL54jNhkEMDNVPaqXYmNLuIvojbNeNyoIZZEx3NDQ5X4Y28Ny9UCq/fDnG+x+r/MD3
         st8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XC8ZDyuKfL+WWJuHQ9inRW5dQmWUpMYvN1Z7VkZugf8=;
        b=na1bjedjt9dDqL/WsTXZLucTnGNwrpHEKdHkxFdmMzN4EHewvcHI/tVtLsLbwqJVdg
         mcei2XicyuiFx1BJpTgb/LNkad7gOgTcZm1DCgEyG30C1uSfdQ+qUAse6Q8X6rndOiIS
         67m9DnuisElAXf35gVHOfsP6wR5WctBzJDlxj6d1UFy/lVLsiaxANrv+dLfr3HExvrQh
         HvB9xq7x63v1nc7fclLGV7PiMzy/pLfukcYU4GL2m67kzKR2WIu5bQBpld5xbnLjcJiD
         8eGEh9IpTSBUlxUIUuePhUpVpzW8bbmEv0EEAqRrJtIsZOu6IItsWyG26uPJvzzsp+tV
         BheA==
X-Gm-Message-State: APjAAAWOz9dQsBHkwJ/6lsfce9KijJSKI/WJ0N5FKE5IbANkGTE9Mnsd
        BcR31iFvdUvdORUqbRWrOcKiXmmEiRvcWA==
X-Google-Smtp-Source: APXvYqy7cMmgO6fdavI+hB1t2xaZ2nNO3c0mSnIIHu2orJME3vPbTt2Ku0SSun2AHIvKw89rhmDY5g==
X-Received: by 2002:a1c:9ac9:: with SMTP id c192mr5114068wme.0.1561135520682;
        Fri, 21 Jun 2019 09:45:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w23sm3364832wmi.45.2019.06.21.09.45.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:45:19 -0700 (PDT)
Message-ID: <5d0d099f.1c69fb81.b562.3aa6@mx.google.com>
Date:   Fri, 21 Jun 2019 09:45:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc5-463-gca1a9d7e4d17
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 202 boots: 2 failed,
 186 passed with 13 offline, 1 untried/unknown (v5.2-rc5-463-gca1a9d7e4d17)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 202 boots: 2 failed, 186 passed with 13 offline, 1=
 untried/unknown (v5.2-rc5-463-gca1a9d7e4d17)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc5-463-gca1a9d7e4d17/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc5-463-gca1a9d7e4d17/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc5-463-gca1a9d7e4d17
Git Commit: ca1a9d7e4d179bd3a6691457eab23d182b4a948d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 25 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.2-rc5-413-gd10f6f2d3=
e41)

arm64:

    defconfig:
        gcc-8:
          rk3399-firefly:
              lab-baylibre-seattle: new failure (last pass: v5.2-rc5-413-gd=
10f6f2d3e41)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            rk3399-firefly: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
