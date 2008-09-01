From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree
Date: Mon, 1 Sep 2008 14:20:30 +1000
Message-ID: <20080901142030.513d82eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Sep_2008_14_20_30_+1000_2hLFarAL7Gv/Fu1X"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47532 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750753AbYIAEUk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2008 00:20:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Mon__1_Sep_2008_14_20_30_+1000_2hLFarAL7Gv/Fu1X
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in sound/core/mem=
alloc.c between commit 759ee81be6d87c150ea2b300c221b4fec8b5f646 ("alsa: Rem=
ove special SBUS dma support code.") from the sparc tree and commit d3acb92=
557b99feb051ac173d119d06900c364f5 ("ALSA: Kill snd_assert() in sound/core/*=
") from the sound tree.

The former removes code modified by the latter.  I just removed the
code.  I will carry the fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Sep_2008_14_20_30_+1000_2hLFarAL7Gv/Fu1X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki7bY4ACgkQjjKRsyhoI8xu9QCgtOnH8RNvj57wXNZqpeQZ7e5U
3DEAnikfp6RBRSmO0PlHh5N0eO+2mspe
=N+8p
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Sep_2008_14_20_30_+1000_2hLFarAL7Gv/Fu1X--
