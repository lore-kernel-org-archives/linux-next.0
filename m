From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rseq tree with Linus' tree
Date: Thu, 16 Nov 2017 01:48:26 +1100
Message-ID: <20171116014826.5228aa7c@canb.auug.org.au>
References: <20171115153536.7fab87b7@canb.auug.org.au>
        <20171115080712.tehklwmcvol7iiic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756850AbdKOOs2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Nov 2017 09:48:28 -0500
In-Reply-To: <20171115080712.tehklwmcvol7iiic@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>

Hi Ingo,

On Wed, 15 Nov 2017 09:07:12 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> There's absolutely no way such invasive x86 changes should be done outside the x86 
> tree and be merged into linux-next.
> 
> linux-next should be for the regular maintenance flow, for changes pushed by 
> maintainers and part of the regular maintenance process - not for work-in-progress 
> features that may or may not be merged upstream in that form ...

Sure.  I was given the impression that Linus was going to be asked to
merge this tree during this merge window, so I assumed that it had been
seen by the appropriate people.  Most of these patches include you,
Linus and Andrew (among others) on their cc's and they seem to have
gone through several revisions.

I guess Mathieu has jumped the gun.

I'll drop it again tomorrow.

-- 
Cheers,
Stephen Rothwell
