From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Fri, 9 Jan 2009 12:53:27 +1100
Message-ID: <20090109125327.351b7f65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__9_Jan_2009_12_53_27_+1100_z8faOm_TrLDrb4xG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39438 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751699AbZAIBxi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 20:53:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Nathan Lynch <ntl@pobox.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@ozlabs.org>

--Signature=_Fri__9_Jan_2009_12_53_27_+1100_z8faOm_TrLDrb4xG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/powerpc/kernel/sysfs.c between commit
93197a36a9c16a85fb24cf5a8639f7bf9af838a3 ("powerpc: Rewrite sysfs
processor cache info code") from Linus' tree and commit
013ab448cec493262080ecc47b13e0adbcfaeccd ("cpualloc:rename-per_cpu-vars")
from the rr tree.

The former moved the code modified by the latter into another file and
rewrote it.  This is part of the code churn that should not be happening
in linux-next during the merge window.  :-(

I have dropped the rr tree for today, sorry.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__9_Jan_2009_12_53_27_+1100_z8faOm_TrLDrb4xG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklmrhcACgkQjjKRsyhoI8xd/wCfXMkEM6wUxs7TfPBKxAmJAqch
GvkAn2GIQcKJ5oPO1n3kiHOSuVAEUa/T
=AW77
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Jan_2009_12_53_27_+1100_z8faOm_TrLDrb4xG--
