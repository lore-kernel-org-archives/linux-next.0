Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20F36CE0A;
	Fri, 30 Jan 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796719; cv=none; b=AIjwSGSbsCZiylCzb7eSrI9I3XHx2q6WcrClR+1SJzxxmDniEoTcFLS8mp0wqoRga3Mb8Np/JlzlTqTnGIK2DNytvLu++ZalCX8Jjcr4caE4ylbUPtKOEvM/jCHE9qBsyVOgHDM621T4Rxf7Jn4ErOaXnBi2PW5CO8GfVQHw/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796719; c=relaxed/simple;
	bh=Ye7xnT4REmfre54wKc+cI1NbTXc1ZmiIp93TVdyA8JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1h1aWVWQNLjuF9bzqWLiEdqtRNA0D6+884xWYIRI9NgxhrwO36hDFEPhuNZdfTv5jncir2VkoDnQtvneL1aV7rURKwFXbvrxSOeokiXm4QoVpSiMm/EB8uSOvqqFIQWhaj/qGju291pRr8JrAJBNb/fhAJ/Jgj/0YBJEenzlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdhGAFER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdhGAFER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAD6C116C6;
	Fri, 30 Jan 2026 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769796719;
	bh=Ye7xnT4REmfre54wKc+cI1NbTXc1ZmiIp93TVdyA8JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdhGAFERA1dE9c68wOO16LRo/LoW7+qYw1NI8VCxPkuXK2QGOBCE1BvIKvWNkV/wG
	 8viZ/LybubPdNuniBTIti4au38pA2HTbwjwj/Yo6gAddAebVvvoWmvASeTH7Wrxn+0
	 Jzr/kBKJojqeUhi6dTl06IY1XxiEmHeEipezx1Eu/c9YTk9m/r7o/uh4UNWB3MY4gD
	 uRlkT7BFVqPHWg5MCIs9RCOyvwDC1IVlh+4KYBRK7jR9VFjL9bQtqM8CWyFCBtfNJ8
	 M9hxOIh1k4WqWrHeM2N5HtA7NfhGe6r+i7cZ5bjqLDdNLfGk8/WFtgx0V46Hez4tPy
	 ryfw3DPn1qljw==
Date: Fri, 30 Jan 2026 18:11:55 +0000
From: Mark Brown <broonie@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules
 tree
Message-ID: <c80f3db9-168f-4e05-b7a1-b1d4f702e9f0@sirena.org.uk>
References: <aXzoSci8NPhIwDf-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P0tNkgv8EjUxyjp7"
Content-Disposition: inline
In-Reply-To: <aXzoSci8NPhIwDf-@sirena.org.uk>
X-Cookie: War is an equal opportunity destroyer.


--P0tNkgv8EjUxyjp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 05:20:09PM +0000, Mark Brown wrote:

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Also needs this (or something):

=46rom 6d9a82fe703a084c1dc0d5a1d184bea787aa7d9a Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Fri, 30 Jan 2026 17:56:06 +0000
Subject: [PATCH] keys: Merge fixup

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/sign-file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index a65c3e0c40b66..ef8a33ba9c529 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -206,6 +206,7 @@ int main(int argc, char **argv)
 	bool raw_sig =3D false;
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
+	unsigned int use_signed_attrs =3D PKCS7_NOATTR;
 	const EVP_MD *digest_algo;
 	EVP_PKEY *private_key;
 	CMS_ContentInfo *cms =3D NULL;
--=20
2.47.3


--P0tNkgv8EjUxyjp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml89GoACgkQJNaLcl1U
h9Avwwf3dn2pMxCTv1s1LUJIypm92YD093JfCevC4VJZCg69lA4tYM34dF6QEL9Q
efB6whUJjbaWVjx4RvNNrLmyg/D5rdz8Qgvaoy+HSAWegVn/pOByU8Z2dq+1/UsZ
fADnlH6WehG2S708HiP+KX7WFvTNUCS7Q2gDjU+4dS/pA8AYwExMg+8e+r8i4tz/
9Pu+Ut7L3iIzan1dvK7A5HBl8zzXcfaL5mv0dckt1L88K1shXaCk5fIHqE65kDGO
qSYOPdYe1Pfiky7kcKh8K3iYBsiJPspxlVPPNWwXmvVvByeLETXes4EkLS9hqB8z
6cfcrrnzNM4oHg9x+MjhcuKXzEak
=sRkR
-----END PGP SIGNATURE-----

--P0tNkgv8EjUxyjp7--
