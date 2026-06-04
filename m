Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD673A5E92;
	Thu,  4 Jun 2026 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576418; cv=none; b=qDX8+X8I5yHnAdlUxNdk5CqocUD7z69mmN1LSXpPZqNcrDaQn4u/8yGCQHYV0MfKfvH6ke0lT42kSU/1m//0sbNyE93hpBkjQoKaffhDayA0h6mue91vT/H4YIgV/rxKrBb77c0UGtOih5BwRzgLt5Z+aW7jYVCs6OJ6wx0bz/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576418; c=relaxed/simple;
	bh=jfL0UYG3s5PPzUTaFTlTlw/hK4ZewyK6LbQJVFikzho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilax4Fe0PDV0GUjnT6sIzXpuMSuju1/+wmDDK4P2KrOmMjFaGlaf1UfyTvQ0yhphWQmIj34z3kxzpdcso67drsgyaK6fbmcEuVkNfGIMOzpEpoZ4xtWmk2oLq8BlIM1g6Yp9nnRnaipa2Zb6ZKTwwTNBf5mNSeojjmQoi8baN8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUYi5oUa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUYi5oUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A9D1F00898;
	Thu,  4 Jun 2026 12:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780576417;
	bh=Xh3g+ozG6pYEGingdPNF/UYPFgXPKWg44xPsiIc+V4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NUYi5oUanei5JkX8XHAJkDHWRaotqGVKJa0AeYdzVEUnscOwq4QYzgbFgw0f9tkPH
	 cMUNXRv4q06nGgG6JnBqj4pRnmenNLtwLwcGau3E6UH2OjHNbSoUP2kifD3C/RdsBo
	 hynoL8AomJIk8G7lmDRmC5sdFEBvQFs7sG6+2T+Kc3ANKr8NEsxoWLNmJVquVaZDVD
	 oSMXhKVrij5BskFBeqnNeH/0kVv3TaRioCKZ0xyHJpxXKJwo8F/QbM9RwjnhniRoGr
	 ObgLixuPPTl5cExC4iRazQqA0llSi1BzIMhg56lr/dVInDGEv+h16kDeCas0iibVu4
	 h8cwK4XE26RPA==
Date: Thu, 4 Jun 2026 14:33:34 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aiFwnoyhrJZyllAv@localhost.localdomain>
References: <aiAs8hIzpPzvCjw5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiAs8hIzpPzvCjw5@sirena.org.uk>

Le Wed, Jun 03, 2026 at 02:32:34PM +0100, Mark Brown a écrit :
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/cpufreq/cpufreq_governor.c
> 
> between commit:
> 
>   24fc5870808de ("cpufreq: governor: Fix stale prev_cpu_nice spike when enabling ignore_nice_load")
> 
> from the pm tree and commit:
> 
>   080b5c6d95034 ("sched/cputime: Remove superfluous and error prone kcpustat_field() parameter")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks good, thanks!

-- 
Frederic Weisbecker
SUSE Labs
