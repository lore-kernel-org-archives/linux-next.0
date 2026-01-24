Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E738256C8B;
	Sat, 24 Jan 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769255261; cv=none; b=XLdizPn8twrfq1eC2T3XNCM/Ap7W/yXnHv2ea9iIzja1bCi+T0xwRj6kIycbaAHeqrPksBYVyFJNphEhbYgTsjKBlNPiUopPzq7W46GOdETDTmFKeHH771xIdGIvRQqt0cxir6rD8ij3JtWtQNz0gO5NIh+j4engfmvvX70oP5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769255261; c=relaxed/simple;
	bh=iincRLQN8qCEKPF7i86sLhdZ46a3U2mvDd0AhMq0rsc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7zn4y1UO7BCGj9QrYlekMBLHS4pEIiX+8aWgEJDQSxAWK/uJ6VtiKKAFpjq1+X4/HBbCvwJWKZHrW3S5G4jtErfDcE6Q3WjgMHQlDqNrz+mfQADzXxcXeyU4rYcU78N7hlKVt6ncdIvnozlL/HxARm/Y2TUGXB61BO/3WpOkoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wm5Pfs+A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wm5Pfs+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1769255253;
	bh=3sDVQWlad4FBCe1xSzGexS2jbHGDgA5u4eJ2uQ1LPuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wm5Pfs+AW4MJZ8Dv2sQAudwO+Zj2AH7enMbXuNEGM/aE7E8O3s65fppMLawxU5lXB
	 WNL9LKklmllJn7+ZnZqhCFvEuIGBo+trrtdmrUdC4NdQZQ2zxwmQeCyws0ykl7FWR7
	 yrFwGQICE7ObFuwrIpI42x5FIHOw6gSgQv9+1zfl5ZmZI3s1Mshes7QT7eqbIkDXyH
	 710BQY4/6TOntVXNQkRhvrQ0NeNv/M+XZTZB3VESh/ycvAIzEmWAQ3GJbTYpKm+gRY
	 Lb6D2LhjGV2xbFZSlJiJnpN/7JYs1cvksOt2qljnKQ0Wlvmh3kQIWU8aER5XVcijtL
	 ahHVX9RfYPX0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dytMS5lKWz4wCJ;
	Sat, 24 Jan 2026 22:47:31 +1100 (AEDT)
Date: Sat, 24 Jan 2026 22:46:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20260124114635.10bff99f@canb.auug.org.au>
In-Reply-To: <ed061c97-9d4f-41c1-a340-1b1e57985e50@kernel.dk>
References: <aXOzI6sVTBTdJE5j@sirena.org.uk>
	<cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
	<ed061c97-9d4f-41c1-a340-1b1e57985e50@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tg+SWH5ISw9R97voRA78AW2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tg+SWH5ISw9R97voRA78AW2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 23 Jan 2026 11:06:43 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 1/23/26 11:00 AM, Jens Axboe wrote:
> > On 1/23/26 10:42 AM, Mark Brown wrote: =20
> >> Hi all,
> >>
> >> After merging the block tree, today's linux-next build (x86 allmodconf=
ig)
> >> failed like this:
> >>
> >> In file included from /tmp/next/build/include/linux/string.h:386,
> >>                  from /tmp/next/build/include/linux/bitmap.h:13,
> >>                  from /tmp/next/build/include/linux/cpumask.h:11,
> >>                  from /tmp/next/build/arch/x86/include/asm/paravirt.h:=
21,
> >>                  from /tmp/next/build/arch/x86/include/asm/cpuid/api.h=
:57,
> >>                  from /tmp/next/build/arch/x86/include/asm/processor.h=
:19,
> >>                  from /tmp/next/build/include/linux/sched.h:13,
> >>                  from /tmp/next/build/include/linux/io_uring.h:5,
> >>                  from /tmp/next/build/io_uring/bpf_filter.c:7:
> >> In function 'fortify_memset_chk',
> >>     inlined from 'io_uring_populate_bpf_ctx' at /tmp/next/build/io_uri=
ng/bpf_filter.c:33:2:
> >> /tmp/next/build/include/linux/fortify-string.h:480:25: error: call to =
'__write_overflow_field' declared with attribute warning: detected write be=
yond size of field (1st parameter); maybe use struct_group()? [-Werror=3Dat=
tribute-warning]
> >>   480 |                         __write_overflow_field(p_size_field, s=
ize);
> >>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> >> cc1: all warnings being treated as errors
> >>
> >> Caused by commit
> >>
> >>   f1e3672e49e2c (io_uring: add support for BPF filtering for opcode re=
strictions) =20
> >=20
> > Huh, that am I missing here? The struct looks as follows:
> >=20
> > struct io_uring_bpf_ctx {
> > 	__u64	user_data;
> > 	__u8	opcode;
> > 	__u8	sqe_flags;
> > 	__u8	pad[6];
> > 	union {
> > 		__u64	resv[6];
> > 		struct {
> > 			__u32	family;
> > 			__u32	type;
> > 			__u32	protocol;
> > 		} socket;
> > 		struct {
> > 			__u64	flags;
> > 			__u64	mode;
> > 			__u64	resolve;
> > 		} open;
> > 	};
> > };
> >=20
> > and the offending line is:
> >=20
> > memset(bctx->pad, 0, sizeof(bctx->pad) + sizeof(bctx->resv));
> >=20
> > which should clear from offset 10 (start of pad) for a total of 6 + 48
> > bytes, which is 54 bytes. The size of the struct is 64b.
> >=20
> > I guess the part it doesn't like is that it thinks we're clearing the
> > pad field, which would of course be way overwriting it. Guess we can do
> > something ala:
> >=20
> > memset((void *) bctx + offsetof(struct io_uring_bpf_ctx, pad), 0,
> > 	sizeof(bctx->pad) + sizeof(bctx->resv));
> >=20
> > to make it happier. =20
>=20
> Folded that in and pushed it out, should be happy for you now. I wonder
> if we have a helper for that...

The origin warning did suggest using struct_group().

--=20
Cheers,
Stephen Rothwell

--Sig_/tg+SWH5ISw9R97voRA78AW2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAml0sRsACgkQAVBC80lX
0GyK7ggAj4F7G/F/DFZ+B1ml62CWWou/LvifNSGAtTiUR1rHNdYm7or/Hv3xfw05
99rlFRsQwHNTe9N2eoEXfu3jqUGpGHNuBhmSTFJtYDNb3Lenbosr31Eh1o9FjLc6
gfiKLjpB4v1ZVjqdCHTeufnbGEj/A90yttAc8j3fbtD+1GqAFDlVqx21I56HBgGq
QBxTDyQDfs4BRtF/wbZUAxwFYe3PiKY/qe7uj65tC1bZ2Yq9q3+jCLIjYBuKYrYN
0naDEeUI2vnjzVRTBN9nPU8v78QWuFm0p71XyN8MVCme849gUCNLJ+iMiSuqgbkP
J3MRiiXFG+EPx/j+cLm6crykF5rPOw==
=pgrE
-----END PGP SIGNATURE-----

--Sig_/tg+SWH5ISw9R97voRA78AW2--
