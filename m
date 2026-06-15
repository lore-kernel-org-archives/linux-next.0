Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AB3FDBF3;
	Mon, 15 Jun 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534610; cv=none; b=eDecohvuIjbUz2GtHINXT1SXqZB3xXL1DtKwiexMguEZHcj8lBYb8kF48n9E7WbHnF82DndTDrQo/sTfFbKXI24R4KOL3IYp7lhFFUGZTD7DFExnyEMHlyJxC0gY+qpi3k/yISm99cEzoG3suKw98quUtWP+HdmbBODWGXdtCBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534610; c=relaxed/simple;
	bh=7ayv6XMn+XxJveKPdVDaHjm72ZuKdr8pgNhBBnDbM6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYZcBuUWTAXPpjp0J/XszzDzFcr1xCq7oL8NejsPIEbaJy2bi0YSzUiLV57UPmBBbv+JmzQwq7rCEuIhADwxIRCsPCXkMBQG8opfYhhP+fJFOAEzvmtxB2l4CWloDIowSUR/PQQQW2zbTOP5b66wjxJyrHhuUtvpHDZ2szeHZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq8PQwyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq8PQwyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B5A1F000E9;
	Mon, 15 Jun 2026 14:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534609;
	bh=l9wlsA/bTaw+r+4G0OnI6rjELtm1hlbHHYEfxOHdUDs=;
	h=Date:From:To:Cc:Subject;
	b=fq8PQwykKYH/WMNEL8YyviX4BSp7B0nxYxcnR13ghffmU8S2+ftqYNm3uCxKsEHJa
	 3bGk/vtUNLPGtTt2emH0xbE4zo+qhfw1NnE5Ht5JRMKAQ+/jklkDRo4yS64Pgm4akj
	 wcxiSLeHW2D+DJu0m18BF5LdT5aX1M+1MLYqf6casG6GdL3MqXO5JitD8gv015o4KJ
	 DKChKGh9QquqoxmIyvaJL062BhCdlN8oGJfs4f4a0sPzmfA1orZ3y+Dk55zBxbxs+t
	 I/PIvmmasSc09dLvglgXvxazxeJoV2uj0f3yp6G3Mr27E+8JEwXCK4XSmdBT7haG2J
	 CotE8V19RacSw==
Date: Mon, 15 Jun 2026 15:43:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <ajAPjq6j3hjx7dBz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WQrFQbhfx9rS9W6P"
Content-Disposition: inline


--WQrFQbhfx9rS9W6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final build (x86_64 allnoconfig) failed like this:

/tmp/next/build/mm/slub.c: In function '__kmalloc_flags_noprof':
/tmp/next/build/mm/slub.c:5552:42: error: passing argument 1 of
'__do_kmalloc_node' makes pointer from integer without a cast
[-Wint-conversion]
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                          ^~~~ | size_t {aka long
      |                                          unsigned int}
/tmp/next/build/mm/slub.c:5340:39: note: expected 'struct kmem_cache *
(*)[14]' but argument is of type 'size_t' {aka 'long unsigned int'}
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                         ~~~~~~~~~~~~~~^
In file included from /tmp/next/build/include/uapi/linux/posix_types.h:5,
                 from /tmp/next/build/include/uapi/linux/types.h:14,
                 from /tmp/next/build/include/linux/types.h:5,
                 from /tmp/next/build/include/linux/kasan-checks.h:5,
                 from /tmp/next/build/include/asm-generic/rwonce.h:26,
                 from /tmp/next/build/arch/arm64/include/asm/rwonce.h:81,
                 from /tmp/next/build/include/linux/compiler.h:369,
                 from /tmp/next/build/include/asm-generic/bug.h:5,
                 from /tmp/next/build/arch/arm64/include/asm/bug.h:26,
                 from /tmp/next/build/include/linux/bug.h:5,
                 from /tmp/next/build/include/linux/mmdebug.h:5,
                 from /tmp/next/build/include/linux/mm.h:7,
                 from /tmp/next/build/mm/slub.c:15:
/tmp/next/build/include/linux/stddef.h:8:14: error: passing argument
2 of '__do_kmalloc_node' makes integer from pointer without a cast
[-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~ | void *
/tmp/next/build/mm/slub.c:5552:48: note: in expansion of macro 'NULL'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                ^~~~
/tmp/next/build/mm/slub.c:5340:48: note: expected 'gfp_t' {aka 'unsigned
int'} but argument is of type 'void *'
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                                          ~~~~~~^~~~~
/tmp/next/build/mm/slub.c:5552:61: error: incompatible type for argument
4 of '__do_kmalloc_node'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                             ^~~~
      |                                                             | int
/tmp/next/build/mm/slub.c:5341:41: note: expected 'kmalloc_token_t'
but argument is of type 'int'
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                         ~~~~~~~~~~~~~~~~^~~~~
In file included from /tmp/next/build/include/linux/mm.h:34:
/tmp/next/build/include/linux/slab.h:512:41: error: incompatible type
for argument 5 of '__do_kmalloc_node'
  512 | #define PASS_TOKEN_PARAM(_token)        (_token)
      |                                         ^~~~~~~~ | kmalloc_token_t
/tmp/next/build/mm/slub.c:5553:33: note: in expansion of macro
'PASS_TOKEN_PARAM'
 5553 |                                 PASS_TOKEN_PARAM(token), &ac);
      |                                 ^~~~~~~~~~~~~~~~
/tmp/next/build/mm/slub.c:5341:75: note: expected 'struct
slab_alloc_context *' but argument is of type 'kmalloc_token_t'
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
/tmp/next/build/mm/slub.c:5552:24: error: too many arguments to function
'__do_kmalloc_node'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                        ^~~~~~~~~~~~~~~~~
/tmp/next/build/mm/slub.c:5340:7: note: declared here
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |       ^~~~~~~~~~~~~~~~~
/tmp/next/build/mm/slub.c:5558:1: error: control reaches end of non-void
function [-Werror=return-type]
 5558 | }
      | ^

I have ignored this for today.

--WQrFQbhfx9rS9W6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowD40ACgkQJNaLcl1U
h9B0VAf/TCoN0K5tegZ9x1Ti1McN90sKWYG26l8uhqHPQCb5lLzaP/v2RAh+hZj2
+SNT9fQJZsUmDkEYkV1DU9gTJZ2JpLylPvCk9NlOx7Ztb2k9MswpgCQf32yRiAsH
NcS/K477Q82OUyCIm4u2THQSlxkrgVTYbwHnoEw8+kEGvFTliwwpJt3hg2VOB0Gg
iqZlBSCjyBB9XWucbVgDK/LiHJI7FakyNazVEGB8i6LUzROAXf9LlcQ98meyZiHe
NNbG3VhuUGdTtfVtbYNtnJw2ShSM5SUTmjk1CX6XmxBOIqMx4Jl9kBycneAyz+/n
WT5NI+cYhzG+kBqp2ryZwCpojTKdBQ==
=t9Zy
-----END PGP SIGNATURE-----

--WQrFQbhfx9rS9W6P--
