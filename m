From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound tree
Date: Fri, 23 Sep 2011 12:49:34 +1000
Message-ID: <20110923124934.dfde6643c66d33abdeeeedc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Sep_2011_12_49_34_+1000_c8ZQ2Wul2CE+1Pk+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:60325 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754700Ab1IWCtl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 22:49:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__23_Sep_2011_12_49_34_+1000_c8ZQ2Wul2CE+1Pk+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

After merging the sound tree, today's linux-next build ()
failed like this:

sound/pci/fm801.c: In function 'snd_fm801_tea575x_get_pins':
sound/pci/fm801.c:759:2: error: expected ',' or ';' before 'return'
sound/pci/fm801.c:757:32: warning: unused variable 'gpio'
sound/pci/fm801.c:756:17: warning: unused variable 'reg'
sound/pci/fm801.c:761:1: warning: no return statement in function returning=
 non-void
sound/pci/fm801.c: In function 'snd_fm801_create':
sound/pci/fm801.c:1251:5: error: implicit declaration of function 'get_tea5=
7x_gpio'
sound/pci/fm801.c:1251:5: error: invalid type argument of '->' (have 'int')

Caused by commit c51a94adef4c ("ALSA: fm801 - Clean up redundant reference =
to snd_fm801_tea575x_gpios[]").

I have used the sound tree from next-20110922 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Sep_2011_12_49_34_+1000_c8ZQ2Wul2CE+1Pk+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOe/O+AAoJEDMEi1NhKgbslkoH/17lS6RKiTYpMTBek20vixOj
kChOe9HhZC0goUok6lEAshqVKYZOAvlvDQ4XbJAkCtOmD7XRpQaAqSelzUEoyyIH
NGgEAmElIfH/+Rfd2uahO6PBySCRYUT2MgbrRyqXdRm6xbI0nT4ybDE3N3PyE1vV
1Q2h4289cEHRelB13CYlImzyE2xYl4c5hvm6ful6+t4TG4ViEtHsjiEvnKEMi3ws
Ron68P2KcKgTzb2VqvxD0MNKLDu04oW/eWkv/OZ5A8fmUhuXBcPqjNduqs5WXc7a
ARDkrBLlKcmNCiXZ5CnjxuAYFeyNUHCtNGHIvUpqsBon1B5I9nw5DltnoQDZ3V8=
=bHTZ
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Sep_2011_12_49_34_+1000_c8ZQ2Wul2CE+1Pk+--
