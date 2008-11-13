From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build failure
Date: Thu, 13 Nov 2008 18:46:24 +1100
Message-ID: <20081113184624.7e29385f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Nov_2008_18_46_24_+1100_Xq4/1alyFb3LUTVU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46935 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750927AbYKMHqg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 02:46:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

--Signature=_Thu__13_Nov_2008_18_46_24_+1100_Xq4/1alyFb3LUTVU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc pseries_defconfig) failed like this:

kernel/built-in.o: In function `.__audit_log_bprm_fcaps':
(.text+0x63aec): undefined reference to `.get_vfs_caps_from_disk'
kernel/built-in.o: In function `.audit_copy_inode':
auditsc.c:(.text+0x64594): undefined reference to `.get_vfs_caps_from_disk'

get_vfs_caps_from_disk() is protected by
CONFIG_SECURITY_FILE_CAPABILITIES but the call sites in kernel/auditsc.c
are not.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Nov_2008_18_46_24_+1100_Xq4/1alyFb3LUTVU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkb21AACgkQjjKRsyhoI8yLowCfbspT+LNhNJC70B5JPTT7GpxP
zxQAn0kW84la3iYDNwM7BWgcEfhJYssO
=LEN6
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Nov_2008_18_46_24_+1100_Xq4/1alyFb3LUTVU--
