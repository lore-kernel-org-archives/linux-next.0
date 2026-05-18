Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D62EA48F;
	Mon, 18 May 2026 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134485; cv=none; b=NHYUzIkbr9b9RbkmckTlvr5v6UzkbXOmJgkvXzNjpuAYRwf6K+AHDFLoylGxF1kYTyjK19sxwGxjB8JD1aloJQqtFfmgUpqkgFNvHLJsyFJJekwS+vnHVlvwhDSI81dqTxXTZQTQMeJtdInZO74dMY+3db0VmWJes9f4MmBeT6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134485; c=relaxed/simple;
	bh=bL2I5/fLOIRjDiRTHtKr+h7PqSag6Z5pjak0eRP8RqE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=maqpuSsP5E9rKTmEuhxM5SAINyhIzZ2MpvKVfptS/eHhJPj45pX6ytUBwVfpjnaswNj00XOr2JsA4VFEPAQwMpZABY1xJuPgKKbEs74/Bxx9ha8pi3ymieWQjogWKu+wQ5WLJbgnY4nltP+XxwJUt3BaRVp/3FO/jTutDyfeB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gy4MLloB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gy4MLloB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15029C2BCC6;
	Mon, 18 May 2026 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779134485;
	bh=bL2I5/fLOIRjDiRTHtKr+h7PqSag6Z5pjak0eRP8RqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gy4MLloBFT9bOou8SrrhcnlwGvSvOH2IdQ56CITJsatsibjNunqw7efaBCANH3Xg8
	 0EeWeK/KdKFnjd0w0k6aWBvozL6b/LIo1Lv2p2flZNmLzBBi4pskgo92S0CPX4l2Kz
	 BykrsS6Qw6lbWLvs53VLk6WJO45KsNIFHLtIg6lg=
Date: Mon, 18 May 2026 13:01:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final buil
Message-Id: <20260518130124.1da1d87bed04e422b585447b@linux-foundation.org>
In-Reply-To: <ags6IM0qGAkndEV5@sirena.org.uk>
References: <ags6IM0qGAkndEV5@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 17:11:12 +0100 Mark Brown <broonie@kernel.org> wrote:

> During the final builds today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> /tmp/next/build/mm/hugetlb.c: In function 'hugetlb_unshare_pmds':
> /tmp/next/build/mm/hugetlb.c:7282:17: error: implicit declaration of function '__huge_pmd_unshare'; did you mean 'huge_pmd_unshare'? [-Wimplicit-function-declaration]
>  7282 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
>       |                 ^~~~~~~~~~~~~~~~~~
>       |                 huge_pmd_unshare
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:289
> 
> Caused by commit
> 
>   2bb8fe16f7bf4 (mm/hugetlb: avoid false positive lockdep assertion)
> 
> I have reverted this commit for today.

I removed this from mm.git on May 15, but I cannot find the email which
prompted me to do that :(

Oh well, I assume Lorenzo will send a new version, thanks.
