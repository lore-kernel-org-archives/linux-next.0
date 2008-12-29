From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 29 Dec 2008 19:02:45 +1100
Message-ID: <20081229190245.d4d259db.sfr@canb.auug.org.au>
References: <20081229184721.0a7c80d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_19_02_45_+1100_2luq55Od/Pcd2Ogf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37994 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752520AbYL2IDD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 03:03:03 -0500
In-Reply-To: <20081229184721.0a7c80d8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_19_02_45_+1100_2luq55Od/Pcd2Ogf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Mon, 29 Dec 2008 18:47:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rr tree got a conflict in
> kernel/rcuclassic.c between commit
> 6a7b3dc3440f7b5a9b67594af01ed562cdeb41e4 ("sched: convert nohz_cpu_mask
> to cpumask_var_t") from the cpus4096 tree and commit
> fe9482e26320b110e102afa01f84c3302d0b1593 ("cpumask: convert RCU
> implementations") from the rr tree.
>=20
> I fixed it up (used the rr tree version) and can carry the fix as
> necessary.

Which I assume was wrong since I got this warning:

kernel/rcuclassic.c: In function 'rcu_start_batch':
kernel/rcuclassic.c:398: warning: passing argument 3 of 'cpumask_andnot' fr=
om incompatible pointer type

So I added back the '&' on the third argument.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_19_02_45_+1100_2luq55Od/Pcd2Ogf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYhCUACgkQjjKRsyhoI8xyawCfcQP79Hv3T8HiPFshM6Ok8lhS
IF4An2R6I8lIxQ+L+akv+1kBANtLgatd
=BVfh
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_19_02_45_+1100_2luq55Od/Pcd2Ogf--
