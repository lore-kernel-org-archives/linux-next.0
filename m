From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for December 19
Date: Wed, 23 Dec 2009 18:52:04 +1100
Message-ID: <20091223185204.93e59989.sfr@canb.auug.org.au>
References: <20091219110457.d6c5de1f.sfr@canb.auug.org.au>
	<10f740e80912190042o474b6188ga32fcc4ff0846531@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Dec_2009_18_52_04_+1100_+PihStOMaqxk=.bZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43453 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751468AbZLWHwL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Dec 2009 02:52:11 -0500
In-Reply-To: <10f740e80912190042o474b6188ga32fcc4ff0846531@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__23_Dec_2009_18_52_04_+1100_+PihStOMaqxk=.bZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Sat, 19 Dec 2009 09:42:19 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> On Sat, Dec 19, 2009 at 01:04, Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > Well, I decided I had time for one more so it will be based in -rc1).
>=20
> Hurray!

:-)

> But http://kisskb.ellerman.id.au/kisskb/buildresult/1852835/ shows
> linux-next/m68k-allmodconfig fails
> in security/keys/keyctl.c, while this got fixed in 2.6.33-rc1?? It
> compiled fine in linus/m68k-allmodconfig,
> as expected

That build was of next-20091218 ... the build of next-20091219
(http://kisskb.ellerman.id.au/kisskb/buildresult/1853405/) failed
differently :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Dec_2009_18_52_04_+1100_+PihStOMaqxk=.bZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksxzCQACgkQjjKRsyhoI8zA5ACgifUpxrYjmSZHCxJIMQnaUD2L
G2sAn2mBJ8KfxeA4teS9UyIYlq3ix+Id
=gozm
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Dec_2009_18_52_04_+1100_+PihStOMaqxk=.bZ--
