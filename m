From: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Tue, 29 Nov 2016 08:34:08 +0000
Message-ID: <DB4PR04MB084718B8EB90B061EA144C02988D0@DB4PR04MB0847.eurprd04.prod.outlook.com>
References: <20161129115529.41f9f0b5@canb.auug.org.au>
 <20161129070840.GA5113@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db5eur01on0054.outbound.protection.outlook.com ([104.47.2.54]:54740
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753356AbcK2JHp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Nov 2016 04:07:45 -0500
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 11/29/2016 10:09 AM, Herbert Xu wrote:=0A=
> On Tue, Nov 29, 2016 at 11:55:29AM +1100, Stephen Rothwell wrote:=0A=
>> Hi Herbert,=0A=
>>=0A=
>> After merging the crypto tree, today's linux-next build (arm=0A=
>> multi_v7_defconfig) failed like this:=0A=
>>=0A=
>> ERROR: "simd_skcipher_free" [arch/arm/crypto/aes-arm-ce.ko] undefined!=
=0A=
>> ERROR: "simd_skcipher_create_compat" [arch/arm/crypto/aes-arm-ce.ko] und=
efined!=0A=
>> ERROR: "simd_skcipher_free" [arch/arm/crypto/aes-arm-bs.ko] undefined!=
=0A=
>> ERROR: "simd_skcipher_create_compat" [arch/arm/crypto/aes-arm-bs.ko] und=
efined!=0A=
>>=0A=
>> Caused by commits=0A=
>>=0A=
>>   da40e7a4ba4d ("crypto: aes-ce - Convert to skcipher")=0A=
>>   211f41af534a ("crypto: aesbs - Convert to skcipher")=0A=
>>=0A=
>> Missing dependencies?=0A=
>>=0A=
>> I have used the crypto tree from next-20161128 for today.=0A=
> =0A=
> Indeed.  This patch should fix the problem.=0A=
> =0A=
> ---8<---=0A=
> Subject: crypto: arm/aes - Select SIMD in Kconfig=0A=
> =0A=
> The skcipher conversion for ARM missed the select on CRYPTO_SIMD,=0A=
> causing build failures if SIMD was not otherwise enabled.=0A=
> =0A=
> Fixes: da40e7a4ba4d ("crypto: aes-ce - Convert to skcipher")=0A=
> Fixes: 211f41af534a ("crypto: aesbs - Convert to skcipher")=0A=
The fix for this commit is missing.=0A=
CRYPTO_AES_ARM_BS also needs to select CRYPTO_SIMD.=0A=
=0A=
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>=0A=
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>=0A=
> =0A=
> diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig=0A=
> index 27ed1b1..8134888 100644=0A=
> --- a/arch/arm/crypto/Kconfig=0A=
> +++ b/arch/arm/crypto/Kconfig=0A=
> @@ -105,7 +105,7 @@ config CRYPTO_AES_ARM_CE=0A=
>  	tristate "Accelerated AES using ARMv8 Crypto Extensions"=0A=
>  	depends on KERNEL_MODE_NEON=0A=
>  	select CRYPTO_ALGAPI=0A=
> -	select CRYPTO_ABLK_HELPER=0A=
> +	select CRYPTO_SIMD=0A=
>  	help=0A=
>  	  Use an implementation of AES in CBC, CTR and XTS modes that uses=0A=
>  	  ARMv8 Crypto Extensions=0A=
> diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig=0A=
> index 5f4a617..c5ce39c 100644=0A=
> --- a/arch/arm64/crypto/Kconfig=0A=
> +++ b/arch/arm64/crypto/Kconfig=0A=
> @@ -48,14 +48,14 @@ config CRYPTO_AES_ARM64_CE_BLK=0A=
>  	depends on ARM64 && KERNEL_MODE_NEON=0A=
>  	select CRYPTO_BLKCIPHER=0A=
>  	select CRYPTO_AES_ARM64_CE=0A=
> -	select CRYPTO_ABLK_HELPER=0A=
> +	select CRYPTO_SIMD=0A=
>  =0A=
>  config CRYPTO_AES_ARM64_NEON_BLK=0A=
>  	tristate "AES in ECB/CBC/CTR/XTS modes using NEON instructions"=0A=
>  	depends on ARM64 && KERNEL_MODE_NEON=0A=
>  	select CRYPTO_BLKCIPHER=0A=
>  	select CRYPTO_AES=0A=
> -	select CRYPTO_ABLK_HELPER=0A=
> +	select CRYPTO_SIMD=0A=
The commit message should also refer to:=0A=
Fixes: d0ed0db149fce ("crypto: arm64/aes - Convert to skcipher")=0A=
=0A=
Horia=0A=
=0A=
