Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B23ACA5B;
	Thu,  5 Feb 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299708; cv=none; b=Tcs4xNKxs9WR5dw6xXNRMtPlpnGTZztRkuQPK4H+d/CxKncaHGCNSVarHgZTfJh4qw1Ny08nQedROEmNKtG5/xGDaqxY8VEiSUXmOUSe3rfRQ0taItQ+Afs78BrMxEnSoFBRsdBBhtRmAPpAxFFOSCykiBgzbBjpt3JF7WgFFyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299708; c=relaxed/simple;
	bh=uEyxt5bG7MRaO3sBZjLd+4lagXdMfKHF/60aL8iUwhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VsBuLzwG2t+6RhcNKc2K3BVweD7gcrjUd6+uNk+CTf7lYTkazC7ofJuUy34R7kJEB3JElR9AdXfL5ezLCwS8mO6AMOhOUHw1LJubxNcjfsXjDG2cpMCkp15pH8iOY9xWLooTLe3HOiHuTdZL4PsCPEudPQFJh2KqV81E2m3/9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rggWiijW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rggWiijW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166EDC4CEF7;
	Thu,  5 Feb 2026 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299708;
	bh=uEyxt5bG7MRaO3sBZjLd+4lagXdMfKHF/60aL8iUwhk=;
	h=Date:From:To:Cc:Subject:From;
	b=rggWiijWi7gIYRr5T4gE4qLHf3RVl/6amMgNDEeK+R0EmVeFXEllbOxWJkAof+S3x
	 lNGT+KQ6S7Cgq/SoWLDEYw9018ne9lq7Gk2FcMu75f8ar88leVAqgo7OvTG7UUGJet
	 +JeiBWo+2deiZnG7JWU8Pl3lpSvOQ/lDucegtnw6m4PqkfUi52uH4cniIfELwi91bN
	 +g3urWO3lzaRqNIw5qcr86VAogFlrjj7Blh86lFsUkEEZ/B98ZIYqT6cqZWIYyKnd8
	 kAr9SLN8mj94dJJUU5oDF8qya697tZaEs3PBeMkly+I6OqJqp8YQsHOwDhugoC14db
	 Y2N9fgZa090jw==
Date: Thu, 5 Feb 2026 13:55:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Hao Ge <hao.ge@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the slab tree with the slab-fixes tree
Message-ID: <aYShOPWbajIlXx_i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6eZc5jxWYmfqt4zX"
Content-Disposition: inline


--6eZc5jxWYmfqt4zX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  mm/slub.c

between commit:

  3a38d13f90d4e ("mm/slab: Add alloc_tagging_slab_free_hook for memcg_alloc=
_abort_single")

=66rom the slab-fixes tree and commit:

  bdc9282f78096 ("slab: remove the do_slab_free() fastpath")

=66rom the slab tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/slub.c
index f9d1f6b69305c,102fb47ae0133..0000000000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -6689,12 -6094,8 +6094,12 @@@ void slab_free(struct kmem_cache *s, st
  static noinline
  void memcg_alloc_abort_single(struct kmem_cache *s, void *object)
  {
 +	struct slab *slab =3D virt_to_slab(object);
 +
 +	alloc_tagging_slab_free_hook(s, slab, &object, 1);
 +
  	if (likely(slab_free_hook(s, object, slab_want_init_on_free(s), false)))
- 		do_slab_free(s, slab, object, object, 1, _RET_IP_);
 -		__slab_free(s, virt_to_slab(object), object, object, 1, _RET_IP_);
++		__slab_free(s, slab, object, object, 1, _RET_IP_);
  }
  #endif
 =20

--6eZc5jxWYmfqt4zX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmEoTcACgkQJNaLcl1U
h9AgRQgAg1KQYOJjDnG2dERXtssZvRKCSgtV0+jovv9jEJdR8XISFC8hKA8snQpl
cvS7R7OAxum21kYYw6fXhK6EkgsAP+tnkPZaFIy7IQdwkTHtMW9GXl0KcRd26+a3
o954FoY5Xvn3qUPUhpb0BC69TctEyELKcTXB3EYsbpPqsKvIDzjfsiduj2KcOF/u
rxc/KBoiU4r4OUuQLI8y2Rh/j5Lcie1w/BVM0D+POgM4Uho6NP7WGEQnYiY/4zZM
UPGQgcoy+/nQc2iGGBM4FA6vVwf2Q9pJS6RfLxe9LIGKI6Q5fTYk0wvSvwheO0HN
ypLa7HH8hajv1ljjZUmP+7tLmSVnIA==
=8gHt
-----END PGP SIGNATURE-----

--6eZc5jxWYmfqt4zX--
