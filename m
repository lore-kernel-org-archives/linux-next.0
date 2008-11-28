From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Fri, 28 Nov 2008 21:04:12 +1100
Message-ID: <20081128210412.a7df2494.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__28_Nov_2008_21_04_12_+1100_ULRVfMz6pKGk_TmX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57007 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750770AbYK1KEa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Nov 2008 05:04:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__28_Nov_2008_21_04_12_+1100_ULRVfMz6pKGk_TmX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (i386 defconfig) failed like this:

sound/pci/hda/hda_intel.c: In function 'azx_codec_create':
sound/pci/hda/hda_intel.c:1236: error: 'power_save' undeclared (first use i=
n this function)

Caused by commit fee2fba3586f78762ecc5f432dfd3602765a31b3 ("ALSA: hda -
Move power_save option to hda_intel.c").

I have reverted that commit.  It needs to be fixed soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__28_Nov_2008_21_04_12_+1100_ULRVfMz6pKGk_TmX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkvwhwACgkQjjKRsyhoI8zn1wCfcYekdqQrJk6YztFgygyuyxmB
+CIAoJXjxpbhlRggUikTHoXFWvWGR09D
=6jHF
-----END PGP SIGNATURE-----

--Signature=_Fri__28_Nov_2008_21_04_12_+1100_ULRVfMz6pKGk_TmX--
