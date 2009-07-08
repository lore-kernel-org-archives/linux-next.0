From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build warning
Date: Wed, 8 Jul 2009 14:18:25 +1000
Message-ID: <20090708141825.da103bc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jul_2009_14_18_25_+1000_c5zw7AnShgMLk_z8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59460 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750836AbZGHESi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2009 00:18:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__8_Jul_2009_14_18_25_+1000_c5zw7AnShgMLk_z8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

sound/pci/hda/patch_via.c: In function 'via_mux_enum_put':
sound/pci/hda/patch_via.c:395: warning: unused variable 'vendor_id'
sound/pci/hda/patch_via.c: In function 'get_mux_nids':
sound/pci/hda/patch_via.c:1337: warning: unused variable 'type'
sound/pci/hda/patch_via.c:1354: warning: no return statement in function re=
turning non-void

Introduced by commit 337b9d02b4873ceac91565272545fb6fd446d939 ("ALSA: hda
- Fix capture source selection in patch_via.c").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jul_2009_14_18_25_+1000_c5zw7AnShgMLk_z8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpUHhEACgkQjjKRsyhoI8w5IgCfbv9zaS2aS+NJNAfbdr48CYsu
LjUAoIM3b0ElHKwuIftK9GAyMo/jlYFJ
=/SQT
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jul_2009_14_18_25_+1000_c5zw7AnShgMLk_z8--
