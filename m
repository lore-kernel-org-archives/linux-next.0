From: Randy Dunlap <RANDY.DUNLAP@ORACLE.COM>
Subject: Re: [PATCH] crypto: fix cryptd build fix due to missing ahash
Date: Thu, 15 May 2008 17:33:54 -0500 (CDT)
Message-ID: <31763212.1210890834426.JavaMail.oracle@acsmt305.oracle.com>
References: <4694288.1210878773358.JavaMail.oracle@acsmt302.oracle.com> <20080515212856.GB3081@Chamillionaire.breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761161AbYEOWfs@vger.kernel.org>
In-Reply-To: <20080515212856.GB3081@Chamillionaire.breakpoint.cc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Siewior <linux-crypto@ml.breakpoint.cc>
Cc: linux-kernel@vger.kernel.org, Loc Ho <lho@amcc.com>, herbert@gondor.apana.org.au, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


> This was reported by Randy Dunlap:
> |crypto/built-in.o: In function `cryptd_alloc':
> |cryptd.c:(.text+0x9b5a): undefined reference to `crypto_ahash_type'
> 
> Signed-off-by: Sebastian Siewior <sebastian@breakpoint.cc>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>  crypto/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 5963a95..ffcd467 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -66,6 +66,7 @@ config CRYPTO_CRYPTD
>  	tristate "Software async crypto daemon"
>  	select CRYPTO_BLKCIPHER
>  	select CRYPTO_MANAGER
> +	select CRYPTO_HASH
>  	help
>  	  This is a generic software asynchronous crypto daemon that
>  	  converts an arbitrary synchronous software crypto algorithm
> -- 
> 1.5.4.3
> 
