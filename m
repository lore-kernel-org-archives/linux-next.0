Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FC1F8755;
	Wed, 22 Apr 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865582; cv=none; b=kkdpHCsNLAzbNKLIoPiVQtcaz6uCYl0JCWH02QmZnTzKN1TjrMtfAMBLUcTr+SCr43hKAgNDOxhn4LZ/JbzwsjcZcV+C6L4ZNC4ceqWGFdubxNaIgUEfbF8WJs7dbXw4DK9RHRhIdUCulKh+eilJnHKU30uYQk3ItYDqUoJVOv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865582; c=relaxed/simple;
	bh=eeF2rX8QsotOo9sHamOkB+bCWPwa1fmLJkj+s+MCQMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT3ZMVA+jOgSlmHfdq9BSv7aMRJfIFl/oylYONgE4h17ffVZ5EXeD2jQisPxdM0vVraKUJM6cAcNUiTVLa84WuCT7CR1alpbPxGmnWgFF2uY5IXJ5bnKJO/w85mc5b17sNcsbly1ssH6nDu1eXe+0sNOzWGUfjwFLK0iDXGCi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWoIJSMh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWoIJSMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8511C19425;
	Wed, 22 Apr 2026 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776865582;
	bh=eeF2rX8QsotOo9sHamOkB+bCWPwa1fmLJkj+s+MCQMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWoIJSMhXqnN8RFJQ2SdS2Zv0VwOjNtgEA+epceCgl20qMy4AC9mgv4w3ECulVhUN
	 106/AmSiY2zK4Zvxp4K9rPOEuqF6B1zPM5BmphAKp5UZqmbh7CBsNhR+7j3JJMsH1t
	 T6nvdcY3Wa5geIcVRpgfG0XAEF4+QVixUY7DhqubADQcczhfKNMdSAKAmNjsGibsfo
	 brd5n3rSJTPBqwstVYKN0v1OCSqlK6Tovpqk7uxIBuPBduWtGPRqx7OZa4JspIGJXG
	 uUwMeCifv8U7PRAyexy+jQQi+OsItKMGFwUGJ98M6cHM3aqJRjC7sZgoMWP0yGUpKm
	 nE4gWC/Lottvg==
Date: Wed, 22 Apr 2026 16:46:17 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: next sync updates
Message-ID: <aejRKWAjCgZAaZMF@kernel.org>
References: <aee_mCW8p2J6IbIO@kernel.org>
 <20260422093528.42562dac@canb.auug.org.au>
 <aeiWDGtG1ItO-SPR@kernel.org>
 <9047f85b-b2f1-497c-933c-c880c5ef56cd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9047f85b-b2f1-497c-933c-c880c5ef56cd@sirena.org.uk>

On Wed, Apr 22, 2026 at 01:10:57PM +0100, Mark Brown wrote:
> On Wed, Apr 22, 2026 at 12:34:04PM +0300, Jarkko Sakkinen wrote:
> 
> > Mark, the goal is to address the main problem Linus was complaining
> > about i.e., late rewrites of Git trees (aside from late cc stable
> > rewrite, which could have been prevented).
> 
> > for-next-tpm and for-next-keys will replace 'next', which I will
> > delete after the change is effective.
> 
> I didn't see this mail until after I'd started things running for today
> but I've now updated the config so the two new trees should appear from
> tomorrow as tpmdd-keys and tpmdd-tpm, and the old tpmdd tree has been
> removed.

AFAIC, this was fast response time :-) (less than 24h)
 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and
>      * destined for the current or next Linux merge window.

Sure.

> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

My old topology caused more noise than necessary, and was getting
difficult to manage, as each pull request required reorg of commits
in my next branch, every time I prepared a PR.

Thanks for your trouble.

BR, Jarkko
