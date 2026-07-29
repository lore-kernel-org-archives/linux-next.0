Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0AA27FD74;
	Wed, 29 Jul 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334715; cv=none; b=tddtqEPcUvbyauMFV4pINxsKVW14LMFRzJ90xOOP/kbdAAlwv1BKLO1ShP9yfF9AHdslkLKWCefvbqTF4SluzFyf6b24ASZe88udBs7RvP3SUPZ07fnbHjsuE1L5cidT/iypF3vI6CihmHMMSmIxeN8cWGX6hIFUwsWOzcO6YA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334715; c=relaxed/simple;
	bh=szSLXp2TkVBRjc9OSM/kiwkJ9B/ZT8MBhb9crdFx4fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VLkDYqWYtjXZQ16/QYdIrXIRolpMMryLKyvW3RgNt7L0UIcG5Q07TZdjOw6c8gVtgXAD2Oa34eRzvCFID+dCDEO74xAZ8WKOFt9j4ZktyYnvQZ1oRFtphBg7oTQ58445/PMZYJmGEbSgSyQ9NddP3uAMgxXdb/Or0nrbNvJNx+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3hDh/Q5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3hDh/Q5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DCE1F000E9;
	Wed, 29 Jul 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334714;
	bh=XTqZ30rY6SHWEMX9sTd8i3rm7mJOoQyIoibdObDNEOM=;
	h=Date:From:To:Cc:Subject;
	b=Y3hDh/Q5GJd3q29fp54knPjx6JQxmUfJH1gnmAE6tnFnhNjdmCE4jmC6ytJecQGZk
	 rbFzXT4FnDduSWdgphTrJWPTaBKWRdQ4CVthPoI4sW/3YcZuI1u0bL687uXmPoBQtQ
	 Mly4HxyHETc4qyZOS9ASk/R0hhECmLn4IChLN/lcO4sdS6eiX4ZkYuTW+zJnzmnmaT
	 FHKCjIkbwz5uk7F+TyAzpAsuWkTM8ZNwpA14/ao+wdHQ1rAL5DM+CgMzGRyPQZkKSS
	 3Os+5cacKdNuBL5T82jGJdgJwkYhgy72h1hm3HfZqJ8guEDCZo6N4qCN0NNZX46LCg
	 ogvBL5XcIwXhA==
Date: Wed, 29 Jul 2026 15:18:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: linux-next: manual merge of the thunderbolt tree with the
 thunderbolt-fixes tree
Message-ID: <amoLtiBHq00XOaCK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVwFTe4orBr+x9Po"
Content-Disposition: inline


--EVwFTe4orBr+x9Po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the thunderbolt tree got a conflict in:

  drivers/thunderbolt/nhi.c

between commit:

  c35c173c3daa0 ("thunderbolt: Initialize ->domain_released completion befo=
re it is being used")

=66rom the thunderbolt-fixes tree and commit:

  5f40cba7d4fa3 ("thunderbolt: Assert downstream port reset on shutdown")

=66rom the thunderbolt tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/thunderbolt/nhi.c
index 35e3c119d5ee8,698fb124d5291..0000000000000
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@@ -1235,6 -1233,10 +1235,8 @@@ int nhi_probe(struct tb_nhi *nhi
 =20
  	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
 =20
 -	init_completion(&nhi->domain_released);
 -
+ 	nhi->host_reset =3D host_reset;
+=20
  	res =3D tb_domain_add(tb, host_reset);
  	if (res) {
  		/*

--EVwFTe4orBr+x9Po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqC7UACgkQJNaLcl1U
h9Ci9Qf/dBuOWUa6tBg6JtvSGjYKp9JdDPd16jBm5RwafQfcjzsABy+tgxAkWVLJ
Nscg6lI94Xl3cpFpjPKwTpL/F07L3Kt7yxVeKrSUOLCas57yczI8dsywf8EXzlVo
IjmQPjV91uxrRd9yz2Kl/83XCRLZclK6QoiNkq3KN2dwWEFhimzlDpWWYVL6Cqu9
RHDZv6m1Z8Bozl6PwMu2fCBbptbFDfjNrKtAM4dn7dszvk9RI1eX/1AGXsMnNmlJ
4rWXCMOo7UOMzcRUoX3WK8aFjS/O8UIQdpbAHkRWxUj3MUgqmGEp/IBmsUKZt56x
z0V6TG4k75Vbs8f7iSRfTHcXAqGWhA==
=+XR5
-----END PGP SIGNATURE-----

--EVwFTe4orBr+x9Po--
