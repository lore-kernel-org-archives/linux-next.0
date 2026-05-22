Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3980737AA63
	for <linux-next@vger.kernel.org>; Fri, 22 May 2026 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452445; cv=none; b=kjYloWDQ1E6E7wI22XuLBo3ZEmzRN/WhmXIbEMlHnA8T1e6QJ95BRPzZsGI6pKPN5yNA0t2xpxbTZzasbUeQLBNcoaq2KNUdllw62Y6hNCioiBM4jOE3cQ3X2yDH24kLUlFUS7foQZ4volpR7511Y0pA16/nhNfU0cWuDQx72F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452445; c=relaxed/simple;
	bh=iHkJ9PQlBGoIXtfH9T56aBR13P87Sgf0SQkeWgXDiy4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jo7ZpYVY7SAwRzVySRAQM+mfLQtoVjLPXD3/4F3pZf2mFLvyXawsh7EX0RBCAXxtW7SwwvVuO8naKjVJZ/ejQQeKbwwuTWPGXZRtgFX3HfH+hmFAGHNy1i8jAsuMKXP23LUChhAsrCSp9Lbsu9+8Lp4eVaLgyNAGncwTFKA6tX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JjI+2cO0; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JjI+2cO0"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779452442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F9M9N9EF8wzj/vRvOKQmxhRdiY2hw17EkK0FGpxSyMM=;
	b=JjI+2cO0oBjnd0IsXcMjbkFC4B8HPmTi1CdOk2CX82w+6PTkPIvCX6F69u1jJdJZxIOMgH
	2mRijA+p0/FnYNQMAls1kfLyO009otONragC6fMG7eD0uUOhiqnHJD5MqVG/SwVtzl5pLP
	3PAQxaJJSkK/JrlSb0fgxcX+PBm85uo=
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: linux-next: manual merge of the loongarch tree with the
 mm-unstable tree
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ahBDDF2noinoSIg5@sirena.org.uk>
Date: Fri, 22 May 2026 20:20:01 +0800
Cc: Huacai Chen <chenhuacai@loongson.cn>,
 Andrew Morton <akpm@linux-foundation.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Muchun Song <songmuchun@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <512D3F9B-2C2C-404E-A777-2C9245876F8C@linux.dev>
References: <ahBDDF2noinoSIg5@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On May 22, 2026, at 19:50, Mark Brown <broonie@kernel.org> wrote:
>=20
> Hi all,
>=20
> Today's linux-next merge of the loongarch tree got a conflict in:
>=20
>  arch/loongarch/mm/init.c
>=20
> between commit:
>=20
>  c0defeccc630f ("mm/sparse-vmemmap: pass @pgmap argument to memory =
deactivation paths")
>=20
> from the mm-unstable tree and commit:
>=20
>  0ccc9d47cf020 ("LoongArch: Remove unused code to avoid build =
warning")
>=20
> from the loongarch tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your =
tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any =
particularly
> complex conflicts.
>=20
> diff --cc arch/loongarch/mm/init.c
> index 055ecd2c8fd94,031b39eb081c5..0000000000000
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@@ -124,12 -123,8 +124,8 @@@ void arch_remove_memory(u64 start, u64=20=

>  {
>   	unsigned long start_pfn =3D start >> PAGE_SHIFT;
>   	unsigned long nr_pages =3D size >> PAGE_SHIFT;
> - 	struct page *page =3D pfn_to_page(start_pfn);
>=20
> - 	/* With altmap the first mapped page is offset from @start */
> - 	if (altmap)
> - 		page +=3D vmem_altmap_offset(altmap);
> -	 __remove_pages(start_pfn, nr_pages, altmap);
> +	 __remove_pages(start_pfn, nr_pages, altmap, pgmap);
>  }
>  #endif

I think your fix is right.

Thanks,
Muchun

