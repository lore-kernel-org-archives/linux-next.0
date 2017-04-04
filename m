From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 4 Apr 2017 09:19:37 +0100
Message-ID: <20170404081937.npgk3cwx7bv5igzg@dell>
References: <20170404164453.677dc74a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:35231 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751101AbdDDITm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2017 04:19:42 -0400
Received: by mail-wr0-f169.google.com with SMTP id k6so198559630wre.2
        for <linux-next@vger.kernel.org>; Tue, 04 Apr 2017 01:19:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170404164453.677dc74a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, 04 Apr 2017, Stephen Rothwell wrote:

> Hi Lee,
> 
> After merging the mfd tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> /home/sfr/next/next/drivers/mfd/intel_soc_pmic_bxtwc.c:25:31: fatal error: asm/intel_pmc_ipc.h: No such file or directory
> 
> Caused by commit
> 
>   eb2a445f7d8f ("mfd: intel_soc_pmic: Fix a mess with compilation units")
> 
> I have reverted that commit for today.

Andy,

I'm pulling this commit.  Despite you thinking the error is unrelated
to your patch, something is clearly wrong and I don't have time to
investigate.

Ball is in your court.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
