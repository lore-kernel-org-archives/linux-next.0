From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: net tree build failure
Date: Wed, 26 Nov 2008 15:51:09 +0800
Message-ID: <20081126075109.GA3642@gondor.apana.org.au>
References: <20081126181543.0d7fba17.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:57972 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750981AbYKZHvR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 02:51:17 -0500
Content-Disposition: inline
In-Reply-To: <20081126181543.0d7fba17.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Patrick McHardy <kaber@trash.net>, Alexey Dobriyan <adobriyan@gmail.com>

On Wed, Nov 26, 2008 at 06:15:43PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> net/bridge/br_netfilter.c:112: error: unknown field 'entry_size' specified in initializer
> net/bridge/br_netfilter.c:112: warning: initialization makes pointer from integer without a cast
> 
> Caused by commit 631339f1e544a4d39a63cfe6708c5bddcd5a2c48 ("bridge:
> netfilter: fix update_pmtu crash with GRE") from the net-current tree
> interacting with commit 6bb3ce25d05f2990c8a19adaf427531430267c1f ("net:
> remove struct dst_entry::entry_size") from the net tree.
> 
> I added the below patch as a temporary merge fix.

Yes your patch is correct.  Thanks Stephen!
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
