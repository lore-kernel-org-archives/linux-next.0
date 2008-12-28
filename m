From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree import failure
Date: Mon, 29 Dec 2008 09:16:30 +1100
Message-ID: <20081229091630.da11d11e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_09_16_30_+1100_29NdHUuosJyLwnUv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40749 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756601AbYL1WQh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 17:16:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_09_16_30_+1100_29NdHUuosJyLwnUv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next import of the rr tree filed like this:

cpumask:cpumask_of_node-x86.patch
error: patch failed: arch/x86/include/asm/pci.h:98
error: arch/x86/include/asm/pci.h: patch does not apply
error: patch failed: arch/x86/include/asm/topology.h:61
error: arch/x86/include/asm/topology.h: patch does not apply
error: patch failed: arch/x86/kernel/setup_percpu.c:334
error: arch/x86/kernel/setup_percpu.c: patch does not apply

So I have dropped the rr tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_09_16_30_+1100_29NdHUuosJyLwnUv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklX+r4ACgkQjjKRsyhoI8zJKQCeKoIcSPU/MZj2+atRAaMOSgKE
Qk8AnRw4pDITipfHAc2rn+i9aYNvaqgE
=eSVu
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_09_16_30_+1100_29NdHUuosJyLwnUv--
