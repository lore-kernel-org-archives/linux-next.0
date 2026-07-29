Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE81DFFD;
	Wed, 29 Jul 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309054; cv=none; b=cTJUSVr8IZ/+CPSHiQHve+MU2M1iy5ogOdyV0PhY70T8d7+dzoebCbD3efAI9jZXeNxx0HrbG7wKGr/F3mZ6xacK5xMCyYfiXbE1aeLqrIYadreF3fVkU/h+SKEYYuncLX80AVlaywkgHHd7wByQkPQmMX02rtGyF2aWbpONewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309054; c=relaxed/simple;
	bh=qlUWwBLTcNlHuyuwO/dFywVi15nyUQ93IhTQ+cZtNa0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eH7HpvPxwyAjaqA3SkIMv1KcnMXAEhfLA+10laMv55EtjxLJHUt+ryI8sOH/OQRlOZW98mijAbzsYovMOFOSqftDp5q24+ldWcso2K58QRQhgHyaL4K6r4k/EBcudYDLgvOqbuPW6W/qRVxB0d66vfW14GEHor77Tc9+zC9S2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mbmequY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mbmequY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96421F000E9;
	Wed, 29 Jul 2026 07:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785309052;
	bh=oj2ejjIZHFy0sv/PNzqy8rMbPjZxTkiuDwKWEZI3QNM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mbmequY4PpJPc11lTQdu1cwogNoIEC5u15kIDpNadLD8KCDMXO2OBBGEezyD4bJ0R
	 9hCdeFgroGX2Fb9E3xuC4zrwas6AJVvBP4z8awV1TuL+Xy3ropRHIBBP3rw7hE4LOQ
	 bjwEfnW/f9VKi7uEPnu5d2qsxSzo9UBXQXt5DY04=
Date: Wed, 29 Jul 2026 00:10:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Muchun Song <muchun.song@linux.dev>, Muchun
 Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 mm-unstable tree
Message-Id: <20260729001052.72027fbb99b50783476fa7c2@linux-foundation.org>
In-Reply-To: <ammYgVd3Ty8JE0Fd@kernel.org>
References: <amjYWetl6_WVyumg@sirena.org.uk>
	<amjpLoJbHsqIAqJO@kernel.org>
	<20260728134333.906cb26da4b6dec083b21344@linux-foundation.org>
	<ammYgVd3Ty8JE0Fd@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 09:06:57 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> > I'll get the series "mm: Refactor bootmem gigantic
> > hugepage allocation" into mm-stable in the next couple of days.  Can we
> > then make this issue go away?
> 
> I can base the conflicting KHO work on mm-stable.

It's pushed out now.  Basing on 6d098029de09 ("mm/mm_init: fold
__init_page_from_nid() into __init_deferred_page()") would capture all
of Muchun's "mm: Refactor bootmem gigantic hugepage allocation".

> But if mm-stable is rebased we'd be in a bigger trouble.

As mentioned, rare.

