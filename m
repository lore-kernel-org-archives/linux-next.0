From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto-current
	tree
Date: Thu, 3 Nov 2011 10:39:36 +1100
Message-ID: <20111102233936.GA10058@gondor.apana.org.au>
References: <20111101115851.2e37ac680db78bdba0661691@canb.auug.org.au> <20111102200900.GA3454@hades>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.apana.org.au ([209.40.204.226]:37742 "EHLO
	fornost.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085Ab1KBXjq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2011 19:39:46 -0400
Content-Disposition: inline
In-Reply-To: <20111102200900.GA3454@hades>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Luis Henriques <henrix@camandro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>

On Wed, Nov 02, 2011 at 08:09:13PM +0000, Luis Henriques wrote:
>
> I'm not sure if this is related, but I am currently unable to build mainline
> kernel when disabling CONFIG_NET.  This seems to be due to the patch serie:
> 
> http://news.gmane.org/gmane.linux.kernel.cryptoapi/cutoff=6228
> 
> For instance, commit 6ad414fe710d4fd3a8c8c6c2ad8fefcfcc207968 adds a dependency
> over function nla_put(), which is only defined when CONFIG_NET is enabled.

Indeed, I missed the dependency in the report functions which
is built even when CRYPTO_USER is turned off.

Does this patch fix the problem for you?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
