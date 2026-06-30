Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FD3769FF;
	Tue, 30 Jun 2026 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819785; cv=none; b=KxCwe897S1oWD4WdApH6P9ktCImqJgLieoGNz6thq0opok9zj+iOv7E998ULGT2JTI209DJcB/d87HtQ4yccK8KynLRHkbG9U5oMET58/5v5uZkt9O2VWpU+MmPLmZV4qRScyB6NHCfez8rf0qrRnqwvb63OE+VaH+UYPo3ssIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819785; c=relaxed/simple;
	bh=mb+mc9MOd1nTUX5JQ1j3ioHgDOlLRbkxiUL9UWGi7gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMi2IabzWSobT554n33YTkrIaO0g32zmtDjhTCG/Nm5bLFbtTrXZN7qjRXxWjOtpgQ1Dx+qWAiav5L+HX7Dwtw9LPk7F81fmJMt+kOS4uCuc8yNaAeCogsJtJm/A66TRFKCV+4CTawXpXRmpi79RVPnY395pfEulnWKgy2opMhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLcWcGVz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLcWcGVz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0DA1F000E9;
	Tue, 30 Jun 2026 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819783;
	bh=kZoiS76EIv/fu4A2fVRwWbnnWTJuoHoRGGIHNem8/Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oLcWcGVzxC1Fx/P89wig6iZykieFM2uew09XWgzZvDCXmJzLWS5zIHZ+0ktZJN/KI
	 LbTG0QB1HCvtCUJ3c9mBti1v/EGwVVSxXjxYMAx2T3SuUyIhdbacsD1W5flmSFq2iB
	 BFmMXiyu7Pk3ocKmz2jWQy38trhmPn2J4Cpo9QIukllZMrOXO7XGWOYMOh/Mi2rIP/
	 RdA37Im5n60Jsx8adZdhLc+QAq3VIQNbVr5h0d1xn4aO+ZtMBWvo6BgTpW5AHjjBnv
	 lj1DJv7WWUYXP0BX3NPoD5zZvHxxjUZIW+RAC5l/bqHV+im15jvQpHTPFuLKq2KpMT
	 VfBbFZraWNGvQ==
Date: Tue, 30 Jun 2026 08:43:00 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
Message-ID: <akOrxCUym-LYr-5n@x1>
References: <akOX2cfUOK1rRbu0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akOX2cfUOK1rRbu0@sirena.org.uk>

On Tue, Jun 30, 2026 at 11:18:01AM +0100, Mark Brown wrote:
> Commits
> 
>   535c327f22a28 ("perf python: Add LiveSession helper")
>   4f093d248b148 ("perf python: Add perf.pyi stubs file")
>   145f6bea48134 ("perf python: Add type checking for parse_events/parse_metrics")
>   1bb0a1721f3f1 ("perf python: Handle Py_None for thread and cpu maps")
>   226e60c35ac93 ("perf python: Add config file access")
>   2b8aad745c248 ("perf python: Add syscall name/id to convert syscall number and name")
>   6efb7ef71b226 ("perf python: Expose brstack in sample event")
>   1b3460930fcda ("perf python: Extend API for stat events in python.c")
>   4d97f00572c6f ("perf python: Add callchain support")
>   0dd3f949cfb58 ("perf python: Add mmap2 event")
>   b81c05a559ee7 ("perf python: Refactor and add accessors to sample event")
>   beed2f88c2d7b ("perf python: Add python session abstraction wrapping perf's session")
>   f46938e02fa6c ("perf python: Add wrapper for perf_data file abstraction")
>   d8da1ea834a88 ("perf python: Use evsel in sample in pyrf_event")
>   3e153b92b6e88 ("perf evlist: Add reference count checking")
>   4d7018b55734f ("perf evsel: Add reference count")
>   7e7110bdf0e37 ("perf evlist: Add reference count")
>   ca42447bde058 ("perf data: Add open flag")
>   3d295e4e6974a ("perf evsel/evlist: Avoid unnecessary #includes")
>   6a7ac633a3e8c ("perf python: Add missed explicit dependencies")
>   bdd53407c817d ("perf util: Sort includes and add missed explicit dependencies")
> 
> are missing a Signed-off-by from their committers

I see it:

acme@number:~/git/perf-tools-next$ git show --format=fuller 535c327f22a28
commit 535c327f22a28fcbbdfc9189cbeef8d54f187364 (perf-tools-next.korg/perf-tools-next)
Author:     Ian Rogers <irogers@google.com>
AuthorDate: Mon Jun 15 18:15:43 2026 -0700
Commit:     Namhyung Kim <namhyung@kernel.org>
CommitDate: Mon Jun 29 10:47:59 2026 -0700

    perf python: Add LiveSession helper

    Add LiveSession class in tools/perf/python/perf_live.py to support
    live event collection using perf.evlist and perf.parse_events,
    avoiding the need to fork a separate perf record process.

    Signed-off-by: Ian Rogers <irogers@google.com>
    Assisted-by: Gemini:gemini-3.1-pro-preview
    Cc: Adrian Hunter <adrian.hunter@intel.com>
    Cc: Alice Rogers <alice.mei.rogers@gmail.com>
    Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: James Clark <james.clark@linaro.org>
    Cc: Leo Yan <leo.yan@linux.dev>
    Cc: Namhyung Kim <namhyung@kernel.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Richter <tmricht@linux.ibm.com>
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>


That was the last series I committed and then removed from the 7.2
submission as per a discussion with Mark, i.e. even being tested a lot
it missed the window, not being strict fixes.

Namhyung, take a look, I think you did something that made you become
the committer but then you didn't S-o-B it, please fix and force push.

Thanks,

- Arnaldo
