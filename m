Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4F476689;
	Wed, 12 Aug 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550378; cv=none; b=dutTXkM8I3UnSB0ilHmx0kB+1U0VVPvvpwtsDY8uzUoc0imBHW4HRcRtNTtOj2hbT5empR9lxUCZMkl0F8aM+xbAYV0+6qrUNzOH/UkpR6GvfSnH24oCPm94STyrbR/rtyeXb66GT07vebB792bCl8+sO6xHRcNFoJxggV5EzAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550378; c=relaxed/simple;
	bh=4UtsdmhHOz4+CfNG1LFd/YTv8e1FCYmWcxWqVHJJNro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tm6Fo4E8AgEZ3FcwsVSOLLbiuQz+RLRRjOXuUpmxPh9SIoH1bPijT8oxyDlogOfXhaPBi2DftSHSl/zwGMfWAvc1ybqO5/mamIjpg5Qp1r2bpul5tHdhje/du182y4UkTXV/ewvFPaqTOFlJdBLacd4nVAOsLW3/OKuaxNutYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLkjl6uE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLkjl6uE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEED91F000E9;
	Wed, 12 Aug 2026 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550377;
	bh=dVrURgH2KpXxgvHO/qTtIsF9Joxm5i6JVe3Cni4GjYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FLkjl6uE/ogjuVHjuZ3SY1v0h2W23kN0jLq3gbpveOmPmwIwTQBlNvG4q7Ej+fQlN
	 zcx8ZnE4931h25Lao78faAojuZ7wSXgJ4oTl0VNsDkhU0DtsUVopSxu/nMMCZhKXqE
	 b5o6pSjw25JGtoI3oRcP90kGPRxoS/PxxEkpJ4794HtQHwXeEqGW/knbJkWJR7/KbZ
	 7Ix50IxqTETcadVYv3mvZrUFxo8v01GyN/EP4JLgDEBeiBvgrrP6L6t5gRCCm4piYS
	 1hhD7AGyPZbdDBPoAahyDOily+X6eC9gEz+FrwF/DSqnOyZxjA91FgSohIxw+ZSsLR
	 2BPla1KNOPXjg==
Date: Wed, 12 Aug 2026 16:59:32 +0100
From: Lee Jones <lee@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Breno Leitao <leitao@debian.org>, Mark Brown <broonie@kernel.org>,
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <20260812155932.GV1072730@google.com>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com>
 <20260812112723.643f9502@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812112723.643f9502@gandalf.local.home>

On Wed, 12 Aug 2026, Steven Rostedt wrote:

> On Wed, 12 Aug 2026 04:42:21 -0700
> Breno Leitao <leitao@debian.org> wrote:
> 
> > On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > > Any other ideas?  
> > 
> > I'm new to this area, so please forgive what might be a silly
> > question: would it make sense for maintainers' -next trees to keep
> > a stable git history?
> > 
> > Some maintainer trees are already stable and append-only, which
> > gives linux-next users/testers stable commits to point to, instead
> > of ephemeral commits that can disappear later due to history
> > rewrites.
> > 
> > Would getting rid of these ephemeral commits make linux-next easier
> > to work with?
> 
> This has come up at the Maintainers Summit in the past. I believe it is
> even in the article I posted earlier in another thread.
> 
>    https://lwn.net/Articles/1050027/
> 
> We are even discussing issues about this in that other thread as well:
> 
>   https://lore.kernel.org/all/0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk/
> 
> I try to keep my linux-next branch clean, but I do rebase to add tags. I do
> on occasion remove commits if they prove to be totally broken. That's rare
> but I rather have that then having to push something to Linus where a bunch
> of commits are simply reverted.

+1

FWIW, I have always reserved the right to rebase in order to remove,
move around, reword and otherwise fix-up commits and do so often.  To
that end my 'next' branches are not, have ever been, nor do I intend
them to ever be, stable.

-- 
Lee Jones
