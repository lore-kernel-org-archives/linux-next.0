Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0D7355F31;
	Mon,  9 Mar 2026 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086526; cv=none; b=B0DaFp8zOH6/LE8Rrytat/q+R7MQ6j0a6SB2Hymb2Rq2fEk1k5Bk6Iq2oZKHcrwVcjfDGqinp91Y/LBPF7rAINzrfRYW02EwbL/QxjBwGifheDJFXGGUmpaKXdVAiXWI+s1vi+sgcMzZaDXcJbht+1qVFQk4P26X9YJ/HF65CNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086526; c=relaxed/simple;
	bh=pwRaZr17rsPcRVVyjdmu37TB6zAEf7CZfkEoadllZoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJI2JVMw1uaMaos4AbtrXD8MprXXgH6R/XVIY5URQjpiAJONf2nm09a/QoleaGeKlbdv1osha1GeAwMAvW8YF6e4ESkNJ4yqmxLhZ0t7ySrLVE95OfQCDgRQ3/Oz2hpJn7sQgtYLPh5WL+U1NVda/E/5Y9L1bKf2dfulhVEWqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEcyggSV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEcyggSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1A2C4CEF7;
	Mon,  9 Mar 2026 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773086526;
	bh=pwRaZr17rsPcRVVyjdmu37TB6zAEf7CZfkEoadllZoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEcyggSVqwoD+aM0aIzFTefzXFO//+sbJwUwJBqcjkjcmeVhEF+sbQyoJ5R0sDkgp
	 /hqa0Z0olxRPptnuCl2rIj00mnxutd7tYWdaDVWYlyXQFDGyTEIw33T7oGMbHIbGcE
	 IWjHhCrhvqZtpX7hKzGWcY7NyzqQUmyjhwCKu+kVv0fBwYJecc9MqvPquH+FonqLAV
	 k6H20URl6rgtjpOWRnHodFqUjGnn0e36CfUndD/x07i4m8IhdB4DtM5CA6Bqk02pdY
	 M1RRXyGV65cd1EHU7SIb7g25VprY7uqqKpAUmtCEI5qr/760Bp2J3hCDqQjWHNRVL6
	 ky7uSAp8X/G/g==
Date: Mon, 9 Mar 2026 10:02:04 -1000
From: Tejun Heo <tj@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <aa8nPDUD8bqIyfx0@slm.duckdns.org>
References: <aa8WSH-ILSebstIB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8WSH-ILSebstIB@sirena.org.uk>

On Mon, Mar 09, 2026 at 06:49:44PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the sched-ext tree got a conflict in:
> 
>   kernel/sched/ext.c
> 
> between commits:
> 
>   c2a57380df9dd ("sched: Replace use of system_unbound_wq with system_dfl_wq")
> 
> from the tip tree and commit:
> 
>   cde94c032b32b ("sched_ext: Make watchdog sub-sched aware")
> 
> from the sched-ext tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I pulled in sched/core into sched_ext/for-7.1 and resolved the conflict.

> I do note there's another system_unbound_wq usage there which for some
> reason wasn't updated...

Yeah, I'll queue a patch to convert that one too.

Thanks.

-- 
tejun
