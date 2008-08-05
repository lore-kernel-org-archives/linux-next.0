From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Tue, 5 Aug 2008 23:33:00 +1000
Message-ID: <20080805233300.e98f9da5.sfr@canb.auug.org.au>
References: <20080805140257.7fad0dc0.sfr@canb.auug.org.au>
	<20080805053628.GA19574@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Aug_2008_23_33_00_+1000_D+9X5EFM_8eKChyC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51612 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757397AbYHENdH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 09:33:07 -0400
In-Reply-To: <20080805053628.GA19574@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__5_Aug_2008_23_33_00_+1000_D+9X5EFM_8eKChyC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Tue, 5 Aug 2008 13:36:28 +0800 Herbert Xu <herbert@gondor.apana.org.au> =
wrote:
>
> I've fixed it with the following patch.
>=20
> --
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 4f72b30..a3f4b4f 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -40,7 +40,9 @@ config CRYPTO_HASH
> =20
>  config CRYPTO_MANAGER
>  	tristate "Cryptographic algorithm manager"
> -	select CRYPTO_ALGAPI
> +	select CRYPTO_AEAD
> +	select CRYPTO_HASH
> +	select CRYPTO_BLKCIPHER
>  	help
>  	  Create default cryptographic template instantiations such as
>  	  cbc(aes).
> @@ -85,9 +87,7 @@ config CRYPTO_AUTHENC
>  config CRYPTO_TEST
>  	tristate "Testing module"
>  	depends on m
> -	select CRYPTO_ALGAPI
> -	select CRYPTO_AEAD
> -	select CRYPTO_BLKCIPHER
> +	select CRYPTO_MANAGER
>  	help
>  	  Quick & dirty crypto test module.

I am guessing that will help with these errors as well?

testmgr.c:(.text+0x6404): undefined reference to `.crypto_alloc_ablkcipher

(From a powerpc cell_defconfig build)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_Aug_2008_23_33_00_+1000_D+9X5EFM_8eKChyC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiYVowACgkQjjKRsyhoI8zOrQCghbfLwOXRAk2gKb5Wc0lc69s9
0b4An0wkKr6/rcenVyLwSZ7grqXo7pz8
=1CaF
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Aug_2008_23_33_00_+1000_D+9X5EFM_8eKChyC--
