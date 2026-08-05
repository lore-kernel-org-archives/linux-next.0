Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269A938D3E6;
	Wed,  5 Aug 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940572; cv=none; b=YHOyaYYcPizQI8GAVlJoQlPXzaNk6ZpfMFYaEO99KTb3gV8dLRA6XLlxA+dY5yGZvWbOHDIA80hPaITqTdj8MCgCZdF6nJ1UOAU2CtksJ56NRYaZTz6wUENrb+xmSsolcMMtIUWok4zZxkiQ9WmRMvgTV5W8s4c2QjrrZpQKpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940572; c=relaxed/simple;
	bh=Pe8r3IFjp70w7luE1DSCFUwMqCvmEyFD3zw6Z9Skl6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBU5KIJhMF7JLrDn32ohY/uQ7oPLAtfX0oM6F1EvBogq/wIWBMPN2eTkTLF17Vk1XGvgBUc7EqTG6HwLB3ch3uysLPsCFGJWCchTnKlI4q6YiZBTpHK6hdCSftQj/8Mf14ru1hdYEMHWMBLD7VMb/RTskxTUEoo3hGurWWQN6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTXZemVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTXZemVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6231F00A3D;
	Wed,  5 Aug 2026 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940564;
	bh=O7hi9ni/YCDPq9EKVl5mlFO/wpk9AXsaavaXh1PW9yo=;
	h=Date:From:To:Cc:Subject;
	b=aTXZemVzkpdxSnwCxxz8U7kUYmSvdTeLoI6wzZqwZi4GOET7JTjO6RU/sTIh8aUnM
	 m8GCFiHY/QxI3CI763a6L2R2O+M4OXQ2JDYF6WM0b9XhJNi4VJJWXMttpOlkSz6/4G
	 eE/aLfPBiZ3O3XoaN1QKh/DVvtCfxHIaSBNSj7AFSOV/RfMl6SJGGvbEEFgLpULZmr
	 PMLAZQMW0NuN29wsSNx6s3R/1eiV0iX4z9kFUmabh6wbYbdceVm+Dm8QyMU217cV3m
	 mxhi9klbt2OhklBN/NWcKGGESYxFfLzvhVSBmvpztZcsAHCUbM2pYpdYqve+0MmIaP
	 dYeeYE5pG1fQQ==
Date: Wed, 5 Aug 2026 15:36:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <anNKULWanUsTk3xb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fMHHB175ZJGFbCzb"
Content-Disposition: inline


--fMHHB175ZJGFbCzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/6lowpan.c

between commit:

  518aa9505fa10 ("Bluetooth: 6lowpan: hold L2CAP conn across debugfs contro=
l")

=66rom the origin tree and commits:

  d740cf77461a4 ("Bluetooth: add annotations for l2cap_data locking context=
")
  d138ff8690c8e ("Bluetooth: 6lowpan: hold L2CAP conn across debugfs contro=
l")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/6lowpan.c
index d504a363a30f3,30f4afa18bc8f..0000000000000
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@@ -1007,6 -1007,8 +1007,8 @@@ static int get_l2cap_conn(char *buf, bd
  		return -ENOENT;
  	}
 =20
+ 	lockdep_assert_held(&hcon->hdev->lock);
+=20
  	*conn =3D l2cap_conn_hold_unless_zero(hcon->l2cap_data);
 =20
  	BT_DBG("conn %p dst %pMR type %u", *conn, &hcon->dst, hcon->dst_type);

--fMHHB175ZJGFbCzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzSk8ACgkQJNaLcl1U
h9BL0gf/QLJncCmSz+n5SisG29xzP99OVhTMrlAeo4zHuxHDOBN2CrfMSTAUMG3E
lLnOC5AFnpTsSntI4S7CGD85MJdG23mEVu8YO1y9snuTVd0Xpg2pmqZZDVZjBYDF
WXbEgfT6a5wBb2pPkYgo3FWKSs66YURkhz7I/8I2vh/xyH64Swz2xp0I+vKrFu9Y
eFXesgZRk7gvhzFnHDcUOwp7Zld2PZfvZCVZImJOcBFUBxcEZIvpW3FtgTJZzhS4
4BYWxMuECARS+qBpAEtaif+osziHyZnvrALERHh6RZOpdSyvf7bmJXloume9xbdT
rn0VwvoFi6D4LybvwKXKpJy3r3bBrQ==
=Kthg
-----END PGP SIGNATURE-----

--fMHHB175ZJGFbCzb--
