From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Fri, 24 Jun 2016 21:33:29 +0800
Message-ID: <20160624133329.GE21111@gondor.apana.org.au>
References: <20160624162022.0f9c265a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:60861 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317AbcFXNdk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jun 2016 09:33:40 -0400
Content-Disposition: inline
In-Reply-To: <20160624162022.0f9c265a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Salvatore Benedetto <salvatore.benedetto@intel.com>

On Fri, Jun 24, 2016 at 04:20:22PM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> net/built-in.o: In function `.ecdh_shared_secret':
> (.text+0x4ad8d0): multiple definition of `.ecdh_shared_secret'
> crypto/built-in.o:(.text+0x113f0): first defined here
> net/built-in.o:(.opd+0x430e0): multiple definition of `ecdh_shared_secret'
> crypto/built-in.o:(.opd+0x1d40): first defined here
> 
> Caused by commit
> 
>   3c4b23901a0c ("crypto: ecdh - Add ECDH software support")
> 
> The other definition is in net/bluetooth/ecc.c
> 
> I added the following patch for today (probably a better name could
> be chosen):

I think the intention is that net/bluetooth/ecc.c will be deleted
in favour of the implementation in crypto.  But for now I have
applied your patch so we can progress.  Thanks Stephen.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
