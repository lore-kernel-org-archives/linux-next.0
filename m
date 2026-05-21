Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE807383993;
	Thu, 21 May 2026 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382791; cv=none; b=ehl3tz+yMTojUxNWXK4bRb81bloA33AU+FAZVpEu41BShQn3Ufm7UnThtz+qax03DTdRJmW0+ivz/OMLoVlNT8inn9sbEE9j5Atxdm+uWaJtNmHBES3wkd8HVFv9kKxkSLL23JfBDwNDxqw+z27OhHYB7B4FOaMPEtkILita1N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382791; c=relaxed/simple;
	bh=IiLsRPph/r/3nV4JI2yheH6wWoPhckbCKnK4e88b5A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARP1I+BY72ZK40XaxDmve65tYYGEpzE/Cl3ZsfMZNSrtNR/PIYx0IaKUxG7SoZ7N8gzZWxMk2OcOQJoK/pSov3XzbhZSEcArRLyG5FSyBFg4i53mpQe3n8Hm7ptEKCm5UYMXjqOkVZwlcVXP2jHMK9K++HblmjkVQ3qEMu+8ZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEa1eE8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEa1eE8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D471F000E9;
	Thu, 21 May 2026 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382790;
	bh=Wq81pz1xhMGw4Rx1Fc5E7boraUQBf1vUis9EX929Gyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BEa1eE8HZrSWcn4SSS163U59eHZlBe54IgTle6Fs8uVBJlHTwMcO0bdPITrOxgbcS
	 dqp8YuKRwQd2wVlfQdnJ3onkcn7/reutxT+2rEYBC2cK1Ib7pB4aR5jyVs+Kb64nvQ
	 ZW6+XwU/g7T74zsAF7TLa74+WHBOuwfMvAOeGZ+A+X3bcAvmxyYO5qz/URMd4/67LS
	 dehmnaIHoXhRR6wv6Z/zXWhnGkD9DJ5wUZLMSzYfIDJS3pEqLp6MwY65Nk206fL4v7
	 4M+tKl2uckis33cEmu/yT8llGsKDobbzCE9hTSaewdOdlYPPvAdgWRkePwTwPmhhoU
	 pY8s3Lcv5YEYQ==
Date: Thu, 21 May 2026 09:59:47 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Mark Brown <broonie@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <ag86A2_LJNm2knOJ@google.com>
References: <ag7cF9XqINQyrq6f@sirena.org.uk>
 <31bfcd67-40b7-4dc2-aa88-a4839347f005@leemhuis.info>
 <CAP-5=fVH=fETWYO=VKuA+aC6=qjyqEmku6JeJhB=q=Nns+rMEQ@mail.gmail.com>
 <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
 <CAP-5=fWrX932GpmHTrZBDrOUJsP7CwPzbKGhGx0PO9_awTASxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWrX932GpmHTrZBDrOUJsP7CwPzbKGhGx0PO9_awTASxA@mail.gmail.com>

On Thu, May 21, 2026 at 08:44:00AM -0700, Ian Rogers wrote:
> On Thu, May 21, 2026 at 8:31 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, May 21, 2026 at 08:04:11AM -0700, Ian Rogers wrote:
> > > On Thu, May 21, 2026 at 7:55 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> > > > On 5/21/26 12:19, Mark Brown wrote:
> >
> > > > > between commit:
> >
> > > > >   552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> >
> > > > > from the origin tree and commits:
> >
> > > > >   32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during umbrella prepare phase")
> >
> > > I believe this commit has issues with "perf trace: Add beautifier
> > > script for fsmount flags":
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git/commit/?h=perf-tools&id=552636b9317c8a843dd4496d77e56976ab48c76b
> > > This change went to the perf-tools tree and then to linux/master,
> > > while "perf build: Pre-generate BPF skeleton tooling during umbrella
> > > prepare phase" has gone to perf-tools-next and then to linux-next.
> > > I'll look into a fix.
> >
> > Yes, that's exactly the conflict I identified above - the lack of
> > coordination there was pretty surprising TBH, and also the fact that
> > 552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> > went in after -rc1.
> 
> So I sent the fix:
> https://lore.kernel.org/lkml/20260521153558.1421014-1-irogers@google.com/
> I'm pretty oblivious to the ins and outs of merging, but hopefully,
> you can work with the fix and the commit message.
> 
> How this happened: after the initial perf-tools PR for v7.1 Arnaldo
> and Namhyung prepared a fixes PR, a large part of which involved
> syncing kernel headers between the regular kernel include and
> tools/include. That sync exposed a bug in the "beautifier" scripts
> (caught by Sashiko) that scrape data from header files for "perf
> trace" an strace like command that displays values for syscall
> parameters, not just numbers. Namhyung wrote a fix along with the
> header file merge and put it into the perf-tools branch for the PR.

Right, thanks for the explanation.

> 
> Anyway, I think the issue was that perf-tools-next wasn't up-to-date
> with linux/master and therefore didn't include Namhyung's change. I
> think we can do better in the future but there were good intentions
> all around. Sorry for the breakage.

Normally we merge perf-tools fixes after it's applied to Linus' tree and
it used to have no problems.  This time we have conflicting changes and
it's found thanks to linux-next continuous integration.

And sorry for unsmooth handling of the conflict.  I should've noticed
you as I see there would be some conflicts.

Thanks,
Namhyung

