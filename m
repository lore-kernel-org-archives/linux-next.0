Return-Path: <SRS0=gC0j=VU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E0DC7618B
	for <linux-next@archiver.kernel.org>; Tue, 23 Jul 2019 11:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69D5821901
	for <linux-next@archiver.kernel.org>; Tue, 23 Jul 2019 11:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="eoGa41rQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729895AbfGWLGa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 23 Jul 2019 07:06:30 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:53081 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbfGWLGa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jul 2019 07:06:30 -0400
Received: by mail-wm1-f44.google.com with SMTP id s3so38078149wms.2
        for <linux-next@vger.kernel.org>; Tue, 23 Jul 2019 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AwppdfGC22SEVCQI9uUyAw9LfRf2ZUMv8hUjA1LQx5s=;
        b=eoGa41rQHVVLT9mneBKTUUSAKcvfshyfSKdbKYiHjqTTiSMy/anLx6H7/ewIjyABGy
         8mfJcyPg1Jvwdos1AUKLGnZj9nUVNLPnh2Pn6pOwlOHGotptq7iuJuUMquVWGZ0LYSne
         46rtb71x92qk4TTmdZyi7wgeVGBBmNzX+zM0qr5kziGvQjwzNksMrGfaDV90K+C6t4w4
         HYuz8f2Zr49hmDMtrFSasbdcQ7bAmZrM2bj9yDeOC5lRy2XlukZ8C+vhR48OXXs0e7j9
         d71Q+5M3LnSohKCIpTMIbra25S42y4gdL0bvlD/sDR0u18qHhtui6rLq3R8cd7doV5Uf
         KNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AwppdfGC22SEVCQI9uUyAw9LfRf2ZUMv8hUjA1LQx5s=;
        b=npwmSHIg2nx5y0QMPgA3ZhJxXJ9FSgjP8KsQBsrWxMfUifq3zxuXFFGfZaiyDBMEOO
         S/zmDUsOqhOQhvp16Z+gPQnBj9z1S/M84tVXQaTgLcGazS0oR2rVuTvSrMfsU+l5f/D4
         u+pjMPDU/5osksyfxlHCfy3RJuawebyzxal6KDoUnz6HJFZ7UmZV0UoyMJ9bKyDTXf1d
         yaSqEwg/RDPGtoD8ouQwnOArpHOdFQ1axdrrgYjfTLdhGP0jy+KpfEZuQSfQKtEEXRAs
         uISlyJ1155agS+aX0Ry0J50oy35y54kha5sOP5LqgH5R1hnCFtKcWORP0ENvM0MhMDCC
         wQDQ==
X-Gm-Message-State: APjAAAVhjZmulF7PskRG67OTivvmbREyrFhxZmd1r6CozAsRJlKWNFv6
        EoH8nqcfcz5x111Nz1L2Mr0jJdML9Ms=
X-Google-Smtp-Source: APXvYqxdqGXP5Hm+qJD7RfRTLLYETesWEUA541q0kShlKt9jhXFHQvtG/qH7V+A/t/mQuvbE3Dnruw==
X-Received: by 2002:a1c:a6d3:: with SMTP id p202mr70262008wme.26.1563879988477;
        Tue, 23 Jul 2019 04:06:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c7sm35592477wro.70.2019.07.23.04.06.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 04:06:27 -0700 (PDT)
Message-ID: <5d36ea33.1c69fb81.cda74.12b8@mx.google.com>
Date:   Tue, 23 Jul 2019 04:06:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc1-254-g9719e17bb9e9
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 213 boots: 10 failed,
 200 passed with 3 offline (v5.3-rc1-254-g9719e17bb9e9)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 213 boots: 10 failed, 200 passed with 3 offline (v=
5.3-rc1-254-g9719e17bb9e9)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc1-254-g9719e17bb9e9/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc1-254-g9719e17bb9e9/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc1-254-g9719e17bb9e9
Git Commit: 9719e17bb9e9ddc1ecb1e3fca8cdf099a3de4e68
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 82 unique boards, 28 SoC families, 22 builds out of 222

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 27 days (last pass: v5.2-=
rc6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

    qcom_defconfig:
        gcc-8:
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 6 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)
          qcom-apq8064-ifc6410:
              lab-baylibre-seattle: failing since 6 days (last pass: v5.2-8=
586-gf96c1aec6d0e - first fail: v5.2-11081-g48f391c6cc7e)

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

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
