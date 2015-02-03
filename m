From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Missing next-$date git-tag when pulled-in linux-next.git on top
 of linus.git
Date: Wed, 4 Feb 2015 07:47:32 +1100
Message-ID: <20150204074732.041c6198@canb.auug.org.au>
References: <CA+icZUVVPe68VGwRcc5ztxGwHi83wHJVeiJMUuBynm2LypoaZA@mail.gmail.com>
	<20150107212439.7254d389@canb.auug.org.au>
	<CA+icZUVYu2uaAG-sSf5pf_rzGU+BSBAwu9mhBDrCXZ0a2nw1sA@mail.gmail.com>
	<20150108075201.042f9126@canb.auug.org.au>
	<CA+icZUUL6pT9L8omUuvOfs4biYgOu6sE11n2o7v8F3fVXoLf+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4GFo=HgzUYT1xAj9+XTK8cv"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35957 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756231AbbBCUrl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Feb 2015 15:47:41 -0500
In-Reply-To: <CA+icZUUL6pT9L8omUuvOfs4biYgOu6sE11n2o7v8F3fVXoLf+w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

--Sig_/4GFo=HgzUYT1xAj9+XTK8cv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Tue, 3 Feb 2015 21:06:45 +0100 Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> $ git fetch linux-next next-20150203
> remote: Counting objects: 62716, done.
> remote: Compressing objects: 100% (14620/14620), done.
> remote: Total 62716 (delta 53326), reused 57198 (delta 47960)
> Empfange Objekte: 100% (62716/62716), 12.84 MiB | 217.00 KiB/s, Fertig.
> L=C3=B6se Unterschiede auf: 100% (53326/53326), abgeschlossen mit 7064
> lokalen Objekten.
> Von git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next
>  * tag                         next-20150203 -> FETCH_HEAD

sorry about that, try

$ git fetch linux-next tag next-20150203

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/4GFo=HgzUYT1xAj9+XTK8cv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0TPpAAoJEMDTa8Ir7ZwVEU0QAI3WyhJGZlRcDkIQ4LykEvFp
NHeF4xCa+GdE8SlNmEwOybnKAyGdEpnKWl+ERYl5oC8hrZyRCawWTdiJyUQYu/FI
2PXO0J7DGAjJ7yDRw7Obyb53XHDzovXACibLLCmmdrGJUYd/bzOJiJoJ0mvahJNs
J3kQyVvYIB3lATxRL2wLa4sch6BsT0ohXPKp0D7m7379rFrDLethxMtbQzMwEm1A
bDVqXPzccuA+qCuAFS6+Kem31j80sVdGczMucGP1fLW0O1/Dostlj3MGCE1gviFn
uvx6y0+ahl2K09XWIWFqQ6iCwXtC+Hz4Pi+VPJ0iKc98wBnb1JedR7sb3a+DzidL
eo1IvE+0L+ulw6aDw3FWc/DuGU1efyX8wFGYbyesTvWDTbE6OjhFwbhFAnNyy98p
HPIKTqAWvZaPK9KtBdJV05B/AOLIqolLdeg1u2+XMaO/qsU+s7nhcNH5jrVNJTvm
UQeGm9STplC36g7FTW4zd9N3Apb45GB2TxoM3ACEJM+3/6kx28ySREifSsV5++bB
u3gqmn0kOL8Pcwl/3653RqPvWjMjMlX9N7PL0zPRgt61o0RUfAFJekGQLDjsQ2y/
sv7UW1W1IHAhpZbra2tIsfUFIx7jiKuZ0+2MWZKadQuoFiZKJuRLnFzYKoOpH1eW
Om979d8dDJQn3Mau51Gt
=UAta
-----END PGP SIGNATURE-----

--Sig_/4GFo=HgzUYT1xAj9+XTK8cv--
