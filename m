From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the sh tree
Date: Mon, 25 Jul 2016 14:16:40 +1000
Message-ID: <20160725141640.4ee60f1f@canb.auug.org.au>
References: <20160724151342.32b35c80@canb.auug.org.au>
	<20160725035503.GQ15995@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55489 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbcGYEQm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jul 2016 00:16:42 -0400
In-Reply-To: <20160725035503.GQ15995@brightrain.aerifal.cx>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rich,

On Sun, 24 Jul 2016 23:55:03 -0400 Rich Felker <dalias@libc.org> wrote:
>
> On Sun, Jul 24, 2016 at 03:13:42PM +1000, Stephen Rothwell wrote:
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >   arch/sh/include/asm/spinlock.h
> > 
> > between commit:
> > 
> >   2da83dfce7df ("sh: add J2 atomics using the cas.l instruction")
> > 
> > from the sh tree and commit:
> > 
> >   726328d92a42 ("locking/spinlock, arch: Update and fix spin_unlock_wait() implementations")
> > 
> > from the tip tree.
> > 
> > I fixed it up (I used this file from the sh tree and then added the merge
> > fix patch below) and can carry the fix as necessary. This is now fixed
> > as far as linux-next is concerned, but any non trivial conflicts should
> > be mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.  
> 
> Assuming the J2 SMP changes go upstream this merge window, should I
> simply cite this conflict and your patch when sending the pull request
> to Linux, or include the merge fix patch myself?

Just mention it to Linus.
-- 
Cheers,
Stephen Rothwell
