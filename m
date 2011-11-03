From: Luis Henriques <henrix@camandro.org>
Subject: Re: linux-next: build failure after merge of the crypto-current
	tree
Date: Thu, 3 Nov 2011 11:59:33 +0000
Message-ID: <20111103115933.GA12708@onza.mythic-beasts.com>
References: <20111101115851.2e37ac680db78bdba0661691@canb.auug.org.au> <20111102200900.GA3454@hades> <20111102233936.GA10058@gondor.apana.org.au> <20111103055824.GC22141@secunet.com> <20111103061628.GA12678@gondor.apana.org.au> <20111103101554.GA17569@onza.mythic-beasts.com> <20111103114214.GA14681@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from onza.mythic-beasts.com ([93.93.131.30]:43170 "EHLO
	onza.mythic-beasts.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755638Ab1KCL7j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Nov 2011 07:59:39 -0400
Content-Disposition: inline
In-Reply-To: <20111103114214.GA14681@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 03, 2011 at 10:42:14PM +1100, Herbert Xu wrote:
> On Thu, Nov 03, 2011 at 10:15:54AM +0000, Luis Henriques wrote:
> >
> > No, this did not solved the problem; build still fails.  The problem is
> > that, in lib/nlattr.c, we have:
> 
> Ugh, for the time being I guess we'll have to wrap these within
> CONFIG_NET, as I'd rather not have CONFIG_CRYPTO depend on CONFIG_NET.
> 
> Please let me know whether this patch fixes the problem.

Yep, it compiles and boots.  Thanks for the patch.

Cheers,
--
Luis Henriques
