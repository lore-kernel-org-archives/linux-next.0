From: Jesper Nilsson <Jesper.Nilsson@axis.com>
Subject: Re: linux-next: cris build failure
Date: Tue, 21 Apr 2009 08:06:23 +0200
Message-ID: <20090421060623.GP21811@axis.com>
References: <20090421135843.0993cb89.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from miranda.se.axis.com ([193.13.178.8]:54036 "EHLO
	miranda.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbZDUGGd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2009 02:06:33 -0400
Content-Disposition: inline
In-Reply-To: <20090421135843.0993cb89.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Tue, Apr 21, 2009 at 05:58:43AM +0200, Stephen Rothwell wrote:
> Hi Jesper, 
> 
> Having figured out that I needed a crisv32 compiler (not a cris one) to
> build the kernel, I now get this error:
> 
>   LD      arch/cris/arch-v32/boot/rescue/rescue.o
> /bin/sh: gcc-cris: command not found
> make[3]: *** [arch/cris/arch-v32/boot/rescue/rescue.o] Error 127
> 
> arch/cris/arch-v32/boot/rescue/Makefile has an explicit reference to
> gcc-cris.  Surely there is some better way specify this.  I created a
> symlink for gcc-cris to my crisv32 cross compiler and that allowed the
> kernel to finish building, but that is not a very nice solution.

Yes, you are quite correct. I have been working (albeit slowly)
at removing all non-standard commands and port specific symlinks,
and I have a patch that folds the boot code for both v32 and v10
into the same directory. That patch also removes the gcc-cris usage.

I'll push that out to my for-next branch asap.

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
