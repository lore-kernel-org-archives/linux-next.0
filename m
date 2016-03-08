From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the crypto tree with the net-next tree
Date: Tue, 08 Mar 2016 16:48:07 +0000
Message-ID: <13171.1457455687@warthog.procyon.org.uk>
References: <20160308165612.54c8dd50@canb.auug.org.au> <20160307131834.70da82d4@canb.auug.org.au> <28626.1457348905@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43941 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753635AbcCHQsL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2016 11:48:11 -0500
In-Reply-To: <20160308165612.54c8dd50@canb.auug.org.au>
Content-ID: <13170.1457455687.1@warthog.procyon.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > What's the best way to deal with this?  Should I take Herbert's
> > 
> > 	[PATCH 18/26] rxrpc: Use skcipher
> > 
> > patch into my rxrpc tree also and pass it on to Dave?
> 
> Linus can deal with it when he merges the latter of the crypto or
> net-next trees.  It might be worth a mention in the respective pull
> requests.

Do you mean I should take it - or just let Linus merge it?

I tried to apply the rxrpc skcipher patch to net-next, but
skcipher_request_zero() isn't available there or in any of the patches in the
series.

David
