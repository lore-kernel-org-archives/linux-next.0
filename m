Return-Path: <SRS0=ROA6=UT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5C5C43613
	for <linux-next@archiver.kernel.org>; Thu, 20 Jun 2019 16:58:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91EB22070B
	for <linux-next@archiver.kernel.org>; Thu, 20 Jun 2019 16:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="yfYfB9+5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFTQ61 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 20 Jun 2019 12:58:27 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:41120 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfFTQ61 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2019 12:58:27 -0400
Received: by mail-wr1-f42.google.com with SMTP id c2so3761805wrm.8
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2019 09:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jtIWJUMM+bByoYstZhibQZ9+I8rOkuJPg1b0D7QbqaY=;
        b=yfYfB9+5xVoFiu2uuXQOOCv87PKQqId9LF8eotHIXuPKI8tbOL28PtckOY9p1MMvW3
         IjQ/wW+S23DEgZqo9W24P44KUE4RYFeJdzd90uipnZeWt0l3PKrYCV4/fFi5MHYDj7A7
         dXfnLUtafd2rg8LgwpyXsgxNagnxG2FHxOSkNdMjmbCmbI4TX46ZmZdGU1zq/YgcglMq
         2DxN+WkeMOQRy5HrmYH4CUJ+vjts4Lz+3F3pnokU/gMRf9lU34qJeLchzfPi+MVuSt0W
         vAKl2S+qKL4+0IhsjIL9JxzSqr/7ma8mBjqmR9maeHHqvDjWgyDgJHYSiPad1rT2lPxf
         lY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jtIWJUMM+bByoYstZhibQZ9+I8rOkuJPg1b0D7QbqaY=;
        b=CkrvbY2a42XMHhlEqDQ3CSgLgl20BkCX4L8S8yBBU17ptYbIbyw22LD7jkql6D6Oh6
         8sy9jdyr8sh0EHRAo/vr8Q7hAr0wtPMWLSX4ZjTMcSmcHmxSDg6Pl8ttMXZoxyzMHMl8
         wkqgvS8YisihUYAws2BcFGoM6qj3zlj5jWpsJmCmsTdB1HO52OSdUyBA2QO29yWbIlsG
         UjKJCkargQV7K+HUmVVzcT68TZyw1JTzZX5xpV5MB089q0wJxKEXK3PUnlrO08Sfw6ay
         bZhFIuVRccERm+aRK0bk63DNHUKGJS7wneq41FOtTFj9HRonpHjSiudLzkCO4WySdLTx
         GxRw==
X-Gm-Message-State: APjAAAXQRbc4N2fwQrHH3a2NDcEFJ2xZx0lLCrC+csh96G3IzDtlaT7u
        QMe/rG3Y/KLIyZqiYO9pFsXO6gO1Sy15xA==
X-Google-Smtp-Source: APXvYqySzVhaxLZOEOfYQs03LT7DCd1a5WEUpfi+br7+ftI6FDnVtWV03iM8by8CzpFcMSrgFzdhwA==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr52311079wrm.55.1561049904692;
        Thu, 20 Jun 2019 09:58:24 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g71sm156023wmg.7.2019.06.20.09.58.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 09:58:24 -0700 (PDT)
Message-ID: <5d0bbb30.1c69fb81.13600.1130@mx.google.com>
Date:   Thu, 20 Jun 2019 09:58:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.2-rc5-413-gd10f6f2d3e41
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 120 boots: 1 failed,
 119 passed (v5.2-rc5-413-gd10f6f2d3e41)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 120 boots: 1 failed, 119 passed (v5.2-rc5-413-gd10=
f6f2d3e41)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.2-rc5-413-gd10f6f2d3e41/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.2-rc5-413-gd10f6f2d3e41/

Tree: next
Branch: pending-fixes
Git Describe: v5.2-rc5-413-gd10f6f2d3e41
Git Commit: d10f6f2d3e4102b57d7d01d149622ad46c382ff7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 42 unique boards, 17 SoC families, 17 builds out of 223

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.2-rc5-374-gae1b7dafe=
f4c)

Boot Failure Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

---
For more info write to <info@kernelci.org>
