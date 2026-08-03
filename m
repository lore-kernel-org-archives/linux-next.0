Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB187412C0F;
	Mon,  3 Aug 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765847; cv=none; b=bALYvAzEQtEagEf/tck/6NnvEVcrj1q+WYoCBcSV6lfls0i89u7iImcJloLDXunjrJtQdmC6apW6N86aUwgqnXpxuwr3gIXv8BTI3pdfMQ+a53YdMz04hzxwMIqTGG0S6iiAXPx5+mv2LMu0FoxSYA5bVbNeZ5FsH+umzY2Ah7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765847; c=relaxed/simple;
	bh=QI8sJYqAD6uPEjC5qpAR0nfUaegDkIbaLc6bwlDEon8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Urbfx/ZA3rqebjDdmsn3FS9XZWIR5WsOlOJOuVcg3ysqbE9imU3EToC3Y5u5u3mo2jWqgUHeXNr6Ky2kYMCpyzzQ2fgIyV77Gy7G45HWFaNhA+cZy/HeuiDH8W2UkYofO1xsGNktif6L6Rrp3gaXtKbaWQRoOlgkaGSaX3dupgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCoalp8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCoalp8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686171F000E9;
	Mon,  3 Aug 2026 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765846;
	bh=VumeiCR7qDDH+m/q6L9R/aCMDRnwb7mxejxA0Hyjch4=;
	h=Date:From:To:Cc:Subject;
	b=BCoalp8gjgnKktrJ6Kx6lxpYaPOy6K39EcBiuxiu2CECGeCtYb1D1IqzuzVyIP6z0
	 Wi+Ddvfc5NtjtTTPjQusp1hl1CG9+ZfWRMCU4PauuCEqU0+wWZlm/zlXzY2Wvexpzs
	 +oPXntwLWrEfF+mb8yf41HDNdm8UHkryBmQBLwq2JuDUUEUn0I7dm7OIB0JH+Z0iqK
	 Nz8/vnlBNFvRtHsgWyazcJhYo56DlIVfXWcS9s8sLnQ+ejWfijAIO+RXM3LXwDNmHn
	 zjxsXtbo3+QZ+v3+s4PeqaPGhr39U0fZhTxXGyEBrWWu/GKAm6MxXSrZCW8mqO0dqP
	 djVQcno5/8CPQ==
Date: Mon, 3 Aug 2026 15:04:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm-lumag tree
Message-ID: <anCf0hggpNnegtEU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'
