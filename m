From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build warning
Date: Tue, 31 Mar 2009 16:22:34 +1100
Message-ID: <20090331162234.1780e0a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__31_Mar_2009_16_22_34_+1100_f0tKrSHFVB4C5ew5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45503 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750901AbZCaFWo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2009 01:22:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__31_Mar_2009_16_22_34_+1100_f0tKrSHFVB4C5ew5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

mm/allocpercpu.c: In function 'free_percpu':
mm/allocpercpu.c:146: warning: passing argument 2 of '__percpu_depopulate_m=
ask' discards qualifiers from pointer target type

Caused by commit c36dd4785de7e87979e0c27aa53dff116ddf37c5
("cpumask:core-use-new-functions").

The "cpumask_t *" argument to __percpu_depopulate_mask() could be marked
"const".
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__31_Mar_2009_16_22_34_+1100_f0tKrSHFVB4C5ew5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknRqJoACgkQjjKRsyhoI8wuPgCdETAHyVRBXy/eCJnVZzFMIFDz
t94An1pJfMJL7HEvRN8tOr9hLwxyRj9C
=lgj3
-----END PGP SIGNATURE-----

--Signature=_Tue__31_Mar_2009_16_22_34_+1100_f0tKrSHFVB4C5ew5--
