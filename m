Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438193D7D8E;
	Wed, 29 Jul 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356158; cv=none; b=ero+dPE/CO2ORfuo4ONB5dJHotI/f5b3cfqMVguiafwlO5IjwxUfNwsEmbUOWP16orIMj7wTarBwqW38im0XyYYT1AZcPmsOYFnSGDUgVr71XFlfAt+i99lJSc+8RZJ9RnDS/+lzXoGU7C0C3K8nZaPXV8woqbaWz7U6nNA5zss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356158; c=relaxed/simple;
	bh=+kDk02YvnH3XaKjHBrRLmtAV94kCNfaZIvsAmwF84nk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UoJrJuLjfxcuS2tn/bfYSZxD3kPsvn4d1Hl2FVNN6cque5TloOitaI0nZZC+DhqTCUw2Oq5UF44pBTvfk/Tp9A17r4Tq8lN8WNzkNd6urIQl6GiIPV57OmzeJNLjltegtrVzyErmTakgRj9swdcFiiJ6JtdlG4DwNCkdPVUtIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UfBTa9Y/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UfBTa9Y/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E13C1F000E9;
	Wed, 29 Jul 2026 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785356156;
	bh=DET8WAAS1wQmwf/hxNnKDMDUTem/7ONEZ+D6DYma9pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UfBTa9Y/h0qtSH/JSErDlAdX9kxRTBqcQaXGDWz2fTvhSnezCRl1MZ3BB82ZBqavj
	 Ro7f10B5UBBFayoBJVmvlXp/umxJ8hN0Ds8LNBvF8F7/UnV0Eo3ITfvys2F4fTnHOu
	 Sd6SRrRgpqDwIRpIkOUwaigl6bPOwwdBuTvJ6mAo=
Date: Wed, 29 Jul 2026 13:15:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Muchun Song <muchun.song@linux.dev>, Muchun
 Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 mm-unstable tree
Message-Id: <20260729131556.b78500b113d057d97a8dff3e@linux-foundation.org>
In-Reply-To: <amoRxuf7AVgGLl7N@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
	<amjpLoJbHsqIAqJO@kernel.org>
	<20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>
	<ammYgVd3Ty8JE0Fd@kernel.org>
	<20260729001052.72027fbb99b50783476fa7c2@linux-foundation.org>
	<amoRxuf7AVgGLl7N@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 17:44:22 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> On Wed, Jul 29, 2026 at 12:10:52AM -0700, Andrew Morton wrote:
> > On Wed, 29 Jul 2026 09:06:57 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > > > I'll get the series "mm: Refactor bootmem gigantic
> > > > hugepage allocation" into mm-stable in the next couple of days.  Can we
> > > > then make this issue go away?
> > > 
> > > I can base the conflicting KHO work on mm-stable.
> > 
> > It's pushed out now.  Basing on 6d098029de09 ("mm/mm_init: fold
> > __init_page_from_nid() into __init_deferred_page()") would capture all
> > of Muchun's "mm: Refactor bootmem gigantic hugepage allocation".
> 
> I'll apply the next version from Pratyush on this ...

I added a mm-stable-6d098029de09 branch if that helps at all.


