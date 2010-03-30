From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound tree
Date: Tue, 30 Mar 2010 14:48:09 +1100
Message-ID: <20100330144809.77620889.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__30_Mar_2010_14_48_09_+1100_nvLqK/c7e6zepZaK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42035 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755350Ab0C3DsQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 23:48:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__30_Mar_2010_14_48_09_+1100_nvLqK/c7e6zepZaK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/pci/hda/patch_realtek.c: In function 'fillup_priv_adc_nids':
sound/pci/hda/patch_realtek.c:5120: warning: format '%s' expects type 'char=
 *', but argument 2 has type 'int'
sound/pci/hda/patch_realtek.c:5120: warning: too few arguments for format

Introduced by commit 6694635d3ae1b038d7a0e38b80637db867c7c8e2 ("ALSA: hda
- Fix ADC/MUX assignment of ALC269 codec").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Mar_2010_14_48_09_+1100_nvLqK/c7e6zepZaK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuxdHkACgkQjjKRsyhoI8xO/wCgrVHm1vOewQ8iYa6UW8RGYOrw
gewAnisjL629+Uav2erxba78R6iF0Ft9
=/XIL
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Mar_2010_14_48_09_+1100_nvLqK/c7e6zepZaK--
