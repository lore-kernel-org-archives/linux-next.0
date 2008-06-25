From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Wed, 25 Jun 2008 16:27:39 +1000
Message-ID: <20080625162739.5add4f55.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_16_27_39_+1000_9V8MGTJc6szz.UCP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45620 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753611AbYFYG1u (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 02:27:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Michael Ellerman <michael@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Christian Borntraeger <borntraeger@de.ibm.com>

--Signature=_Wed__25_Jun_2008_16_27_39_+1000_9V8MGTJc6szz.UCP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/char/hvc_console.h between commit
1c8950ff87de950a3b6ccfb26650fc0a56278836 ("[POWERPC] Make cpus_in_xmon
static and remove extern mess from hvc_console.c") from the powerpc tree
and commit c9a834016cfb2b0fb71392fddab4d80ab9f9d172 ("hvc_console: rework
setup to replace irq functions with callbacks") from the rr tree.

Just a matter of overlapping additions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_16_27_39_+1000_9V8MGTJc6szz.UCP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhh5VsACgkQTgG2atn1QN+LcgCeJGP+bUNVPWX8qtRjh5XVxs+/
ZgAAoIPCItQ2ghUsU9/oXEBDkr+437sP
=eJHt
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_16_27_39_+1000_9V8MGTJc6szz.UCP--
