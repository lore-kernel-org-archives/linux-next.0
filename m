From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree
Date: Mon, 7 Jul 2008 23:07:17 +1000
Message-ID: <20080707230717.10429faf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_23_07_17_+1000_v_TF/1jVe7e4EQ12"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52755 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753048AbYGGNH0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 09:07:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Daniel Walker <dwalker@mvista.com>, Andrew Morton <akpm@linux-foundation.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

--Signature=_Mon__7_Jul_2008_23_07_17_+1000_v_TF/1jVe7e4EQ12
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in
drivers/macintosh/mediabay.c between commit
7ad963b103d3863b1161c59f3e65a435979804ed ("ide-pmac: media-bay support
fixes (take 4)") from the ide tree and commit
9a24729d8aeef967eac7af71c6a69edc83d06558 ("macintosh/media bay: Convert
semaphore to mutex") from the powerpc tree.

I just applied the up/down -> mutex_unlock/mutex_lock change to the ide
tree version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_23_07_17_+1000_v_TF/1jVe7e4EQ12
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyFQUACgkQjjKRsyhoI8wRnACcCjGTvHMRZKlje32kfsXkCqxn
fugAn0cgikj9+yYfiAXrY3lMF3OuThxX
=2vfM
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_23_07_17_+1000_v_TF/1jVe7e4EQ12--
