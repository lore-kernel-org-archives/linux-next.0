From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound tree
Date: Tue, 1 Jun 2010 12:30:11 +1000
Message-ID: <20100601123011.3f20ffde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jun_2010_12_30_11_+1000_HolKtbwgNLxfJRxS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42382 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752003Ab0FACab (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 May 2010 22:30:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>

--Signature=_Tue__1_Jun_2010_12_30_11_+1000_HolKtbwgNLxfJRxS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/usb/gadget/audio.c:37:
drivers/usb/gadget/f_audio.c:104: error: 'UAC_MUTE_CONTROL' undeclared here=
 (not in a function)
drivers/usb/gadget/f_audio.c:113: error: 'UAC_VOLUME_CONTROL' undeclared he=
re (not in a function)

Presumably caused by commit 65f25da44b51f55e3a74301c25f29263be2bf1ba
("ALSA: usb-audio: unify constants from specification").

I have used the version of the sound tree from next-20100531 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jun_2010_12_30_11_+1000_HolKtbwgNLxfJRxS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwEcLMACgkQjjKRsyhoI8xFxQCfecSHG/1iWjPIHsTdHLoIonVd
0MQAniNw1En27JwEzT4I9taVD+zHgHl5
=gq/v
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jun_2010_12_30_11_+1000_HolKtbwgNLxfJRxS--
