From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (kgdb tree
 related)
Date: Mon, 1 Aug 2011 14:22:57 +1000
Message-ID: <20110801142257.0fe7bcceaa0c61527b9597c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Aug_2011_14_22_57_+1000_rGcjaskMqRfyrZr6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37105 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751025Ab1HAEXF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Aug 2011 00:23:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__1_Aug_2011_14_22_57_+1000_rGcjaskMqRfyrZr6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

After merging the final tree, today's linux-next build (sparc32_defconfig)
failed like this:

kernel/debug/gdbstub.c: In function 'gdbstub_state':
kernel/debug/gdbstub.c:1098:3: error: 'gdbstub_use_prev_in_buf' undeclared =
(first use in this function)
kernel/debug/gdbstub.c:1098:3: note: each undeclared identifier is reported=
 only once for each function it appears in
kernel/debug/gdbstub.c:1099:3: error: 'gdbstub_prev_in_buf_pos' undeclared =
(first use in this function)

Caused by commit faed702e3b31 ("kdb,kgdb: Implement switch and pass
buffer from kdb -> gdb").

I reverted that commit (and 621ebf205b99 "kdb: Remove all references to
DOING_KGDB2" and "kdb,kgdb: Allow arbitrary kgdb magic knock
sequences" that depend on it) for today.

BTW, that last commit (29e3c61ef33c) doesn't have a SOB line.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Aug_2011_14_22_57_+1000_rGcjaskMqRfyrZr6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJONiohAAoJEDMEi1NhKgbs1/8H/0Ug+mfzNt8KnW+EA5xdY0Is
rqd651zKVc93b1biVYYjo7ZYcb3dCiXUlizVDxUgl/wSE/yrooygoMKBmGx7dgFt
QhHDJ3lJ43hN/RS5i+c1oC1/OIUKl6iwDaTBPVGt09KnKYGelMn1IDn9YU4pP9TA
FGRQnyf87CEhH2nvKcxGGc8DNxHya+1Sxjn2FCjvG5NXBRvUVKWVYB0ZJQR/U0nC
4Slkk2CTFUU3OT8HpfP8VNDUGCZSKV3/PCGYEZOSSOOynBHe+iQex0HhEDbDmU0J
0rYFL+g2AJRDRcvehQL81Sm0GN0J7223FWp4IfFw/UWtF09sMHJttKXAmRZWhXE=
=7Jgx
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Aug_2011_14_22_57_+1000_rGcjaskMqRfyrZr6--
