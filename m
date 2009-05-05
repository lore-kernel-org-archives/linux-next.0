From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kbuild tree build failure
Date: Tue, 5 May 2009 11:17:12 +1000
Message-ID: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_May_2009_11_17_12_+1000_BJPJBbsP.xJO0yDp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36555 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754227AbZEEBRl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 May 2009 21:17:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, Jan Beulich <jbeulich@novell.com>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Tue__5_May_2009_11_17_12_+1000_BJPJBbsP.xJO0yDp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section ty=
pe conflict
fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section ty=
pe conflict

We get these occasionally on powerpc builds - Usually from
EXPORT_SYMBOLS.  Though I was hoping that using a newer compiler would
fix that (I am now compiling with gcc 4.4.0).

Direct cause is commit efbe795f5f63b74ed642e196518907355aa94bd7
("initconst adjustments").

OK, looking at the preprocessor output, I see we have a previous variable
(static match_table_t __initconst tokens) with __attribute__ ((__section__
(".init.rodata"))) but it is not const ... (This came from commit
a447c0932445f92ce6f4c1bd020f62c5097a7842 "vfs: Use const for kernel
parser table" which changed "tokens" from __initdata to __initconst.  Not
using "const" seems deliberate, but the changelog does not include enough
information as to why.)

So, I will revert the above commit for today to allow it to be "improved"
by also fixing the tokens variable definition above.  Of course there may
be other places where such mixed definitions exist.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_May_2009_11_17_12_+1000_BJPJBbsP.xJO0yDp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn/k5gACgkQjjKRsyhoI8wsBgCgqydP2PvG73r1biyCwBx1EezO
TdcAn2z8N4j9Y3i5ZwWs9oM9hbfJEEIH
=+k/j
-----END PGP SIGNATURE-----

--Signature=_Tue__5_May_2009_11_17_12_+1000_BJPJBbsP.xJO0yDp--
