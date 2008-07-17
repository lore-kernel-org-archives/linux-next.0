From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Thu, 17 Jul 2008 14:22:05 +1000
Message-ID: <20080717142205.064285ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_14_22_05_+1000_H0xuSvfXQDn9rnZ/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58395 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745AbYGQEWM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 00:22:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__17_Jul_2008_14_22_05_+1000_H0xuSvfXQDn9rnZ/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/mm/srat_32.c against Linus' tree.

I used the version in Linus' tree.  Could you do a merge with Linus' tree
for tomorrow?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_14_22_05_+1000_H0xuSvfXQDn9rnZ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+yO0ACgkQjjKRsyhoI8wGRgCfb5sweOdOQvxJiuPqX0BMRNuu
LAAAn3N9vKk7DR8rM+V4FfeQQnV0ShUU
=nwvG
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_14_22_05_+1000_H0xuSvfXQDn9rnZ/--
