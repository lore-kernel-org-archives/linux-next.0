Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013639;
	b=lElp8/AuBTJQeItyEaKFzftpLX8//WxhsAOgxKldLIODhWPIRj35c4k24tjjlJAzvWci
	 IpdeSg6vrMcKYYDqgxL4w/sn4mkG1jj/4zZx0CyauXuo3rC8ONk3qq0Xc6IVnm61YGjLL
	 4qyS8xJ7R8jO++kWQXDLMlZdG554akBqAP/+XQ6Fc5DnZPceJTa8EoKdo+EKnQQveYPJl
	 wN7FWEtKhAHbxnFVODosW0BbNNfrY/d670EJjBV2ouypvL2jul2tYLqUKRyUYrp5wn5/4
	 u5/sDf61nY9CwGjSHRJgHXVrAtrjtARFKCr14JhpqDwgPd8ihFMibDCsYLz4bLTiBDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013639;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=AWLwsTpHtjgyhsjE8YjCOAaL8ahwBFmsReEUaaPVOfk=;
	b=nFBjZEaCZ7Vm2a1+gerZuynhvCMLTuykqXEgGAliZntFwACuGaRr1OP0v1U+dmjWjTNP
	 YAztRCebXbflXynj7Pcv/+tTEIrmvlrgEmw9P8VIw9jK2VuqVdRyly/jLh4rAVq0tC7pa
	 eVKzmZ95MnWEQNzLgi2Hha+2fjGKGPvU14rXMl4BdHKsMGAzr1OfWy1mHmuDAyAmskRnx
	 rrqL094G2ZaJlkxt657gffydLDQP6PSk9MNaMBUkHW0yGcsxR3IqQ2/1DlTdBG6y9RcfK
	 /Y613ppQD/K1x/2apxFVgLy3HUHYNZFMDRbRlhM2YkH0eQ75aEZsCZYBWwZTTfC84PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J412sb5l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBA606A31C;
	Wed, 18 Nov 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J412sb5l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB0C1F000C4;
	Wed, 18 Nov 2026 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013639;
	bh=AWLwsTpHtjgyhsjE8YjCOAaL8ahwBFmsReEUaaPVOfk=;
	h=Date:From:To:Cc:Subject;
	b=J412sb5lvoRLv2pnJHcCalcKr1h+cxIstRgyRFjs6nP+bkUeffp2y2KN/lNOzxG70
	 HifhpTF6v/M0ynz4Efpchi10SwmSB4EgIJ4foTIWh/s2DQpLDwsOp9Qlnv2pL3U4Iv
	 /c7IIhsofHEYIr8Pkto7MHOdD5tFy9LYw4eFDPJgT9efdfojudyyztAROod5rP+cZF
	 wETOW4wu/VKzjJu1ujuTmo5uvhCSup9nSu/xLTAmENRJbZbeL/DeaDp+qt97tpSJEw
	 rZXGUlv+GawNdGr5tqdAYZbgPmu4JDJPEmZLlE7WEpaCc6QSztBoI8EvLQ0mP03yuW
	 mwRRKGDebiP7Q==
Date: Wed, 18 Nov 2026 14:53:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shao Mingyin <shao.mingyin@zte.com.cn>
Subject: linux-next: manual merge of the block tree with the vfs-brauner tree
Message-ID: <av28A8BdSAcVJWk0@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="3jFE0u6TUvKpSya6"
Content-Disposition: inline


--3jFE0u6TUvKpSya6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/target/io-cmd-file.c

between commit:

  054280c7786b6 ("nvmet: take freeze protection for writes to files")

=66rom the vfs-brauner tree and commit:

  bcd5316e708d4 ("nvmet: use overflow-safe range checks in the file backend=
")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/nvme/target/io-cmd-file.c
index 083f4ffb9bd6e,3098b902f5198..0000000000000
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@@ -121,12 -117,19 +121,25 @@@ static void nvmet_file_io_done(struct k
  	nvmet_req_complete(req, status);
  }
 =20
 +static void nvmet_file_io_complete(struct kiocb *iocb, long ret)
 +{
 +	kiocb_end_write_iter(iocb);
 +	nvmet_file_io_done(iocb, ret);
 +}
 +
+ static bool nvmet_file_check_lba_range(struct nvmet_req *req, u64 slba,
+ 				       u64 len, loff_t *pos)
+ {
+ 	u64 pos64;
+=20
+ 	if (check_shl_overflow(slba, req->ns->blksize_shift, &pos64) ||
+ 	    pos64 > req->ns->size || len > req->ns->size - pos64)
+ 		return false;
+=20
+ 	*pos =3D pos64;
+ 	return true;
+ }
+=20
  static bool nvmet_file_execute_io(struct nvmet_req *req, int ki_flags)
  {
  	ssize_t nr_bvec =3D req->sg_cnt;

--3jFE0u6TUvKpSya6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9vAIACgkQJNaLcl1U
h9DWWAf5AUMG4Khb3k/efQAXP0L5ihowEoRloYQnNlBnr6SCfBWnJz2A2HkjkXc5
PNqd+VyZvYxkImtW3YrXdAsoySUg6Ls0KWxy+G3qVQDS308Jn0K5Yq8/L5jYocZM
Al4WP9fQOOgyw18xFnRjxj/KnjDSXKyg9SR35etiWKhomzbxXb9OGqmdAEOfGP9N
9j63jTx+sB7azGRUIzqNaFJC9fZ5ZUJJVG7XBhZcEyEb+XBugRqqo4HidsBzruBs
c7lrqFImW4Bds/mFWHqVlKAPqxawbov+5cxPxRWEAbbflv6c4hzSXkNrBeki+AG8
njngHN3ieV3yiKECkAAi+82qpblKKw==
=MxLY
-----END PGP SIGNATURE-----

--3jFE0u6TUvKpSya6--
