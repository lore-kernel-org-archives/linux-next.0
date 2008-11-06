From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: testing of new cpumask API introduction patch
Date: Thu, 6 Nov 2008 11:05:39 +1100
Message-ID: <20081106110539.22fd7426.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__6_Nov_2008_11_05_39_+1100_9Bj9JpIqGyLGrHs8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751568AbYKFAFy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 19:05:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__6_Nov_2008_11_05_39_+1100_9Bj9JpIqGyLGrHs8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today I have temporarily dropped the cpus4096 tree from linux-next in
order to integrate and test Rusty's API introducing only patch.  Linus has
said he will consider this patch for 2.6.28 if it is very contained and
has no net effect - which is what it looks like (having reviewed the
patch).

Of course, if Linus' takes Rusty's patch, it will mean significant
changes for the cpus4096 tree and this may be one case where rebasing the
tree makes sense.  But we should burn that bridge when we come to it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__6_Nov_2008_11_05_39_+1100_9Bj9JpIqGyLGrHs8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkSNNMACgkQjjKRsyhoI8xFVQCgh5Cclug8C/QRB2LqvFrJ4e5z
nRgAnjqvAjCpJZrpDupB6qurXInYLRQj
=qzP7
-----END PGP SIGNATURE-----

--Signature=_Thu__6_Nov_2008_11_05_39_+1100_9Bj9JpIqGyLGrHs8--
