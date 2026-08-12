Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB21470EA2;
	Wed, 12 Aug 2026 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553119; cv=none; b=Y2weJtezBciljS8Qolqe3DFQQoyBqxqyNIDjYRPjhTDXhjUFNENnLQQL1a0zjs2+3nu2ncAz0fI9UtErlPHJRPK3r0lbm8jJPy2erd1yMGQ6fnUocfXbiK/bBNISYuPpuDyAbVfB4Aj1Pr+GbhwfKeFiII/J6oO2Evk362piHhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553119; c=relaxed/simple;
	bh=KZ05atHrzp2Z4d3nrNt6dr6skL9g8NiVgqEwqyIKYLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk3rb1JdCXLADjQDxjccuRe1JGKGgC4JSks4A/WR6Pu3HlOM31us9LZgDGFpE+P42eyf8lDX2gjjfr1GUHkLcc8ya+Ks3wP9cWf6bOfV59wKLsBDE5TbdajzH1enG3TXJvueknt8FXd7s4bR01Jkp98oYXhImUvXESO3hjdZIdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRTjdH+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRTjdH+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A461F000E9;
	Wed, 12 Aug 2026 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786553116;
	bh=PyGw4V3TYBaD1KIvKbgCepkk8Gc+npemiH5pmNzZ1t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PRTjdH+Y9dqXfshj3/FbKIbn6D6TvbbbCEY4QdpdNrUWJ8jy2wSEx42CIMc+SPQHV
	 IRW7wzLx1m9vA2yvuOjmwHjyW9SC54LF2GwaSb56gn5JsEI3S8xJV7sdnjGE8tt9Fq
	 ZQ/mJpZeNS64cyd34ZK4Ok4U4C79f8sI8+28qRLdv/lVuyDVA51GXmPU/C22l27HRE
	 CQWlWaWpoOvd/2Dp6I/Asw8PUUfixkqsBpu/fuBdkJ4Eg9FWBFQdhucqFu0EyJtpwH
	 1I8JwE0UcBTTlx//eBH+9USZQm8cYp6syIZOErPeMnNfCFUB5LFp/cTAMALSnJT4Qe
	 yeSFcwGwEVXAA==
Date: Wed, 12 Aug 2026 12:45:15 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@debian.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <anyjG-mMuaDox3eN@laps>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
 <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>

On Wed, Aug 12, 2026 at 05:37:30PM +0100, Mark Brown wrote:
>On Wed, Aug 12, 2026 at 01:19:05PM +0200, Uwe Kleine-König wrote:
>> On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
>
>> > Any other ideas?
>
>> One thing I recently wondered is if it would make sense to not merge one
>> tree after another into the same tree, but first create pairs, then
>> merge two pairs, ...
>
>> The advantage is that if commit B breaks something there are less
>> intermediate trees that don't contain B and you can still test on e.g.
>> D+E.
>
>> I'm not convinced the advantages outweight the additional effort, but
>> IMHO this is a bit similar to the request by the filesystem guys to have
>> a tree with only filesystem changes.
>
>> So this is just an idea that might be worth to be thought about by more
>> than just me.
>
>Yeah, there was also Sasha was talking about something with trying to
>make loosely topic based subtrees.  As you mention there's a scripting
>and comprehensibility cost to doing something like this, both when
>building the tree and when trying to understand the results.  If people

Right. I have an experiment that I ran here:
https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git/ where I
scripted something that generates those *-next branches based on category tags
I've added to the manifest:
https://gist.github.com/sashalevin/15dbe4cfe2e2a3c4706788b07ef48079 .

>actually want the intermediate trees directly like with the filesystems
>stuff then sure, but if there's no demand for the specific combinations
>of trees I'm not sure it's worth it.
>
>There's also the issue of incremental build benefits.

Which is mostly the reason I kept silent on this thread :)

My original goal with that work was to evaluate AI merge conflict resolution
and measure it against the work that both the -next folks do as well as Linus.

I suppose that if folks are interested, this is something I can keep running
consistently, with the caveat that conflict resolutions are purely AI driven,
which could be enough for something we feed to CI and bots.

-- 
Thanks,
Sasha
