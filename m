Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE634D3B5;
	Tue,  9 Jun 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018642; cv=none; b=lYMsTVflWlQhTu2fY6fn+6t8QKKQy+aywC5odXrdrbltRWbOTydOtPD12VaSXnL8duguzVSoPNXiwBhbUfYm1Yd+xlVaK3BUeA/H6eRdlH40Bm4+Scyi8J4BxVl5Lmq9lOttABjW2QS9NTLyeuwll/Ja0fTTedLNr/Bpvc6csuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018642; c=relaxed/simple;
	bh=hQQzowqrfdqKzGOWNJgdudb72H1MdCN+1LqqlomzTjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUalU1swD5DMtVmfN67vbBaFpB+Kpq7oV9gehkvlU/dMZFXiNolIBAQ8Z6S7Fuu14xZ+9DMXXuAqUSrJIu7MHa70ndwcDEnnNSF0mvMa8DaE32ulozCZq3zpPbDACYkH9TMkVHH5JeFpWWTEFcWWvyODBVPOAx4iYBRsGdXOVW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObVzICyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObVzICyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBDD1F00893;
	Tue,  9 Jun 2026 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018641;
	bh=bC+3wnQBhrpkpkChnz2vgzrQatyMcqexI/fZr9nhO/8=;
	h=Date:From:To:Cc:Subject;
	b=ObVzICytaDMp2qqaZ+C+ITNKI4GSVETpFybeC550Q+YFiiUN9WOz3Xs0vZx/POR4W
	 md2B78RGlgSedeUyjT7Awebdy3Ek1XnJm3Ap+1jVKZ+TVimykk5TZ2IyByurF6aY0n
	 wX0/jWRufK3TEX6RexJJiylC0gM3TElF96dZQ9YUvi9NbY7Jm0jbSoxHX1d0OMmWu7
	 gkpwbx3/BB/1bru3An4/sP1cgnq4hA/8UlWlTsia76FL5CQiq9yuNlvzYTaxPJGp0g
	 BC73WF8f7I83appjIuquk5Sdg17D/B8ogWUGYwHEAH+jcWLVzsz1ETo8EKFAEBoCRc
	 Z0AgBY4OeXfyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B81F41AC56AE; Tue, 09 Jun 2026 16:23:58 +0100 (BST)
Date: Tue, 9 Jun 2026 16:23:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the xfs tree
Message-ID: <aigwDvQMI2CHiLl3@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iYC323NjeywHrJH1"
Content-Disposition: inline


--iYC323NjeywHrJH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/xfs/xfs_trace.h

between commit:

  1113a6d6d5d133 ("xfs: remove the i_ino field in struct xfs_inode")

=66rom the xfs tree and commit:

  769e143b115a4a ("fs: add icount_read_once() and stop open-coding ->i_coun=
t loads")

=66rom the kthread tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc fs/xfs/xfs_trace.h
index ae5faa78783005,f87c738d84b248..00000000000000
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@@ -1157,8 -1157,8 +1157,8 @@@ DECLARE_EVENT_CLASS(xfs_iref_class
  	),
  	TP_fast_assign(
  		__entry->dev =3D VFS_I(ip)->i_sb->s_dev;
 -		__entry->ino =3D ip->i_ino;
 +		__entry->ino =3D I_INO(ip);
- 		__entry->count =3D icount_read(VFS_I(ip));
+ 		__entry->count =3D icount_read_once(VFS_I(ip));
  		__entry->pincount =3D atomic_read(&ip->i_pincount);
  		__entry->iflags =3D ip->i_flags;
  		__entry->caller_ip =3D caller_ip;

--iYC323NjeywHrJH1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooMA0ACgkQJNaLcl1U
h9DixQf+NxSl7blei/anOXCEtDbbHYYcWlcNuMjqhzKeEo6bAGde27yOzRI3GsNm
Ml+q8xVcNA0VODGg9be4KAJbVjgF7QtOQD7M2DiqB6Lc3nipxvU0CAuuDroE7ls0
8mUCFqqeiXQEuSMYo4YiTLhLJUJZzXLEjwMLS6vps51uDvAL8KZuWt1/c6NykiCp
VPvm/WKLghuQczZ2K3scSn5EaUvEeJ51pZGbC4vLuL526V7H3/DyE486TJjWq2R1
27iqkxUy5I1e/h2dV/RZQN5F46+xSHspNLirigTr3tZIgRQvERRX++dnigvCqHT5
uprxsi0zOxKElV9OUYoSB3Z/QhtzPA==
=uXpl
-----END PGP SIGNATURE-----

--iYC323NjeywHrJH1--
