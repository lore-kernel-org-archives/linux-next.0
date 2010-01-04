From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Tue, 5 Jan 2010 09:55:43 +1100
Message-ID: <20100105095543.8c446cb7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Jan_2010_09_55_43_+1100_34m2qvl/CmETgw+8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59871 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752218Ab0ADWzu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2010 17:55:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <matthew@wil.cx>

--Signature=_Tue__5_Jan_2010_09_55_43_+1100_34m2qvl/CmETgw+8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/pci/hotplug/rpaphp_core.c:433: error: unknown field 'get_max_bus_sp=
eed' specified in initializer
drivers/pci/hotplug/rpaphp_core.c:433: warning: excess elements in struct i=
nitializer
drivers/pci/hotplug/rpaphp_core.c:433: warning: (near initialization for 'r=
paphp_hotplug_slot_ops')

Caused by commit 7227d60c98ad0e1af49c717a62515d74002dd754 ("PCI: Make
current and maximum bus speeds part of the PCI core").

I have used the version of the pci tree from next-20100104 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_Jan_2010_09_55_43_+1100_34m2qvl/CmETgw+8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktCce8ACgkQjjKRsyhoI8z5kwCgoO+jIfqabm2O3FmQkJZETQXB
JLkAn00UEkLFdTrtPYV7/kcJfw+7Igc4
=caOk
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Jan_2010_09_55_43_+1100_34m2qvl/CmETgw+8--
