Return-Path: <SRS0=ROA6=UT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E5BC43613
	for <linux-next@archiver.kernel.org>; Thu, 20 Jun 2019 16:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4F192085A
	for <linux-next@archiver.kernel.org>; Thu, 20 Jun 2019 16:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="UGnmmnFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfFTQmR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 20 Jun 2019 12:42:17 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:54491 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfFTQmQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2019 12:42:16 -0400
Received: by mail-wm1-f51.google.com with SMTP id g135so3722159wme.4
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2019 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aVVARl+PJWiEixXNhzypuF4Ycp9H/zLHWfF671TJGd0=;
        b=UGnmmnFv57Yi+snyTKTWYPScZBW3uTU+1Quwq7VBDD9UUWu5ao9bPZ3PTVjl+iQMwj
         VtgHrOHxVIMg7k/uPeNLl8+RMRG4z1XasTj8xCBUeQXTK+ik368QZg9ktIpIaGbkvqcp
         FsJjUYAVLZvgE129BG+CVbEQpDtDwu92vi+gx++ngD9JXh4GbGv4Jr3OWiy4dg1Xi8GG
         zZlGvRiTUjdY96CqBylXrEXj9O/LS4h59vaZZF4wb7km8pHUtX4Ps35wFkPObhe2O7LC
         T7sOkAGhhEkeIiJVkcQjSAKRd+xHIMpHW5OiDrZXu7jLM4sxXYpaGR3LuTZ+btt2/5h5
         iRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aVVARl+PJWiEixXNhzypuF4Ycp9H/zLHWfF671TJGd0=;
        b=bYaNjBZx3W9VmgyU3fDbjEdoAPYUq+lHl7oP8O8GLQkSEJIKOZiLfLWKmRa8C14qum
         A4yvxHJA1054RctLVpgk+Bjz0pVi/uT3PH7LalfK4PMSSX5kJlmFv6pOmjFHBYJZzdh9
         164ExtZe1QYfxbPk+AfMAZZs+gJI9WqKywUKSY0LHPx1b8hRvHpdY4djpde7RRZ4WmPx
         gT0fdw30HcOll+81NTdmHrkTUp/lmX/AwzkJzbXw5V0KfT4Euht5oTD0jNvaIymfvqfS
         qOhQtDGR/qgymY+/vRH3eb9EZiLIzSARm3cFssj5ieHVO5kTKlT7ss1KGn9BrPccckzb
         avcg==
X-Gm-Message-State: APjAAAXYXA2uRwZ4OE+5Yl/K5BY+zkcV+OD+kjol1D6ScxZ5lutlA9go
        6f6NA7+zgwLhYQH99UZAiFxgn96VuYmHAQ==
X-Google-Smtp-Source: APXvYqzv8kbhXwZs28gqKigD0+qKO3G+g5sqxyWRqs/6pnoWAo/FWLJtDpLW2pHI6q8qbCaklpU3Ww==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr365695wme.12.1561048934749;
        Thu, 20 Jun 2019 09:42:14 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h23sm25212wmb.46.2019.06.20.09.42.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 09:42:13 -0700 (PDT)
Message-ID: <5d0bb765.1c69fb81.f8ff5.025a@mx.google.com>
Date:   Thu, 20 Jun 2019 09:42:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20190620
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 65 boots: 1 failed, 64 passed (next-20190620)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 65 boots: 1 failed, 64 passed (next-20190620)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190620/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190620/

Tree: next
Branch: master
Git Describe: next-20190620
Git Commit: dc636f5d78de487ec493a9cc455c9eb595749470
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 24 unique boards, 12 SoC families, 10 builds out of 230

Boot Regressions Detected:

arm:

    qcom_defconfig:
        gcc-8:
          qcom-msm8974-sony-xperia-castor:
              lab-bjorn: failing since 1 day (last pass: next-20190617 - fi=
rst fail: next-20190618)

Boot Failure Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-msm8974-sony-xperia-castor: 1 failed lab

---
For more info write to <info@kernelci.org>
