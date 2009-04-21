From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the net tree with the  tree
Date: Tue, 21 Apr 2009 09:22:16 +0800
Message-ID: <20090421012216.GA12324@gondor.apana.org.au>
References: <20090421110612.9cf9b6a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:33600 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754217AbZDUBWZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Apr 2009 21:22:25 -0400
Content-Disposition: inline
In-Reply-To: <20090421110612.9cf9b6a6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>

On Tue, Apr 21, 2009 at 11:06:12AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the net tree got a conflict in net/core/dev.c
> between commit 5db8765a86a4cbaf45adaf8c231cf9a6ca2dcfaf ("net: Fix GRO
> for multiple page fragments") from the net-current tree and commit
> 76620aafd66f0004829764940c5466144969cffc ("gro: New frags interface to
> avoid copying shinfo") from the net tree.
> 
> I used the version from the net tree.

I think that's the right one.

Thanks,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
