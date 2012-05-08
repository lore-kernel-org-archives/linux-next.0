From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the arm-soc tree with the crypto
 tree
Date: Tue, 8 May 2012 20:00:58 +1000
Message-ID: <20120508100058.GB2113@gondor.apana.org.au>
References: <20120508172153.b05c9d198b1b81c652a2bde6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120508172153.b05c9d198b1b81c652a2bde6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: linux-next.vger.kernel.org

On Tue, May 08, 2012 at 05:21:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/char/hw_random/Kconfig between commit 028fdd87b79a ("hwrng:
> Kconfig - modify default state for atmel-rng driver") from the crypto
> tree and commit 1234f4bada54 ("hwrng: Kconfig: remove dependency for
> atmel-rng driver") from the arm-soc tree.
> 
> Juts context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good.  Thanks Stephen!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
