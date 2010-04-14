From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with Linus' tree
Date: Wed, 14 Apr 2010 11:14:08 +0800
Message-ID: <20100414031408.GA19203@gondor.apana.org.au>
References: <20100414114856.54e1cb21.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100414114856.54e1cb21.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uri Simchoni <uri@jdland.co.il>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 14, 2010 at 11:48:56AM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next merge of the crypto tree got a conflict in
> drivers/crypto/mv_cesa.c between commit
> 5a0e3ad6af8660be21ca98a971cd00f331318c05 ("include cleanup: Update gfp.h
> and slab.h includes to prepare for breaking implicit slab.h inclusion
> from percpu.h") from Linus' tree and commit
> 750052dd2400cd09e0864d75b63c2c0bf605056f ("crypto: mv_cesa - Add sha1 and
> hmac(sha1) async hash drivers") from the crypto tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix
> for a while.

Thanks for the heads up Stephen, I will do a merge soon.
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
