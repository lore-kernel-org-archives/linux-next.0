From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 19:15:11 +0200
Message-ID: <20080606171511.GC18524@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu> <20080606002957.6329a0ec.akpm@linux-foundation.org> <20080606024811.70db9ab2.akpm@linux-foundation.org> <20080606035413.37f340ef.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55344 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753956AbYFFRP1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 13:15:27 -0400
Content-Disposition: inline
In-Reply-To: <20080606035413.37f340ef.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Travis <travis@sgi.com>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> 	    x86: remove the static 256k node_to_cpumask_map
> 
> crash, as described earlier.
> 
> I don't know what happened to that early exception - it didn't come back.

hm, early exception, there's one commit i can think of right now:

 # tip/x86/xen: b20aecc: xen: fix early bootup crash on native hardware

but that got propagated to linux-next:

 # linux-next: b20aecc: xen: fix early bootup crash on native hardware

	Ingo
