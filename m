From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build failure
Date: Tue, 24 Feb 2009 17:56:49 +1100
Message-ID: <20090224175649.1bcc74cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Feb_2009_17_56_49_+1100_9m4cK.mQnznCc2dk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56252 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756155AbZBXG47 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 01:56:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org

--Signature=_Tue__24_Feb_2009_17_56_49_+1100_9m4cK.mQnznCc2dk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/cifs/file.c: In function 'cifs_fsync':
fs/cifs/file.c:1587: error: 'cifs_sb' undeclared (first use in this functio=
n)

Probably caused by commit cdff0d69360ad3b87e4ac019caa73c657cfe9c76
("[CIFS] Add new nostrictsync cifs mount option to avoid slow SMB flush").

I have dropped the cifs tree for today.

--=20
Cheers,
Stephen Rothwell

--Signature=_Tue__24_Feb_2009_17_56_49_+1100_9m4cK.mQnznCc2dk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmjmjEACgkQjjKRsyhoI8xOUgCeK/srj/r8GrTk6d0mpQo2qZ7y
FgwAn2l4ofEUcZoIAI5HJakBr2p1j4OS
=Vkzf
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Feb_2009_17_56_49_+1100_9m4cK.mQnznCc2dk--
