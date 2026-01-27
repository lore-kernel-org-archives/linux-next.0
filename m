Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1D348862;
	Tue, 27 Jan 2026 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516078; cv=none; b=re1WM4CFtJ3UzO92Z7E4MvGPKNKgSty8sffFGhaO2sPRUBNIZYY+hsI8muVqgZmgLFXuoGlnC5y1EA766lu8VBLjLbWkz9daXTc/2syYuAUPNSah9/YbZ0FOOc7Tf8MKLWC1qngBK3g7eRYJqp4jTdWS7l34lUpkSIq9t+Hd0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516078; c=relaxed/simple;
	bh=7+NiV6krw9PBJy582jeJ90cR/9TV/glT+2EroGMzoXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuAG2nnLFiKjEVzIF24jych3f3KI6zAEp3RE4P3ND9yk+f/YZvNiPOCVHHaJkrGXoRMvab7qjDpbc/9XChByTDIhajzkQvbPbyo3ceuxfO4aHt7Ilg1Ozu8pYgl+yb2LEYRtkSVRQvt4IbNlc8ccgyW2EsP3e7XLmhw3TMDSDPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpbE69Wg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpbE69Wg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FC5C116C6;
	Tue, 27 Jan 2026 12:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769516078;
	bh=7+NiV6krw9PBJy582jeJ90cR/9TV/glT+2EroGMzoXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TpbE69WgUJ364gM1c/4jnunCbf0cCsKwkj+8hYMGEIxUQwBCt9DEjF3dj7krjEMzb
	 SLLkiWLi+MQ9s3GPna80MYq4K9ElAtRd4l+AnU0YB/6teqxFeU1gQH0O7svOixj15J
	 SawFFodbs9iE9OTZTx3T8IGafHUpczqCn+e/ENgdC/d1Y9cNhB0dUh7S32s0bpGkzD
	 J2Fz2ZdT0ryjvLemx3IFCS6aGO+uOCehOhvQn30gJ670aSSsjMz+mQ4Gaw+nsBRafR
	 48SM/6f29BzkvKZXMTewGEVO0qhOQcEWyJ3Gix6QTbqGxG2K7RXKm00iOOh/uzoW6a
	 MH6ybD4haPl2w==
Date: Tue, 27 Jan 2026 21:14:36 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tag could use some work in the pci tree
Message-ID: <20260127121436.GA2024337@rocinante>
References: <f09eaf3c-3df0-4cd3-9feb-b8ce9408f462@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f09eaf3c-3df0-4cd3-9feb-b8ce9408f462@sirena.org.uk>

Hello,

> In commit
> 
>   a21a27a0e8933 ("PCI: Rewrite bridge window head alignment function")
> 
> Fixes tag
> 
>   Fixes: 5d0a8965aea9 ("[PATCH] 2.5.14: New PCI allocation code (alpha, arm, parisc) [2/2]")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist

This very, very old commit, as such, one has to check the following:

  - https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git

For this specific commit:

  - https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=5d0a8965aea93bd799ebcd671e562d90f3ec2711

Hope this helps.

	Krzysztof
