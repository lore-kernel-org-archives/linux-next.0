From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for July 14
Date: Mon, 14 Jul 2008 23:47:37 +1000
Message-ID: <20080714234737.8e301eb4.sfr@canb.auug.org.au>
References: <20080714201249.947400d0.sfr@canb.auug.org.au>
	<1820d69d0807140443x1c4ba0b3p46072164ea2fe48b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Jul_2008_23_47_37_+1000_LTPB7DKbAO/AVAmj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46586 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752516AbYGNNrt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 09:47:49 -0400
In-Reply-To: <1820d69d0807140443x1c4ba0b3p46072164ea2fe48b@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gabriel C <nix.or.die@googlemail.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michael Krufky <mkrufky@linuxtv.org>, Mauro Carvalho Chehab <mchehab@infradead.org>

--Signature=_Mon__14_Jul_2008_23_47_37_+1000_LTPB7DKbAO/AVAmj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jul 2008 13:43:17 +0200 "Gabriel C" <nix.or.die@googlemail.com> =
wrote:
>
> make clean / mrproper is broken , I'm not sure when it broken , I'm
> updating from
> 2.6.26-rc8-next-20080630.
>=20
> ...
>=20
> crazy@thor:/work/crazy/linux/linux-next/git/linux-2.6$ LC_ALL=3DC make cl=
ean
> scripts/Makefile.clean:17:
> /work/crazy/linux/linux-next/git/linux-2.6/drivers/media/mdtv/Makefile:
> No such file or directory
> make[3]: *** No rule to make target
> `/work/crazy/linux/linux-next/git/linux-2.6/drivers/media/mdtv/Makefile'.
>  Stop.
> make[2]: *** [drivers/media/mdtv] Error 2
> make[1]: *** [drivers/media] Error 2
> make: *** [_clean_drivers] Error 2
>=20
> ...
>=20
> drivers/media/Makefile has 'obj-$(CONFIG_MDTV_ADAPTERS)  +=3D mdtv/' but
> I cannot see such a folder under drivers/media =3D). Removing mdtv from
> Makefile fixes the problem.

Commit 0fdb296d34c14520f061828d69a6e537e7dd78a4 ("V4L/DVB (8272):
sms1xxx: move driver from media/mdtv/ to media/dvb/siano/") moved all of
drivers/media/mdtv, but didn;t remove the reference from
drivers/media/Makefile.

Added some cc's
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jul_2008_23_47_37_+1000_LTPB7DKbAO/AVAmj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh7WPkACgkQjjKRsyhoI8xC+ACdHyGOkzTYHADd9QjBTwnqsuw+
+dIAn0eh+vdb4RbO/gduzqL7b9gDsOIk
=kuyh
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jul_2008_23_47_37_+1000_LTPB7DKbAO/AVAmj--
