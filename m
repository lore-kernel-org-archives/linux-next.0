Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473F22DEA64;
	Fri, 13 Mar 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406796; cv=none; b=e/alDsly49RweOQjULV+b1cGHM37f9QAh23l5gFbT9qyFpVJUJiusjIpo3iOTl4/ZQMeaAmeWChMlt9yhh3zrNBAG1PkVMKJx7N68DQN3r96aNvFlkCEOk2UT+LqarJLWUr7q57UmqdeAiCwvKPDuL12ABCqaDFxj6qtNE2iRKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406796; c=relaxed/simple;
	bh=ZU9GHJDfHSJeVHvweiwvTNZcUUU/V7Jz9lnyVRE3j7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rC6a/qhQfHBipzlBlIUhirAA2alwK2DTHFBGvTeuSwdT2DCgDVelRGZaLpnqgRGqb+KjYMFufjox+wLiyUezdvM+UpXRshIlmEG1czABB4LXRiHlgR+8yIo90C+0RqJrPcutdBNQ8Vekiiy//8/k3JmCkuTbxlIZQUUURSi7874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRRDMNkG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRRDMNkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A0FC19421;
	Fri, 13 Mar 2026 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773406795;
	bh=ZU9GHJDfHSJeVHvweiwvTNZcUUU/V7Jz9lnyVRE3j7A=;
	h=Date:From:To:Cc:Subject:From;
	b=vRRDMNkGHFKMP3M58jHAI8mHlJh9fR/BJbD3obc1rsPY2AXUtQSk5n8n6anjWuBaT
	 QORiZg5UsYlZPeQNeZe8xfa91m3LTJs51E2DYp7cf/GNikxAUF9y4PhE7JHpt9TUtE
	 VhEDEswjFTKLszkLrIVPF3nPaACKbfIzVlYZrlSfitJ03zv8ZFKBW1yh5tEU94eUoP
	 5EPDBHArzOQQw4y2FOXcyyeOcjMREPLzlmJ10sgbwzvOcLZ99B2zScqv0rE4LO5X8i
	 wJDiyO4vdJlgTbH7oA7Sf4uRvxAINqGYijBDWuefuSukk0C0jJg8uILe2KJnl44ZyQ
	 OI0pExTEVPPuA==
Date: Fri, 13 Mar 2026 12:59:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: John Johansen <john.johansen@canonical.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <abQKR3Lc2oG3vReu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z/u5fUlW60yd80A3"
Content-Disposition: inline


--Z/u5fUlW60yd80A3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  security/apparmor/apparmorfs.c

between commit:

  8e135b8aee5a0 ("apparmor: fix race between freeing data and fs accessing =
it")

=66rom the origin tree and commit:

  5c6c7ae93236e ("Apparmor: Use simple_start_creating() / simple_done_creat=
ing()")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc security/apparmor/apparmorfs.c
index 242c71b3fb6ef,32611e13dc3b0..0000000000000
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@@ -364,22 -289,13 +358,17 @@@ static struct dentry *aafs_create(cons
  	}
 =20
  	error =3D __aafs_setup_d_inode(dir, dentry, mode, data, link, fops, iops=
);
+ 	simple_done_creating(dentry);
  	if (error)
- 		goto fail_dentry;
- 	inode_unlock(dir);
+ 		goto fail;
 +
 +	if (data)
 +		aa_get_common_ref(data);
 +
  	return dentry;
 =20
- fail_dentry:
- 	dput(dentry);
-=20
- fail_lock:
- 	inode_unlock(dir);
+ fail:
  	simple_release_fs(&aafs_mnt, &aafs_count);
-=20
  	return ERR_PTR(error);
  }
 =20

--Z/u5fUlW60yd80A3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0CkcACgkQJNaLcl1U
h9BTUAf9Hg4mdSC/N6B4TjN4t6uMRDBioOEMpkucyw8iPVUWRwls17f+dOQNVRAY
JwrCJ4prkhrol9i9W8Lne2XfnvAhuZ/Z8L+Yz1wlAEGeTRuPwFJojwMXVFU9T/TN
FNTnOK7i8M6+xbyFDF/6pt+/Ep2yEDhpO2BzxNDFcSahEfcGMSxFkf8py2LkM8Yn
bUmlMcaUXStGMObtj5Li+YUSjplk3qbKNR3r7Aqh7/MG08fWfiQZiS8dwMtUXn7z
o49H83Jw3pnhaZKTVCsZU3GbsGw9sADwfgaBtHEsh3nx4l2dpHhaV+9Bz7ZQznW+
39bERDwds6VIuerlyw59ruCFrB9cDQ==
=tkFJ
-----END PGP SIGNATURE-----

--Z/u5fUlW60yd80A3--
