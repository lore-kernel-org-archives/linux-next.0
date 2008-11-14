From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: security-testing tree build failure
Date: Fri, 14 Nov 2008 18:43:13 +1100
Message-ID: <20081114184313.27dbe432.sfr@canb.auug.org.au>
References: <20081113184624.7e29385f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_18_43_13_+1100_nKFMaJ8.Ozd/BVie"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44654 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750957AbYKNHnW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 02:43:22 -0500
In-Reply-To: <20081113184624.7e29385f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

--Signature=_Fri__14_Nov_2008_18_43_13_+1100_nKFMaJ8.Ozd/BVie
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Thu, 13 Nov 2008 18:46:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc pseries_defconfig) failed like this:
>=20
> kernel/built-in.o: In function `.__audit_log_bprm_fcaps':
> (.text+0x63aec): undefined reference to `.get_vfs_caps_from_disk'
> kernel/built-in.o: In function `.audit_copy_inode':
> auditsc.c:(.text+0x64594): undefined reference to `.get_vfs_caps_from_dis=
k'
>=20
> get_vfs_caps_from_disk() is protected by
> CONFIG_SECURITY_FILE_CAPABILITIES but the call sites in kernel/auditsc.c
> are not.

This error is still there today.  I will have to drop the
security-testing tree on Monday if this is not fixed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_18_43_13_+1100_nKFMaJ8.Ozd/BVie
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkdLBEACgkQjjKRsyhoI8xKCwCgmiwHn+m0xz2yJM+SGDmUz3I/
SkoAoKJfJlssNKyMFVABA4PbQnt4zJKG
=ylb0
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_18_43_13_+1100_nKFMaJ8.Ozd/BVie--
