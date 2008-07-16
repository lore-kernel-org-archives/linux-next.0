From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 23:14:04 +1000
Message-ID: <20080716231404.cda81a4d.sfr@canb.auug.org.au>
References: <20080716194517.fc260962.sfr@canb.auug.org.au>
	<20080716101921.GA16688@elte.hu>
	<20080716202521.ea91d90d.sfr@canb.auug.org.au>
	<20080716104012.GA2425@elte.hu>
	<20080716111441.GA15724@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_23_14_04_+1000_=qH9zUzTY3OzH8Qw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35138 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752049AbYGPNOM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 09:14:12 -0400
In-Reply-To: <20080716111441.GA15724@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org

--Signature=_Wed__16_Jul_2008_23_14_04_+1000_=qH9zUzTY3OzH8Qw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Wed, 16 Jul 2008 13:14:42 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> ok, i've done the integration run of all of tip's auto-*-next branches=20
> and pushed out the result.
>=20
> note, you might run into a conflict in arch/x86/kernel/Makefile, the=20
> correct final resolution is:
>=20
>  ifdef CONFIG_FTRACE
>  # Do not profile debug and lowlevel utilities
>  CFLAGS_REMOVE_tsc.o =3D -pg
>  CFLAGS_REMOVE_rtc.o =3D -pg
>  CFLAGS_REMOVE_paravirt.o =3D -pg
>  endif

Thanks, I will keep my eyes open.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_23_14_04_+1000_=qH9zUzTY3OzH8Qw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh99BwACgkQjjKRsyhoI8xw1wCeKxyJaUTLOShkIW/AbcOT3RwL
2JoAn34zLG84yj7AFU4SMi/hcM5XJxnY
=alWV
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_23_14_04_+1000_=qH9zUzTY3OzH8Qw--
