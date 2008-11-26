From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Wed, 26 Nov 2008 09:46:04 +0100
Message-ID: <20081126084604.GN26036@elte.hu>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au> <20081125102234.GA4281@elte.hu> <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com> <20081125153345.GA20733@elte.hu> <7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com> <20081125165118.GF22504@elte.hu> <20081126140032.72d86f17.sfr@canb.auug.org.au> <20081126033318.GE8242@elte.hu> <7c86c4470811260032n64d69b04w5762e5f6cbd0cff9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52616 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754365AbYKZIqx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 03:46:53 -0500
Content-Disposition: inline
In-Reply-To: <7c86c4470811260032n64d69b04w5762e5f6cbd0cff9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eranian@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>


* stephane eranian <eranian@googlemail.com> wrote:

> > We know and knew about the existence of the perfmon patches, but 
> > they were always in the vague RFC category and never directly 
> > submitted or Cc:-ed to us.
>
> As Stephen pointed out, the full patchset was posted on LKML in 
> October I never saw any comments from you or any other x86 
> maintainers. I always assumed you were ALL on LKML anyway.

There's nothing to be "pointed out" about that - i was well aware of 
the regular perfmon spam on lkml ;-)

What was done in stealth was its sudden "will go upstream in 1-2 
months" status change, and its showing up in linux-next. There was 
ample opportunity to Cc: the maintainers for all of those steps - when 
you sent the tree setup request to Stephen, etc.

Really, in such cases you are expected to ping the respective 
maintainers about what they think about it and whether there's any 
objections. If they only notice it via conflicts of problem patches in 
linux-next they'll (rightfully) go into grumpy mode. _Especially_ if 
then the linux-next integrator also plays stupid about basic kernel 
workflow questions ;-)

> I have reposted the full patchset yesterday on LKML but 
> unfortunately my script dropped the cc-list. I will repost today 
> making sure x86@kernel.org is cc'ed. I am sorry about that, it never 
> was intentional. I will be waiting for your feedback on the x86 
> code.

ok, thanks. That's all that is needed normally.

	Ingo
