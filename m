From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: net tree build failure
Date: Wed, 1 Apr 2009 21:58:08 +0200
Message-ID: <20090401195808.GA28351@elte.hu>
References: <20090319154617.12fed283.sfr@canb.auug.org.au> <20090318.224033.185789158.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41581 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755558AbZDAT6f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Apr 2009 15:58:35 -0400
Content-Disposition: inline
In-Reply-To: <20090318.224033.185789158.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, srostedt@redhat.com, nhorman@tuxdriver.com, tglx@linutronix.de, hpa@zytor.com


* David Miller <davem@davemloft.net> wrote:

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 19 Mar 2009 15:46:17 +1100
> 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > In file included from net/core/skbuff.c:69:
> > include/trace/skb.h:4: error: expected ')' before '(' token
> > include/trace/skb.h:4: error: expected ')' before '(' token
> > include/trace/skb.h:4: warning: function declaration isn't a prototype
> > include/trace/skb.h: In function 'register_trace_kfree_skb':
> > include/trace/skb.h:4: error: 'probe' undeclared (first use in this function)
> > include/trace/skb.h:4: error: (Each undeclared identifier is reported only once
> > include/trace/skb.h:4: error: for each function it appears in.)
> > include/trace/skb.h: At top level:
> > include/trace/skb.h:4: error: expected ')' before '(' token
> > include/trace/skb.h:4: warning: function declaration isn't a prototype
> > include/trace/skb.h: In function 'unregister_trace_kfree_skb':
> > include/trace/skb.h:4: error: 'probe' undeclared (first use in this function)
> > net/core/skbuff.c: In function 'kfree_skb':
> > net/core/skbuff.c:446: error: implicit declaration of function 'trace_kfree_skb'
> > 
> > Caused by commit 2939b0469d04ba9ac791aca9a81625d7eb50662b ("tracing:
> > replace TP<var> with TP_<var>") from the tracing tree interacting with
> > commit 4893d39e865b2897bf9fcd329697d37032d853a1 ("Network Drop Monitor:
> > Add trace declaration for skb frees") from the net tree.
> > 
> > I added the merge fixup below and can carry it as necessary.
> 
> I think you're going to have to carry this one indefinitely. At 
> least until that tracing tree change goes upstream.

i'll take this as an implicit:

  Acked-by: David S. Miller <davem@davemloft.net>

Okay?

	Ingo
