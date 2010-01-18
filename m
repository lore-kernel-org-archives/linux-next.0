From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warning
Date: Mon, 18 Jan 2010 15:05:01 +1100
Message-ID: <20100118150501.f6aa79e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jan_2010_15_05_01_+1100_g2Io_UgSLZBefBjg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54648 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752373Ab0AREFH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jan 2010 23:05:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wu Fengguang <fengguang.wu@intel.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Mon__18_Jan_2010_15_05_01_+1100_g2Io_UgSLZBefBjg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64_allmodconfig) produced these warnings:

drivers/base/memory.c:319: warning: initialization from incompatible pointe=
r type
drivers/base/memory.c:353: warning: initialization from incompatible pointe=
r type
drivers/base/memory.c:408: warning: initialization from incompatible pointe=
r type
drivers/base/memory.c:409: warning: initialization from incompatible pointe=
r type

Introduced by commit 8ff410daa009c4b44be445ded5b0cec00abc0426 ("sysdev:
fix prototype for memory_sysdev_class show/store functions").

The third parameter to SYSDEV_CLASS_ATTR should be a "ssize_t (*)(struct
sysdev_class *, char *)", but this commit changes them to "ssize_t (*)
(struct sysdev_class *, struct sysdev_class_attribute *, char *buf)".  Or
maybe the definition of "struct sysdev_class_attribute" is wrong?

It actually looks like commit c29af9636 ("sysdev: Pass attribute in
sysdev_class attributes show/store") referred to in the changelog for the
above commit has not yet been applied to Linus' tree?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jan_2010_15_05_01_+1100_g2Io_UgSLZBefBjg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktT3e0ACgkQjjKRsyhoI8wOQgCgvmbgENfZXv7m0/Y5r3wGBzrZ
APoAoKXHqUfMwGqijFP4ceKYzA57q1VF
=XFgC
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jan_2010_15_05_01_+1100_g2Io_UgSLZBefBjg--
