From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the final tree (tip
 treee related)
Date: Mon, 13 Sep 2010 14:39:42 +1000
Message-ID: <20100913143942.7344ada4.sfr@canb.auug.org.au>
References: <20100913132721.5a02cfbc.sfr@canb.auug.org.au>
	<4C8DA517.9000603@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__13_Sep_2010_14_39_42_+1000_LFB1mbA64F_p94jI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41149 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750864Ab0IMEjt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Sep 2010 00:39:49 -0400
In-Reply-To: <4C8DA517.9000603@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>

--Signature=_Mon__13_Sep_2010_14_39_42_+1000_LFB1mbA64F_p94jI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yinghai,

On Sun, 12 Sep 2010 21:14:15 -0700 Yinghai Lu <yinghai@kernel.org> wrote:
>
> please check it, and it should get into core/memblock branch.
>=20
> Thanks
>=20
> Yinghai
>=20
> [PATCH] memblock: Fix section mismatch warning
>=20
> for arches that use memblock other than x86
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Yinghai Lu <Yinghai@kernel.org>

Your patch fixes some of the warnings, but still leaves these for a
powerpc allnoconfig build:

WARNING: mm/built-in.o(.text+0x25d80): Section mismatch in reference from t=
he function memblock_double_array() to the function .init.text:memblock_fre=
e()
The function memblock_double_array() references
the function __init memblock_free().
This is often because memblock_double_array lacks a __init=20
annotation or the annotation of memblock_free is wrong.

WARNING: mm/built-in.o(.text+0x26318): Section mismatch in reference from t=
he function memblock_reserve_reserved_regions() to the function .init.text:=
memblock_reserve()
The function memblock_reserve_reserved_regions() references
the function __init memblock_reserve().
This is often because memblock_reserve_reserved_regions lacks a __init=20
annotation or the annotation of memblock_reserve is wrong.

WARNING: mm/built-in.o(.text+0x26490): Section mismatch in reference from t=
he function memblock_free_reserved_regions() to the function .init.text:mem=
block_free()
The function memblock_free_reserved_regions() references
the function __init memblock_free().
This is often because memblock_free_reserved_regions lacks a __init=20
annotation or the annotation of memblock_free is wrong.

And these for a i386 defconfig build:

WARNING: mm/built-in.o(.text+0x1e261): Section mismatch in reference from t=
he function memblock_is_memory() to the variable .init.data:memblock
The function memblock_is_memory() references
the variable __initdata memblock.
This is often because memblock_is_memory lacks a __initdata=20
annotation or the annotation of memblock is wrong.

WARNING: mm/built-in.o(.text+0x1e27f): Section mismatch in reference from t=
he function memblock_is_region_memory() to the variable .init.data:memblock
The function memblock_is_region_memory() references
the variable __initdata memblock.
This is often because memblock_is_region_memory lacks a __initdata=20
annotation or the annotation of memblock is wrong.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__13_Sep_2010_14_39_42_+1000_LFB1mbA64F_p94jI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMjasOAAoJEDMEi1NhKgbsz/4H/iB0Vmgh2Jrw0CadUixbRYZX
a9Ch6JcU9KN1U74N7yG8o08r9CHb/BGjYIqnnAMfAh5HJfrF7+yNLzUXE76DpTrN
rgbZBTgJf61hZKbtYrGdIjRDrbU1dL3NhJ8wStVD+oeUCJwQ9h0f6Kh3EHrHcCoe
0zqrF8S4uR2uxIDzWQvyluUVg7Qlr34o5CKQxkh9XtIacHSgE6fI9DzZa05vYWHQ
FUOIGZ+coT+zeCsQXy44Hfaxb6g8LB7YKQuvXEk6wvydkkgfeYry0rI1DLRfylYo
j6QMjbbxU1rz7cYtpY3pPDVAcShf1mMZWFK1rixabGTnf9cL8s5vj5Mixj3z5P4=
=TEN7
-----END PGP SIGNATURE-----

--Signature=_Mon__13_Sep_2010_14_39_42_+1000_LFB1mbA64F_p94jI--
