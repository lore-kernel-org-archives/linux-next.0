From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree
Date: Tue, 14 Oct 2008 16:03:11 +1100
Message-ID: <20081014160311.c5f0ccdf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_16_03_11_+1100_wwFek5znnMvKmPJw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40239 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752063AbYJNFOu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 01:14:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__14_Oct_2008_16_03_11_+1100_wwFek5znnMvKmPJw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in
arch/x86/kernel/traps.c between various commits now in Linus' tree and
various commits from the ftrace tree.

The result is a bit of a mess and really needs to be resolved by someone
who understands the changes involved.  So I have dropped the ftrace tree
for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_16_03_11_+1100_wwFek5znnMvKmPJw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0KA8ACgkQjjKRsyhoI8w00wCeLBbOw1uhtBKLBC0GxZQZbx+m
7ZgAn2I2gnC3IXG16xwJailDd+ze1L4y
=qfVz
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_16_03_11_+1100_wwFek5znnMvKmPJw--
