Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8547DFBB;
	Wed, 29 Jul 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336270; cv=none; b=N8x7MKBlY3LGT0u9jZzJSoCmGXbjGGxh/ADaJiz3cpfEIWDD2W+5FFw5wxHwfM+WFmfDWMbL7HXGoDBvry9MUUR20t9+fqr4QN9fb/XnfQiW4+DCpMrySXUPu6pGEUgQ+xYcPrdXqEXo2LX0XeCzH5CLBkI+P/3LVdybTxrLw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336270; c=relaxed/simple;
	bh=QPwmwUKosyBU67XH0NptiGrHRClvyRiLKrUGa9hONHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuWrj90w6WNeNgICMl08Pnz/sKjBO4CJ40yHakRrCxnM9VhthTuv140TCFq9OG1vhOEOYwEj4AwWTqN1AObBUXaFY+rCWZ6jz9JOY8wXBseOXl+t8nc+BWRqispi/o+glX3Vr1lpWvSnYML/Xs4mDvqHDsJFWQ97enTn/1r2lo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GD2vlaEi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GD2vlaEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3CF1F00A3A;
	Wed, 29 Jul 2026 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336268;
	bh=QozwXecRgLLRxIN7vxC8o2fe9+8yqONG7yvJGsEVga0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GD2vlaEi4O+N51Vy30XhpH/LcnTKpofBzTf+LAuSP/kwlrKTR/eWjsPTCkEYCzuKm
	 JZlgP9eh2HstOA0WChEj/h5zMO9RGB/UKJ3aUvkoEgLNxzJrTB9fu5zDJYz5kkTefo
	 ERQ8KGy1QPSnpEDNc21XqQnO5RzsklUXlI4y/MCD6sZFW7jujzNfl765PTIh6KwD0x
	 BGD06vrqfvJ+brl7W/K9lWJH/tDnlEhHOswA7gh2JZvIji4J2b4q4pQyRKsE9OMx4S
	 tL48PTTM1IlXAasvL/Z2NyOA+4raxKRxFYR6mckQB7KltsnOXZ8ELjktns99nFlwPq
	 55w6ArJVDiqfw==
Date: Wed, 29 Jul 2026 17:44:22 +0300
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
Message-ID: <amoRxuf7AVgGLl7N@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
 <amjpLoJbHsqIAqJO@kernel.org>
 <20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>
 <ammYgVd3Ty8JE0Fd@kernel.org>
 <20260729001052.72027fbb99b50783476fa7c2@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729001052.72027fbb99b50783476fa7c2@linux-foundation.org>

On Wed, Jul 29, 2026 at 12:10:52AM -0700, Andrew Morton wrote:
> On Wed, 29 Jul 2026 09:06:57 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > > I'll get the series "mm: Refactor bootmem gigantic
> > > hugepage allocation" into mm-stable in the next couple of days.  Can we
> > > then make this issue go away?
> > 
> > I can base the conflicting KHO work on mm-stable.
> 
> It's pushed out now.  Basing on 6d098029de09 ("mm/mm_init: fold
> __init_page_from_nid() into __init_deferred_page()") would capture all
> of Muchun's "mm: Refactor bootmem gigantic hugepage allocation".

I'll apply the next version from Pratyush on this ...
 
> > But if mm-stable is rebased we'd be in a bigger trouble.
> 
> As mentioned, rare.

... and will cross fingers that such rare event won't happen this cycle :) 

-- 
Sincerely yours,
Mike.
