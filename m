From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio-lw tree
Date: Mon, 21 Jan 2013 14:20:13 +0800
Message-ID: <20130121062011.GC2272@S2100-06.ap.freescale.net>
References: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
 <20130118080211.GA8706@S2101-09.ap.freescale.net>
 <20130119104045.80e588ed651f40d8c567b7d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]:52091 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750699Ab3AUFvg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jan 2013 00:51:36 -0500
Content-Disposition: inline
In-Reply-To: <20130119104045.80e588ed651f40d8c567b7d6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jan 19, 2013 at 10:40:45AM +1100, Stephen Rothwell wrote:
> Hi Shawn,
> 
> On Fri, 18 Jan 2013 16:02:13 +0800 Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > My bad, sorry for that.  I just sent a v2 in reply to this message
> > for fixing the error.  I spent some time trying to install a ppc64
> > toolchain for testing, but unfortunately with on luck.  So Stephen,
> > I have to rely on linux-next to give it a test again.  Thanks.
> 
> Cross compilers suitable for building kernels are available at
> http://www.kernel.org/pub/tools/crosstool/ .

Thanks for the link, Stephen.  I installed the compiler and verified
that the v2 fixes the error.

Shawn
