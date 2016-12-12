From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: linux-next: build warning after merge of the clk tree
Date: Mon, 12 Dec 2016 09:05:21 +0100
Message-ID: <20161212090521.0450504e@bbrezillon>
References: <20161212083944.5b6f2b54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54221 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbcLLIFh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Dec 2016 03:05:37 -0500
In-Reply-To: <20161212083944.5b6f2b54@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>

+Eric

Hi Stephen,

On Mon, 12 Dec 2016 08:39:44 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the clk tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/clk/bcm/clk-bcm2835.c: In function 'bcm2835_clock_determine_rate':
> drivers/clk/bcm/clk-bcm2835.c:1069:18: warning: 'best_rate' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   *prate = curdiv * best_rate;
>                   ^
> drivers/clk/bcm/clk-bcm2835.c:1032:16: note: 'best_rate' was declared here
>   unsigned long best_rate;
>                 ^
> 
> Introduced by commit
> 
>   155e8b3b0ee3 ("clk: bcm: Support rate change propagation on bcm2835 clocks")
> 

Thanks for the report (I just sent a patch fixing this warning).
May I ask which toolchain you're using, because my gcc failed to detect
this uninitialized variable (and this is not the first time I have this
problem).

Regards,

Boris
