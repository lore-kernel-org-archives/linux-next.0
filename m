From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (sound tree
 related)
Date: Tue, 21 Sep 2010 16:40:25 +1000
Message-ID: <20100921164025.62ace513.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Sep_2010_16_40_25_+1000_KABOLVhxguv_Szl="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47914 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753274Ab0IUGkc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Sep 2010 02:40:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__21_Sep_2010_16_40_25_+1000_KABOLVhxguv_Szl=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

After merging the final tree, today's linux-next build (i386 defconfig)
failed like this:

sound/pci/hda/patch_realtek.c: In function 'alc_resume':
sound/pci/hda/patch_realtek.c:4131: error: 'struct hda_codec_ops' has no me=
mber named 'check_power_status'
sound/pci/hda/patch_realtek.c:4132: error: 'struct hda_codec_ops' has no me=
mber named 'check_power_status'
sound/pci/hda/patch_realtek.c: In function 'alc269_resume':
sound/pci/hda/patch_realtek.c:14706: error: 'struct hda_codec_ops' has no m=
ember named 'check_power_status'
sound/pci/hda/patch_realtek.c:14707: error: 'struct hda_codec_ops' has no m=
ember named 'check_power_status'

Caused by commit 0ec33d1f952934ea3251cefc6d108b47818eedd0 ("ALSA: hda -
Refactor ALC269 power-ups/downs in PM callbacks").  I have reverted that
commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Sep_2010_16_40_25_+1000_KABOLVhxguv_Szl=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMmFNZAAoJEDMEi1NhKgbsjHYH/007ol4rpcNV7OrtQJB0Du5z
Hb205tNcPDngF2k+ELcnKg7Pug3nPfrF4WBwGohbduBSRLL2sAuNwNq2RXYS1dbb
AhVG3GgZdkYchtEuni7YLr0sble6wZFDNJHVJC5DQ2uKCVdNrm60JYsZu9O4TWxt
vaYOZL4qmY4cLUIqrvrKj9jsJl80lj6UAnIPl/W4dKEoBwIPGAz9X1jRrXLzcaSY
kMv3pfYzsZgc1ty7wTooy7W75irX7byQI6ZtRZ7WLOGKMIgZeE/XrG3aBl1nwndi
MmvX6KFFiBYWWLqs0oB/bf7zH877lTJpjspLQriIv0P7YcbC+XG6EFPL4QkpX4I=
=ZZ2/
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Sep_2010_16_40_25_+1000_KABOLVhxguv_Szl=--
