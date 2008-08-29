From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning
Date: Fri, 29 Aug 2008 18:14:33 +1000
Message-ID: <20080829181433.78a5ae42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Aug_2008_18_14_33_+1000_4D6lzIQc4rAOK_wf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57202 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753208AbYH2IOm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 04:14:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__29_Aug_2008_18_14_33_+1000_4D6lzIQc4rAOK_wf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

The current linux-next build (x86_64 allmodconfig) gives this warning:

drivers/char/tty_io.c: In function 'tty_find_polling_driver':
drivers/char/tty_io.c:307: warning: passing argument 2 of 'strict_strtoul' =
makes integer from pointer without a cast
drivers/char/tty_io.c:307: warning: passing argument 3 of 'strict_strtoul' =
makes pointer from integer without a cast

Which points to an actual bug introduced by commit
8a89d640448c261c248594511c72db0569725058 ("kgdboc,tty: Fix tty polling
search to use name correctly") from the kgdb tree.

simple_strtol() and strict_strtoul() take different parameters and have
different return values.

Warnings are important!  Please take a more care.

I will revert that commit from linux-next for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Aug_2008_18_14_33_+1000_4D6lzIQc4rAOK_wf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki3r+kACgkQjjKRsyhoI8w+3QCgukoqkJFsgFRUDF5DahKN16Ag
9KsAnjYPlN0e11jTduYDu20B92TtqkvU
=ILZ8
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Aug_2008_18_14_33_+1000_4D6lzIQc4rAOK_wf--
