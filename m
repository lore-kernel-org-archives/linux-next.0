Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784A229B2A;
	Wed, 28 Jan 2026 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608068; cv=none; b=goAyi49d/4+CZvVtt/04b2R2FNuH91WOF9nqcC9cpVsfqFf2eq06woWydXgzn3LuKD7hJDAQ6ICCYMg/ELKiw2gzFPUsvqfvLh+zZfqc0XIlC01ok/uNlFndNCGxCAcgTywHUATYveyMt7c5ghrlOqXuel7YUuchVvkUKAylTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608068; c=relaxed/simple;
	bh=XEmnXYh3PBADttOUR3u3h1vqFJal0VhqdZ+jtSQBTEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6WDGPzZoC1vo1of/SSJQo9FlJnctdfAdoQeWjbXPccURdjx5JzKnrKaFrB7qqVqPf5MTsqjKbkZ1wTnuhAuWvtI5vtzfAi81w8JwJZ1xkP5KYa+HFa6Hb2/bJaCww0+7mWfuSCj2FLABVP6cIPy5aJM0mP8CZ+OxVf7BbEf/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+eGMFmx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+eGMFmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC059C4CEF1;
	Wed, 28 Jan 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608068;
	bh=XEmnXYh3PBADttOUR3u3h1vqFJal0VhqdZ+jtSQBTEE=;
	h=Date:From:To:Cc:Subject:From;
	b=M+eGMFmx/pALKNwAQOgNcBkyab8zqXSOVZRIxw5cnp26p3ky0DMvF/l6qdEjg1fJZ
	 KANweiIMD62H6/oVVpW31fzgETI06kpesmpSCLAmIMWTimfedC1itty3UgXn0i0X1Y
	 hH/brzBIWlppNFmPola/qjDXAYRcIZMclsdYIwC0kfaad0BT9854yScVnH2VuNLa0O
	 vdPC1TQaONT6llh97/lQrQy6jISc55lkMGTYKQSxOJeXkZsloh+z93enUqshSCOkv+
	 hQEN2b25vVr8wwjgs7sTMaLjotxiooIuWWyP2AF/wRycNDMkScObLx8daQ+gYF4Xmq
	 q+tHnS9g1LkUA==
Date: Wed, 28 Jan 2026 13:47:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Kanchan Joshi <joshi.k@samsung.com>,
	Qu Wenruo <wqu@suse.com>, David Sterba <dsterba@suse.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <aXoTgCb9tP_PQA-n@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="byOhuxqJcGiHcD5B"
Content-Disposition: inline


--byOhuxqJcGiHcD5B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm64 defconfig)
failed like this:

/tmp/next/build/fs/btrfs/inode.c: In function 'zero_last_folio':
/tmp/next/build/fs/btrfs/inode.c:869:32: error: implicit declaration of fun=
ction 'bio_last_bvec_all'; did you mean 'bio_first_bvec_all'? [-Wimplicit-f=
unction-declaration]
  869 |         struct bio_vec *bvec =3D bio_last_bvec_all(bio);
      |                                ^~~~~~~~~~~~~~~~~
      |                                bio_first_bvec_all
/tmp/next/build/fs/btrfs/inode.c:869:32: error: initialization of 'struct b=
io_vec *' from 'int' makes pointer from integer without a cast [-Wint-conve=
rsion]
/tmp/next/build/fs/btrfs/inode.c: In function 'round_up_last_block':
/tmp/next/build/fs/btrfs/inode.c:881:32: error: initialization of 'struct b=
io_vec *' from 'int' makes pointer from integer without a cast [-Wint-conve=
rsion]
  881 |         struct bio_vec *bvec =3D bio_last_bvec_all(bio);
      |                                ^~~~~~~~~~~~~~~~~

Caused by commit

   68a1d4ad30e5d (btrfs: switch to btrfs_compress_bio() interface for compr=
essed writes)
 =20
=66rom the btrfs tree interacting with commit

   72a41750f1a35 (block: remove bio_last_bvec_all)

=66rom the block tree.  I have reverted the latter commit and can carry as
needed.

--byOhuxqJcGiHcD5B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6E38ACgkQJNaLcl1U
h9AikQgAhZbYxMaccMxq/QZaW0Ht3Ske9e1ZnO5mO8OyWF9HwAj/eB/u8r727/hg
U9K0j1hCMFAX3GR5cLZbcVrpLETL7RyLgG41YTqmM+iUN7KOOFzhD9Hgqaydfkr6
+af//ofcwdiTI5Su4K/Aq+9HY4EFa3fnGeUmByf7KHnJlQsZxyuQUVi3afHoKw+T
fGuordMAs6kvJ2sz4Nmc6NP+TgOF0CXDoqpck+FvqK16l4VYIvRYTpT+oStlioX8
6Zo/1yvzZW1SfTzlVggmm+aMIr23DnWTPpteZ1Ppy2xH+yHZ6nSIVL1ccPwoIn4F
JdgCCqTLfaejcP13Ig8zHU/ol82ZPg==
=Ow9T
-----END PGP SIGNATURE-----

--byOhuxqJcGiHcD5B--
