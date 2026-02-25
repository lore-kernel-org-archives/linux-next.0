Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C27239099;
	Wed, 25 Feb 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051878; cv=none; b=OxOk+OCBFHHtPIpWbJEQJUB4WNoaUqiJR5YyPBmSTWDdgr8bw8XPytAmPDLuB6MzKrV20zxqO/mMJWNn8jBYKK8jMoXzgAi/ogXjUM7a5K/OI9x6TKEFMa7DBJM8p4OMNaozedHo1Usr5eZE/8kQQNXMaeCQ4fwcTiF2QZtScmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051878; c=relaxed/simple;
	bh=EfvOsuMh6TRLkWqOKhSj3i1RIw0cv4TZoYG/lRhXETA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCkc1hVCrA7+Fj4B5GzNCp1L1/MuPcPLICvIqrZwxTFNArZvOUEkdoW1fSOanT6ORjz7j3IJbXeTc+sQFB4J8rpqVJFbZnbIN5qWPk6appojq9bQieO436Fu9xnK4xvS4TEjNPtBHCjJjHXFIgztEImalzSZWFqrI38hkF7Mw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU9zvwc1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU9zvwc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A58AC116D0;
	Wed, 25 Feb 2026 20:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772051878;
	bh=EfvOsuMh6TRLkWqOKhSj3i1RIw0cv4TZoYG/lRhXETA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU9zvwc1w4x2Nbe8qm3uqc2rgiLrcaMLtC7eeoBUORn3nUup2Vom/KRhNnKwRbf25
	 zFTd0lZl1fvMR/MFejTb4gaa8Mwcye5n+8NWzP7c1aGqtZ8y8ZCpNc9KyoYuRkrWCp
	 f9bgL7GLcIYd6r/U7+NAsaa86FoKISKvyfJsApcahABxyfTJGmr20ppMk3FLNm7WoN
	 2fRlhqndo7g2w50gbcXZzNzJydTUXP/GhKxJJUftc8V9lOlMc9SZfaS0ezHRY+Z320
	 FYjeyZQMoL+Rng7+BndjgXddUUlEZrhgTPc2KXVEu1+Mdrn5JO+ZRHJc3n9YBecHPL
	 co2h1qqpbX5Ew==
Date: Wed, 25 Feb 2026 12:37:58 -0800
From: Kees Cook <kees@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <seanpaul@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-msm-fixes tree with the
 origin tree
Message-ID: <202602251233.8DCB8E1@keescook>
References: <aZ73gWMLc_kMCIrA@sirena.org.uk>
 <CAO9ioeUM6ypgSLfZYj41LcjjENVpCuJ6ffk7f5yybdmd8UGJ3Q@mail.gmail.com>
 <202602250951.FBB79714E@keescook>
 <CAO9ioeW__4fBAFM=dLKkKiyGNXJsZUNKbTSzywHhK=oNtKQk+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeW__4fBAFM=dLKkKiyGNXJsZUNKbTSzywHhK=oNtKQk+g@mail.gmail.com>

On Wed, Feb 25, 2026 at 08:11:21PM +0200, Dmitry Baryshkov wrote:
> On Wed, 25 Feb 2026 at 19:56, Kees Cook <kees@kernel.org> wrote:
> >
> > On Wed, Feb 25, 2026 at 07:42:12PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, 25 Feb 2026 at 15:22, Mark Brown <broonie@kernel.org> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > Today's linux-next merge of the drm-msm-fixes tree got a conflict in:
> > > >
> > > >   drivers/gpu/drm/msm/msm_iommu.c
> > > >
> > > > between commits:
> > > >
> > > >   48634a9ea06a4 ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type")
> > >
> > > Kees, why was it landed? And how? It was not Ack'ed (nor was it
> > > requested) to go through the non-drm-msm tree. There was no note that
> > > it got applied. What is going on?
> >
> > It was a prerequisite for the tree-wide changes, so I had to send it to
> > Linus ahead of the -rc1 release. Sorry for the collision there! I waited
> > as long as I could, but the msm-fixes tree wasn't sent for -rc1, so I
> > had to include the patch in the prep patches:
> > https://lore.kernel.org/lkml/202602191029.2F0E7F01@keescook/
> 
> Was it coordinated with drm/msm maintainers? Not with me at least. Did
> we hear anything from you, like `Would you ack merging it through the
> XYZ tree`? Did we at least get the `b4 ty` or `picked up, sorry, I was
> in a rush to merge my changes which were tested in linux-next`? Nope.
> Is it how the community is expected to work? Not really.

I apologize for not communicating this in a more direct and timely
fashion. It was a rare case, and I didn't follow the expected
procedures. I'll be sure to do such notifications if there is ever need
for such out-of-band patch handling like this again. It's been a lot of
years since I did my last large-scale tree-wide refactoring, so I was
a bit rusty.

-- 
Kees Cook
