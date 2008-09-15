From: Roland McGrath <roland@redhat.com>
Subject: Re: linux-next: manual merge of the sparseirq tree
Date: Mon, 15 Sep 2008 11:35:10 -0700 (PDT)
Message-ID: <20080915183511.1B510640A3@pipsqueak.localdomain>
References: <20080916011904.1e53d750.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:33151 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752749AbYIOSfj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 14:35:39 -0400
In-Reply-To: Stephen Rothwell's message of  Tuesday, 16 September 2008 01:19:04 +1000 <20080916011904.1e53d750.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Markus Metzger <markus.t.metzger@intel.com>, Thomas Gleixner <tglx@linutronix.de>

The ioperm patch (tip/x86/ptrace) adds the new ioperm_* functions, which
could go anywhere in the file (before the *_regsets[] decls).  It might be
simplest to just change the patch to put them earlier or later where the
patch text is not near the lines touched by BTS patches.


Thanks,
Roland
