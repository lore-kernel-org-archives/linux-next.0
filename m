From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  rr_cpumask tree build failure
Date: Tue, 30 Dec 2008 02:55:57 +1100
Message-ID: <20081230025557.89d2565e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__30_Dec_2008_02_55_57_+1100_8XyHT8y/=1uK=2b8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45803 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751538AbYL2P4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 10:56:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

--Signature=_Tue__30_Dec_2008_02_55_57_+1100_8XyHT8y/=1uK=2b8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc allnoconfig) failed like this:

drivers/base/cpu.c: In function 'print_cpus_kernel_max':
drivers/base/cpu.c:136: error: 'CONFIG_NR_CPUS' undeclared (first use in th=
is function)

Caused by commit e057d7aea9d8f2a46cd440d8bfb72245d4e72d79 ("cpumask: add
sysfs displays for configured and disabled cpu maps") from the rr_cpumask
tree.  Powerpc (at least) does not define CONFIG_NR_CPUS for a non SMP
build.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Dec_2008_02_55_57_+1100_8XyHT8y/=1uK=2b8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklY8w0ACgkQjjKRsyhoI8wkRgCgtSg8PRuomtGhooWJFaPGZ35t
E8sAmwfuYmO4HLNjLqLRv+rI0CZHHHGI
=VpNz
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Dec_2008_02_55_57_+1100_8XyHT8y/=1uK=2b8--
