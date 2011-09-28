From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] qdio: add missing export.h include
Date: Wed, 28 Sep 2011 14:54:39 +1000
Message-ID: <20110928145439.7ed4a378cd7772f9037e0c83@canb.auug.org.au>
References: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com>
	<4E824F3A.6070302@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Sep_2011_14_54_39_+1000_4C+MSM4AHEZi905E"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:48046 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969Ab1I1Eyr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 00:54:47 -0400
In-Reply-To: <4E824F3A.6070302@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, Frank Blaschka <blaschka@linux.vnet.ibm.com>, Jan Glauber <jang@linux.vnet.ibm.com>

--Signature=_Wed__28_Sep_2011_14_54_39_+1000_4C+MSM4AHEZi905E
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 27 Sep 2011 18:33:30 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> Now that I look at this, and the other patch, I'm not
> seeing how this is possible.  Unless there is some
> convoluted CPP magic going on, I don't see any instances
> of EXPORT_SYMBOL in qdio_setup.c -- similarly I don't
> see any module_ or MODULE_ references in zfcp_qdio.c
>=20
> Am I missing something obvious here?   The line numbers
> you quote dont match anything meaningful -- so I'm wondering
> if perhaps these changes are meant to be in advance of the
> s390 changes you've got queued in next -- which is fine, but
> it would be nice to have that called out.

There is a patch in the net tree in linux-next that adds two
EXPORT_SYMBOL_GPLs to qdio_setup.c.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Sep_2011_14_54_39_+1000_4C+MSM4AHEZi905E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOgqiPAAoJEDMEi1NhKgbsooYH/R91NWReIySq8SqIS/xdIHRj
mo1Crt5RJlCkV8sFo+3XJECdsfNYMtkU6XU4VOOyS6DEWG5fmAKIfIjOLnhZriPu
e7jOVCFDAvCnEdLSKEH8lLO3kzzkCUjAbFedg/oT4wY588dav5dpEih4sGZ9LK0C
KFDUrJoihspinIhddCB1id8ul5vIvuGBuAxTwzg0Bb+DyOMAxnfkXuNW0yc01F2e
r6XT1yafWnNttRl6NKfUm5+xBhD805R7lnVGRysj+te4fBptsyr0xlIIp40aW96x
H9qtkfvyTVi8q5/oWLyLSNbxWukiNshuAY0ieYkTUzq+J03WztleDen+99Ci1JE=
=GOUZ
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Sep_2011_14_54_39_+1000_4C+MSM4AHEZi905E--
