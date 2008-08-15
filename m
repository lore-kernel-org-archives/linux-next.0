From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 15 Aug 2008 17:38:10 +1000
Message-ID: <20080815173810.39f6604c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_17_38_10_+1000_l2XL/YCTslAB6bn7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35874 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751711AbYHOHiV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 03:38:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__15_Aug_2008_17_38_10_+1000_l2XL/YCTslAB6bn7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
kernel/exit.c between commit 177a5f86ba5f60c783e24603bedf037d6c43a193
("tracing, sched: LTTng instrumentation - scheduler") from the ftrace
tree and commit 89be244cbb79a6c4a6d73730a1f042fc04d30967 ("CRED:
Inaugurate COW credentials") from the creds tree.

Just overlapping additions.  I used both.

[David, I also got the expected conflicts against Linus' tree and fixed
them up appropriately.]

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_17_38_10_+1000_l2XL/YCTslAB6bn7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilMmIACgkQjjKRsyhoI8zqkwCfZ+fgD0EBCiBOYCg8mzKO35/w
608AoLrYpUt2mca5MeerBRQoubRWDI0u
=vZNy
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_17_38_10_+1000_l2XL/YCTslAB6bn7--
