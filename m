Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA7D443A8F;
	Tue, 28 Jul 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246313; cv=none; b=CUUSwY6miaaHBsH+YV274gBW58Sw2Kb6qgHX2egInV0uk5iZSeRoGZVD3DG6odT9pUkoZ2x5U1hdPu8O1Vh7E6ln+cq0Wv8P4Xfhehrkg3SMALXzyZimH2dVPpKQR7ZGWOrNameHsulcPjzc8QIJ5fYFrwFaUc9KLO/rjjCIglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246313; c=relaxed/simple;
	bh=Hx8ntUErcPial+4LAGuDZE2LOZAY1OcosprnMya3xBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sa6ObsjS5stYWeALnSrC7IwczkQok+kKX8PASE3GC0NOBzmnoKJpjbxvAusLahV4BiQqFuIaT8ycISeNS8jSqZ1cgRlVHH5+fHGOCPp0sg41MlQy7DVteskbmv+/R++CIzWrP+H9P06zmeGu+5vZBwcnSKGifv3EzpnjjC/XOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULOABcUa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULOABcUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1091F000E9;
	Tue, 28 Jul 2026 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785246312;
	bh=RV6aitj9SVBwFSXuDlGyBX8vl/N0dbTo+xzvBYh94+s=;
	h=Date:From:To:Cc:Subject;
	b=ULOABcUaAn/TiqtbSWSpV+cMoO7c58LOVeBg3O/ZVd5oSDy7zC3UaTuYwY0StWRo4
	 sVQfd7hJMQenEpCI1TusUYGUgKWY5oHSw6F7OfG3rIQRRRhJ/r0BWItC7RXyHPHAA0
	 NAgClrZVzXTNYRqcb7jjHpqjpT6FQKRv4qzwPuMYCGKl+5O8jqBHnpGSAooHsQbaIU
	 HwFiNQjQIFtaVbnTx67VCJ7TVQmlhymauY7pyPVtSU2xMfhxWfvpXBMIQMTfX4hQZd
	 59D588CbqNCNWB7qbIYPOdnNkUimL6JfEZN1kHPr6tc2TVcrvB0qXwfoFNzcNgWNuQ
	 GwHEPJwRuIYrg==
Date: Tue, 28 Jul 2026 14:45:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <amiyZN5HqHZ6EMlj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="627lZO7SXTlCQXKu"
Content-Disposition: inline


--627lZO7SXTlCQXKu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "__inode_attach_wb" [fs/ext4/ext4.ko] undefined!

Caused by commit

  c26339e1df335 (ext4: Fix data integrity writeout issues in nojournal mode)

I have used the tree from next-20260723 instead.

--627lZO7SXTlCQXKu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmposmQACgkQJNaLcl1U
h9BFvAf/SiQSNOo8DobVwgF6z6hM7IB5Zyv6w1TkEtzmAxmbIRRkiIjedFipAqRL
OMHDEYzLkofEMYU4rkye/fp5puvOEdU58L2yexUJkOJry8bMiLVOY+TZL7/OzvoO
/p37IMr8UvftJvwxxeQONPwdWd7ORurnlJuM2hvJl8qOPus4CZEtB1qspusbYCLr
b6J8pUz9YIc/WDZc+a91M2NhM4g0Nn0HKA3yjDVB7fOE8dBVR+nkVXsikwoJjHht
WGilVL/93XqGLQ3/AeNPi3fxSZfV9C8XIDGZt6+dnfTg212tZBlC1FuhSr/tEcAm
8U4mjT5p5kxgb4ijtMLeioJ+sXEvuQ==
=vI/F
-----END PGP SIGNATURE-----

--627lZO7SXTlCQXKu--
