Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A03E9F74;
	Wed, 25 Feb 2026 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042170; cv=none; b=CT4rA1vuZ4P7Vf0GAmBxSl4lc99rA1TvzEeLTxc9yeFwyHpG6o1LtXsYK5VI4qlApAyXbC0lwwiliKP82paVMoqnARG22Y0O8NjA5bead3+LqSAdA5teNkMNqEkSxLEBtBpNljq36lnGRzRvZwJh2TA8VwpyX9QC4kR+j7uFqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042170; c=relaxed/simple;
	bh=TKeiV6az9jbyInaHyMxEYNxkrwf3wxydPP5cZDo7DuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s086qVXyQC5k57Rj3x3cqrFcOraQe0vQb17xf5hR8wGddL1WQCjbfBeWie1A3a20ot4c5MrDcdATP75JveCrFQGgMJ5pYblMpSGMn35GazLP7GKgLbtnCDA1niWE3RXYdlsp+gAQDL5UN4G81vQ64baThm793/2qMHCUK2bEsSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOhZ1V5W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOhZ1V5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0FBC116D0;
	Wed, 25 Feb 2026 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772042170;
	bh=TKeiV6az9jbyInaHyMxEYNxkrwf3wxydPP5cZDo7DuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOhZ1V5WoSEI2sJuTFxCLiqXze1pRG+jUfS8H1rJwLRIXP7npkDcjtwA/Jt+AO8y6
	 /fSFA37Kc8GDdEmHEVKbG8RrTzpK3aIstr5wuLulUMbTWynpSBx125hgOhwEKM3h2j
	 9b0FAnsPOw1vExfIvc22DXiLfB5X8gKosl+oKTdsXyNVeo5iAQLfq9A3nmlxyd0peM
	 SJv6csl80iam/UUg6fKx9MSie6oBaBGR0Yef+AmMVts5tTGp7kzp2utT3FzSi5McRn
	 PPcZcHW+Mve8J/4/VKMwvTR9XTC2X/pLcJ3SFOt8HX8O9Q9x5isHRjPSFlxymeK35o
	 dj3QsDepcVwaA==
Date: Wed, 25 Feb 2026 09:56:09 -0800
From: Kees Cook <kees@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <seanpaul@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-msm-fixes tree with the
 origin tree
Message-ID: <202602250951.FBB79714E@keescook>
References: <aZ73gWMLc_kMCIrA@sirena.org.uk>
 <CAO9ioeUM6ypgSLfZYj41LcjjENVpCuJ6ffk7f5yybdmd8UGJ3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeUM6ypgSLfZYj41LcjjENVpCuJ6ffk7f5yybdmd8UGJ3Q@mail.gmail.com>

On Wed, Feb 25, 2026 at 07:42:12PM +0200, Dmitry Baryshkov wrote:
> On Wed, 25 Feb 2026 at 15:22, Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the drm-msm-fixes tree got a conflict in:
> >
> >   drivers/gpu/drm/msm/msm_iommu.c
> >
> > between commits:
> >
> >   48634a9ea06a4 ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type")
> 
> Kees, why was it landed? And how? It was not Ack'ed (nor was it
> requested) to go through the non-drm-msm tree. There was no note that
> it got applied. What is going on?

It was a prerequisite for the tree-wide changes, so I had to send it to
Linus ahead of the -rc1 release. Sorry for the collision there! I waited
as long as I could, but the msm-fixes tree wasn't sent for -rc1, so I
had to include the patch in the prep patches:
https://lore.kernel.org/lkml/202602191029.2F0E7F01@keescook/

-- 
Kees Cook
