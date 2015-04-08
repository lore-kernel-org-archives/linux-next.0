From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 8 Apr 2015 13:46:26 -0700
Message-ID: <20150408134626.0de0d209e49d3911d46228d5@linux-foundation.org>
References: <20150408184954.1356280d@canb.auug.org.au>
	<20150408151350.GA8490@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59462 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753905AbbDHUq1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Apr 2015 16:46:27 -0400
In-Reply-To: <20150408151350.GA8490@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>

On Wed, 8 Apr 2015 17:13:51 +0200 Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Andrew,
> > 
> > Today's linux-next merge of the akpm tree got a conflict in
> > arch/x86/kernel/cpu/common.c between commit 6b51311c9765
> > ("x86/asm/entry/64: Use a define for an invalid segment selector") from
> > the tip tree and commit f28c11e4b695 ("arch/x86/kernel/cpu/common.c:
> > fix warning") from the akpm tree.
> 
> So f28c11e4b695 doesn't appear to be in linux-next as fetched a minute 
> ago:
> 
>  triton:~/linux.trees.git> git log f28c11e4b695 --
>  fatal: bad revision 'f28c11e4b695'
>  triton:~/linux.trees.git> git describe
>  next-20150408
> 
> How am I supposed to fetch and interpret such sha1's?

Stephen didn't include the -mm patch so I guess that ID never was
included in -next.

For -mm patches the place to bookmark is
http://ozlabs.org/~akpm/mmotm/broken-out/.

This:
http://ozlabs.org/~akpm/mmotm/broken-out/arch-x86-kernel-cpu-commonc-fix-warning.patch

It sounds like the warning has now been fixed.
