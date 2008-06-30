From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Mon, 30 Jun 2008 19:33:13 +1000
Message-ID: <20080630193313.0f00a764.sfr@canb.auug.org.au>
References: <20080630190907.004cbb79.sfr@canb.auug.org.au>
	<1214817853.10393.330.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_19_33_13_+1000_VHFZ=kcYL//La=du"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35344 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754474AbYF3JdT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 05:33:19 -0400
In-Reply-To: <1214817853.10393.330.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, Chas Williams <chas@cmf.nrl.navy.mil>, David Miller <davem@davemloft.net>

--Signature=_Mon__30_Jun_2008_19_33_13_+1000_VHFZ=kcYL//La=du
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 30 Jun 2008 10:24:13 +0100 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> Oops, sorry -- I'd forgotten about that patch, and I let Jaswinder go
> ahead and do it again.
>=20
> I think the reason I didn't apply the patch from Chas to my tree was
> because I'm trying to be very careful to preserve functionality -- when
> I ask Linus to pull the firmware tree, I still want people to be able to
> build in _all_ the firmware they could before.
>=20
> I'm happy enough to see it done separately though; I'll drop our
> fore200e patch from the firmware-2.6.git tree.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_19_33_13_+1000_VHFZ=kcYL//La=du
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhoqFkACgkQjjKRsyhoI8ybFgCbB0GPovRaZfMs8Fw6dqCjJTGA
cewAoLRs+tqontmBl2ud7uMoPmeeDG9V
=FQAe
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_19_33_13_+1000_VHFZ=kcYL//La=du--
