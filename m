From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Coresight tree to -next please
Date: Tue, 5 May 2015 10:48:34 +1000
Message-ID: <20150505104834.47f528ba@canb.auug.org.au>
References: <CANLsYky=XeD6ednBkgv4Qe3=a7RUa6bW9-9X2DKKCmUXUwKsyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uW9xhlXb2XBVdb=Cz=UdWlM"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34441 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751258AbbEEAsl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 May 2015 20:48:41 -0400
In-Reply-To: <CANLsYky=XeD6ednBkgv4Qe3=a7RUa6bW9-9X2DKKCmUXUwKsyA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-next@vger.kernel.org

--Sig_/uW9xhlXb2XBVdb=Cz=UdWlM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Mon, 4 May 2015 16:19:30 -0600 Mathieu Poirier <mathieu.poirier@linaro.o=
rg> wrote:
>
> I am the maintainer of the coresight sub-system [1] and I would like
> to ask you to add my next tree [2] to the list of trees you are using
> to build linux-next.
>=20
> [1]. drivers/hwtracing/coresight
> [2]. https://git.linaro.org/kernel/coresight.git (next)

I used git://git.linaro.org/kernel/coresight.git, and added it from
today.  Is this tree to be submitted directly to Linus, or via some
other tree? (just gives me a clue as to where to positiion it in the
merge list)

Thanks for adding your subsystem tree as a participant of linux-next.
As you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series
have been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/uW9xhlXb2XBVdb=Cz=UdWlM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSBNnAAoJEMDTa8Ir7ZwV35kP/2Kiv/JS8UkHfp/fIiHsc5a2
o5TryaciPpphR7oVJJYIcC9u+bnh18dCp30J+0BSZ4j3wRgftsF7xfU4wNCJ/wDH
CtCzn+iKyEgB/wTcHg4GF/g/Jx4YwXjM/v19YJpb4UcWpqynGN0jBKn05O7T8uVU
W8gAcKR5GykiOLkVUL29iqpApszs/Bhew2iPLFDsv75dJl0vzmqUFk3dzAN6c5qC
KqZtmgb7kcmf+2yKXKE2TfYKpt80APZoDW5LGqnjx67Rgv0CodMBcsyny1/qFmVs
ZivVV7O23W29u97TUUx4MHFPJRTU4iBJ/ejub7ke4DBNbVz6Zp9cB1e/lreN+fxV
Dekn1g84WeUgFpuqJE9AONxt7bj5rto/d57ViXe3CJwf2S8dcUPxAAHjuQTc12gC
Zq5Z8kO18EMD/6MMdWs9iYUlCsR7hgl+HQT13jZSI8t1/Amilu5VzU7ZgmnPcX34
ttBkv0T80E/TvLqmOD+xq1SrnoCNS+Ti6c0oR3qm6x1YxtVjof8+5wQlOhjUtSQW
wAm9zc5e6NPAcjrFZAt7e9gdMuU9Aj67Dj0QGTjiHK/Ni/wqnQVNXzBGXANsHPox
32DtJKYkWhlhXAXSGc8BMcHnEeER1pFlQPEPpy6pahfaHeTr+Xvu2f5T/Fl2eE1h
oMiK9PdaAtJGDbd55wHd
=oFWk
-----END PGP SIGNATURE-----

--Sig_/uW9xhlXb2XBVdb=Cz=UdWlM--
