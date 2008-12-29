From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 29 Dec 2008 18:47:21 +1100
Message-ID: <20081229184721.0a7c80d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_18_47_21_+1100_G=qKT2RXnPXC0LJl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52182 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750818AbYL2Hr3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 02:47:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_18_47_21_+1100_G=qKT2RXnPXC0LJl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/rcuclassic.c between commit
6a7b3dc3440f7b5a9b67594af01ed562cdeb41e4 ("sched: convert nohz_cpu_mask
to cpumask_var_t") from the cpus4096 tree and commit
fe9482e26320b110e102afa01f84c3302d0b1593 ("cpumask: convert RCU
implementations") from the rr tree.

I fixed it up (used the rr tree version) and can carry the fix as
necessary.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_18_47_21_+1100_G=qKT2RXnPXC0LJl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYgIkACgkQjjKRsyhoI8z1+ACfY1czvmOy7pLvagBEf6SH2m2B
66UAn13hmFnCDB6gDP57KGf2vCxIxHKP
=Ouxb
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_18_47_21_+1100_G=qKT2RXnPXC0LJl--
