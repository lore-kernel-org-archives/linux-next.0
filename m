Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FFD39CCE0;
	Tue, 14 Jul 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049225; cv=none; b=ed0HfvLz0/v68UOUPEGFCKxJAnTdaL7moTmWeTmkLGEahqIYrKwhjeO2DaK2ZOAPBNpypUZHQXsucx5VLElaQnmpySm7+3SEhNQy4BTgSqbdDEz2tZwF04wDOXzXcK43WMt7W2pxBehL9YKyLXODRIB00bnEv1gU6Qu3/2js35c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049225; c=relaxed/simple;
	bh=2c9+42mHqvk88utB0fer0pSO12Tfi3iD4TZNi9J7MdM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XIN1jTCjK7Znkey2woMT9KNz5WiVm64rbE4DcG0Tm2Cslmk/hXG8h81DVw4VXnk3bDWETzv148+3kAM8VFhldHnJj2lht9Ylq+y5zMVgzkwlc26hUkytLe4smxGlTkvAxF0lMf0mXbDYc13m2y3gffnODj5qJe9jDBTpuv+gv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SsyA1JEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SsyA1JEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A561F000E9;
	Tue, 14 Jul 2026 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784049223;
	bh=q3g4xQqIQfolmHDtnqCkqUgaRczYHaYtQsfopJ9L4cU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SsyA1JEQAg76RA9UEfIt89OWlpyUYQzs94gK1UDKOesGPuv0cBcP/l1F5MtuX9Zfd
	 yfHFK5eiii3TnUeo0XjVb788xWCmPOjmCwrZRudSR7GEWFACJjOjIWhiEdwKSZIcai
	 QLyng1DQRJ2v6K89Q2ZbA6c7zRNx5uj011Jr7kfs=
Date: Tue, 14 Jul 2026 10:13:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 risc-v-fixes tree
Message-Id: <20260714101343.5319eda0435560ad84828a7a@linux-foundation.org>
In-Reply-To: <alYh7S9n9qE8-Hc_@sirena.org.uk>
References: <alYh7S9n9qE8-Hc_@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 12:47:57 +0100 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:
> 
>   mm/sparse-vmemmap.c
> 
> between commit:
> 
>   4edd70ee6a7d0 ("mm/sparse-vmemmap: flush_cache_vmap() after hotplugging vmemmap")
> 
> from the risc-v-fixes tree and commit:
> 
>   7605044cea4d2 ("riscv: mm: avoid spurious fault after hotplugging vmemmap")
> 
> from the mm-nonmm-unstable tree.  These appear to be two versions of the
> same fix, it looks like one needs to be chosen - I did the conflict
> resolution picking based on taste but left the non-conflicting bits of
> both changes.

OK, thanks.  I'll remove "riscv: mm: avoid spurious fault after
hotplugging vmemmap" from mm.git.
