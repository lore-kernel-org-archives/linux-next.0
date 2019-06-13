Return-Path: <SRS0=xExw=UM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA76C31E45
	for <linux-next@archiver.kernel.org>; Thu, 13 Jun 2019 17:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66D6F20665
	for <linux-next@archiver.kernel.org>; Thu, 13 Jun 2019 17:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="DxuUwutO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfFMRBY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 13 Jun 2019 13:01:24 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:40650 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbfFMRBW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Jun 2019 13:01:22 -0400
Received: by mail-wm1-f45.google.com with SMTP id v19so10878278wmj.5
        for <linux-next@vger.kernel.org>; Thu, 13 Jun 2019 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VmCpFpPCCvtJa/wkXWp4fN0UNvlf9Z7fMUZA8WUNh5Y=;
        b=DxuUwutOzUkrsvCIiilWXwMiC036TC32UHTvmMpSWvvOqFk4dcxavdZJkgI2VAmrPf
         zkdPSFcnfeUI8PHifwyYw7A32dGd63XxbzSjWAjSVAdH5Id7W9cUK8oPDeOMaQ3ZWxKQ
         5yDAdmbSX/UHB3RvekVQeRPOHH2hnlS3kxuBDs4qbHWqKpqGvhqX9hDB58Ot9JFW3/QV
         SAuW933ZjnG07HKl9igPmvCfpMzxScXv4C3Wf1lVLltFDurfDvkqfGLaFktvCfvObWAT
         0Axmz/6PRj+XCUojK03LGUvkRS4O9hOw1/PwUEw8oJ2luf954PqfSkIwif5EO6z+DOmZ
         973Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VmCpFpPCCvtJa/wkXWp4fN0UNvlf9Z7fMUZA8WUNh5Y=;
        b=q46bqKNIbselHAo7vRovEaJgfaT1Roj5wyiQRrY6Vyhf6MY71Vb+2JicIuBClkBCaF
         DR83Vd4939zvzovIFi+weXm7cVyJpKFaAifq6aKfJmtiQYh96aMj0qc7rvOyhoA2Dqip
         KpFWpp2zXBq8q8U3NOErLdaNxwqWhkjLpOG8fUFmJF3HlukN92R6HH0tuBiP+Iwon5D3
         pLVtnCmnRkgbXjlRK7ys8l1mnsrvkopPzzSLaEBdzFUeT1gvWBTZRoJPqy2kEoUJJ+JK
         dt02S3d2DVzLm5KNdXlALua9CFLf7DXNCLHUzT+8EORjOuRdlOxpRc11GwhKbSrwSLNo
         pm8Q==
X-Gm-Message-State: APjAAAUd5cyFDpFGhwwQ92LgKnY/XRsY5AQcdACJvLu5I65VHfSe/DJB
        cJWHMhbwR0RSMO21bzaUSXxhud/MWSigTg==
X-Google-Smtp-Source: APXvYqywWVJ6dkmMUfb93s8hYDXXfO6oEHC42Mg7Xem9RTBho5l1FOy/s65RhacUGbP2rVh7K1JwOg==
X-Received: by 2002:a1c:7408:: with SMTP id p8mr4329866wmc.161.1560445280935;
        Thu, 13 Jun 2019 10:01:20 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r5sm411475wrg.10.2019.06.13.10.01.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 10:01:20 -0700 (PDT)
Message-ID: <5d028160.1c69fb81.bb633.2616@mx.google.com>
Date:   Thu, 13 Jun 2019 10:01:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc4-333-gafcfc783dad1
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 211 boots: 8 failed,
 201 passed with 2 untried/unknown (v5.2-rc4-333-gafcfc783dad1)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 211 boots: 8 failed, 201 passed with 2 untried/unk=
nown (v5.2-rc4-333-gafcfc783dad1)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc4-333-gafcfc783dad1/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc4-333-gafcfc783dad1/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc4-333-gafcfc783dad1
Git Commit: afcfc783dad1939a4cf73c53877b28a15a97f2db
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 80 unique boards, 24 SoC families, 20 builds out of 223

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.2-rc4-273-g26c91f14d=
441)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.2-rc4-273-g26c91f14d=
441)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.2-rc4-273-g26c91f14d441)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.2-rc4-273-g26c91f14d=
441)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.2-rc4-257-g875653b27=
b69)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: v5.2-rc4-257-g875653b27=
b69)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm4708-smartrg-sr400ac: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

---
For more info write to <info@kernelci.org>
