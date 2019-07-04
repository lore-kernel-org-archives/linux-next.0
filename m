Return-Path: <SRS0=xL23=VB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E08BC0651F
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 19:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEA8421738
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 19:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="bbI0E4Sw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfGDTs1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 4 Jul 2019 15:48:27 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:37809 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfGDTs1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jul 2019 15:48:27 -0400
Received: by mail-wr1-f43.google.com with SMTP id v14so7680245wrr.4
        for <linux-next@vger.kernel.org>; Thu, 04 Jul 2019 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AyaeFd66/gY85FlwImSi8q8w4aBYntDHIrcy9D5qvp0=;
        b=bbI0E4Swj32l2iHHQOL6gG2om92y19ErEehy5zlj7fkb6cMqRfN9CwejGL0bQj+EQg
         LYp1OShnFE03gCymPi5JGn1axC2LfA2rUiq4pFUqDnFBLz5mrGzoYjmZG/0p/CM7QAd+
         6+Kz+DdnPk4YnD+F3yMaVi6dSNZWE22f/Dw5IwOtL9FtuGiq9Vqby7SwH/ZgoEWPy1Ho
         NFL3x7TUwpg/IJq7dZ4+1bbBWK6/JyA6SxV3h/n+Dw8m91e1CbRcfImCHFLlqcn2atqk
         JgRQ5IhSPybcl9BHCQfS+ToXYw2lC95CVWWjfh+QDa7VBx4diY0gQt2Z9GN7otp4u9Il
         zKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AyaeFd66/gY85FlwImSi8q8w4aBYntDHIrcy9D5qvp0=;
        b=Q21CjenOFLgycNPfGsoI2jIznzz8BjTh1MCmZVDSkTQfEQJ35dpZ8m47YmYDKYmZ8s
         KOZuQrnZIg9qoqBBD2fyUWjWn1/ZGMsX+CZKY5zIbk5u98PY7MGH7NrPi8Xq+L4B+ykH
         iGfV4tXjSzMt5OH9+r4WowXLPFu+0GDMfllAbtAo0PzXQZ8Vn2HmzOMKbVF/6n+NHOTa
         9hMHEj8P9TR8qJ5Nq+3urOouZjfnRxmyAW8YYbwH/GMUvWBmvy4n4UDoAco/dizKFvji
         9JAqtF/bhNbo66Aoi7PcPqD7kloqL724D0MZhNtduACg5mG0zNhumxTDKMK12nEkxjHy
         a6gw==
X-Gm-Message-State: APjAAAXoGLkT4khPAQEmSwKFpQ54m++SbcfkTOUvMCVNq6gPvm7jjyaA
        zWERRChHOD1/2XDEq2looRbqCClBv7HN5w==
X-Google-Smtp-Source: APXvYqxfHV/8ww0sHjRKtYU1AlcLV0zfGGDUkc+1nF7KDpnSu2uv/HA5rHiXMbbdd6IpsGe2bwmybQ==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr149125wrv.247.1562269703411;
        Thu, 04 Jul 2019 12:48:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a2sm8450787wmj.9.2019.07.04.12.48.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 12:48:22 -0700 (PDT)
Message-ID: <5d1e5806.1c69fb81.82ee0.0f70@mx.google.com>
Date:   Thu, 04 Jul 2019 12:48:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc7-250-g820e56d05831
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 230 boots: 5 failed,
 224 passed with 1 conflict (v5.2-rc7-250-g820e56d05831)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 230 boots: 5 failed, 224 passed with 1 conflict (v=
5.2-rc7-250-g820e56d05831)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc7-250-g820e56d05831/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc7-250-g820e56d05831/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc7-250-g820e56d05831
Git Commit: 820e56d058310ac08c9290fd3b343dc255797d10
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 27 SoC families, 21 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 9 days (last pass: v5.2-r=
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
            stih410-b2120: 1 failed lab
            sun7i-a20-bananapi: 1 failed lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
