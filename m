From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Wed, 25 Jun 2008 18:29:23 +0200
Message-ID: <20080625162923.GB6040@elte.hu>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au> <20080625071508.GA20454@elte.hu> <20080626015918.71a6b4d7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:36951 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760900AbYFYQ3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 12:29:43 -0400
Content-Disposition: inline
In-Reply-To: <20080626015918.71a6b4d7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Wed, 25 Jun 2008 09:15:08 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > I suspect we cannot really eliminate this particular conflict 
> > because the latter change is a (much welcome!) infrastructure 
> > cleanup in all things ACPI, the former is an early init 
> > refactoring/cleanup that depends on a whole lot of other (non-ACPI) 
> > changes in tip/x86/*. It's too late in .26-rc cycle to push the 
> > infrastructure cleanup upstream, so i suspect we have to live with 
> > this conflict for a while.
> 
> No problem.  How long can it be until all this is merged in Linus' 
> tree anyway? :-)

if Len acks these patches i can do a by-line mini-topic with just these 
commits and put them into tip/auto-x86-next. It's Len's call though :-)

	Ingo
