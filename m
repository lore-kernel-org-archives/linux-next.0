Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789655;
	b=uBJX7wS+1+JWF+L3SbH1n5pzYNYZTyg3QOC70hYSLQ3HNLdndBB1jHJt9tx5PJ90pfKa
	 EkrjZJaH2dck/YA8KURip0i7hDnRAqD2PSi9sXZpqHcpgAnorovj3tMBzBdknOcpb0lqD
	 Gxx5tJc8kDoyuABMQAKZhBQTLFEIv847L3ItwCLFQx5LXv4xJFs6lRc1gBITkFgMjM+ev
	 xg1XKji3vYe8h7cGOXRAUGpkKqa2aJQBrR3VwKTaMSR/TISTZPE1p82NH6lORRtlPF0DK
	 j/WYe0iXhoFdNRhbEmFkvnvNrWgo5fAX3ekDaIeBo3PYQn7WXwkDFYPu2spI2HyUEzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789655;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=jxog2oY0KJDIT3Moo3GQxpPvR9a5zV1aRDZGpnfV6tk=;
	b=gnmWT3YJ4exYraoahmgp0Umg469+fOz/uWTE8gmadQCFvU4R6qSzdFn6QXkfEjZCRU1h
	 FSb0CTI4Iq0+yCzVpTBPGPhK7cBsvbM0wNUQsHFLXJCLAbbt+i/kOu3RYAcT1MagstTDP
	 uvFr2yUUB1qNjQxqAOI67L8HBYuL5DorUoJzAoCDkjdu6zcaS0xn4n1d+M56MJHueeF9r
	 rJJQCWgshwK0J9Ha0PUAa8g/+stB1DEkkjcBvRG5K6z9nuqud1Mlvi7l2058FvzieM0ZJ
	 4w27qy5U2n/16g/EPoqo0QxkB8fIQxYybTYpKT497VEsT2loUbfUEvNF5+lgALfET4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGyrtG8w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF14D606B1B6;
	Fri, 27 Nov 2026 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGyrtG8w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC0B1F00899;
	Fri, 27 Nov 2026 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789654;
	bh=jxog2oY0KJDIT3Moo3GQxpPvR9a5zV1aRDZGpnfV6tk=;
	h=Date:From:To:Cc:Subject;
	b=GGyrtG8wyFESHXOThGbkxHKVBeEmlalhkYDVHvQoBO85Bm+h8/2DEllD+Gr4mcEdM
	 tKZ8c744Y2+t+P8ksyr1vTr3ZDeEySp/Ro29x6hv4T0bvEYn/918vUUcJC1Cp5MWbT
	 DDlM/ch/0UFLse80uDQ5fBrl7YRfp7c9/Rs3XySnU1250WCegS4k3Udgcg8l6VGRPh
	 tbtova9tFo/wc1TH6du/CWbfOBzU5DDctLW2L84FZlNHtaiI0ToUQfr+NyvcfGQshI
	 s7Wo+50io0o2kEqc++ioTrONvYEK95fNDBIXcZ/DKiJmqKMvkyf9BE99nKynOzEv2f
	 PclA0xPwlKXkg==
Date: Fri, 27 Nov 2026 14:27:29 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Chad Aldreda <ca@modelmiser.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: linux-next: manual merge of the mm tree with the origin tree
Message-ID: <awmTUV81zRGpj0Tu@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="n6+N5MVy8fdpYzjF"
Content-Disposition: inline


--n6+N5MVy8fdpYzjF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  drivers/ptp/ptp_vmclock.c

between commit:

  e6474ead54b8a ("ptp: vmclock: keep the device state until the last file i=
s closed")

=66rom the origin tree and commit:

  92cdcfbf70344 ("ptp: vmclock: convert mmap hook to mmap_prepare")

=66rom the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/ptp/ptp_vmclock.c
index 3e32a90306616,6a1d5f40a5661..0000000000000
--- a/drivers/ptp/ptp_vmclock.c
+++ b/drivers/ptp/ptp_vmclock.c
@@@ -367,15 -364,13 +367,16 @@@ struct vmclock_file_state=20
  	atomic_t seq;
  };
 =20
- static int vmclock_miscdev_mmap(struct file *fp, struct vm_area_struct *v=
ma)
+ static int vmclock_miscdev_mmap_prepare(struct vm_area_desc *desc)
  {
- 	struct vmclock_file_state *fst =3D fp->private_data;
+ 	struct vmclock_file_state *fst =3D desc->file->private_data;
  	struct vmclock_state *st =3D fst->st;
 =20
 +	if (READ_ONCE(st->removed))
 +		return -ENODEV;
 +
- 	if ((vma->vm_flags & (VM_READ|VM_WRITE)) !=3D VM_READ)
+ 	if (!vma_desc_test(desc, VMA_READ_BIT) ||
+ 	    vma_desc_test(desc, VMA_WRITE_BIT))
  		return -EROFS;
 =20
  	/*

--n6+N5MVy8fdpYzjF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJk1EACgkQJNaLcl1U
h9Dk8gf+MP5U7U7BFV1/fw5/rbslC+BaoRysXHTp17Xzq5y2WqJYYkstWJDg3Px3
7bPjHKl7dXINJqmyeB/sTsKltsjEnee0UUCJieq5VbidRB+gHglzArtONAkYbDWz
oeN88nhtV+mrRmuqzz7Kew0/UU9kjW5FJ2Y7EqhCOTApVDcvS00GgSYWFVV3CvN5
L3TOVENDPe6EGKMDBS7JWhP5QsMS1oOhxteJ1jXpOiz6Toy6waYfFZqvtE+lxGoc
HF7vp7KglensshHDU9/CeBTSxEFNRigPq24SKpaBeg13d7BChvl3/lciIGiFiXF7
lw1QOOifPc4oacJnOsffFwkIVWZo4A==
=TGzs
-----END PGP SIGNATURE-----

--n6+N5MVy8fdpYzjF--
