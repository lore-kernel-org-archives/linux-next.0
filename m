From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the oprofile tree
Date: Mon, 25 Aug 2008 11:13:41 +0200
Message-ID: <20080825091341.GB9114@elte.hu>
References: <20080825190822.591685e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45144 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756122AbYHYJOA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 05:14:00 -0400
Content-Disposition: inline
In-Reply-To: <20080825190822.591685e5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Robert Richter <robert.richter@amd.com>, Cyrill Gorcunov <gorcunov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Today's linux-next merge of the oprofile tree got a conflict in
> arch/x86/kernel/apic_32.c between commit
> 274cfe5912eebe9d4e1a4c451fe617289a181fcf ("x86: apic - rearrange
> functions and comments") from the x86 tree and commits
> 286f571837ba9d67625afd015366d79345abb414 ("x86: apic_*.c: add description
> to AMD's extended LVT functions"),
> 09691616850b3614dfb44790e1e1419b6a7f5d13 ("x86: apic: export symbols for
> extended interrupt LVT functions") and
> 6aa360e6c16c145edf1837690e0f7aaea6b86ef3 ("x86: apic: changing export
> symbols to *_GPL") from the oprofile tree.
> 
> The former moved some code that was updated by the latter.  I fixed it 
> up (see below) and can carry it.

thanks Stephen - conflict resolution looks good to me.

	Ingo
