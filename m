From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext3 tree
Date: Thu, 31 Jan 2019 15:14:11 +1100
Message-ID: <20190131151411.7e8b89b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8o/_ST.PInOHu0vP8rsGp0e"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/8o/_ST.PInOHu0vP8rsGp0e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jan,

After merging the ext3 tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

ld: fs/ext2/super.o: in function `ext2_fill_super':
super.c:(.text+0x1494): undefined reference to `__divdi3'
ld: super.c:(.text+0x14bc): undefined reference to `__divdi3'

Caused by commit

  455d38a0e62f ("ext2: Fix underflow in ext2_max_size()")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8o/_ST.PInOHu0vP8rsGp0e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSdhMACgkQAVBC80lX
0GxR9gf9FEto0xpI7MLQl7zy+a/dkbLaUuljzr5mdaRNn39EFCQhiujoPRtDAtRZ
rTGRelCJ9mMpnjXNmYFtCEmrGSsJs0zEMh2ZxdHjsj+QIAeBhXv+J+6Tof1U31OZ
25fNTfjKk/uOUESQ/MtWg6k2LI5k7iguaWZajCK9B1Rb4HfGC8K198+T2brdC2Cy
0Mp060+akFsii7J7x+ECvaX+9NSG1p6iR2tn4KC/JUJ0X6w8k8axc6artsm0FhUG
/V1/i22SyPz0Kpyjl5nnaW4Bgt0kvyYSjW7VPo1vy3DXUQoYGlFQIf+lvb6bCmmR
bs1Xzjiljm2YW5O56mGvtg3Ca1TUOA==
=m/j+
-----END PGP SIGNATURE-----

--Sig_/8o/_ST.PInOHu0vP8rsGp0e--
