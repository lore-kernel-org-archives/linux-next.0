From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the oprofile tree
Date: Sat, 13 Sep 2008 10:06:20 +1000
Message-ID: <20080913100620.bff0cb7c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__13_Sep_2008_10_06_20_+1000_usNI19AdK.NoMJ8T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52839 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757329AbYIMAGh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 20:06:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

--Signature=_Sat__13_Sep_2008_10_06_20_+1000_usNI19AdK.NoMJ8T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the oprofile tree got a conflict in
arch/x86/oprofile/nmi_int.c between commit
0329693bf72584efd84dde19997ee4f0c54f8d57 ("Merge branch 'linus' into
irq/sparseirq") from the timers tree and commit
424bf62df64003f35ce8941494dcfe7ab61376b3 ("manual merge of oprofile")
from the oprofile tree.

The former merge added two declarations twice. I just removed the extras.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__13_Sep_2008_10_06_20_+1000_usNI19AdK.NoMJ8T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjLA/0ACgkQjjKRsyhoI8ztJgCeIKiPhHZKQQfhEgdQxR9P0Z78
skAAoKx7vVRCtKltWKH7Y3o146gKP+qb
=uMrS
-----END PGP SIGNATURE-----

--Signature=_Sat__13_Sep_2008_10_06_20_+1000_usNI19AdK.NoMJ8T--
