Return-Path: <SRS0=lqV3=UK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F706C4321A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 16:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 705522086A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 16:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="zW9WrGxS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391110AbfFKQ4g (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 12:56:36 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:41096 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390961AbfFKQ4f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jun 2019 12:56:35 -0400
Received: by mail-wr1-f52.google.com with SMTP id c2so13848109wrm.8
        for <linux-next@vger.kernel.org>; Tue, 11 Jun 2019 09:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ai/7/lGmgiaJFrTPBcnwh9D+PDobgIgNDqzZM2Zht38=;
        b=zW9WrGxSXK7GSZbGdAnpZkWbvQib919BtvuMSTb0QI1l12b5QdDGaPeclESdmVJbR3
         I+zZyvNcRvRjdZBIISNWU1UJqYKK2m6rsyeXVCelXKMA7zUbQGpZvmAlPpcyWkf7HCa+
         g+ZcbXmX5aONSTRvNGocLwuw+ZqfSPJdW0unmKO0Wa6o6yHE5wNMO8KMW5v5wAXWef8n
         GKyMIZ3GdnyZc5Kh3qwRXbk918qigtpfdhYt9CplvWqAAdHETpWkhaua6g7QwdRA8voG
         p3BlpHXxY/zqClIRPB0HNYo+nhv2sZYoKZ0hQAZcVhHx4ZRnJFD89CjRAdaCRAvLEM/E
         mLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ai/7/lGmgiaJFrTPBcnwh9D+PDobgIgNDqzZM2Zht38=;
        b=IowhkbY1mUdrPkB+6+Uo5bWOq6xLxm1co4/DwZLOcZ5PxBj3aaTv/YDRLNVsqheEq5
         VLGx4TRCVCkQoM6I5PAqt4bVY8Wgxqp/dGF6Cuw69UKn6/JkAOI9yB8h2RUP/ON74FGA
         /6eSlykQ7eMrasYIUeuTkqEDAkkNE8E5Jfo3i+HXQr67Cnjhd5w78osJrfSuEPTFXAEY
         bhXtFXjN0YZwvFEoOYSQ+T4M0JK7DfJTm6ns2L3NtXFPkYajkvM63rxNtwjjFyGkqJ9W
         FG9O6IjVKWunXS9+HhGvMcZx6qzas7fczgIr35axQVma3mCqpX/cuszxyWX2f12hw/oW
         TdwQ==
X-Gm-Message-State: APjAAAXLOqD7msnxDP/Zat4NYYc5ZjuDrtqN11im5vd3ZQ8AwN9A31Np
        tcVZam5YjmudO1iwz/7rWhFJ9BY8cBCqJw==
X-Google-Smtp-Source: APXvYqzr+L3n1PFZZ+eNFFBL86ITMH9CPHJzWJgKgqrtE2RM/HvT8m9yc2ZW3UI6nZJuTQHDmGgXEg==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr10474459wrm.55.1560272194059;
        Tue, 11 Jun 2019 09:56:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w14sm13850289wrk.44.2019.06.11.09.56.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 09:56:33 -0700 (PDT)
Message-ID: <5cffdd41.1c69fb81.efd26.eb8f@mx.google.com>
Date:   Tue, 11 Jun 2019 09:56:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc4-257-g875653b27b69
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 225 boots: 2 failed,
 219 passed with 1 offline, 3 conflicts (v5.2-rc4-257-g875653b27b69)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 225 boots: 2 failed, 219 passed with 1 offline, 3 =
conflicts (v5.2-rc4-257-g875653b27b69)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc4-257-g875653b27b69/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc4-257-g875653b27b69/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc4-257-g875653b27b69
Git Commit: 875653b27b6906637b965a13924ba06224bcd1ac
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 83 unique boards, 24 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 5 days (last pass: v5.2-r=
c3-298-gefd8de4f40d0 - first fail: v5.2-rc3-336-gfd5c57db249c)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 5 days (last pass: v5.2-r=
c3-298-gefd8de4f40d0 - first fail: v5.2-rc3-336-gfd5c57db249c)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre-seattle: failing since 5 days (last pass: v5.2-r=
c3-298-gefd8de4f40d0 - first fail: v5.2-rc3-336-gfd5c57db249c)

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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        meson-gxl-s905x-khadas-vim:
            lab-baylibre-seattle: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
