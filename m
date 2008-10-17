From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Fri, 17 Oct 2008 11:26:10 +1100
Message-ID: <20081017112610.83a67160.sfr@canb.auug.org.au>
References: <20081014145917.708bace4.sfr@canb.auug.org.au>
	<20081016160503.GB27769@kroah.com>
	<20081016213613.GB11876@doriath.ww600.siemens.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Oct_2008_11_26_10_+1100_ohoGIhHc+Ohl=lO."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56386 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752734AbYJQA0U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 20:26:20 -0400
In-Reply-To: <20081016213613.GB11876@doriath.ww600.siemens.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

--Signature=_Fri__17_Oct_2008_11_26_10_+1100_ohoGIhHc+Ohl=lO.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Fri, 17 Oct 2008 01:36:13 +0400 Dmitry Baryshkov <dbaryshkov@gmail.com> =
wrote:
>
> After few tries I can come with pretty simple but pretty strange solution:
>=20
> >From 1c6dd41e074c5f526fc29b00a2bf265497d2819d Mon Sep 17 00:00:00 2001
> From: Dmitry Baryshkov <dbaryshkov@gmail.com>
> Date: Fri, 17 Oct 2008 01:30:15 +0400
> Subject: [PATCH] USB: unbreak recursive dependancy
>=20
> After addition of TMIO usb driver Kconfig sees the recursive dependency
> Break it by rephrasing ARCH_PNX4008 OHCI deps.

I will add this to today's linux-next, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Oct_2008_11_26_10_+1100_ohoGIhHc+Ohl=lO.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj326MACgkQjjKRsyhoI8wW0QCdFgeWgc07XWeHgYgIxkC1J5QL
GVUAoLVXN+R3vZ6qsfL3bjU8HgSyMzd8
=zfHX
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Oct_2008_11_26_10_+1100_ohoGIhHc+Ohl=lO.--
