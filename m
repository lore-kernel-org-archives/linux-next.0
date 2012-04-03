From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 3 Apr 2012 11:26:16 +1000
Message-ID: <20120403112616.9078a733b60bbdada036167f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__3_Apr_2012_11_26_16_+1000_s7pk8On5aGcWVwze"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:58671 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752097Ab2DCB00 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Apr 2012 21:26:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__3_Apr_2012_11_26_16_+1000_s7pk8On5aGcWVwze
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "regcache_sync_region" [sound/soc/codecs/snd-soc-wm8962.ko] undefine=
d!

Caused by commit 26b427a701f8 ("ASoC: wm8962: Implement DSP2
configuration initialisation").  regcache_sync_region() is not exported
to modules.

I have used the sound-asoc tree from next-20120330 again for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__3_Apr_2012_11_26_16_+1000_s7pk8On5aGcWVwze
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPelG4AAoJEECxmPOUX5FE7FgQAKGH+DaI2Ts9oOtHX+OHYwjK
47HT0o04g0B1gRusblhCSLJcSiGuQY4amtDcI6yQw6Nrh46qVkVbO3ySr+9cKG30
TqqFJM/ejjAlCphdkswfFgDhmEoiZ6uKCxuzfuvVVBLQk48ECGaa7P3be12PukD0
NrI02BtdxpgDVVOZ3pq75aRrLBEk3A7tmpWLi7N+OTcQM1LdIAJ8PVOqBVMwO9ZZ
J4UeUb9wlOaHlxUHhhFVB5JAloQYhW+EQbp4j2STy57HtMTM6gulr3rr82B/A6tz
/V7wGSSCAVBcqiE0l8JUfoxDpkBR/y8l0dWA/JT3pOu3eVLhRgbuvpheXiQZyHMq
EEpVwyVZ2qJW1oF+k0IbtyLv44wHE/hILZlPXYFvlVcsxEEukOuMNwBUGdlh6Tzg
8WZEtHzizeNlvj/lyumdTN7xX60CTfzexlsq4K9Gd0mn5BFVerOgPEV6W5Hp6hJH
1Fo2nKIX9EFiq7BZ0LuRpYE3CZrHEuOGYbe0c+uSD6PDjXZy9T+wnP7ObLAPoLSA
xM8vFWWLzXqMVUv9+PS7o7MQka2eW+Vb3Eppg3SGmPuibRMtpMH0N9rvn7EVA1JT
UNTc+sAZB2RkowNtPpIfy++Bm+o5AVYZmf7/B9xMC6rKxZNzpun7XOki7qShHu8a
XnDtINJk1i/FzXRoD5t5
=Hbyq
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Apr_2012_11_26_16_+1000_s7pk8On5aGcWVwze--
