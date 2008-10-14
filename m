From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree
Date: Tue, 14 Oct 2008 15:23:58 +1100
Message-ID: <20081014152358.3e92d57b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_15_23_58_+1100_3YVgvkOlR9blMAnx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59350 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751702AbYJNEmS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:42:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, Jeremy Fitzhardinge <jeremy@goop.org>, Becky Bruce <becky.bruce@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

--Signature=_Tue__14_Oct_2008_15_23_58_+1100_3YVgvkOlR9blMAnx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
arch/powerpc/platforms/Kconfig.cputype between commit
4ee7084eb11e00eb02dc8435fd18273a61ffa9bf ("Allow 32-bit hashed pgtable
code to support 36-bit physical") from the powerpc tree and commit
8308c54d7e312f7a03e2ce2057d0837e6fe3843f ("redefine resource_size_t as
phys_addr_t") from the tip-core tree.

Just context.  I fixed it up (see below) and can carry the fix (assuming
it is correct).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/powerpc/platforms/Kconfig.cputype
index 439c5ba,be852fd..0000000
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@@ -129,20 -128,17 +129,19 @@@ config FSL_EMB_PERFMO
 =20
  config PTE_64BIT
  	bool
 -	depends on 44x || E500
 -	default y if 44x
 -	default y if E500 && PHYS_64BIT
 +	depends on 44x || E500 || PPC_86xx
 +	default y if PHYS_64BIT
 =20
  config PHYS_64BIT
 -	bool 'Large physical address support' if E500
 -	depends on 44x || E500
 -	default y if 44x
 +	bool 'Large physical address support' if E500 || PPC_86xx
 +	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
- 	select RESOURCES_64BIT
  	---help---
  	  This option enables kernel support for larger than 32-bit physical
 -	  addresses.  This features is not be available on all e500 cores.
 +	  addresses.  This feature may not be available on all cores.
 +
 +	  If you have more than 3.5GB of RAM or so, you also need to enable
 +	  SWIOTLB under Kernel Options for this to work.  The actual number
 +	  is platform-dependent.
 =20
  	  If in doubt, say N here.
 =20

--Signature=_Tue__14_Oct_2008_15_23_58_+1100_3YVgvkOlR9blMAnx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0Ht4ACgkQjjKRsyhoI8wZEACfetQK+SGhB3DWHmH+fHkY/0Ir
Z08AoKswwH8CauDU19BcCO99JwfGath1
=aUqU
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_15_23_58_+1100_3YVgvkOlR9blMAnx--
