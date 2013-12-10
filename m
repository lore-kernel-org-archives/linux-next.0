From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: randconfig build error with next-20131210, in drivers/crypto/ccp
Date: Tue, 10 Dec 2013 09:33:26 -0600
Message-ID: <2432540.XbvglUb6sT@tlendack-t1>
References: <CA+r1ZhhmuJF=YLAjOkEfr8YzLHC+Mwe+ubgorjvK0KdZwheDEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhhmuJF=YLAjOkEfr8YzLHC+Mwe+ubgorjvK0KdZwheDEg@mail.gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org


On Monday, December 09, 2013 10:30:17 PM Jim Davis wrote:
> Building with the attached random configuration file,
> 
> drivers/built-in.o: In function `ccp_init':
> /home/jim/linux/drivers/crypto/ccp/ccp-dev.c:402: undefined reference
> to `hwrng_register'
> drivers/built-in.o: In function `ccp_destroy':
> /home/jim/linux/drivers/crypto/ccp/ccp-dev.c:445: undefined reference
> to `hwrng_unregister'
> make: *** [vmlinux] Error 1

Thanks for finding this, I'll update the Kconfig to select HW_RANDOM.

Tom
