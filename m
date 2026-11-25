Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633072;
	b=I/w0ay0wNtJsUjQBU1koNQwNdryPLAzLVTrYULDeh14Ut6V03GMjwoAm/+lwDiRMS12W
	 X6uEeI4QmK3IlAULEeSBDsWGpR/QxCGroCn5MTr+11qqFr1JzrVntL6zSgSJj7Y4hNfZT
	 7TIX1KMPbIax5HU3I8vjXOYJrw8dWUqjVN8hgpm8hiwYiQOjtsJZi2ubeonU8GT5eTHwl
	 mSNRDjJdOv72SMlVDyByZ+pt1m70rrIw/ZHpXs4JChPGpIWCd//Ze5aPTyTvMhwkeY0F+
	 p+zwg+ALd2TbRmdAb3MCQYvlAFZQyIfIbUJCidKFojXUEb6jbk4Ta/j0ArYfLXCG2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633072;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ONfenFvlXhBiZ+s/vteFkbxDREPIyztUzFSckrPKJwU=;
	b=Qyc5AofX/1YBEKLAZKvVN/3M0xXyFgZMlJL4ytqpUBrP5HlYlfbdHT3A/EQaq4jUlAiS
	 KrhTsXrcovGiKjTayshReO8mlQpLbH1UUnHLXk5sKCPlS8foVmsJWqSNe9jZ3qE6uk+G2
	 cX/B7FyT9tKVJ6xTH1W7z801wOj8PtiPB/WB0ftZXb+tyXVWuHLcMwEGswPxI9lvpdXW+
	 GzqD45sIytWf57aqew3+rA4uUDiReJm3UwoC+SxCsOzgW1Bfh9IUpSpW5ga4Tv+vYJNel
	 rcEPlgG/CtjpVo4nZfzVexdsueftelABSPpjarxZV1fymUpZGWcSt+uv+9qIMr/iSzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRGWxMTS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8E606A31E;
	Wed, 25 Nov 2026 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRGWxMTS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF4E1F000D1;
	Wed, 25 Nov 2026 18:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795633071;
	bh=ONfenFvlXhBiZ+s/vteFkbxDREPIyztUzFSckrPKJwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JRGWxMTSBL8SpLe6ALjI1nfp3NzIDsGbyLfbaf3exnJjWk5q/vgqGKEdUukytxt+C
	 HyzTl/vm8Xz43Ed6HJ8OuacmwnKrqCks7KUU/IXOZJ1r5HR+AWbeyr1JBYEJb2d2Lp
	 4k4NM+BIgEEEWNjBED8+SDC1YiLXfr2H4HHPpXFq6JcEsyU6LDLU0DxZYPfMGblorc
	 ibL/glaLyzPbpsws3a/fbTfH+x11cWP0G1BuPyHwDza1tU26DXJwqO+vIPUx1qmmdI
	 NoZgoKPwwgoBm8UlX1kE6+nMHbpIHf4K+FTkYF1AavnnO0oYqwp22G1iw7w2x6qohP
	 e5Odox89v9XTw==
Date: Wed, 25 Nov 2026 10:57:49 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Mark Brown <broonie@kernel.org>, TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
Message-ID: <awcvrSCXa-CvH4Ah@google.com>
References: <awbXUvbdJt6FcjKc@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awbXUvbdJt6FcjKc@sirena.org.uk>

Hello,

On Wed, Nov 25, 2026 at 12:40:50PM +0000, Mark Brown wrote:
> Commit
> 
>   0215d3b0181da ("perf stat: Start tool events when enable_on_exec is used")
> 
> is missing a Signed-off-by from its author

Sorry for the trouble, I'll fix and force push soon.

TAKANO, can I get your sign-off?

Thanks,
Namhyung

