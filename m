Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F63AA187;
	Wed, 29 Jul 2026 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305225; cv=none; b=DAGy+yR/c42YZ/ug7oYnFKYeyuMkYBFo+BBSos0aAE7cufIQkq3/slU66aljWGTlcJTchszCxwCvpRS4uHqUSJaV9iEkkayqxKhHtj1XYnMQoiUSkf3YKNdbNib5rMgld5i6xprAW6ytuAkFnIL6k6S8rKEA3xTKCoJUaAvMHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305225; c=relaxed/simple;
	bh=x34r+kclZ45ga6FYBAmQPrxCQtpKhNSWsmq8YoYqYX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcgNfIOiZ75H6Lu1ZS3z9iBXzmLZBrnVv5g4rHFXP9rrkAPPgW0DTFxf1Y4nwd1tiV+Q8Glhw2EiDu98HjXylhjzXboNiMuVSqboMm96OK+JcBi1wG77gwNH1fzPkX+yjhEu3Hm12Pt7f7u/Ks3mYme7NEH2i58m092wOXsxg6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7f8axmi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7f8axmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B08F1F00A3D;
	Wed, 29 Jul 2026 06:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785305224;
	bh=ltQs+xRcPr3lhvubPKxf0DZ313RrY7uEmr4Y6Jo0bfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M7f8axmiINlRPwZkJfrAds0SySrfyRx9/geu83//6OqnL3AW0r1dmAUOggJsp4vjc
	 cKYGlIsl53tmlZ6RLkdkgTVybvbRnqEVb7mO9/xTyK8xlDsD/gVx/hDbCAr5g6B/vP
	 beNloMrldhAJNOcZquZuEPVgULSLDNBV3BHO4g8dqLEUiKilLMYhbQse6+qvr0GT5q
	 SLc7ylIP1qHMzb92iDVFkpE3zqzcU3w6f2KZAzFlC7vrBKPWHDmbWbnv9Ht83rqgUo
	 B+f/dUBAHker5ehgcLutlBgBLlnYsAWcjKhG0cu8IhJjc2uQc3dBKzwh02aSCVfg5r
	 UBBdIn+xHLV/g==
Date: Wed, 29 Jul 2026 09:06:57 +0300
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
Message-ID: <ammYgVd3Ty8JE0Fd@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
 <amjpLoJbHsqIAqJO@kernel.org>
 <20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>

On Tue, Jul 28, 2026 at 01:43:33PM -0700, Andrew Morton wrote:
> On Tue, 28 Jul 2026 20:38:54 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > I've got this for merging mm-unstable into liveupdate/next:
> > 
> > diff --cc mm/hugetlb.c
> > index ab4afc818e8cb,a77c3c1cb8943..0000000000000
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> 
> Well that's a pain.

Once resolved it stops being a pain :)

> I'll get the series "mm: Refactor bootmem gigantic
> hugepage allocation" into mm-stable in the next couple of days.  Can we
> then make this issue go away?

I can base the conflicting KHO work on mm-stable.
But if mm-stable is rebased we'd be in a bigger trouble.

Ideally we'd have a stable branch in mm tree that only contains "mm:
Refactor bootmem gigantic hugepage allocation" series and then this branch
would be easily merged into mm-stable and into liveupdate tree.

I'm going to keep liveupdate tree as it is for a couple of days and when
Pratyush sends the updated version we can resync again.

-- 
Sincerely yours,
Mike.
