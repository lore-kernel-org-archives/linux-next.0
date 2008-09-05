From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Fri, 5 Sep 2008 18:00:07 +0200
Message-ID: <20080905160007.GK10292@elte.hu>
References: <20080903105755.d70e9f0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39293 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752336AbYIEQAb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Sep 2008 12:00:31 -0400
Content-Disposition: inline
In-Reply-To: <20080903105755.d70e9f0b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict in
> include/asm-x86/statfs.h between commit
> e4e2079e475520e02f55f0b225fc044e39a357e0 ("x86_64: Use
> <asm-generic/statfs.h>") from the dwmw2 tree and commit
> 77ef50a522717fa040636ee1017179ceba12ff62 ("x86: consolidate header
> guards") from the x86 tree.
> 
> Trivial fix (see below).  I can carry it.

thanks Stephen!

Since e4e2079e is part of the multi-platform statfs.h cleanups in 
David's tree i guess we'll have to carry the conflict along for a while.

	Ingo
