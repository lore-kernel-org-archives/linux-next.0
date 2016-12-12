From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Mon, 12 Dec 2016 13:24:29 +1100
Message-ID: <20161212132429.0d948f4f@canb.auug.org.au>
References: <20161209133256.7e8a5ead@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751617AbcLLCYb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 21:24:31 -0500
In-Reply-To: <20161209133256.7e8a5ead@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>

Hi Mark,

On Fri, 9 Dec 2016 13:32:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the spi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/spi/spi-orion.c: In function 'orion_spi_baudrate_set':
> drivers/spi/spi-orion.c:192:8: error: 'sspr' undeclared (first use in this function)
>     if (sspr > 7)
>         ^
> 
> Caused by commit
> 
>   d9fc6452af47 ("spi: mvebu: fix baudrate calculation for armada variants")
> 
> I have used the spi tree from next-20161208 for today.

Still getting this.

-- 
Cheers,
Stephen Rothwell
