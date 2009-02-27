From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the x86 tree
Date: Fri, 27 Feb 2009 16:08:04 +1100
Message-ID: <20090227160804.0ce21078.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Feb_2009_16_08_04_+1100_mof/Wc5o/0xLWaME"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49437 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752081AbZB0FIP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Feb 2009 00:08:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Ben Gamari <bgamari@gmail.com>, Eric Anholt <eric@anholt.net>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__27_Feb_2009_16_08_04_+1100_mof/Wc5o/0xLWaME
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/drm_proc.c between commit
804852e4ffc983f9ee7600f78218698546fdc58d ("drm_proc.c fix compilation
warning") from the x86 tree and commit
a584bb1ed4de35a9206a8ed42fc7de18b3d46b5a ("drm: Convert proc files to
seq_file and introduce debugfs") from the drm tree.

The former fixed a warning in code removed by the latter.  I just dropped
the former change.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Feb_2009_16_08_04_+1100_mof/Wc5o/0xLWaME
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmndTQACgkQjjKRsyhoI8zl8ACgpBmfkRvCm0DKvH7n1qN471Z8
fqkAoJKV55xVz3m7fmeFqDfCg3feDdpf
=aoJj
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Feb_2009_16_08_04_+1100_mof/Wc5o/0xLWaME--
