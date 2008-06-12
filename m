From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip-core merge conflict
Date: Thu, 12 Jun 2008 16:10:22 +0200
Message-ID: <20080612141022.GA28001@elte.hu>
References: <20080610120857.042ea0f1.sfr@canb.auug.org.au> <20080610190434.GC15983@uranus.ravnborg.org> <20080611095226.f798bb6a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:40063 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754981AbYFLOKl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 10:10:41 -0400
Content-Disposition: inline
In-Reply-To: <20080611095226.f798bb6a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > I have dropped the offending commit from kbuild.git for now. It will 
> > be applied late in the merge window.
> 
> OK, thanks.  However, I am more than happy to carry these trivial 
> merge fixes (and Linus does these fixes all the time) so if you want 
> to keep this sort of thing in your tree, that's OK.  The reason I 
> report them is that I try to report everything.

i think it might be a communications issue - as conflicts are not a 
problem per se, they are just a complication that you resolve.

So it might make sense to change the subject line of your merge 
resolution mails from:

  linux-next: tip-core merge conflict

to:

  linux-next: manual merge of tip-core

that way people still stay informed about interactions between trees 
(and can reduce them when they are avoidable, and can check the result 
as well since it was done manually), but dont see it as some sort of 
failure that needs to be 'resolved' via dropping patches.

	Ingo
