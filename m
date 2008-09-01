From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 1 Sep 2008 13:42:39 +1000
Message-ID: <20080901134239.7d95d83a.sfr@canb.auug.org.au>
References: <20080901131458.24ac7832.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Sep_2008_13_42_39_+1000_c7H7OoLNJ/zYr/P/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41875 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751099AbYIADmv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Aug 2008 23:42:51 -0400
In-Reply-To: <20080901131458.24ac7832.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Hans Verkuil <hverkuil@xs4all.nl>

--Signature=_Mon__1_Sep_2008_13_42_39_+1000_c7H7OoLNJ/zYr/P/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Mon, 1 Sep 2008 13:14:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in
> drivers/media/radio/dsbr100.c between commit
> 59d1f04f76c8386d468f74c18fe5c008752c9340 ("USB: remove warn() macro from
> usb.h") from the usb tree and commit
> 63057954eb49549963c4c5079381492575cab33a ("V4L/DVB (8778): radio: fix
> incorrect video_register_device result check") from the v4l-dvb tree.
>=20
> Just a context clash.  I fixed it up (see below) and can carry the fix.

Of course, this is fixable in the v4l-dvb tree as well.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Sep_2008_13_42_39_+1000_c7H7OoLNJ/zYr/P/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki7ZK8ACgkQjjKRsyhoI8xqXgCgk/hZ7fcRTilwT7hRW0rxoD9U
C6oAnj5qYscm4RMkqMPbrvwaWv1hWtNg
=NyfE
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Sep_2008_13_42_39_+1000_c7H7OoLNJ/zYr/P/--
