From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cputime tree
Date: Tue, 25 Nov 2008 20:21:05 +1100
Message-ID: <20081125202105.2e80cf92.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_20_21_05_+1100_=15eLgH+OIBcbVYU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39965 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbYKYJVZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 04:21:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Tue__25_Nov_2008_20_21_05_+1100_=15eLgH+OIBcbVYU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Today's linux-next merge of the cputime tree got a conflict in
kernel/sched.c between commit 74fcd524e808975dd546dac847119f1995a7c622
("account_steal_time: kill the unneeded account_group_system_time()")
from the tip-core tree and commit
b7f4776b7f575ed8f288c44b64befd241fd44458 ("[PATCH] idle cputime
accounting") from the cputime tree.

The latter removes the call to account_group_system_time() as a side
effect of further changes.  So the fixup is to just take the latter
change.  I can carry the merge fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_20_21_05_+1100_=15eLgH+OIBcbVYU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrw4EACgkQjjKRsyhoI8zaWQCghtA2UMSOCRW7XHrtcZ7eLGEo
O5cAoJRsL2FfzUi1vcwkeHq2W4yR4uY8
=q0Po
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_20_21_05_+1100_=15eLgH+OIBcbVYU--
