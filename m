From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the powerpc tree
Date: Wed, 25 Mar 2009 15:08:17 +1100
Message-ID: <20090325150817.b25954ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Mar_2009_15_08_17_+1100_xccbj967zO5nA1Hr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38801 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751292AbZCYEI0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 00:08:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__25_Mar_2009_15_08_17_+1100_xccbj967zO5nA1Hr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/powerpc/kernel/sysfs.c between commit
9a3719341a9b5d2f5a2e590497346b61cf3462a5 ("powerpc: Make sysfs code use
smp_call_function_single") from the powerpc tree and commits
a604eba6e6850d9d225cc5e983c29be78e629580
("cpumask:remove-cpumask-games-arch-powerpc-kernel-sysfs.c") and
40d45a4bf32db8c75f837caa72bf4bb2c1040597
("cpumask:smp_call_function-in-powerpc-sysfs") from the rr tree.

The former appears to be an earlier version of the latter two.  I fixed
it up (using the rr tree version) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Wed__25_Mar_2009_15_08_17_+1100_xccbj967zO5nA1Hr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknJrjEACgkQjjKRsyhoI8y3vwCfRNAJbmP0gI3rigP2SH0DXSAC
0IMAmwQTUrSAPkg//qga+cZi4SNYrrNR
=4sgT
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Mar_2009_15_08_17_+1100_xccbj967zO5nA1Hr--
