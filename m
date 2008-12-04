From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Thu, 4 Dec 2008 14:38:48 +0800
Message-ID: <20081204063848.GA18141@gondor.apana.org.au>
References: <20081204134331.016d38c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:55288 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754491AbYLDGiv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 01:38:51 -0500
Content-Disposition: inline
In-Reply-To: <20081204134331.016d38c4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Adrian-Ken Rueegsegger <ken@codelabs.ch>

On Thu, Dec 04, 2008 at 01:43:31PM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> crypto/built-in.o: In function `md5_mod_init':
> crypto/md5.c:239: undefined reference to `crypto_register_shash'
> crypto/built-in.o: In function `md5_mod_fini':
> crypto/md5.c:244: undefined reference to `crypto_unregister_shash'

Thanks for the note Stephen.  It should be fixed now.

Cheers,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
