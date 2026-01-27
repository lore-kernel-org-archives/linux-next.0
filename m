Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5C283FF5;
	Tue, 27 Jan 2026 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516283; cv=none; b=Oj2Dzs17nha0g1hqYN9bdnzsOMAHzCuWQy5Xn5WNR4Cb+GGpYMblj/NJ03v5YfeHWB6otorE7x04cAWiweZca7MoJxyWjYObkcpKBqlbsSEPZxFHcWKD9Sty+lRu6+bVi8VL8se0qrqgGimP2cshoxocJ56k2CwXGWov4v26NOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516283; c=relaxed/simple;
	bh=/fTITwRUjnD5wbXvuuxwG1fsK8nM4Kgaj4djltE6KCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2BSWTDw6R2RBrg7s7/4evptiapyH4YxCkQrsg0R6Nqk/jVfqxT/d8m9fVbxq2AQBpbA0gnqS4QkRnsT3W0ipHIiNIoEYydaV8FD4sxQKLXxdHJrBfZoeQAM/pl2invo7sfSaYdsJH5Wop/GBuF6nPBKQ+Pn6+OEvYGr15uWGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBBNXw0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBBNXw0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95B5C116C6;
	Tue, 27 Jan 2026 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769516283;
	bh=/fTITwRUjnD5wbXvuuxwG1fsK8nM4Kgaj4djltE6KCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBBNXw0QCVNEazokZ3IX3ycyhEXaWHxIP/4PjGMsYvx//2m13w4Id3BOfS/PSGjML
	 NK+luOkB/H2NNh0+r+ItevVTQrL47QMFjyo4VDPWszBhHFBmnZIh5CFBHjgtxMZVye
	 nNa7qt2p2OEf7Bc/cuKy/ynmdyKpO5WKLre56bqzGYu5GGk+xs0HhvinNRVJHBCb7l
	 xixIdLZaT1O0zU5taYqdivhCnWtAdM2KCiMFrPWLPaW0zK7gulo197SSeSTLGXM0g+
	 XqtWsnTBsSZFJ62ybwCkwKx5v+bc2+ycSxm8btI1MnipQlJ9AsSiCkecZz05Fjc1uR
	 jcqWew1e8H6KA==
Date: Tue, 27 Jan 2026 21:18:01 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tag could use some work in the pci tree
Message-ID: <20260127121801.GB2024337@rocinante>
References: <f09eaf3c-3df0-4cd3-9feb-b8ce9408f462@sirena.org.uk>
 <20260127121436.GA2024337@rocinante>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127121436.GA2024337@rocinante>

Hello,

> For this specific commit:
> 
>   - https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=5d0a8965aea93bd799ebcd671e562d90f3ec2711

Update:

The patch author, Ilpo, added some comments about this old commit:

    - https://lore.kernel.org/linux-pci/6405c825-6d8e-043c-38f1-e7e1a4ebf44a@linux.intel.com/

I didn't notice this at the time of writing the previous message.

	Krzysztof
