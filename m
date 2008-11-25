From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ocsf2 tree build warnings
Date: Tue, 25 Nov 2008 21:31:02 +1100
Message-ID: <20081125213102.28efa104.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_21_31_02_+1100_PND3OBBNYMBD=T4m"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40248 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752507AbYKYKbU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 05:31:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mfasheh@suse.com>
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>

--Signature=_Tue__25_Nov_2008_21_31_02_+1100_PND3OBBNYMBD=T4m
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next build (powerpc allyesconfig) produced these warnings:

fs/ocfs2/quota_local.c: In function 'olq_set_dquot':
fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long =
int', but argument 7 has type '__le64'
fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long =
int', but argument 8 has type '__le64'
fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long =
int', but argument 7 has type '__le64'
fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long =
int', but argument 8 has type '__le64'
fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long =
int', but argument 7 has type '__le64'
fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long =
int', but argument 8 has type '__le64'
fs/ocfs2/quota_global.c: In function '__ocfs2_sync_dquot':
fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long=
 int', but argument 8 has type 's64'
fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long=
 int', but argument 10 has type 's64'
fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long=
 int', but argument 8 has type 's64'
fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long=
 int', but argument 10 has type 's64'
fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long=
 int', but argument 8 has type 's64'
fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long=
 int', but argument 10 has type 's64'

These are because s64 is "long" on some architectures.  Our usual
solution is to cast them to "long long" when printing them.  Also, you
shouldn't directly print an __le64 (you need to convert it to the host
type first for it to make much sense.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_21_31_02_+1100_PND3OBBNYMBD=T4m
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkr0+YACgkQjjKRsyhoI8ykFwCggK1mg2vZRMQkR0QMTktK9ldZ
lzgAoId4zNoEhLq65v6KHBOL1pzgn1jY
=3hI4
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_21_31_02_+1100_PND3OBBNYMBD=T4m--
