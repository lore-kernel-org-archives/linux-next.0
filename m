From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 11 Jul 2008 11:48:17 +1000
Message-ID: <20080711114817.86703a4e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Jul_2008_11_48_17_+1000_1yZ1JzoT2lVlEqZ/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56790 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759161AbYGKBsY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 21:48:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>

--Signature=_Fri__11_Jul_2008_11_48_17_+1000_1yZ1JzoT2lVlEqZ/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got conflicts in
arch/x86/kernel/traps_32.c and arch/x86/kernel/traps_64.c between commit
db47946e32824309a7815eddb78e838a5c276fb1 ("sysfs: crash debugging") from
the driver-core tree and commits e423f49fc8ccd761618748d7139638d8ddc1d16f
("x86: traps_xx: modify __die"), badc76527f7e29302f0bde3d366c59101fb2ab87
("x86: traps_xx: shuffle headers and globals") and
a8c1be9d2e78d8608892c86791837acf12da4bf6 ("x86: initial changes to unify
traps_32.c and traps_64.c") from the x86 tree.

I just applied the driver-core addition (one line in each case) to the
x86 tree versions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Jul_2008_11_48_17_+1000_1yZ1JzoT2lVlEqZ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh2u+EACgkQjjKRsyhoI8xndwCgvVGXuKV7dtjNQDzTYTwFuRKs
tiMAoIDZImkS0sm+BR07wMNIoRQQEEe/
=TB52
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jul_2008_11_48_17_+1000_1yZ1JzoT2lVlEqZ/--
