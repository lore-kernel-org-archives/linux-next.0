Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CA5C433EF
	for <linux-next@archiver.kernel.org>; Fri,  5 Nov 2021 09:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A66C861220
	for <linux-next@archiver.kernel.org>; Fri,  5 Nov 2021 09:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbhKEJ1r (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Nov 2021 05:27:47 -0400
Received: from foss.arm.com ([217.140.110.172]:57440 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232546AbhKEJ1q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Nov 2021 05:27:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2A3E2F;
        Fri,  5 Nov 2021 02:25:06 -0700 (PDT)
Received: from [10.57.45.134] (unknown [10.57.45.134])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C7503F7B4;
        Fri,  5 Nov 2021 02:25:05 -0700 (PDT)
Subject: Re: linux-next: build failure in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20211105155457.770efec2@canb.auug.org.au>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <83c53b7b-611a-19fa-8779-ec223166a9fd@arm.com>
Date:   Fri, 5 Nov 2021 09:25:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211105155457.770efec2@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,


On 05/11/2021 04:54, Stephen Rothwell wrote:
> Hi all,
> 
> In Linus' tree, today's linux-next build (arm64 allmodconfig) failed
> like this:
> 
> ERROR: modpost: "this_cpu_has_cap" [drivers/hwtracing/coresight/coresight-trbe.ko] undefined!
> 
> Caused by commit
> 
>    8a1065127d95 ("coresight: trbe: Add infrastructure for Errata handling")
> 

Thanks for the report. We are aware of this issue and
a fix is queued, which should soon hit the trees.

[0] https://lkml.kernel.org/r/20211103221256.725080-1-suzuki.poulose@arm.com


Kind regards
Suzuki

