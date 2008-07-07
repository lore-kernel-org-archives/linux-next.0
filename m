From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip-core tree
Date: Mon, 7 Jul 2008 08:12:32 +0200
Message-ID: <20080707061232.GC16144@elte.hu>
References: <20080707131538.25a05c1c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41925 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751380AbYGGGMz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:12:55 -0400
Content-Disposition: inline
In-Reply-To: <20080707131538.25a05c1c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Arjan van de Ven <arjan@linux.intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip-core tree got a trivial conflict 
> in kernel/softlockup.c between commit 
> 3b7253238801a7b97b3929d8db2fa7a0721fb17b ("softlockup: print a module 
> list on being stuck") from Linus' tree (which also exists in the 
> tip-core tree) and commit 8d5be7f4e8515af461cbc8f07687ccc81507d508 
> ("softlockup: show irqtrace") from the tip-core tree.
> 
> It is just tha the latter change modifies the section of code modified 
> by the former.  I fixed it up and can carry the fix.

Thanks Stephen - this should be resolved by today's auto-core-next 
iteration as well. (which you'll pick up tomorrow-ish)

	Ingo
