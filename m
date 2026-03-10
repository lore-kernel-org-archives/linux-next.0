Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BA3019DC;
	Tue, 10 Mar 2026 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156343; cv=none; b=CulOGeJ/SEAbH9ix2FttgBs4Sr2TUiX5WeQfDsWLuK6kIoEj7Weef+SNrtXyBSITBQ/tIpyg9uJwuElz6ctW3f8v2OFfRQ0NWke1ecnFZp5XRkL6l/LTS6FvWYd7xBtGU5VqKiQCl+gKV3yJdpdR0qJPNpqq+EIGNacs/2f+mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156343; c=relaxed/simple;
	bh=Vatw/MJ4wFrj/OXKcquKJgMj4BF/9X5Y8YNJ0+Aba1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XmxSBrXwS/nDNLJhTf8qpvdo/KwxP8jFXxE0wPpXSn5gLwVRehY1QDkpP1xwv6HN2PeQYCUBtPL7F98VhISkjIug8u3U/T4fV8qqjvEJJroDw81JuTcTpAsJA3xot08WHT2lv/NQMK0fEKM6WISu4wPbhuSp7O0itevLrBuVnQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpWsrDMX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpWsrDMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1865BC19423;
	Tue, 10 Mar 2026 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773156342;
	bh=Vatw/MJ4wFrj/OXKcquKJgMj4BF/9X5Y8YNJ0+Aba1w=;
	h=Date:From:To:Cc:Subject:From;
	b=FpWsrDMXT+QOJ6z7o/a5C6zzgzTmq6yJS+JrOMilSmTLGl5gvzhIKKTp+9/QAy6fB
	 hpEsqsGmOtjEH1LlROrz3Fgoy1d8E7BczXJ1q51cufeHV4Lo7CssPQzC92w2KQsoWL
	 2dS3tGZKlfrCd3ANjrgVXzhpiUrNnHf3G5ab/t+yO+S5EoQZNbTOP/ydkx9z8vqP3c
	 +JpUBjPvym/fLOpoiKWuX+FAHajeIIjQtR6kYbSPNnJgEGslaESIB2kYlZfkH6ZtJx
	 7UNPjlxPShpVM8TDtVcqtEn8pkqdFLUvl0gLEpSQaBRynoLHzrwg0TGBjVbUDFRK47
	 SrLr3OcP/hu7Q==
Date: Tue, 10 Mar 2026 15:25:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jacob Moroni <jmoroni@google.com>, Leon Romanovsky <leon@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dave Airlie <airlied@redhat.com>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <abA38r3vfTOr8_Ks@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ShBot90uaSH/6fee"
Content-Disposition: inline


--ShBot90uaSH/6fee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/infiniband/core/umem_dmabuf.c:210:10: error: 'struc=
t dma_buf_attach_ops' has no member named 'move_notify'
  210 |         .move_notify =3D ib_umem_dmabuf_revoke_locked,
      |          ^~~~~~~~~~~


Caused by commit

  932f1eef09ecb (RDMA/umem: Add pinned revocable dmabuf import interface)

=66rom the rdma tree interacting with commit

  ef246da8e63c4 (dma-buf: Rename .move_notify() callback to a clearer ident=
ifier)

=66rom the drm tree.  I have fixed this up as below and can carry as
required.

commit 0cab8756cbc2f43cec2b8e88f2ea3c985491a426
Author: Mark Brown <broonie@kernel.org>
Date:   Tue Mar 10 15:15:19 2026 +0000

    drm/rdma: Fix up merge
   =20
    /tmp/next/build/drivers/infiniband/core/umem_dmabuf.c:210:10: error: 's=
truct dma_buf_attach_ops' has no member named 'move_notify'
      210 |         .move_notify =3D ib_umem_dmabuf_revoke_locked,
          |          ^~~~~~~~~~~
    make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drive
   =20
    Signed-off-by: Mark Brown <broonie@kernel.org>

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/cor=
e/umem_dmabuf.c
index d7ade877bf9d1..ad023c2d84d85 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -207,7 +207,7 @@ static void ib_umem_dmabuf_revoke_locked(struct dma_buf=
_attachment *attach)
=20
 static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_revocable_op=
s =3D {
 	.allow_peer2peer =3D true,
-	.move_notify =3D ib_umem_dmabuf_revoke_locked,
+	.invalidate_mappings =3D ib_umem_dmabuf_revoke_locked,
 };
=20
 static struct ib_umem_dmabuf *

--ShBot90uaSH/6fee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwN/EACgkQJNaLcl1U
h9AuDQgAgXziWhiCA5Q/GlXbHbvrOMTqwKXw6TB6W+cqfQwaE2OICRw7+Xy1YxL3
dpl1WZtqkJgY9ZVhG6jTgR/7taTWOazLwNOsoZUz7L4AXtJVFOSKUGurnAX07J4Q
71CX/LQv3cnqomBWoa3O1QxqL+kL2RuSWqXTTyeBOc6mzKOvc2X83tScf4Fg182O
dBzLWI+1GXo7sPUA7I/BS+ZSWbFmHLLcwQBTfmeBYDYrUUWOPDAxs7z7MX/p0Wex
Iw9JWvmkWLzw6y9xumfqtzauZFwDTiV7aCFt2DRzsdIwp79ayG7bu2DROcAR7Emd
KrurFgpV56IeMUjClOwmo4Ab9+xqZw==
=cs9e
-----END PGP SIGNATURE-----

--ShBot90uaSH/6fee--
