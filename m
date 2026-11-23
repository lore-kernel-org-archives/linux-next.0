Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469827;
	b=Y2Po2FpqNXjkQCRuhJnWukSamYqa28R9MlfSTT9n+SCIIXccXKfILEqCsnhfb8xNuSeJ
	 l1khJWPoNdszc7n2RBH8Np344QZ64R6On0BuGQj7Qf7GiUxykdXTlMW5zfhRT4KEcPbkB
	 CDmEtG5b8wFmOAECXviqbKTGZQygOCL7zSVCH4J2uHHcXIQsL/g2WylWgaXQsV2FZHfSs
	 IEbSJqkGZk8xipCa7MPfhpR79jl9mhHXXmKm7rs+6KgkGQnshN2h1Bb0jMP9Tc7/sD9eM
	 iwYcK/lJWHE4cXjbsQsGhK1vcEFQGF265dUYE3gUK4+hUyjfZ94J3HCDI1mDDhnJ8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469827;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hfkI+UHcjK0PbeypYNi+Qj0qIUe7gAIHbiIZnk53oic=;
	b=Dq5KEH4/DqY7eGnJ5wzZ29OKQLsg74io+qReClTQ1s6MB5Xk8d0PsCIujnXi2XUjfh0e
	 uILpu0LW+YVQyJrukMipTazbeEwmtlk/QHAnnW1s+/KZlZJoWSHSeqZAxf07WrmaE5nxo
	 JqK6gjlNvr6ibn/YuIXXcI4xI8ya5jFEJGISYbCY/VcBntUTn+ukNITcBxM5hM2Dgn/D1
	 fmcOnd2sjZ8fY+gSdjsQkJxpqhCiUkj8IFiIPlzmWgSwcbx1q6rvIQdg/OGL8RskREx+w
	 RVzrchv57O+JSa2durfPwfxQy1TAlbv96VqmFoJ5P82d9GO2/8JKLQIBPUzbB43zcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCBvYv4n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247D9606A321;
	Mon, 23 Nov 2026 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCBvYv4n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A441F000D1;
	Mon, 23 Nov 2026 21:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469826;
	bh=hfkI+UHcjK0PbeypYNi+Qj0qIUe7gAIHbiIZnk53oic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCBvYv4nBdIIBNhftjQ+AbOy4sjtQpDuc5l9Wn/hhdIjbYNQfvrCoUIwLnn0uXlC/
	 if6TrM2NjbriKMG/n4O0DMaXq1m0KDmJ3GJjTvB0T7HL3XoK+u7Am1V+2QN4Q1NIvw
	 rQpqPmikqoUSnNCspY5k557uPqEAn6Kg/guhxxo1a7IZGRFQdcXVAp55JMrkPaAfIJ
	 sfkj5Lr2k0K7yi1yIvJeqlQ1RfLD9orJSNcErE8LKgAsxY6fMaqiCOjo1WYNzoG8C6
	 OkYiZJEnLsLKRus86U23G0M7eD0ovPUoLUwDep8JdjTte8fBJOGmRc4P1/eCbqUFq7
	 ph5K2OQHCOD+g==
Date: Mon, 23 Nov 2026 13:37:04 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>, Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with the
 mm-nonmm-unstable tree
Message-ID: <awSyACE_zJCpQkGt@google.com>
References: <awRHAIi2TSeFOKpB@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awRHAIi2TSeFOKpB@sirena.org.uk>

Hello,

On Mon, Nov 23, 2026 at 02:00:32PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the perf tree got a conflict in:
> 
>   tools/include/linux/compiler.h
> 
> between commit:
> 
>   8bc0233d079e4 ("xarray: switch to __nonnull_args() macro")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   bed0673e839c3 ("tools headers compiler: Synchronize compiler_types.h with the kernel sources")
> 
> from the perf tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for letting me know.  The change looks fine.  I'll note that when
it happens again during the next merge window.

Thanks,
Namhyung

> 
> diff --cc tools/include/linux/compiler.h
> index fad2c6131a80c,505fbb0080d06..0000000000000
> --- a/tools/include/linux/compiler.h
> +++ b/tools/include/linux/compiler.h
> @@@ -68,15 -34,6 +34,10 @@@
>   #define __naked __attribute__((__naked__))
>   #endif
>   
>  +#ifndef __nonnull_args
>  +#define __nonnull_args(x...) __attribute__((__nonnull__(x)))
>  +#endif
>  +
> - /* Are two types/vars the same type (ignoring qualifiers)? */
> - #ifndef __same_type
> - # define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
> - #endif
> - 
>   /* Enforce static storage duration. */
>   #define ASSERT_STATIC_STORAGE(name) \
>   	static typeof(name) * const __always_unused \


