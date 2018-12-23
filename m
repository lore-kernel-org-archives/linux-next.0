From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the crypto tree
Date: Sun, 23 Dec 2018 20:30:11 +0800
Message-ID: <20181223123011.qxwfkoib6zadd2rn@gondor.apana.org.au>
References: <20181223231304.1654cf1d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181223231304.1654cf1d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harsh Jain <harsh@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 23, 2018 at 11:13:04PM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Commit
> 
>   6501ab5ed4d9 ("crypto: chelsio - Reset counters on cxgb4 Detach")
> 
> is missing a Signed-off-by from its author.

Hi Stephen:

I believe the issue here is not a missing sign-off from the author,
but rather that the author was incorrectly set to Harsh who sent
the email rather than Atul.

Harsh, please add a From header to the patch description in future
so that the Author field is set correctly.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
