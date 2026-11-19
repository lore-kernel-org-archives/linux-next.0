Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108425;
	b=kNIxfJqmsS1C6eDvU9UZV54tiri8Xp8qQ99a8Be3yESMMfvHFPqukuvLHxFF4TLgVvho
	 PbmdpCgWquzo+1uTbazJ6BLS//qnKanYilXijaTJ2urECf6THZ48s2IPEEctr5zeT+q/G
	 LGtJ0i5r5qXG+oJb+7StfhvPO4vYQriY7aBnOkaP91nyWV2bKns3ZQCd9hOUCHvc+KW/H
	 ArTto+JP4Mqd4GUP/5P1ynT5dQnBZz6EmrUNCK4WpxcchIBdsd6OAE0zJ1eYZ+qS25pRR
	 lqVzgPk7pL3MOeGPlolYLjFdEZNc2gwTHwzFe8HMql2BqpqtUExEV7kPJtVSoD+UCaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108425;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=zufZPVnpl0LGoflgUiwggjmpOcY/OOAzsEMQ2nap3k0=;
	b=dipwZFJSQfunFxppmaRIzf7Lwq2PqV7SI5ucD0+5CkwjjFZseX99IYbFABc5wH2tJuyJ
	 mLGOOyhpXI96vyJ88ZZLQTDS6gNgdC+OyiQ4/mbON6ca8RGS939Lw8BX2kgGlY8f2IQnP
	 44PnzbHs8lH4SOelZNM9WgQpEIMI1Sprc10lwX/jdhfaTM1oHIQ+pwGSNhFPSWrzXuesy
	 YMIpo9/q34DCxbGQVWgaYlHBxAFwuS7VBz8pww82MkVhouGomkqUjPadS3vnR7bBgoYkR
	 DhKbMqo34pCBgw/fY5Syheqc/bXYrElWr3t3SKW5j51t6zQfgCesgAr1pN0pWmck8Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=He6J89WK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670CF606A320;
	Thu, 19 Nov 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=He6J89WK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EEA1F000C4;
	Thu, 19 Nov 2026 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108424;
	bh=zufZPVnpl0LGoflgUiwggjmpOcY/OOAzsEMQ2nap3k0=;
	h=Date:From:To:Cc:Subject;
	b=He6J89WKDoCmg0R79EI3IlUcQIMBUyH+GTqO/8CoKkamM1y/IExO175vZ5llBWeXz
	 b5uDVFPMp0+LinneBCUv3LZ2xSVKzeFe6k+yqxz6NK1OH0kLf6T1INvIHhWnfm9hN6
	 SQUtK4QXGoEFLMucYISXO+XQWZj+8xp6Dw+NLG+EGhUeHCJIUL1NetwNvjcZ9gp8jz
	 P3EEuLXI8P/yqZPt1DNRY04R1SlvzRz0/25h7G5ldLE+o2gAsbITGKodQj56ogQbg9
	 wuf38+CKBiNXvHBNU/AaIFN9Jc6XUk73PfhiILBA7OxXSlUf0WTE3gP707SySPYfdM
	 eKbyWiq+KT0Og==
Date: Thu, 19 Nov 2026 17:13:40 +0000
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Shao Mingyin <shao.mingyin@zte.com.cn>,
	Yong Liu <pkfxxxing@gmail.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the rdma tree
Message-ID: <av8uRPAvMk_hfVSu@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="5/Kj9YlV5ICw9O0l"
Content-Disposition: inline


--5/Kj9YlV5ICw9O0l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/target/target_core_transport.c

between commit:

  1ecb732b4524d ("scsi: target: Clear all control read scatterlist entries")

=66rom the rdma tree and commit:

  0fc91e8028018 ("scsi: target: core: Drop the dead kmap_local_page() NULL =
check")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/target/target_core_transport.c
index 267f5e2cc8b24,9819515ce9674..0000000000000
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@@ -1633,16 -1633,21 +1633,16 @@@ static int __target_submit(struct se_cm
  	core_alua_check_nonop_delay(cmd);
 =20
  	if (cmd->t_data_nents !=3D 0) {
 -		/*
 -		 * This is primarily a hack for udev and tcm loop which sends
 -		 * INQUIRYs with a single page and expects the data to be
 -		 * cleared.
 -		 */
 +		/* Control CDB handlers may leave response bytes untouched. */
  		if (!(cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) &&
  		    cmd->data_direction =3D=3D DMA_FROM_DEVICE) {
 -			struct scatterlist *sgl =3D cmd->t_data_sg;
 -			unsigned char *buf =3D NULL;
 +			struct scatterlist *sg;
 +			unsigned int i;
 =20
 -			BUG_ON(!sgl);
 +			BUG_ON(!cmd->t_data_sg);
 =20
 -			buf =3D kmap_local_page(sg_page(sgl));
 -			memset(buf + sgl->offset, 0, sgl->length);
 -			kunmap_local(buf);
 +			for_each_sg(cmd->t_data_sg, sg, cmd->t_data_nents, i)
 +				sg_zero_buffer(sg, 1, sg->length, 0);
  		}
  	}
 =20

--5/Kj9YlV5ICw9O0l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/LkMACgkQJNaLcl1U
h9CC/AgAg5RLg2sgokA7akiSZBxh+xOLLqgfLSoZGvvN53umnvYCKagy2vtDGJXt
tqauZlFUxvUUv+bC03c3skcK1vGog422ixHUrUBlrgBwiRsNygR/xXClhf7QxRyE
e3GatwfKpV2SlgfJHYbGgXmXSLJ5ITTxEoceQN3eAbS9QGBNCHQCoZfvT92LSzI9
iP008CAoPUxjsNt9DBuAC0CkjMiLNt2yKn8Tn0k47Qk81oNlCsMiAq2B1OCZX70m
EOOoNn/w+DvCWH8bY+4exxONBYdgH2tN+tm1vTFsahGovFu75kw2g3dgKYtavY7u
hTHFiwTGAm0bV/Y8q3nY0uDU8xNIwg==
=FGjn
-----END PGP SIGNATURE-----

--5/Kj9YlV5ICw9O0l--
