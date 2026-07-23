Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1B3DDDD7
	for <linux-next@vger.kernel.org>; Thu, 23 Jul 2026 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784848186; cv=none; b=ejH5M+GrFterQ/1bHcMeZiLaLtC7Q4zp0gZ3bWmUXJg42+d7LQuvOd0Y68CVva8Y7tKaVRESV5f0sWTfReFKQpRhfMhwpvsHWOoHQodMvLz6qrLWNlSrYx/aAiXZmAeTOYEyyFzgRahUOW47dOA7HnWs5GOpSMSLojbSHEF7WLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784848186; c=relaxed/simple;
	bh=l1ZmUhyyBNAYXwI9Ehv+sUjut2NigREUm77hdS3PbmE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iRYrRmsgQuSKLVYt0mGZzcaWSA9Vnvjlyk7vdkSWbj2mQyP6/zuAGL8K6MnpYV46ZrWcA3GESKyCncfWW5s6kRts0eZDoYax60hIX9wzBvlwROrsAonwhpVy63dugqQBY/VfEEYfLCBFUP0Q5Jy042Gm3S51shXxHNpN8ubmzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VAfxbPLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VAfxbPLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1F71F000E9;
	Thu, 23 Jul 2026 23:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784848182;
	bh=tSN/SqdoXxpvwrgxo5RrG0Q0/V1H/881uQTbRe6xvH4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VAfxbPLnI8mckxMSf/u+ozV3DQM6crMakIuBMasclDZbuPk2ITUn00ztbvn6zYyEe
	 4cXrtXZqlVW62quaQKeDmFUiZXg2qQ8g/qPVFA6k2mrzfcUDy71ZL7hFHbkGFfX3Em
	 5+gTAQG42pFiy3o5kl/1NFLhtZjgQ2IIOQWwVH/s=
Date: Thu, 23 Jul 2026 16:09:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Mark Brown
 <broonie@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Usama Arif <usama.arif@linux.dev>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org
Subject: Re: Semantic conflict between 04b177544a04 in drm-misc-fixes and
 0b6b1bb28482 in -mm
Message-Id: <20260723160942.b58b065d771401aba117bc77@linux-foundation.org>
In-Reply-To: <20260723212724.GA999236@ax162>
References: <20260722225605.GA1910198@ax162>
	<amFPJc1NQbuYWlSp@gsse-cloud1.jf.intel.com>
	<20260723212724.GA999236@ax162>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 14:27:24 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> > So the drm_pagemap.c code could be:
> > 
> > -#if IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> > +#if IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES)
> > #define DRM_PAGEMAP_PMD_ORDER        HPAGE_PMD_ORDER
> > #else
> > #define DRM_PAGEMAP_PMD_ORDER        (-1)
> 
> Ah yeah, I probably should have looked at the bigger picture there.
> 
> > This Kconfig has been around since 2024:
> > git format-patch -1 b979db1611a63
> > 
> > Would it be better for everyone for me to change this in the DRM branches?
> 
> I believe that would render this conflict moot and seems like the
> correct thing to do anyways but you could wait for input from the mm
> folks.

I'm fine the drm people changing things ;)

Otherwise I can disable "mm: rename ARCH_ENABLE_THP_MIGRATION to
ARCH_HAS_PMD_SOFTLEAVES" for now and fix&reintroduce it into mm.git
after drm-misc has merge into Linus.  Or something like that.

