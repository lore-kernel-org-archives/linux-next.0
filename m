From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build failure
Date: Wed, 22 Apr 2009 11:57:38 +1000
Message-ID: <20090422115738.524272c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_11_57_38_+1000_Qmbuf8Uuxd8G.rpY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54628 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751479AbZDVB5s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 21:57:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Matthew Garrett <mjg59@srcf.ucam.org>, Len Brown <lenb@kernel.org>

--Signature=_Wed__22_Apr_2009_11_57_38_+1000_Qmbuf8Uuxd8G.rpY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_init':
drivers/platform/x86/oqo-wmi.c:767: error: 'struct rfkill' has no member na=
med 'user_claim_unsupported'

Caused by commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 ("rfkill:
remove user_claim stuff") interacting with commit
03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86: Add oqo-wmi
driver for model 2 OQO backlight and rfkill control") from the acpi tree.

I have reverted commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 for today.

Johannes, maybe you could suggest a patch for the acpi guys?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_11_57_38_+1000_Qmbuf8Uuxd8G.rpY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknueZIACgkQjjKRsyhoI8wAAgCeJ/TBHqXwMJRbQBzlYU7C+fjz
4lEAniVoir3psp+480OSqOJAp3FvI45a
=b92O
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_11_57_38_+1000_Qmbuf8Uuxd8G.rpY--
