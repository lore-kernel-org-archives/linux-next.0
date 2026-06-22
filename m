Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395B3A0EA5;
	Mon, 22 Jun 2026 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121299; cv=none; b=aKnf+Cmq9VR9Q8I1XtRdAJQTaLf7saes4HJ3aW7DhAOE/giKkihbKAVfxA66Cz6TLivBy1+qOkGiqCd/4HQf1X0txRH3zJzunRt2oK3X42ZduYR18/nhajsMzdopC1S8KP1/pg9LitDqobw/chj3B8OFpdb7lh/KwsymWjMpCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121299; c=relaxed/simple;
	bh=zD4ZaJT8KBBow38luQY/GdEXdeNxITNe0G9iuqPY3s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s19nrQx8NcHtvLo1e9GbxG62pPZGVlh8wF+VaC7e44O04qurt/ngNlQH6lrC8+YsATkXHrZUM2BD0z633h0V92sv7r7dsCJEhU2cmv87kZe4U+kkdK9mMkzHqJlUxw4wQwIQrQeuS9/6sGeledINPkZkYJ4jTiNmJkNQw+B8gws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNVxgp9G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNVxgp9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0151F000E9;
	Mon, 22 Jun 2026 09:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782121295;
	bh=sa/u2QlGpF7x8F8GFjZh1o2jdogbqRQYlfuenhmszLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iNVxgp9GMYk0iSf3Q9S8TQH8zUTSXIMJcz4+i4VjzM8rjH1rQeEuUX5bhPU7t3wFV
	 tK/fzncDpad/bNkVeD8YO6kEYSCTYYgUSDn2bhfaWZzK3zfRaXealextqlzCNDA9l+
	 LPivev8DR+9yVkakbzS13CBqfl5Z9ceahFvjsBjpx1366K9Z7hc9iORcfyRVclinjB
	 ex7BFtZLsX/eDVDS10l2/hMjj8WzvFTIXw1/ARXPJc6KXphYPfPddIh1JT91wzg9Cx
	 7r1T1zA6HRD1Vu4U0dsXW/m0iBE+swrrCD37e2d+FZ4DOv6qaUucm8FjLUvjtTgZIh
	 h7b5PpxAWu26A==
Date: Mon, 22 Jun 2026 10:41:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Maguire <alan.maguire@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <61b096e6-39d1-4b61-80ee-31bda9978e86@sirena.org.uk>
References: <ajK3E_9sm1up6soi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eMWZdA0jnkGOZfUD"
Content-Disposition: inline
In-Reply-To: <ajK3E_9sm1up6soi@sirena.org.uk>
X-Cookie: Do not remove tag under penalty of law.


--eMWZdA0jnkGOZfUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 04:02:43PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the origin tree, today's linux-next build (perf.log perf)
> failed like this:
>=20
> util/btf.c: In function '__btf_type__find_member_by_name':
> util/btf.c:19:43: error: comparison of integer expressions of different s=
ignedness: 'int' and '__u32' {aka 'unsigned int'} [-Werror=3Dsign-compare]
>    19 |         for (i =3D 0, m =3D btf_members(t); i < btf_vlen(t); i++,=
 m++) {
>       |                                           ^
> cc1: all warnings being treated as errors
>=20
> Triggered by commit:
>=20
>    f7a6b9eaff3e6 (bpf: Extend BTF UAPI vlen, kinds to use unused bits)

This issue is still present today.

--eMWZdA0jnkGOZfUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5A0oACgkQJNaLcl1U
h9CJRgf/SUaIICQt+caYhgvN6mpuO99Gh99A+d+Qq1WKaJkCgTIU3HkuUIWqOgCW
LqCbV10cQwFDI9VjyNqF9IeXqc1yolnJd/hy8T297ntLqTbTex+mjGka+aIWRgRh
MWJR/lmzDoZn15Ho6iYlQJuBPqrpN8bP54pwNBfGQEQo3xF0y2Vuk+6fXBZSyPxQ
FYa83cxwLqMHrSj4+1z3CiNTagX8f+WgZ1xbTRq+UC3GvejWSHXYGg0limCbqA7T
T2PquPMQd/6DcYkIHyoWtBQYzLPJTD4sKu6VCiMvrl6NO+e7YQVQTe7i9VUviFst
KHIFZHxvJ07k1JZHZvNQjBYPXtUclA==
=4z9+
-----END PGP SIGNATURE-----

--eMWZdA0jnkGOZfUD--
