From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree
Date: Tue, 1 Jul 2008 16:48:27 +1000
Message-ID: <20080701164827.c76600c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_16_48_27_+1000_sjEM_l3d5a37.rVX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34795 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751876AbYGAGsf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 02:48:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

--Signature=_Tue__1_Jul_2008_16_48_27_+1000_sjEM_l3d5a37.rVX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the powerpc tree got a conflict in
drivers/macintosh/mediabay.c between commit
3fdba626506365e3aaf49140632120cd9156c2e8 ("ide-pmac: media-bay support
fixes (take 3)") from the ide tree and commit
9a24729d8aeef967eac7af71c6a69edc83d06558 ("macintosh/media bay: Convert
semaphore to mutex") from the powerpc tree.

I used the version from the ide tree but with the down/up ->
mutex_lock/mutex_unlock changes applied.  It may be worth a check to make
sure I got it right.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_16_48_27_+1000_sjEM_l3d5a37.rVX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhp0zsACgkQjjKRsyhoI8wlnACgo9y9aNWhjEdDDwo/gXBTTN/A
XlgAn02veHrfgPuNJny50uocDA4rdaJu
=ocNJ
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_16_48_27_+1000_sjEM_l3d5a37.rVX--
