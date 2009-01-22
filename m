From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  driver-core.current tree build failure
Date: Thu, 22 Jan 2009 17:39:01 +1100
Message-ID: <20090122173901.1828a3a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Jan_2009_17_39_01_+1100_7pbt0Xm+QN00wO69"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36140 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752000AbZAVGj1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 01:39:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>, Linus <torvalds@linux-foundation.org>

--Signature=_Thu__22_Jan_2009_17_39_01_+1100_7pbt0Xm+QN00wO69
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc allnoconfig) failed like this:

arch/powerpc/kernel/prom.o: In function `debugfs_create_size_t':
prom.c:(.text+0x0): multiple definition of `debugfs_create_size_t'
arch/powerpc/kernel/irq.o:irq.c:(.text+0x0): first defined here
arch/powerpc/kernel/setup-common.o: In function `debugfs_create_size_t':
setup-common.c:(.text+0x0): multiple definition of `debugfs_create_size_t'
arch/powerpc/kernel/irq.o:irq.c:(.text+0x0): first defined here

Caused by commit c00d80adc67c69d0762390ba513913a44bdebb36 ("debugfs:
introduce stub for debugfs_create_size_t() when DEBUG_FS=3Dn") which added
a stub function to a header file but didn't declare it "static inline".

This has been submitted to Linus stating that it has been in at least one
linux-next tree.  It has *not* been in linux-next until today (you do
neither of us a favour by claiming otherwise) and I am reverting it from
there.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Jan_2009_17_39_01_+1100_7pbt0Xm+QN00wO69
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl4FIUACgkQjjKRsyhoI8xtUACgm9GKJR5RPA6RbXYP+HZzg0Uq
KJgAn2AOXtAOXvd+kM0PDdiJp0LrpdtM
=hSV+
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Jan_2009_17_39_01_+1100_7pbt0Xm+QN00wO69--
