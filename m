Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629199;
	b=QQcg/fMJoM8Tlqe4kMg4JpdTREbZ/VJoX/qDftdovjz6dtuf0cnfyjYuEIDEvhgCXedS
	 X32fn3Y411+nM7R0+vP3iRtPoaGfO6DWqAj3tVxJ1oCGlZn/D5yw0Lzs3knCbcjhszNyZ
	 uOdqlWr3YrdHyeh/J25A8t861ddH8ZpvcQuyc9CAKNcFCKSNtpJfaJ2qFeAAv2AG2iTHt
	 sClz94TxQKE2qeXc9zUm/h16Um/bM/pc8Ipq31iS93eyCP85tlUK+OX+kksDK2L7qKjPZ
	 lBtpKStwyE1h/90inIAI557aImsPqXMGRlf2ejg2L/Y+ufaNUhmYHnTVQ0qpnjAPqMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629199;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=4FbevbOmPJD1VF9/8SIk8nGM5Pom0h48Nj3C+QYO3wA=;
	b=i/KgfLuL5veUMGrJAKVF0WgyXagbvTdwL4lv8JlcU8CYq0wRu+P25xDND5Gvv/EmH0e1
	 VEWWqt1M8Xvb8KHkmn3tBgRw4jbNvEbIgELNRindlrd2Dm8jgAKdaDghmqnxwu7HSBwbB
	 b3Ltii+ohXAWLSWfiutmvbsrGUOIC1lhUHYMi1ktZhthFUfmyUqJQj2IEDLVVGCehA9VJ
	 HtUfwGXNfA8QoLu+OgNbMo+AOSX8+vc+cWfyed4j+zn0ijfUN0uPxGvWSUWrhh8TK19Wt
	 TDJnDLf6qCD4nkY4wf8nUJNb3JYoRhMXALNRmCrIBOMZ6oD7f+inR5vv8Lx3urFR9TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIhvlYNf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D2606A6A4;
	Wed, 25 Nov 2026 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIhvlYNf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2401F000E6;
	Wed, 25 Nov 2026 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629199;
	bh=4FbevbOmPJD1VF9/8SIk8nGM5Pom0h48Nj3C+QYO3wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gIhvlYNfemTLako6gPdtIMNK3eH1QfKoiwtmrBe4bkPSSF8PfJLMxlr9YAqb55IMT
	 K4xdUfkSl3kIkoUy9LzkCWhY1YKq3L8QOCziMBoneBvXxMgCzOgtPz9SMOkqcAvJil
	 V3e5Vo0Ti6SNGIMRxrULSk4bp3xXMyBfrLQaOx9A7MLQ1iKuyXvUdW8JHTx4N/3Uzy
	 LwiYB9j6FajEQFi/lgb0MKxBUWdGjNP9DdZ2g6wGT5RIBHQJhuhRRsBnPcQsHm6mO/
	 8Z7i1nah/uSnYOV2GkSQdD8Qi3PlBfmc13rSa4A3PfSA6xGZinkxWTC7QG5+nM7MRe
	 kS0YdE2c1hvCg==
Date: Wed, 25 Nov 2026 17:53:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure in the origin tree
Message-ID: <15549465-a429-4243-af9c-8a26ba497891@sirena.org.uk>
References: <awbpOaMZRkKXbq1H@sirena.org.uk>
 <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
 <674edd30-0087-4341-8a13-3c306583705b@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="jiAtIxj9Ui94ArMb"
Content-Disposition: inline
In-Reply-To: <674edd30-0087-4341-8a13-3c306583705b@sirena.org.uk>
X-Cookie: -- Owen Meredith


--jiAtIxj9Ui94ArMb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 05:21:16PM +0000, Mark Brown wrote:
> On Wed, Nov 25, 2026 at 08:24:22AM -0800, Linus Torvalds wrote:

> > Well, it could be me having messed up the merge itself. There were a
> > few conflicts - but I was being careful and they did look quite
> > straightforward despite my annoyance at the timing of seeing those
> > kinds of conflicts.
>=20
> It's definitely possible of course.  Probably worth mentioning that what
> you've pulled in was the main ext4 development tree yesterday, not the
> ext4 fixes tree which was still at the previously merged 8c4f6e3376348
> ("ext4: introduce a mount option for iomap buffered I/O path") which
> makes direct comparisons a bit wonky.  What came in during yesterday's
> merge was never in -next as a fixes branch so didn't hit fs-current or
> pending-fixes.

Inspecting the diffs with the various versions and testing quickly I
think you need:

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index ab1ca59826aaf..529cab24db48f 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -1149,6 +1149,8 @@ static struct inode_test_ctx *inode_test_setup(struct=
 kunit *test)
 				   inode_test_sb_getblk_stub);
 	kunit_activate_static_stub(test, ext4_sb_find_get_block,
 				   inode_test_sb_find_get_block_stub);
+	kunit_activate_static_stub(test, ext4_sb_find_get_block_nonatomic,
+				   inode_test_sb_find_get_block_stub);
 	kunit_activate_static_stub(test, ext4_sb_getblk_unmovable,
 				   inode_test_sb_getblk_unmovable_stub);
 	kunit_activate_static_stub(test, ext4_ext_getblk,


--jiAtIxj9Ui94ArMb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsHIIoACgkQJNaLcl1U
h9BgQAf2LJ3ilqPq4YIRXLhWxAxcBA8/tyX5zO6Y8A3WoqRRMv8DycV3ohRb/kOe
fx1oLmRH9AlG75Uht4GYpGPNp+I+kloT84AnbT0wA4BJ4Wl8Eg5tBpETRDUuxVsG
z/cn+FRyBkeyn0JTp9nhL4c5s+wzNSaM9/f4SgFWxkhe5h+J6X3BBmHmE6vgNp+d
oL/Wpubo88NeL8b5OxK8yvjrub1OgPYR/mxILN+r/84NYnofIZClPEhdDqIN3HtL
3KBJIsK8Sk7e+0ZK5q7QxwBOWpdDW3L2vB2GIAe2S5sRPAQF73ooJY2nSS1mJszW
4fAWXUTZxE2rSkgRP0WN5hcUSw79
=zTFN
-----END PGP SIGNATURE-----

--jiAtIxj9Ui94ArMb--
