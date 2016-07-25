From: Rich Felker <dalias@libc.org>
Subject: Re: linux-next: manual merge of the tip tree with the sh tree
Date: Sun, 24 Jul 2016 23:55:03 -0400
Message-ID: <20160725035503.GQ15995@brightrain.aerifal.cx>
References: <20160724151342.32b35c80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:59175 "EHLO
	brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585AbcGYD5P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 24 Jul 2016 23:57:15 -0400
Content-Disposition: inline
In-Reply-To: <20160724151342.32b35c80@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 24, 2016 at 03:13:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/sh/include/asm/spinlock.h
> 
> between commit:
> 
>   2da83dfce7df ("sh: add J2 atomics using the cas.l instruction")
> 
> from the sh tree and commit:
> 
>   726328d92a42 ("locking/spinlock, arch: Update and fix spin_unlock_wait() implementations")
> 
> from the tip tree.
> 
> I fixed it up (I used this file from the sh tree and then added the merge
> fix patch below) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Assuming the J2 SMP changes go upstream this merge window, should I
simply cite this conflict and your patch when sending the pull request
to Linux, or include the merge fix patch myself?

Rich
