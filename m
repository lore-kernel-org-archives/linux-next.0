From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Mon, 30 Jun 2008 19:23:39 +1000
Message-ID: <20080630192339.b1032e1d.sfr@canb.auug.org.au>
References: <20080626233833.f78fbd36.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_19_23_39_+1000_9_fQQ0RVRvxzS4ha"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34532 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760294AbYF3JXq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 05:23:46 -0400
In-Reply-To: <20080626233833.f78fbd36.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

--Signature=_Mon__30_Jun_2008_19_23_39_+1000_9_fQQ0RVRvxzS4ha
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 26 Jun 2008 23:38:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the firmware tree got conflicts in
> sound/pci/Kconfig between commits 829808ac06b33cdc678ad7dbd628d71d65f8a9c3
> ("[ALSA] Fix AC97 kconfig items") and
> 03cf8be8c43b8c7febc5aacc110fd6a0bff00aa7 ("sound: Convert to menuconfig")
> from the sound tree and commits aee133db3305c4eb85a2d024db613ff44e714f20 =
("firmware: convert korg1212 driver to use firmware loader exclusively"), 8=
fa5ae5506e4a5f69a0c662bc499d8992a2e26c8 ("firmware: convert maestro3 driver=
 to use firmware loader exclusively") and  62bd53e67f6516ce6ec6c3c40db5d886=
8c7b2487
> ("firmware: convert ymfpci driver to use firmware loader exclusively")
> from the firmware tree.
>=20
> I can carry the obvious fixups for these.
>=20
> I may have previously reported these (erroneously) against sound/Kconfig.

This has come up again today.  I assume there has been some
rebasing/modification of the commits involved.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_19_23_39_+1000_9_fQQ0RVRvxzS4ha
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhophsACgkQjjKRsyhoI8ym4wCgjBqSXqzRD1eGRwsbRQ8NKN2h
DIoAmgOX338TqNyGXtt8BQglTVLqqmfw
=belB
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_19_23_39_+1000_9_fQQ0RVRvxzS4ha--
