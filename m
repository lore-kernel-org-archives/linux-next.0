From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext4 tree
Date: Thu, 7 May 2015 11:14:32 +1000
Message-ID: <20150507111432.272e30fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TYgeKb/kH2vSpkMPVZ.NGRH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57228 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751565AbbEGBOl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2015 21:14:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/TYgeKb/kH2vSpkMPVZ.NGRH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ted,

After merging the ext4 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/ext4/file.c: In function 'ext4_file_mmap':
fs/ext4/file.c:226:3: error: implicit declaration of function 'ext4_get_enc=
ryption_info' [-Werror=3Dimplicit-function-declaration]
   int err =3D ext4_get_encryption_info(inode);
   ^
fs/ext4/super.c: In function 'ext4_clear_inode':
fs/ext4/super.c:958:19: error: 'struct ext4_inode_info' has no member named=
 'i_crypt_info'
  if (EXT4_I(inode)->i_crypt_info)
                   ^

Caused by commit ef8a5d07c606 ("ext4 crypto: reorganize how we store
keys in the inode").  This build has CONFIG_EXT4_FS_ENCRYPTION not set.

I have used the ext4 tree from next-20150506 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/TYgeKb/kH2vSpkMPVZ.NGRH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSrx8AAoJEMDTa8Ir7ZwV1+EP/iEH6LFitFKY+ZYO8iXJPao/
m6U2L467zf/Rzw4OgmM2Bhk3x8HWrgSZDYFIclcVtCMYKrYKZRCGH5S4o7TTwT/l
vME0Qoi5sJsn85NhKUbmFhQXQxC7CJ66Xp8DUUA2jS4MvYi0bDQ3ey12nASHstWP
CZXkbCKEd+YMLy+6OZdGRPJG0+nja4pnnymSYQrF4XFo7H+E8qWKBbKP34YTqDsU
SsSOLY33YBziIS+TYR9hp6y7FEnFhQcRcARHEFrbpi32bu/A25rjgRPOk5n1RIRv
qLKDRkYmV7TXIP/Rn/IjrQdgdR3ZPBxw7y+YjypRybPyQj9A6SYVLIan7pvWqs/l
/Rs1kzWzIhcnmm9esDsmQl7+FCy0JnfbkgR/plNMbF1q08+rtHj50NeLkMEFMUZY
Hb4p/E4opx3KTw4xw19cQhATGl6VwjfuQFvvFTzxwlldhozOD44s1tDg5Td7AMhG
yvefss9ATiqNTF+fasGzCwC6+9p31XTzUkjpCubKHo9WnuXsZ+h46ZuY0JZyYyof
NBheu5nbN0XJgqD85dZj64vOGCaOERLvE2EsYge2V5G3evpJSAG7N1txqk6GC8Ne
UTRWAAw96FztyxxBHvKHcwBroc8dkK+7Px5f9kh/0OMLXlFyvQi1vHAQHgfJ2eep
yKjB1MhbcDSeYtROhEVn
=SjGf
-----END PGP SIGNATURE-----

--Sig_/TYgeKb/kH2vSpkMPVZ.NGRH--
