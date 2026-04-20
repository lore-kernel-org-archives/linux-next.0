Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CA32B9B6;
	Mon, 20 Apr 2026 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776704257; cv=none; b=XxrqKwwkeB8zLvyRtpS9QVkVl5F0+wupXm7xUKsoFde/N/9gM1g7F71dOl7wPreQDb+62lNnJCXjBe4rQMIqVfpS8IDWK0HPeZd5Q4qgpHBMpurz02ehpS3TIOuGrO2H1z66N/94UgTua0Wdp8k8pVYf93auEaxY0Nybr+Y+Cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776704257; c=relaxed/simple;
	bh=7nGsLVplWwuIKlrooDB4k/VIQxf1T5xOu/3a1Ys/yv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0vSotmNdh6AxUZsNmfow/0vV6jB0CnE7dtMTPqrYIuKThzZXIQ3UZc/IGygofcdCqBGAUV2MTU7PnPPlfhmOKV75ZjOalhiv9/jdv/YL3ghJNMbFMGOcuGGRG6r750hRCLF5gfUIYGzKFDeXMGxjsMY5G/QyYtJsXCWAisXjJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jE2+x6MM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jE2+x6MM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038D2C2BCB3;
	Mon, 20 Apr 2026 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776704257;
	bh=7nGsLVplWwuIKlrooDB4k/VIQxf1T5xOu/3a1Ys/yv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jE2+x6MM8E7pRx11kXfnqHoyHePsL59LOOnWYlyre3J2y+HN8Ezi6esmG3sZDg4q/
	 hilsjcKnkV1WMgZuIlSvIHPzvRKyvp9nnwAPtPnfIl3uEKjhg+qG4PfKRU2R4RzwoH
	 EJvg2itOFhZPTtlptO4yhqdMW4noauHlhjdfNg8NryoUOzcPPc9Y00sjj3IA2ouaEx
	 lX6rPA/UUSdD5ORwGpJrn3RPdZmq0Vjm9v9axZ2p390IpLDn1Cuzc6yKZde0rlHqSD
	 W4haTpdJ8wC+qzNYgByr4pKR/F6BgcDlSGwpr5ZFeiy7CVkDBN+nf3NdxGCsnpu7sV
	 99vreyLZGS0NQ==
Date: Mon, 20 Apr 2026 06:57:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the sched-ext tree
Message-ID: <aeZbADZKyvvh213S@slm.duckdns.org>
References: <aeYlUCi1oEeBOKr-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeYlUCi1oEeBOKr-@sirena.org.uk>

On Mon, Apr 20, 2026 at 02:08:32PM +0100, Mark Brown wrote:
> Commit
> 
>   bc4cefd40b33e ("tools/sched_ext: Remove dead -d option in scx_flatcg")
> 
> is missing a Signed-off-by from its committer

Fixed it up. Sorry about that.

Thanks.

-- 
tejun
