From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the acpi tree
Date: Tue, 2 Mar 2010 14:06:06 +1100
Message-ID: <20100302140606.340170f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Mar_2010_14_06_06_+1100_qYAKVAxBKANK6/yf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41204 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751472Ab0CBDGM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Mar 2010 22:06:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

--Signature=_Tue__2_Mar_2010_14_06_06_+1100_qYAKVAxBKANK6/yf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

After merging the acpi tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/platform/x86/asus-laptop.c: In function 'asus_laptop_get_info':
drivers/platform/x86/asus-laptop.c:1416: warning: passing argument 3 of 'as=
us_handle_init' from incompatible pointer type
drivers/platform/x86/asus-laptop.c:1313: note: expected 'char **' but argum=
ent is of type 'const char **'
drivers/platform/x86/asus-laptop.c:1417: warning: passing argument 3 of 'as=
us_handle_init' from incompatible pointer type
drivers/platform/x86/asus-laptop.c:1313: note: expected 'char **' but argum=
ent is of type 'const char **'

Introduced by commit c21085108a02e1b838c34f3650c8cc9fbd178615 ("asus-laptop=
: fix style problems reported by checkpath.pl").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Mar_2010_14_06_06_+1100_qYAKVAxBKANK6/yf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuMgJ4ACgkQjjKRsyhoI8xTAQCgmANER72M8FEf6Orjj6FsXQhU
BAgAnilLDZNQduFqD5GotEa2tde1b7Su
=aljP
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Mar_2010_14_06_06_+1100_qYAKVAxBKANK6/yf--
