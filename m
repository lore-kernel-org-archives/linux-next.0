From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr_cpumask tree
Date: Fri, 2 Jan 2009 13:35:57 +1100
Message-ID: <20090102133557.0750cdbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__2_Jan_2009_13_35_57_+1100_AckIkZ5OvR88bZQU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42845 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810AbZABCgF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Jan 2009 21:36:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__2_Jan_2009_13_35_57_+1100_AckIkZ5OvR88bZQU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr_cpumask tree got a conflict in
arch/x86/kernel/io_apic.c between commit
22f65d31b25a320a5246592160bcb102d2791c45 ("x86: Update io_apic.c to use
new cpumask API") from the cpus4096 tree and commit
2ca1a615835d9f4990f42102ab1f2ef434e7e89c ("Merge branch 'master' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6") (or
something - I suspect git has failed me a little here) from the
rr_cpumask tree.

It is a bit of a train wreck :-)

I have dropped the rr_cpumask tree for today and also the rr tree that
depends on it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__2_Jan_2009_13_35_57_+1100_AckIkZ5OvR88bZQU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkldfY0ACgkQjjKRsyhoI8w6KQCeLT4bynzE5hRJoRqq7F4TBc3l
3vUAnibvfRuSd9fQoEDD7F21Amr9gE/f
=DqtY
-----END PGP SIGNATURE-----

--Signature=_Fri__2_Jan_2009_13_35_57_+1100_AckIkZ5OvR88bZQU--
