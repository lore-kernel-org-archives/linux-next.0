From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Thu, 5 Mar 2009 19:33:52 +1100
Message-ID: <20090305193352.bb6969cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Mar_2009_19_33_52_+1100_Po=2_kYcMa45EaeD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50302 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750796AbZCEIeE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 03:34:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

--Signature=_Thu__5_Mar_2009_19_33_52_+1100_Po=2_kYcMa45EaeD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (sparc64 defconfig) failed like this:

drivers/pci/probe.c: In function 'pci_bus_show_cpuaffinity':
drivers/pci/probe.c:56: error: 'CPU_MASK_ALL_PTR' undeclared (first use in =
this function)

Caused by commit 66ec53ceff39a3daf3b1a3628bca1198bd88c7b3
("cpumask:remove-CPU_MASK_ALL_PTR"). 2.6.29-rc2 added cpumask_of_pcibus()
(which references CPU_MASK_ALL_PTR) to
arch/sparc/include/asm/topology_64.h .

I have reverted that commit (as well as commit
ba5eb00621351d4f16270cf2db0932fe2c7067f3 ("cpumask:remove-cpu_mask_all")
that depended on it).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Mar_2009_19_33_52_+1100_Po=2_kYcMa45EaeD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmvjnAACgkQjjKRsyhoI8wmqgCeOcS3CiDNdWDTweyld80iqXwQ
zg8AnRzX1nw5N1DiHyu0mCOkDkXUpIv3
=w8bL
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Mar_2009_19_33_52_+1100_Po=2_kYcMa45EaeD--
