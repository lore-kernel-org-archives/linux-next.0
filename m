Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC640314A;
	Mon, 18 May 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107215; cv=none; b=P3AvyzbJ/H+sspvUQYsDyvX8RdNXdSTluxLqaZWUOiIV56oqMHzxw6w25ZatQb/EiK1Lz0/bC6J8RRWZP5c8SXAG3RmwAWu0dRALZ3eygQeAIaKK7b0cZFkQ3jBrpeKUtvZn2+CrkDUT9mMuJdIQJwvo+EsTcjFJ6AxzVO8qshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107215; c=relaxed/simple;
	bh=MLL7wWwYSO43hA3SBzOZIOMawI4DyuY5plNRm2XVq0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DtajaC9Hwhwk7rJfCLfV+QpUfllodnZYjANQj/p62o10S7ZwjOZNq2FLCy01ZAWGmlHiVdmBKzujTeGEKoV1CO1xBm2c6Qg6Fd3Ch1oADf9BEHMunCZEGn3fse/DQw21lQQWNegMBNqGdzD+BhlDkZPHfZlqiY2y3+Jygn0z1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBqs5EUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBqs5EUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A1FC2BCC6;
	Mon, 18 May 2026 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107215;
	bh=MLL7wWwYSO43hA3SBzOZIOMawI4DyuY5plNRm2XVq0I=;
	h=Date:From:To:Cc:Subject:From;
	b=iBqs5EUsBMQ0e7s0bZsnq9WAMdkkRY5sLE1Q0bG7HLpqG3NMvOD3+y3PpzQMbrqbL
	 YpZOg8VmDeX6B0zGTg8QQ9OSltrkZ0Pzk0Qh72+64t5UVOdnVd9zdx0XOw1AiWcf4N
	 KTKNrh4MI4uaWPzHWQv2NWOG8pGpd8e7xikI8vf3Pyh7Ij3bm49UICLvQp8yd6CkkH
	 YxwgWmW1Zgb/gRAaN5mXP7TESGLciWSgNn2cr7Q0XUdq0KqZP3XlPl45vPCYEvz1Rd
	 AdgeT5gx24SLU28H4TszGn7OMTzPXbmb+wHenw83qGW27OUhFeUgdaZofUGwCW76cm
	 St4HGEGNihMCg==
Date: Mon, 18 May 2026 13:26:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with the origin tree
Message-ID: <agsFixoL6yMvsULA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9OEOaigUfN9Tq3Mp"
Content-Disposition: inline


--9OEOaigUfN9Tq3Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/infiniband/hw/mana/qp.c
  drivers/infiniband/hw/mlx4/srq.c

between commits:

  c54c7e4cb679c ("RDMA/mlx4: Fix resource leak on error in mlx4_ib_create_s=
rq()")
  6aaa978c6b621 ("RDMA/mana: Fix error unwind in mana_ib_create_qp_rss()")

=66rom the origin tree and commits:

  271746ec81325 ("RDMA: Convert drivers using min to ib_respond_udata()")
  22d072b3bcc59 ("RDMA: Convert drivers using sizeof() to ib_respond_udata(=
)")
  23a45206d20de ("RDMA: Use proper driver data response structs instead of =
open coding")

=66rom the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/infiniband/hw/mana/qp.c
index 0fbcf449c134b,c50a1eafee58c..0000000000000
--- a/drivers/infiniband/hw/mana/qp.c
+++ b/drivers/infiniband/hw/mana/qp.c
@@@ -212,13 -210,9 +212,9 @@@ static int mana_ib_create_qp_rss(struc
  	if (ret)
  		goto fail;
 =20
- 	ret =3D ib_copy_to_udata(udata, &resp, sizeof(resp));
- 	if (ret) {
- 		ibdev_dbg(&mdev->ib_dev,
- 			  "Failed to copy to udata create rss-qp, %d\n",
- 			  ret);
+ 	ret =3D ib_respond_udata(udata, resp);
+ 	if (ret)
 -		goto fail;
 +		goto err_disable_vport_rx;
- 	}
 =20
  	kfree(mana_ind_table);
 =20
diff --cc drivers/infiniband/hw/mlx4/srq.c
index 767840736d583,0b4df4f48ca14..0000000000000
--- a/drivers/infiniband/hw/mlx4/srq.c
+++ b/drivers/infiniband/hw/mlx4/srq.c
@@@ -191,11 -191,15 +191,15 @@@ int mlx4_ib_create_srq(struct ib_srq *i
  	srq->msrq.event =3D mlx4_ib_srq_event;
  	srq->ibsrq.ext.xrc.srq_num =3D srq->msrq.srqn;
 =20
- 	if (udata)
- 		if (ib_copy_to_udata(udata, &srq->msrq.srqn, sizeof (__u32))) {
- 			err =3D -EFAULT;
+ 	if (udata) {
+ 		struct mlx4_ib_create_srq_resp uresp =3D {
+ 			.srqn =3D srq->msrq.srqn
+ 		};
+=20
+ 		err =3D ib_respond_udata(udata, uresp);
+ 		if (err)
 -			goto err_wrid;
 +			goto err_srq;
- 		}
+ 	}
 =20
  	init_attr->attr.max_wr =3D srq->msrq.max - 1;
 =20

--9OEOaigUfN9Tq3Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLBYoACgkQJNaLcl1U
h9Bo/wf9Hj0+n33jG/fcHRYp7Q9fQaKo3dKhCNZe7QEHyI1Dwtq8813hVJ6Ua+9z
1IR9ZF24DyF4YE7AanMgU5Gi1EhH+RjhOgfiw/BWAUaKy0c688cVfqLM2ZjfP13p
yYSbuTzOhmwu+XfRLk7ryIcUwMRlfjt/4UFcYpD4EagE8n4r3SYz6YbMTxDRdeHq
Vcee5vttl+cRep41dj0OUUQuN5fL4l+CVqkqg3LhRcJ+WpF8ZLO6e0fggqWKvMSE
swoTOD9Xw0qZYw1UeXEb6vzhUuZv9guMhGwH1hY+GHh6nfNxRe366csacAqeuaEG
3qt2kuGCxFB/01Ae7dLq/8v0Kbpe9g==
=LfoN
-----END PGP SIGNATURE-----

--9OEOaigUfN9Tq3Mp--
