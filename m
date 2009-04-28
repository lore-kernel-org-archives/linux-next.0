From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: wireless tree build failure
Date: Tue, 28 Apr 2009 13:28:17 +1000
Message-ID: <20090428132817.5e86b172.sfr@canb.auug.org.au>
References: <20090422115738.524272c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Apr_2009_13_28_17_+1000_0fbwXIJbFQDi1/vM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50415 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751952AbZD1D2Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 23:28:25 -0400
In-Reply-To: <20090422115738.524272c8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>, Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Matthew Garrett <mjg59@srcf.ucam.org>

--Signature=_Tue__28_Apr_2009_13_28_17_+1000_0fbwXIJbFQDi1/vM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John, Len,

On Wed, 22 Apr 2009 11:57:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_init':
> drivers/platform/x86/oqo-wmi.c:767: error: 'struct rfkill' has no member =
named 'user_claim_unsupported'
>=20
> Caused by commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 ("rfkill:
> remove user_claim stuff") interacting with commit
> 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86: Add oqo-wmi
> driver for model 2 OQO backlight and rfkill control") from the acpi tree.
>=20
> I have reverted commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 for today.

This is still happening ... is someone going to do something about it?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Apr_2009_13_28_17_+1000_0fbwXIJbFQDi1/vM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn2d9EACgkQjjKRsyhoI8ztCACgpmU5yUB1fyU6X2t2rdh0AzAd
qFAAn2sxAzkM1/X0/152p0tVnj8giyHL
=nuub
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Apr_2009_13_28_17_+1000_0fbwXIJbFQDi1/vM--
