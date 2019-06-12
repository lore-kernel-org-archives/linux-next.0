Return-Path: <SRS0=4G8J=UL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1F6C31E46
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 15:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F119C208CA
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 15:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439906AbfFLPCu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 12 Jun 2019 11:02:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46590 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408269AbfFLPCu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jun 2019 11:02:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 73A4B260D9A
Subject: Re: next/master baseline: 278 tests, 0 regressions (next-20190612)
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <5d00ff67.1c69fb81.878d4.023d@mx.google.com>
Cc:     kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <b42f62a3-44aa-5963-3ae5-6e922c7d1300@collabora.com>
Date:   Wed, 12 Jun 2019 16:02:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5d00ff67.1c69fb81.878d4.023d@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/06/2019 14:34, kernelci.org bot wrote:
> next/master baseline: 278 tests, 0 regressions (next-20190612)
> 
> Test results summary
> --------------------
> 
>   Test:    baseline
>   Tree:    next
>   Branch:  master
>   Kernel:  next-20190612
>   URL:     git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Commit:  81a72c79224f83af18e26dc0c599f917312e6c78
> 
> 
> 1  | rk3399-gru-kevin       | gcc-8    | arm64 |  78 total:  78 PASS   0 FAIL   0 SKIP
> 2  | rk3399-gru-kevin       | gcc-8    | arm64 |  78 total:  78 PASS   0 FAIL   0 SKIP
> 3  | rk3288-veyron-jaq      | gcc-8    | arm   |  61 total:  60 PASS   1 FAIL   0 SKIP
> 4  | rk3288-veyron-jaq      | gcc-8    | arm   |  61 total:  60 PASS   1 FAIL   0 SKIP  
>   
>   
>     
> 
> Test failures
> ------------- 
> 3  | rk3288-veyron-jaq      | gcc-8    | arm   |  61 total:  60 PASS   1 FAIL   0 SKIP
> 
>   Config:      multi_v7_defconfig
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Lab Name:    lab-collabora
>   Plain log:   https://storage.kernelci.org//next/master/next-20190612/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20190612/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
>   Rootfs:      https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-2-gefc755ba4a02/armel/baseline/rootfs.cpio.gz
>       
> 
>     bootrr - 61 tests: 60  PASS, 1 FAIL, 0 SKIP
>       * rk3x-i2c5-probed: never passed   

It says it never passed, but it's passing in mainline.  So this
failure is not reported as a regression here because the baseline
test plan was enabled very recently and this never passed in
linux-next indeed.

In other words, this does look like a regression that's about to
get merged into mainline.  Probably worth a look?

Guillaume

