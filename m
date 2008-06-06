From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 12:10:22 +0200
Message-ID: <20080606101016.GC9490@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu> <20080606002957.6329a0ec.akpm@linux-foundation.org> <20080606024811.70db9ab2.akpm@linux-foundation.org> <20080606025413.3772f21e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:36868 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753580AbYFFKKl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 06:10:41 -0400
Content-Disposition: inline
In-Reply-To: <20080606025413.3772f21e.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Travis <travis@sgi.com>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> > Author: Mike Travis <travis@sgi.com>  2008-05-12 12:21:13
> > Committer: Thomas Gleixner <tglx@linutronix.de>  2008-05-23 09:08:00
> > Parent: a9ad585c8a18f7ba754b85f5786976609b9d7d29 (x86: remove the static 256k node_to_cpumask_map)
> > Branch: 
> > Follows: v2.6.26-rc2
> > Precedes: next-20080526
> 
> 29657a44f8660acd8751d7e9f5aac06ec8633481
>    x86: cleanup early per cpu variables/accesses v4

hm, these commits have not caused problems in testing before. Mike 
Cc:-ed.

	Ingo
