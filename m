From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: proc tree build failure
Date: Thu, 20 Nov 2008 17:24:25 +1100
Message-ID: <20081120172425.135c8cf8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_17_24_25_+1100_r5jAP4Vnw/eewO+V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38381 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753604AbYKTGYj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 01:24:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

--Signature=_Thu__20_Nov_2008_17_24_25_+1100_r5jAP4Vnw/eewO+V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

Today's linux-next build (x86_64 allmodconfig) failed like this:

security/selinux/hooks.c: In function 'selinux_proc_get_sid':
security/selinux/hooks.c:1182: error: 'struct super_block' has no member na=
med 'type'
security/selinux/hooks.c:1183: error: 'struct super_block' has no member na=
med 'type'
security/selinux/hooks.c:1189: error: too few arguments to function 'memcpy'

Caused by commit e23b822350796e690a46873058d220878a18564c ("proc:
make /proc/net it's own filesystem"). This has clearly never been
compiled with CONFIG_PROC_FS set!  I have dropped the proc tree for today.
Much better testing is required - this should never have been submitted
to linux-next in this state.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_17_24_25_+1100_r5jAP4Vnw/eewO+V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkklApkACgkQjjKRsyhoI8zdOwCfW1igx6F0TmhfHutd1mJ/4pe1
zHMAn3XZHrd77Wrjm3WsC+OOpSRlPCdo
=k2+G
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_17_24_25_+1100_r5jAP4Vnw/eewO+V--
