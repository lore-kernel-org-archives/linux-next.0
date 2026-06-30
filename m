Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36C3DB632;
	Tue, 30 Jun 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839686; cv=none; b=rqyGpAkP819rKM4v+3N57X2lCurEgDO1s5BL93cFq86Au96hD91luPXvvVfn5IUKLSfWCMvWuYFXDmLwkBLJKsXVQd3E7tFZhzN/maj2u/nbnTzHAEk6+IYkHW2zolh4kc3tRgtDG5n6ZgcPF/RhVGJQA1G/ZeCAKVLuCIJXEOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839686; c=relaxed/simple;
	bh=DkuLcuSzVqcbwoq5E9lD55g7Z6hHqqkstqP3BEu7ru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5BrQ/4E7YvBbdqNNhg/sbAJzNAlhbMtGCOmIPkW9yVf0VdLjxXY9XA6++L7p9k1m1n2KI+bRKsUMfO4s9kMKLZxAnTFGt5q0pKxB/2p2xzDzdliRC50suptlp8RNoeVa8xN81HG8lmn/Dg5xCFXME9Ob14vCc97LVyAxmkvdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAbhDgDg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAbhDgDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974B71F000E9;
	Tue, 30 Jun 2026 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839684;
	bh=UnBL0uoLbKLZU40JHEgf3OJogNqGFGPUbiJzlrri2rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TAbhDgDgya/OzHUZ9lD7z5vs2mZdisn42ANhXBC9fVUQChCjB4jPU9OlTJgWY8uhw
	 +mccsHKFYy9OeWOD8lhAW5GutKxpnwXl9iW7UI4i9jXvAuATV2iaWQrGR+7vASPcCY
	 Bfb96zyqhq36bssthH9ql4pyC5XQe+0vhqTT+a8+jWIL/NlWWOmfY4Q/+34VA/4DR4
	 bhUeQu/NTiYJ/TJKVm4bt+xxsF4lX4FvVLAuPWVXVPTiU5lUjo14fwh5r2bFcKXJtv
	 y1Ucqb/3jgczW/3kZe2eYoSDrM934xNAg7x1jzxTv6Wdo46ODLTSM2fBU4TtFAw+Ig
	 9JrkkkF1seXGw==
Date: Tue, 30 Jun 2026 10:14:42 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
Message-ID: <akP5gvAVSK-8-lWR@google.com>
References: <akOX2cfUOK1rRbu0@sirena.org.uk>
 <akOrxCUym-LYr-5n@x1>
 <b68f5562-4148-41dc-a169-7d7da3371db6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b68f5562-4148-41dc-a169-7d7da3371db6@sirena.org.uk>

Hello,

On Tue, Jun 30, 2026 at 12:44:10PM +0100, Mark Brown wrote:
> On Tue, Jun 30, 2026 at 08:43:00AM -0300, Arnaldo Carvalho de Melo wrote:
> 
> > Namhyung, take a look, I think you did something that made you become
> > the committer but then you didn't S-o-B it, please fix and force push.
> 
> That's usually a rebase.

Yep, I've rebased the python changes onto v7.2-rc1 but forgot to check
the S-o-b.  Sorry for the trouble, will fix and push soon.

Thanks,
Namhyung

