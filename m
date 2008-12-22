From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch] powerpc: change u64/s64 to a long long integer type
Date: Tue, 23 Dec 2008 00:00:35 +0100
Message-ID: <20081222230035.GB4074@uranus.ravnborg.org>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au> <b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com> <20081222070426.GD29160@elte.hu> <20081222181932.5dd9514e.sfr@canb.auug.org.au> <20081222080341.GA18897@elte.hu> <20081222144319.1bfc0061.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:40882 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754936AbYLVW7H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Dec 2008 17:59:07 -0500
Content-Disposition: inline
In-Reply-To: <20081222144319.1bfc0061.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, kenchen@google.com, paulus@samba.org, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

On Mon, Dec 22, 2008 at 02:43:19PM -0800, Andrew Morton wrote:
> On Mon, 22 Dec 2008 09:03:41 +0100
> Ingo Molnar <mingo@elte.hu> wrote:
> 
> > Subject: powerpc: change u64/s64 to a long long integer type
> 
> <applause>
> 
> There are lots of other architctures that need doing though.

I have missed the introduction.
Can you explain why?

I have done a bit of sparc hacking lately and was wondering if
sparc needs something similar.

cd arch/sparc
git grep u64 | grep -v __u64 | wc -l
448

[On the unified tree]

	Sam
