From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build failures
Date: Fri, 25 Sep 2009 09:51:05 +1000
Message-ID: <20090925095105.b06d77f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Sep_2009_09_51_05_+1000_hZWrGBczf+9U3Mmb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60406 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750992AbZIXXvI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Sep 2009 19:51:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

--Signature=_Fri__25_Sep_2009_09_51_05_+1000_hZWrGBczf+9U3Mmb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/cifs/cifsfs.c: In function 'init_cifs':
fs/cifs/cifsfs.c:1047: error: implicit declaration of function 'unregister_=
key_type'

Caused by commit 3bc303c254335dbd7c7012cc1760b12f1d5514d3 ("cifs: convert
oplock breaks to use slow_work facility (try #4)") exposing the call to
unregister_key_type() even if CONFIG_KEYS is not set.

fs/cifs/file.c: In function 'cifs_open':
fs/cifs/file.c:401: warning: passing argument 4 of 'cifs_new_fileinfo' from=
 incompatible pointer type
fs/cifs/cifsproto.h:94: note: expected 'struct cifsTconInfo *' but argument=
 is of type 'struct vfsmount *'
fs/cifs/dir.c:134: error: conflicting types for 'cifs_new_fileinfo'
fs/cifs/cifsproto.h:94: note: previous declaration of 'cifs_new_fileinfo' w=
as here

Caused by commit 086f68bd97126618ecb2dcff5f766f3a21722df7 ("cifs:
eliminate cifs_init_private") which gives a different prototype for
cifs_new_fileinfo() in fs/cifs/cifsproto.h to the definition in
fs/cifs/dir.c.

This needs more care ...

I have reverted both those commits for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Sep_2009_09_51_05_+1000_hZWrGBczf+9U3Mmb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq8BekACgkQjjKRsyhoI8yqxgCfaFPgxlNpe/TleLspBi24dpMX
wLsAn0ImyG5uBAcIyQD16FRbNCfpjGCS
=h5E6
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Sep_2009_09_51_05_+1000_hZWrGBczf+9U3Mmb--
