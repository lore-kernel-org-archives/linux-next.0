From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the ipsec tree
Date: Fri, 29 May 2015 12:26:26 +0800
Message-ID: <20150529042626.GA16932@gondor.apana.org.au>
References: <20150529142134.5206b395@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:36786 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049AbbE2E0f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2015 00:26:35 -0400
Content-Disposition: inline
In-Reply-To: <20150529142134.5206b395@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 29, 2015 at 02:21:34PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got a conflict in
> net/ipv4/esp4.c between commit 64aa42338e9a ("esp4: Use high-order
> sequence number bits for IV generation") from the ipsec tree and commit
> 7021b2e1cddd ("esp4: Switch to new AEAD interface") from the crypto
> tree.
> 
> I fixed it up (the latter seems to have incorporated the change from
> the former) and can carry the fix as necessary (no action is required).

Thanks Stephen, yes just carrying the latter should be good enough.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
