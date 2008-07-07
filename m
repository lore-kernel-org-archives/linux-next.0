From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the selinux tree
Date: Mon, 7 Jul 2008 22:51:30 +1000
Message-ID: <20080707225130.ca52d527.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_22_51_30_+1000_gCyiGP+x6mDs0NL7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39404 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752592AbYGGMvm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 08:51:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>, Eric Paris <eparis@redhat.com>, Stephen Smalley <sds@tycho.nsa.gov>, Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Mon__7_Jul_2008_22_51_30_+1000_gCyiGP+x6mDs0NL7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in
fs/proc/task_mmu.c between commit
5d7e0d2bd98ef4f5a16ac9da1987ae655368dd6a ("Fix pagemap_read() use of
struct mm_walk") from Linus' tree and commit
ca9b1a1413bac6ea5e5c8cb81044a39bdb3b4bc8 ("Security: split proc ptrace
checking into read vs. attach") from the selinux tree.

The former removed some of the code that the latter changed.  It is
probably worth a check on the code in pagemap_read to make sure I got it
right.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_22_51_30_+1000_gCyiGP+x6mDs0NL7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyEVIACgkQjjKRsyhoI8xMSQCgo+oWAcgXJCgxDsE+mP8klGKZ
TdMAniuWu/U6J/IazlJb4lYHPTVaGRvN
=nj7J
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_22_51_30_+1000_gCyiGP+x6mDs0NL7--
