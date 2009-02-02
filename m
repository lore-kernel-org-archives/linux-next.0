From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpufreq tree
Date: Mon, 2 Feb 2009 15:00:41 +1100
Message-ID: <20090202150041.a4c37123.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_15_00_41_+1100_zNE._u7U/jRbKYKi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42884 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753655AbZBBEAt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 23:00:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>

--Signature=_Mon__2_Feb_2009_15_00_41_+1100_zNE._u7U/jRbKYKi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/kernel/cpu/cpufreq/powernow-k8.c between commit
8ad2aedc2129f4e791dc7e2e89eabdcb2145d16c ("[CPUFREQ] checkpatch cleanups
for powernow-k8") from the cpufreq tree and commit
d58128cd5c204e6f9d2e1910f160064c15b5f19d
("cpumask:partial-revert-powernow-k8") from the rr tree.

Just simple overlapping changes.  I fixed it up (used the conflicting
part from the rr tree change) and can carry the fix as necessary.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_15_00_41_+1100_zNE._u7U/jRbKYKi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGb+kACgkQjjKRsyhoI8wXyQCeO0qjXrHgaEJZuP54P+OKaa8H
ahwAn3I8RFFvL+0waPDi8YJ7vbpSadRD
=hInm
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_15_00_41_+1100_zNE._u7U/jRbKYKi--
