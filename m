Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185531;
	b=G1XCnYjC41JsAWiGszE0c9ba/Nyjpw/VeYfmVSpS7J/tfhqICyODsiJ/OU91aPZhvNh9
	 enVOJO3uWP1OXFjNu1EssUVFhJiojCbL+U0lnkeLVPI5WtCVs6jdnRFmrOVzt0BeqUaDv
	 qPAIotwYEaICTv6C9khPTa81HiIJANgwI7bR3/kUTxlOQZ7boUIHH075pJ9IbyDPchyjp
	 tXEgqw54b1bMQYFsVtNMexAL/H7DFzAr4/OvHUGzFFRGlJZ+FqWCdUxR9jxYBjIVdfVMb
	 hQaUWTB1GlueL+pT3IrTyCwComBUFNwC6sZ3zqudV69yMeNhfSrv4Of3I+jDZmWgGTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185531;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=DzcDFgaxwZ70Nu4UAgRqNOGGvC/ebUQ1JOWNP0TZoZs=;
	b=UZf+6Njv/5XSv1ZV/XclsqsFcREmyDgwDMM8pQ/+0ZoFc8olYoCjLNA3KGaHrIVhoFWS
	 bXk7MSctFmAlg4/reuooSTytR4vdFHX9CfTii33nJsXrzkcZknVLkYmJZJVGIHBfOYIwa
	 dTc2Eptub79+qPp1O9Uo/D8UjKi6GUYEJYRUG5WuoZOUcwR2IMj/L+j8y0rSP+RmxdnJA
	 GBypFVpNal/Hm74BfZMwElMCkgrwH5k+9EQUCsknTycqUxTFZrOGT7YcBHgFWiA0za3hW
	 SJtDNtxZHQO7TM+CxZql7TYi6lk/k5kW7xdIiJqxtydP9pNtmqTi9IUWwo0EqhsUsCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amRw5dbo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A086606A320;
	Fri, 20 Nov 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amRw5dbo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DA51F000CA;
	Fri, 20 Nov 2026 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185530;
	bh=DzcDFgaxwZ70Nu4UAgRqNOGGvC/ebUQ1JOWNP0TZoZs=;
	h=Date:From:To:Cc:Subject;
	b=amRw5dbo8+x4dBEW+OvjssYsxWmdzXANUPGh3UDWq/F5zBQ6eGmWOu+h9AkF6K8ne
	 yUoot1HJVP4X3OuorxaOcsEGObtS4yilK/+zMv1UgpAS2Vifid7FZL2aQgGjI7bhu4
	 8rfnHOVxuz9W4w44p2pzYmYLai7dTRmBps1g1ls7SEw8U6ztAn9ceNEKNiF7Z9w3jH
	 SHNHA7+9MiPykxhFdHYYwOUheAPG9rcXhtdqwST76H4U5FHBqcMFeMi8RwZ0I3bnSn
	 MQv/34bD+tgqup5SOcusoaJbeRaRpRZfHfPnlquqhlH1R0HlbNGhKORZYpjl6slttW
	 ljreCFOIRPFmA==
Date: Fri, 20 Nov 2026 14:38:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <awBbd8nN6VxxArGV@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qJ5MbS9v33Y32u8y"
Content-Disposition: inline


--qJ5MbS9v33Y32u8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  include/linux/fs/super_types.h

between commit:

  1e026a4556f68 ("fs: reintroduce SB_I_MULTIROOT")

=66rom the vfs-brauner-fixes tree and commits:

  30f726feea9bd ("vfs: add O_CREAT|O_DIRECTORY to open*(2)")
  bfd7be31a5a75 ("fs: add SB_I_PSEUDO")
  1e05d7077d1ea ("fs: add a generic emergency read-only state")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/fs/super_types.h
index b09e8b2087252,4454e3574b2cc..0000000000000
--- a/include/linux/fs/super_types.h
+++ b/include/linux/fs/super_types.h
@@@ -359,6 -362,23 +362,24 @@@ struct super_block=20
  #define SB_I_NOIDMAP	0x00002000	/* No idmapped mounts on this superblock =
*/
  #define SB_I_ALLOW_HSM	0x00004000	/* Allow HSM events on this superblock =
*/
  #define SB_I_NO_DATA_INTEGRITY	0x00008000 /* fs cannot guarantee data per=
sistence on sync */
 -#define SB_I_NO_ATOMIC_MKDIR	0x00010000 /* no O_CREAT|O_DIRECTORY on this=
 fs */
 -#define SB_I_PSEUDO	0x00020000	/* regular files are kernel interfaces, no=
t storage */
 +#define SB_I_MULTIROOT	0x00010000	/* Multiple roots to the dentry tree */
++#define SB_I_NO_ATOMIC_MKDIR	0x00020000 /* no O_CREAT|O_DIRECTORY on this=
 fs */
++#define SB_I_PSEUDO	0x00040000	/* regular files are kernel interfaces, no=
t storage */
+=20
+ /*
+  * sb->s_state bit numbers. Set with set_bit() from any context without
+  * s_umount and never cleared, so they can be tested without any ordering
+  * against the setter. Unlike SB_RDONLY which only changes under s_umount=
 in
+  * reconfigure_super().
+  */
+ enum sb_state_bits {
+ 	/*
+ 	 * An error made the filesystem read-only. The VFS refuses modifications
+ 	 * with EROFS, a remount to read-write and a new freeze until umount and
+ 	 * doesn't sync the superblock anymore. The filesystem still has to
+ 	 * refuse what doesn't pass through the VFS, see sb_emergency_ro().
+ 	 */
+ 	SB_STATE_EMERGENCY_RO =3D 0,
+ };
 =20
  #endif /* _LINUX_FS_SUPER_TYPES_H */

--qJ5MbS9v33Y32u8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAW3YACgkQJNaLcl1U
h9AtVQf7BZBGMhYod8avLIRDyWaGAv6UVPJLB4yL9JaHtdHdIGSZcMfHMU+vUHN6
+GywBJTfG4nZOSzethI9Hq4OPZ2uy3SVIWHMdJWQYeNz+3r95nXDJrap5EUBKv0B
L6ZTbiPqTLMvSie6XgVUG7JbG3GGTtU/aW8pZPqt2NX2DowXVncwicrPhv6+8lGV
TOt2V8zzpT3HlGRb0np3lqjAYTKh877oSzLS6lj1uMxuPkwWQ/Kg04qj4LZSMhpi
Ab/4H6gaxpJbdOfR0/5ggkccsoQMiSt+Awoev6MoL/j1HaJQNaTzBB4kDooJyW/k
m2IZmbvdKar70cqqEe8B3daWLIGWEg==
=W0mx
-----END PGP SIGNATURE-----

--qJ5MbS9v33Y32u8y--
