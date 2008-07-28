From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Mon, 28 Jul 2008 11:06:35 +0200
Message-ID: <20080728090635.GB5732@elte.hu>
References: <20080728140917.fd7769c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:56348 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363AbYG1JGr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 05:06:47 -0400
Content-Disposition: inline
In-Reply-To: <20080728140917.fd7769c3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the kmemcheck tree got a conflict in 
> mm/slab.c between commit 51cc50685a4275c6a02653670af9f108a64e01cf 
> ("SL*B: drop kmem cache argument from constructor") from Linus' tree 
> and commit c9506812f317bca0edcbc717c8fdabdd1d0a264b ("slab: move 
> struct kmem_cache to headers") from the kmemcheck tree.
> 
> The former changed the ctor field of the structure that the latter 
> moved to a different file.  I fixed it up in its new location.

Thanks Stephen. I have done the same merge fixup yesterday in tip/master 
and pushed it out today into tip/auto-kmemcheck-next. The conflict 
should disappear on your next integration run.

	Ingo
