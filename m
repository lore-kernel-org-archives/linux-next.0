From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 22 Jan 2016 14:03:12 +1100
Message-ID: <20160122140312.1587dd03@canb.auug.org.au>
References: <20151231232210.7ab890f1@canb.auug.org.au>
	<20160114151541.17e76d23@canb.auug.org.au>
	<20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
	<20160116100047.681e0e03@canb.auug.org.au>
	<20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
	<s5h4meductq.wl-tiwai@suse.de>
	<s5hmvs0uytw.wl-tiwai@suse.de>
	<20160121073859.3a6c22a3@canb.auug.org.au>
	<20160122112442.75c07aac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57864 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751249AbcAVDDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2016 22:03:14 -0500
In-Reply-To: <20160122112442.75c07aac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>

Hi all,

On Fri, 22 Jan 2016 11:24:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Thu, 21 Jan 2016 07:38:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Wed, 20 Jan 2016 15:09:47 +0100 Takashi Iwai <tiwai@suse.de> wrote:  
> > >
> > > On Sat, 16 Jan 2016 09:51:29 +0100,
> > > Takashi Iwai wrote:    
> > > > 
> > > > There are a few ways to fix this, but all are not comfortable.
> > > > 
> > > > A. Disable compress API for powerpc.    
> > 
> > This also affects alpha, mips and (maybe) sparc.  
> 
> This was exposed on PowerPC by commit bf76f73c5f65 ("powerpc: enable
> UBSAN support") which is in Linus' tree as of this morning.  The only
> relevant change that made was in the compiler flags (I tested this by
> building the file without that commit but with these new compiler flags:
> 
> -fsanitize=shift -fsanitize=integer-divide-by-zero
> -fsanitize=unreachable -fsanitize=vla-bound -fsanitize=null
> -fsanitize=signed-integer-overflow -fsanitize=bounds
> -fsanitize=object-size -fsanitize=returns-nonnull-attribute
> -fsanitize=bool -fsanitize=enum -fsanitize=alignment
> 
> The preprocessed file is the same in both cases, but with these flags
> the compiler errors.

I have discussed this with the PowerPC maintainer (Michael) and he
figured out why the compiler does not produce an error (normally).  It
is because this driver is using _IOC_NR(xxx) to match ioctls instead of
the full ioctl number.  Because of that, the compiler can figure out
that it does not care about the undefined reference to
__invalid_size_argument_for_IOC that the size check shouold generate
(since _IOC_NR shifts and masks it out).

So, the switch statement in snd_compr_ioctl() should be rewritten to
check against the full ioctl number (since currently it could
theoretically match any number of ioctls, not just the relevant ones).
And then something needs to be done about the very large structure
being passed.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
