From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 13:21:40 +0200
Message-ID: <20080627112139.GA20851@kernel.dk>
References: <20080627161347.0af905fb.sfr@canb.auug.org.au> <20080627083053.GC6562@elte.hu> <20080627084758.GR20851@kernel.dk> <20080627092626.GA496@elte.hu> <20080627095737.GA22123@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:12267 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753930AbYF0LVm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 07:21:42 -0400
Content-Disposition: inline
In-Reply-To: <20080627095737.GA22123@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>

On Fri, Jun 27 2008, Ingo Molnar wrote:
> 
> * Ingo Molnar <mingo@elte.hu> wrote:
> 
> > i'll put this into tip/generic-ipi and wont put into the x86 topics 
> > towards linux-next - i just want to see the effects in practice.
> > 
> > This is the 102th -tip topic, there's space for all :-)
> 
> Jens, i've started testing this in -tip - there are three small build 
> fixlets in the tip/generic-ipi branch so far.
> 
> If you dont have these fixes already then you can pull them from:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git generic-ipi

Fallout from since last I checked the entire tree I guess, thanks Ingo!

I'll just let them sit in your tree and only commit other changes to
mine, then I'll disable the ipi stuff from what Stephen pulls from my
git tree. OK?

-- 
Jens Axboe
