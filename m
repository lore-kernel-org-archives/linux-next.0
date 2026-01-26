Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01222874FA;
	Mon, 26 Jan 2026 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465692; cv=none; b=At8pkn+X/05/ti1r5KfzT0Ah+hbydtDSsvq8kfhjpfKc5zvYDosmmTTh0TFUgvNCWSMf9hEyqKT9Qnx5kUZ4bsxlfDMQgq3JPK8U4LAltbANFZRsuLt1VBCz27knkG261lmH015rHQYgk4kmQIVDXrywWBk/y/2rUtaHK/G8EQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465692; c=relaxed/simple;
	bh=0PoTJI2SMgFnSh9VOdC7uO8jyV9IdWUwDUGhTs6yflA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASwj0rC+7cY7xYtGFaXiIsCdGVZryGpUfQG6HTkNVHcsFOng8oM63uyippv0fpt1jEUkR2PGAeXhioO7D5l6egyhB0x0LmtJVAQMu+p+bgOB5KZpBAm6u7EqATr7b3xh0IqZwegASpG/XbeobMaEkG6UBYIwzhtx7Wf54qhJ3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGubj4II; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGubj4II"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBC5C116C6;
	Mon, 26 Jan 2026 22:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465692;
	bh=0PoTJI2SMgFnSh9VOdC7uO8jyV9IdWUwDUGhTs6yflA=;
	h=Date:From:To:Cc:Subject:From;
	b=kGubj4IIDUu5ygGeZqWZ23489LjMCQtcXf/9VgHXVwGrHANHBGG0ye14WgcSx77OD
	 tLV5iw2vKij5wYKqkQxR8o6xuBGUdstXd51Toqov3qwJRBC5Nirch1id5KzwBo8kdf
	 UIDuFhou8mH1kePiDyFxvPxBjNEAwAPzN50SZwUu7O8D3kPSuZRN6E7i7/Exxyb5my
	 OOjmf8+5L5LdLVr8SGZ+5/Djf9p0XeOoGnO9nr4Tl8dZSIrTrsk+4MAgMZPh5BvsAR
	 QpdPeEhovhUNqunc/XDASect2nqC63AdmNiDDAVldpqGt1jVytkaQuchUs7yT2TIHs
	 4oRmJIZf9jYjQ==
Date: Mon, 26 Jan 2026 22:14:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Clint George <clintbgeorge@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Uday Shankar <ushankar@purestorage.com>
Subject: linux-next: manual merge of the kselftest tree with the block tree
Message-ID: <aXfnWL8Wh5jKAE71@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ziJ/LH+GlcP3jABu"
Content-Disposition: inline


--ziJ/LH+GlcP3jABu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kselftest tree got a conflict in:

  tools/testing/selftests/ublk/kublk.h

between commit:

  584709ad5ce35 ("selftests: ublk: replace assert() with ublk_assert()")

=66rom the block tree and commit:

  3e6ad272bb8b3 ("kselftest/kublk: include message in _Static_assert for C1=
1 compatibility")

=66rom the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/ublk/kublk.h
index ca97deb5e2082,e5eb5f762c1c1..0000000000000
--- a/tools/testing/selftests/ublk/kublk.h
+++ b/tools/testing/selftests/ublk/kublk.h
@@@ -333,10 -217,10 +333,10 @@@ static inline __u64 build_user_data(uns
  		unsigned tgt_data, unsigned q_id, unsigned is_target_io)
  {
  	/* we only have 7 bits to encode q_id */
- 	_Static_assert(UBLK_MAX_QUEUES_SHIFT <=3D 7);
+ 	_Static_assert(UBLK_MAX_QUEUES_SHIFT <=3D 7, "UBLK_MAX_QUEUES_SHIFT must=
 be <=3D 7");
 -	assert(!(tag >> 16) && !(op >> 8) && !(tgt_data >> 16) && !(q_id >> 7));
 +	ublk_assert(!(tag >> 16) && !(op >> 8) && !(tgt_data >> 16) && !(q_id >>=
 7));
 =20
 -	return tag | (op << 16) | (tgt_data << 24) |
 +	return tag | ((__u64)op << 16) | ((__u64)tgt_data << 24) |
  		(__u64)q_id << 56 | (__u64)is_target_io << 63;
  }
 =20

--ziJ/LH+GlcP3jABu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml351cACgkQJNaLcl1U
h9DCIgf/S9CKliS83zmVghhi1yeIZ32AA6E5DJMe2jN2ABYSn9B9BzpXndvcS9/8
VAL+rxxbaojtL/fytWqHkAnMg2tHOFNVnTLlwWcAyOKhVmhqwoYC+W3znDeevF2d
zEFnzBmhV3VpQQ4tKpb7WlRzNX6s0s5dthx+eS1JGrQcJauDP7VD9UkD1CTFrvwA
tJmBe/up7r4TO458JJ4n+J9sa9LDW2tN1vAi1UkEUVojTQQ9Ds+gyYnkXsDDJP/j
EgoL6XQXsI8ctM/OFfvHsRkZABlxoxNwsdSKpqjYjTbRAMOOEKJnCDc4vtBdnOzX
qfnB2nA8oHS1p9In1y44B3GZEyYhsA==
=H4mk
-----END PGP SIGNATURE-----

--ziJ/LH+GlcP3jABu--
