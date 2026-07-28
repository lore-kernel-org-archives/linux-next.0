Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE346F4B8;
	Tue, 28 Jul 2026 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271415; cv=none; b=TG5Nej/JA899G+g6BIud6Yncp0wKH1VlQvA0aBAQyrR/ok798hysFSkmqvECuHScm1E9NSjpGeABlQS/24/Sj/AlIfX2RKDEUfHCOsTuree8HRErwX00j48k+LFnvOW0LYQbiYivG0a+pI5a44Kv8gBehkMiuiWhGcmnMdg3ASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271415; c=relaxed/simple;
	bh=q/SqOhxC0tModFZVSnVokzdWDjgfsZ2xXaCfy+/dL/Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NCw7sc27xmCKa1aSZ2sNUe6LeNvlTy1r/qLrOuz774SeIjy4oZaTNYKL/vL8JDmnveMuIUCmhkY4wG1bC9KMweGlGa95osnIbyYqpqw+zQQvhkpNHg6vATy1qViqOisgy016QkR4MbEW9lk76A8o99mVxZj2UjrLZhvpOGvGJNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VYTz7A7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VYTz7A7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E531F000E9;
	Tue, 28 Jul 2026 20:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785271413;
	bh=ksr5HsUXADRxIcnz11RmRWZkKaHakhgIuZ4IlUV5D1g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VYTz7A7Ntsmh9LrL3Ntl+pmPX+lEvDH16eNaeI8swq6mTZM35i2uqOsnp6rjvcSct
	 a3Msc4kEBtb4XTB9rmHbj0WmF9fa+t0gms5MXjg7PaVsrPUKspwoteRyJ+uO/kv3VP
	 bLQstN6JQ4JFTHzq1zTrTXGp3xWOCN9wGlhWsZ+A=
Date: Tue, 28 Jul 2026 13:43:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Muchun Song <muchun.song@linux.dev>, Muchun
 Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 mm-unstable tree
Message-Id: <20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>
In-Reply-To: <amjpLoJbHsqIAqJO@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
	<amjpLoJbHsqIAqJO@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Jul 2026 20:38:54 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> I've got this for merging mm-unstable into liveupdate/next:
> 
> diff --cc mm/hugetlb.c
> index ab4afc818e8cb,a77c3c1cb8943..0000000000000
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c

Well that's a pain.  I'll get the series "mm: Refactor bootmem gigantic
hugepage allocation" into mm-stable in the next couple of days.  Can we
then make this issue go away?
