From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for March 8 (BROKEN:
 arch/x86/kernel/entry_32.S? Debian's binutils/as?)
Date: Sat, 12 Mar 2011 09:25:57 +0100
Message-ID: <20110312082557.GA28952@elte.hu>
References: <AANLkTi=6YstJxad41knR4Q9WN3wYKikPv-g1i3kg3HS1@mail.gmail.com>
 <1299615939.25628.1427572905@webmail.messagingengine.com>
 <AANLkTimBMP1jiuEEUwmKKVNZcZnrkFxFA_YBcLmkEFJM@mail.gmail.com>
 <AANLkTikpMAXfG5aNWo8x7pKKppaQiE-U8qjFaG0B2azV@mail.gmail.com>
 <20110309085150.GC21294@elte.hu>
 <AANLkTiks9o18LRS46CrYHBXzq_6U-v-CqK=0Fzc4Tuco@mail.gmail.com>
 <20110309160241.GC31249@elte.hu>
 <AANLkTinCzzqq6KC5H1Gad7a99dkp_x-cc8f3FHnXdjLJ@mail.gmail.com>
 <20110310071709.GG9289@elte.hu>
 <AANLkTim_oy_X9DGvyzyN3Y6w0YWp2CCy+dsMKCHob_cU@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33325 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751508Ab1CLI0I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 12 Mar 2011 03:26:08 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTim_oy_X9DGvyzyN3Y6w0YWp2CCy+dsMKCHob_cU@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H.J. Lu" <hjl.tools@gmail.com>
Cc: sedat.dilek@gmail.com, Sedat Dilek <sedat.dilek@googlemail.com>, Alexander van Heukelum <heukelum@fastmail.fm>, linux-next <linux-next@vger.kernel.org>, psomas@cslab.ece.ntua.gr, Jan Beulich <JBeulich@novell.com>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org


* H.J. Lu <hjl.tools@gmail.com> wrote:

> If I understand it correctly, the issue here is in some cases, for whatever 
> reason, the assembly input files can't be changed even if they are incorrect.

Correct - not having to change the source code is *very* important during testing 
and in particular during bisection testing.

This binutils change broke the kernel build (and hence bisection) for over 130,000 
existing commits (none of which can be changed - history is append-only immutable), 
on CONFIG_XEN=y x86-64 kernels.

Kernel bisection works like this:

   git bisect good v2.6.27
   git bisect  bad v2.6.37

The kernel gets rebuilt and tested by the tester at every commit that the bisection 
mechanism comes up with. Mid-section commits get marked either 'git bisect bad' or 
'git bisect good', depending on whether the bug is experienced or not.

Try it on a kernel repo, you can clone/track it:

   http://people.redhat.com/mingo/tip.git/README

The Linux kernel has over 200,000 commits currently, with about 10,000 new commits 
per new release. Bisection can easily go 'back in time' a few ten thousand commits 
and can end up on any of those commits (depending on the kind of bug that is being 
bisected).

You can try out the commands above. Please try it and mark commits good/bad randomly 
and see where you end up. You can end up *anywhere* within the 130,000+ commits 
bisection windo.

This CONFIG_XEN=y example shows why it's a *seriously* bad idea for build 
infrastructure to introduce build failures out of the blue. We want build
*warnings* to allow code that built fine before to still build.

Thanks,

	Ingo
