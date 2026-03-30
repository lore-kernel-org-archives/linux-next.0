Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2B3B8945;
	Mon, 30 Mar 2026 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900721; cv=none; b=Deot9aORM2kN5p5SLmyMiTAiRyCC1osa6FFKltcaQ2QNH7mFLMM6gRXEfB3ILUCmQ4P5qRQhxXuevBE2t/hUy1YdVh3gLBosxe7GqfE6JIvMPKJPbGEGtdsj1ZOrDecPloqUkun0qfu88yWOzy3wQYTrWUPv6efJ82qbXaYbH6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900721; c=relaxed/simple;
	bh=7XYczzNVj9xAbMLuYMF3cZEg6bZQyiSAMauIHgLznsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vCXa/RnbO/70tEbhVc+rXNyIi59F4zcWf9cZ1tGylSBQ9MCQk94bsbyu20P/g15Oj1qbl/KvXIOhS+EnfX8efkE2z2bh2Sr3uHVrhO7TWHFet8Z7U7dV0S55lDF4s26tfvUE4XCqe779Nv88JWUkiN4OcbI9duGkeVKDoppiVU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePoCdpmN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePoCdpmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F505C4CEF7;
	Mon, 30 Mar 2026 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774900721;
	bh=7XYczzNVj9xAbMLuYMF3cZEg6bZQyiSAMauIHgLznsE=;
	h=Date:From:To:Cc:Subject:From;
	b=ePoCdpmNE/VWm8kmm4fJqCulWHnMx04Vn/Oau8Yo1zv4YSqTFb6mE/Dvordv3yv4n
	 oGrdoJFAShgLIq0bBKd6VJPRzhlS+h4ruFigQMVrJQ3aoDhmW1ySpJb8jCRHT3nLFW
	 Sal0npFAkZe+zB9vbsOc+ezlfAfEuOm7hD8Wz2dojMyf4SVipcNsJ4o/3GCIf3h0N2
	 mCB8qbDHDEr/P1heiBrMMDJx/kwjHDY/LDKWKYo33XBA8yMWaZTU1Sq9Tj90UHvdqO
	 vWs+dbXNUzoO6qT7kCTo8JZltx6y3UnRtg97o/jH3YPuN7zFL96rWEJQ9ydMfrRkpw
	 Wg0/8wczceIOQ==
Date: Mon, 30 Mar 2026 20:58:37 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the origin tree
Message-ID: <acrV7SNlVtPT8YM2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UHsI4w5LBU+jyqLT"
Content-Disposition: inline


--UHsI4w5LBU+jyqLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/mpi3mr/mpi3mr_fw.c

between commit:

  fa96392ebebc8 ("scsi: mpi3mr: Add NULL checks when resetting request and =
reply queues")

=66rom the origin tree and commit:

  9d660e482071b ("scsi: mpi3mr: Add queue-full tracking for operational req=
uest queues")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/scsi/mpi3mr/mpi3mr_fw.c
index c744210cc9018,01042eaf0dff4..0000000000000
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@@ -4817,25 -4828,22 +4838,26 @@@ void mpi3mr_memset_buffers(struct mpi3m
  	}
 =20
  	for (i =3D 0; i < mrioc->num_queues; i++) {
 -		mrioc->op_reply_qinfo[i].qid =3D 0;
 -		mrioc->op_reply_qinfo[i].ci =3D 0;
 -		mrioc->op_reply_qinfo[i].num_replies =3D 0;
 -		mrioc->op_reply_qinfo[i].ephase =3D 0;
 -		atomic_set(&mrioc->op_reply_qinfo[i].pend_ios, 0);
 -		atomic_set(&mrioc->op_reply_qinfo[i].in_use, 0);
 -		mpi3mr_memset_op_reply_q_buffers(mrioc, i);
 +		if (mrioc->op_reply_qinfo) {
 +			mrioc->op_reply_qinfo[i].qid =3D 0;
 +			mrioc->op_reply_qinfo[i].ci =3D 0;
 +			mrioc->op_reply_qinfo[i].num_replies =3D 0;
 +			mrioc->op_reply_qinfo[i].ephase =3D 0;
 +			atomic_set(&mrioc->op_reply_qinfo[i].pend_ios, 0);
 +			atomic_set(&mrioc->op_reply_qinfo[i].in_use, 0);
 +			mpi3mr_memset_op_reply_q_buffers(mrioc, i);
 +		}
 =20
 -		mrioc->req_qinfo[i].ci =3D 0;
 -		mrioc->req_qinfo[i].pi =3D 0;
 -		mrioc->req_qinfo[i].num_requests =3D 0;
 -		mrioc->req_qinfo[i].qid =3D 0;
 -		mrioc->req_qinfo[i].reply_qid =3D 0;
 -		spin_lock_init(&mrioc->req_qinfo[i].q_lock);
 -		mrioc->req_qinfo[i].last_full_host_tag =3D 0;
 -		mpi3mr_memset_op_req_q_buffers(mrioc, i);
 +		if (mrioc->req_qinfo) {
 +			mrioc->req_qinfo[i].ci =3D 0;
 +			mrioc->req_qinfo[i].pi =3D 0;
 +			mrioc->req_qinfo[i].num_requests =3D 0;
 +			mrioc->req_qinfo[i].qid =3D 0;
 +			mrioc->req_qinfo[i].reply_qid =3D 0;
 +			spin_lock_init(&mrioc->req_qinfo[i].q_lock);
++			mrioc->req_qinfo[i].last_full_host_tag =3D 0;
 +			mpi3mr_memset_op_req_q_buffers(mrioc, i);
 +		}
  	}
 =20
  	atomic_set(&mrioc->pend_large_data_sz, 0);

--UHsI4w5LBU+jyqLT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK1ewACgkQJNaLcl1U
h9DF0Qf/dM5TORrGwFp+aLp6mAx/5IMbK85x3IlY3rtKeKU3nz8h67BeRNDPdeZW
c17WyaD4szqKWsB3PvjNGjEhPVnx5UXaAWjUpPH2q+NpUgTWAkJ8W3san7I/RNvW
WERSdcbboE+o/XkTW1Bbba3lDBlr+5O40aU8IiGwM1TXSmTO38J46OSBe4hnXWqu
7zs6oN7if9AqiVf5dwHR3E6UW7Sf7TW8LjmF6zjlmqizeQw4uGFV7lEoCWPUJFzZ
mjDE80m8B3EqwQQlFiDtU6Jts0YScXz+qf/aUd4kAr8k/TsDpMKhNRA4E4RKsLM7
cISyIetpwsA5LzoqeDJn7fR409bs1g==
=1BHe
-----END PGP SIGNATURE-----

--UHsI4w5LBU+jyqLT--
