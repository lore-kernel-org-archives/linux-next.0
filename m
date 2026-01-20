Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5E42EECF;
	Tue, 20 Jan 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917632; cv=none; b=eOcWuI7zqlxkTnfkrqFna7Wi5rBgXXXYf75WfD/fvQUoi+OaG0dQOM3r9Kwkm9deO3p6mgcjkGyZSnSQKJ5XDDfCS8XyMR4Ucc4ryC/48WmqfPsWCB/hHUF59YSb+q/hoG0tzrBOMVGo6gSurfPSWpea+1b6w7vA243ikIIwRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917632; c=relaxed/simple;
	bh=KXMV8LO1mLrvWkyK5tkUa4P3StCreFZRbOizv/7pJpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgEZvD6Kr6jBIlKpr8fSfcJBj154C7JSBYczs94QzgiTtMo6tMCuHs9ilntlnTabUQGklSTctGKvsqHx6Blce8+HwPr+NCDZVBJklQTuqBkliYvkUEHjkWxnSCQAH7OHRoa34m/UkOuRDb1KN14wzxuhY8otQp2SRfsNDhGU+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2sRGWol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2sRGWol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923A7C16AAE;
	Tue, 20 Jan 2026 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917631;
	bh=KXMV8LO1mLrvWkyK5tkUa4P3StCreFZRbOizv/7pJpo=;
	h=Date:From:To:Cc:Subject:From;
	b=g2sRGWolZYUPJmgrRhvI3cmUYuzOwJN5SZHua4zyxPNpPSKrKhYnRCkmRQKLd7pnn
	 VlWgtAt8AS42vEq6wS64CpW3Z+kNhl4w1xm+M6wE0pHnz4USQUJVqOms7zgf6m3+l5
	 7F+lfbrFcRE3cMkDXmTIog1a/RJ5CqBS+pPrDzcaw+xYEvjWg12Uh/0G7jUm2wEbUV
	 Uzonnibc30FkMn467IPAcsyNyrWEl+xw1pVYR9uMPgIPFWhsXFKhr1spq3FeX9rfwX
	 1hz5lEKO/wF5EeiBlGR/LMFIg97rcJrWy0c9LKof706JcykzO1i929qovsDTHLKDqG
	 EOpJ2P/JPDS7w==
Date: Tue, 20 Jan 2026 14:00:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@gentoo.org>, Encrow Thorne <jyc0019@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the spacemit tree
Message-ID: <aW-Ke8K6pKGrIp-N@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  91c444d4285c0 ("riscv: dts: spacemit: add reset property")

is missing a Signed-off-by from its author
