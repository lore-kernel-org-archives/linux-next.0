From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: acpi tree build failure
Date: Thu, 5 Feb 2009 13:13:40 +1100
Message-ID: <20090205131340.edc6e6a8.sfr@canb.auug.org.au>
References: <20090202132254.456b7725.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Feb_2009_13_13_40_+1100_DEFvc=TO+uLSwSLz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57244 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758127AbZBECN6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 21:13:58 -0500
In-Reply-To: <20090202132254.456b7725.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

--Signature=_Thu__5_Feb_2009_13_13_40_+1100_DEFvc=TO+uLSwSLz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greg, Len,

On Mon, 2 Feb 2009 13:22:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> drivers/platform/x86/oqo-wmi.c: In function 'oqo_kine_init':
> drivers/platform/x86/oqo-wmi.c:595: error: 'struct device' has no member =
named 'bus_id'
>=20
> Caused by commit 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86:
> Add oqo-wmi driver for model 2 OQO backlight and rfkill control")
> interacting with commit c44c8304353aa6da82cbf98040c6a9c254e68e1c ("driver
> core: get rid of struct device's bus_id string array") from the
> driver-core tree.

Still getting this (of course).  Can you guys come up with a fix, please?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Feb_2009_13_13_40_+1100_DEFvc=TO+uLSwSLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmKS1QACgkQjjKRsyhoI8yA0ACeIE9TqZuUc4hQmBDtggnSoSjo
1VYAn2dX/Ck8UT31WojTENwqtRG6VhhD
=eNJ4
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Feb_2009_13_13_40_+1100_DEFvc=TO+uLSwSLz--
