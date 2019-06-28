Return-Path: <SRS0=YJ6U=U3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58697C4321A
	for <linux-next@archiver.kernel.org>; Fri, 28 Jun 2019 21:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19341208C4
	for <linux-next@archiver.kernel.org>; Fri, 28 Jun 2019 21:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="pFpUHP78"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfF1VBL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 28 Jun 2019 17:01:11 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:40729 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfF1VBL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jun 2019 17:01:11 -0400
Received: by mail-wr1-f42.google.com with SMTP id p11so7579607wre.7
        for <linux-next@vger.kernel.org>; Fri, 28 Jun 2019 14:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KtuIGwDUpEE132n7/pUtQvpnit8PhX51RnaxEbUmyPo=;
        b=pFpUHP78ANBx+usGSK92Xvo82qr+lEjfliHZMds709GbQB6rk7ZvtY68wRqIARs9F3
         4fe1nHk2W/AtwUbObkmcrK2HBk1o+8h4dBkPYWPxybtyfOvnk447Sgpm8qFkN12XRVMf
         XtnpimuZokoVpjI6Ygy7xnJF2Rl8btSCS6490nWQ8p3viXFUXy/1O5U+TGeVq0xpS07S
         cYRFQCLFTUOMZb5vWCyxJJ22oB35bGGg/FhJfsBV/tFIAniKRD++aU/M3sq+IPRNhWyU
         gNdUKqZNBzijN4wWoEsrolC4svsjvAlEBMRPpJF3q44XOJm9VcNVJxBVox8HtIOyRkaK
         e+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KtuIGwDUpEE132n7/pUtQvpnit8PhX51RnaxEbUmyPo=;
        b=ntbfOKjcu1o+wByh8ttZJOo2gvWUNLJfB0EZ9sL5LCpSmJLinLTE5NaUepD1eXKVo4
         qGTGOoG5L2WR36MzXIHxWTKin08Z/1UV6Qx7u0dA8MBka0eAoftRqUFLFDikPuuNwNAJ
         NqwVAqgOL835r4IbXS3G/6HclSV41jShWZRrFG1vEG6rJKl4Ym+GPhbw3QaWBaGa5KIX
         1mtCZ2K/ZV7rGurLcg5EN3a9mI79JltGVJvikfnGlVGxpWUPLz5SMEt347Yt2Tud+klP
         w3gi9JgraYi5To8DEKEAUNMMvWJui/1QLhIk9OjtMki2AQOWVVP26DmOK0fN2XcU2rxZ
         /fWA==
X-Gm-Message-State: APjAAAUInSY2qJ7UmPXyCb32f/B/mhXZdIHSSiDD9m7WRQHAI5GR4M/1
        J3+RHmphrZ5OdrPKeb8dCh7Z3M6iz23pJQ==
X-Google-Smtp-Source: APXvYqyR5sEncKxAfKa77/IPJVOV6jFCxFD5jh7WvTgv4JE358DrHqvWsSYFwCm5wehROSpeQntqig==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr9173032wrn.342.1561755668818;
        Fri, 28 Jun 2019 14:01:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j189sm3562800wmb.48.2019.06.28.14.01.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 14:01:07 -0700 (PDT)
Message-ID: <5d168013.1c69fb81.17212.58df@mx.google.com>
Date:   Fri, 28 Jun 2019 14:01:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc6-190-gd8fb83281cfd
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 242 boots: 5 failed,
 236 passed with 1 untried/unknown (v5.2-rc6-190-gd8fb83281cfd)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 242 boots: 5 failed, 236 passed with 1 untried/unk=
nown (v5.2-rc6-190-gd8fb83281cfd)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc6-190-gd8fb83281cfd/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc6-190-gd8fb83281cfd/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc6-190-gd8fb83281cfd
Git Commit: d8fb83281cfd7506390190a416beeac4c8f66833
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 26 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 3 days (last pass: v5.2-r=
c6-99-g690c98f37a5e - first fail: v5.2-rc6-130-gddc352bc91de)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            armada-xp-openblocks-ax3-4: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-bananapi: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

---
For more info write to <info@kernelci.org>
