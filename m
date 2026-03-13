Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2D1BC08F;
	Fri, 13 Mar 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415946; cv=none; b=kqrSIPXsDYUIHKYdayrF8rgvu+ct2945RMS2cmonDVSX1/+3vdEHkDOvlN9eV/ciREaFaEf7HIIS2wnCKDBFxGZu+gjt2raFUJgDljpdfujdpeRFE7SYzQUjEqB/T0TXM4IS/PfeewdXFPN8+0i+M2ZL+bhxPan2AtCwUdQI+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415946; c=relaxed/simple;
	bh=YrMLSJ6+n2K6gUebIHUXc2+IaM86eT2W7Sr2VIbVWCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEEzOJ/4UzU4jSju7jYvHH16TMDCqEuCmJGYsbouFxi3Pj7EoLrYv3Ilj1OUYGcVB4P3HAoKWWBCV9HGeFvMmGXB/TcbHiwQ4SPnlqYqgQzNFSFJXfTOyDLGiRjfXBeVP740jvZiTTLATrYcaQKFFUcmiXbqFFGj0lf27gL4hNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGDPKF1J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGDPKF1J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02321C19421;
	Fri, 13 Mar 2026 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415946;
	bh=YrMLSJ6+n2K6gUebIHUXc2+IaM86eT2W7Sr2VIbVWCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGDPKF1Jw6KJKTHLkf5IXdCbJ9GFEmuGNFfEc53tk4vl6sYjzFEi9LZa4Qr+Ih9GF
	 4blfTZcSZYRM2I7bTOXFcJq5eEEEoPEJ8UI4ZTkoxNUVpJ4IVOhruWwnvF1svFtYG+
	 9OvOXmOazfDQB53Effaig6mzZX3XqZOE7nK44iNSCf0zpyyiifKPqtJ4c4smPasZa7
	 LnHmdjBzvJvg9WrJII0Fh1JA/GBDimBTCDIW8mYO6hqlpgj3NvSSiSYcFcWvzz+bbB
	 7DxaK4TwXLbj6B7bak9JfWUUtTG2hw1OPB9QfNCT0Kl7w14TZmX4oND+oAUBT5Goqx
	 RiQPMdnKa6H0A==
Date: Fri, 13 Mar 2026 17:32:20 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ran Xiaokai <ran.xiaokai@zte.com.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tags could use some work in the mm-unstable tree
Message-ID: <abQuBNBoT_AIfUV7@kernel.org>
References: <bd8f5814-c5c3-4090-bbc5-9005e2052d9a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd8f5814-c5c3-4090-bbc5-9005e2052d9a@sirena.org.uk>

Hi Mark,

On Fri, Mar 13, 2026 at 12:11:45PM +0000, Mark Brown wrote:
> In commit
> 
>   5bea10633ca8b ("kho: fix child node parsing for debugfs in/sub_fdts")
> 
> Fixes tag
> 
>   Fixes: "kho: adopt radix tree for preserved memory tracking"
> 
> has these problem(s):
> 
>   - No SHA1 recognised

Right, sha's in mm-unstable are, well, unstable :(

Maybe Andrew's tooling updates those when the patches move to mm-stable...

-- 
Sincerely yours,
Mike.
