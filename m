From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: hid build failure
Date: Tue, 27 May 2008 20:46:41 +1000
Message-ID: <20080527204641.938b6075.sfr@canb.auug.org.au>
References: <20080527131441.06f3a67f.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0805271111560.18218@twin.jikos.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_May_2008_20_46_41_+1000_.vJy2z_f2=iEuUYi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60067 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755880AbYE0KrK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 06:47:10 -0400
In-Reply-To: <Pine.LNX.4.64.0805271111560.18218@twin.jikos.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

--Signature=_Tue__27_May_2008_20_46_41_+1000_.vJy2z_f2=iEuUYi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Tue, 27 May 2008 11:14:01 +0200 (CEST) Jiri Kosina <jkosina@suse.cz> wro=
te:
>
> thanks a lot for reporting, Alan's patch missed to change the prototype i=
n=20
> the compat handler, and I missed this too.=20
>=20
> Should be now fixed in my tree.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_May_2008_20_46_41_+1000_.vJy2z_f2=iEuUYi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIO+acTgG2atn1QN8RAkFfAJ9YZ8ijUB98CSbGdyMQpdfOcQJqUQCffoHt
aGIIqqg6RrqKWzY/WJeFWX4=
=3h44
-----END PGP SIGNATURE-----

--Signature=_Tue__27_May_2008_20_46_41_+1000_.vJy2z_f2=iEuUYi--
