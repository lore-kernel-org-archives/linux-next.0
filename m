From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure after merge of the crypto-current tree
Date: Thu, 10 Nov 2011 16:50:19 +0100
Message-ID: <20111110155019.GA7068@elte.hu>
References: <20111101115851.2e37ac680db78bdba0661691@canb.auug.org.au>
 <20111102200900.GA3454@hades>
 <20111102233936.GA10058@gondor.apana.org.au>
 <20111103055824.GC22141@secunet.com>
 <20111103061628.GA12678@gondor.apana.org.au>
 <20111103101554.GA17569@onza.mythic-beasts.com>
 <20111103114214.GA14681@gondor.apana.org.au>
 <20111103115933.GA12708@onza.mythic-beasts.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:44543 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753561Ab1KJPwO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Nov 2011 10:52:14 -0500
Content-Disposition: inline
In-Reply-To: <20111103115933.GA12708@onza.mythic-beasts.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Luis Henriques <henrix@camandro.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Steffen Klassert <steffen.klassert@secunet.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Luis Henriques <henrix@camandro.org> wrote:

> On Thu, Nov 03, 2011 at 10:42:14PM +1100, Herbert Xu wrote:
> > On Thu, Nov 03, 2011 at 10:15:54AM +0000, Luis Henriques wrote:
> > >
> > > No, this did not solved the problem; build still fails.  The problem is
> > > that, in lib/nlattr.c, we have:
> > 
> > Ugh, for the time being I guess we'll have to wrap these within
> > CONFIG_NET, as I'd rather not have CONFIG_CRYPTO depend on CONFIG_NET.
> > 
> > Please let me know whether this patch fixes the problem.
> 
> Yep, it compiles and boots.  Thanks for the patch.

v3.2-rc1 has been released with this (commonly triggering) build bug 
included. Herbert, is the fix on the way to upstream?

Thanks,

	Ingo
