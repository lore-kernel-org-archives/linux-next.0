Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B9408018;
	Thu, 30 Jul 2026 11:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410313; cv=none; b=Iuxxkh2ifCD1HWjmqug/vmcPc034Z/uA6JKMuc80N51G9WcjvUlp8aXfjcOO7yezKbaI8BWCDCVDg7RtIfhHMOR/pCt33xF0Zdgoy/wGGiI1dMNSXoR6t+py7v2UVqB/zgGlai4M6P6XFK4PA430pGeCy5b4VeT1vifYlBJVFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410313; c=relaxed/simple;
	bh=UNAkaw1DpRVBtWs/Psznf+Mwyu2lOJqP7MqQ/UmxeLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4mhb8dgKmHA0LDP8SlSPeJzNSmKn6522gbgAH5qBP3XojfJQChRsDap0V6bO9Hna17260tokmCUmvrg0C75dsMB7nunEKSm2QIN3k4uQ/eOztxR6PecUe3d1t/XyfsY4DPdA/NND9UTQC6/Obeae9iyGqSxl8yLMAgVX/M9quM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD5kyVpV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WD5kyVpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C011E1F000E9;
	Thu, 30 Jul 2026 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410312;
	bh=yzXoLp9VzT/v76eXCdAPAIoaoWxJ1wZqDTZYG8HBriY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WD5kyVpVTL1Dz3P1KF1uluwBdxs4tSahwzCx357b8PytFzYIfrDrjJYt/XvEgFCG6
	 9v3W2cpL6a2GlmMe5mtWcIIZUfuzrB/VMUKN1u03b2khF8ttNRZRirPEt9t60xb6P/
	 4ml8E+y3VeQ2YNDz4UlmACnRT9vJDeCuSZzM9Hfso1xFI48DMTK9dFwvNknwHkpfqt
	 suXw1UcIK2pNrQCKIbQHBeJO9/VROuVT5PBdPonQ81gBAyVgIWy8oyY6IICBut3rbd
	 ufgK0waT5NYhg3ffJZvWZx0nEGEXsZrtUJnNYP0pT4uDCqpAV8IptKedwj/eraHCBc
	 eRc1CUXN6Tczw==
Date: Thu, 30 Jul 2026 14:18:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 mm-unstable tree
Message-ID: <amszAr7DL7pY2jM-@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
 <amjpLoJbHsqIAqJO@kernel.org>
 <20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>
 <ammYgVd3Ty8JE0Fd@kernel.org>
 <20260729001052.72027fbb99b50783476fa7c2@linux-foundation.org>
 <amoRxuf7AVgGLl7N@kernel.org>
 <20260729131556.b78500b113d057d97a8dff3e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729131556.b78500b113d057d97a8dff3e@linux-foundation.org>

On Wed, Jul 29, 2026 at 01:15:56PM -0700, Andrew Morton wrote:
> On Wed, 29 Jul 2026 17:44:22 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > On Wed, Jul 29, 2026 at 12:10:52AM -0700, Andrew Morton wrote:
> > > On Wed, 29 Jul 2026 09:06:57 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> > > 
> > > > > I'll get the series "mm: Refactor bootmem gigantic
> > > > > hugepage allocation" into mm-stable in the next couple of days.  Can we
> > > > > then make this issue go away?
> > > > 
> > > > I can base the conflicting KHO work on mm-stable.
> > > 
> > > It's pushed out now.  Basing on 6d098029de09 ("mm/mm_init: fold
> > > __init_page_from_nid() into __init_deferred_page()") would capture all
> > > of Muchun's "mm: Refactor bootmem gigantic hugepage allocation".
> > 
> > I'll apply the next version from Pratyush on this ...
> 
> I added a mm-stable-6d098029de09 branch if that helps at all.

I noticed, thanks! :)

-- 
Sincerely yours,
Mike.
