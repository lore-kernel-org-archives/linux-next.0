From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sparseirq tree
Date: Wed, 17 Sep 2008 12:20:45 +0200
Message-ID: <20080917102045.GA18764@elte.hu>
References: <20080916011904.1e53d750.sfr@canb.auug.org.au> <20080915183511.1B510640A3@pipsqueak.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:38738 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751788AbYIQKVK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 06:21:10 -0400
Content-Disposition: inline
In-Reply-To: <20080915183511.1B510640A3@pipsqueak.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Markus Metzger <markus.t.metzger@intel.com>, Thomas Gleixner <tglx@linutronix.de>


* Roland McGrath <roland@redhat.com> wrote:

> The ioperm patch (tip/x86/ptrace) adds the new ioperm_* functions, 
> which could go anywhere in the file (before the *_regsets[] decls).  
> It might be simplest to just change the patch to put them earlier or 
> later where the patch text is not near the lines touched by BTS 
> patches.

yeah - but these are old commits, we better not upset them.

I've carried that conflict fixup for a long time and made it visible 
because i updated sparseirq tree to propagate a fix but the x86 tree for 
linux-next was at an older version (with PEBS topic not integrated yet) 
- so Stephen got to see this conflict.

It should disappear on the next integration run this week. (the 
frequency of integration runs is weekly - the frequency of bugfix/hotfix 
propagation is daily/hourly)

Thanks Stephen for taking care of it.

	Ingo
