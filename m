From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sparc tree
Date: Wed, 16 Jul 2008 17:23:52 +1000
Message-ID: <20080716172352.f40c17ad.sfr@canb.auug.org.au>
References: <20080716171946.f26f9f2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_17_23_52_+1000_rSWof1W8ioVdpBEu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37743 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752656AbYGPHX7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:23:59 -0400
In-Reply-To: <20080716171946.f26f9f2e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__16_Jul_2008_17_23_52_+1000_rSWof1W8ioVdpBEu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2008 17:19:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sparc tree got a conflict in
> include/asm-sparc/ide.h between commit
> 28f42f1b76ba97dbc68041c75be387b743dcf5b1 ("ide: define MAX_HWIFS in
> <linux/ide.h>") from the ide tree and commit
> 0d4b5053275562b4ff7a9a98942936c9eb9b5c18 ("sparc: join the remaining
> header files") from the sparc tree.
>=20
> I applied the change from the ide commit to asm-sparc/ide_32.h (just
> remove three lines).

I also applied the asm-sparc64/ide.h part of the ide commit to
asm-sparc/ide_64.h

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_17_23_52_+1000_rSWof1W8ioVdpBEu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9oggACgkQjjKRsyhoI8zaQQCglvonLZMAE42Ut7easu2KVUnL
leQAn0eZZovqMrL+0rYOC2ydk8LbhESd
=ljFG
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_17_23_52_+1000_rSWof1W8ioVdpBEu--
