Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903720;
	b=EHOdp405C6sCxiItdRgLp+cNG9h7Ga6Vys/doR1eiIHDWS2Na7x+vaSsSgnPWlMh4sdz
	 ELoXbsgfVTMT0QbjQY/0PYHk3nH0vnjdrPKwSgRp1yBn5Q2sH22YxFixS4LKHjIaBLXxC
	 TgEi5UqP291XPFn/d6ncwvUdGlHc8b/3uhKhK1QCeGv3TfNh3q/keTYnVmw3C/63yiBu/
	 B/UvUT89ReeUg9lVeVK8SzzoTYcDk8eMz8T2+Ig8PjB1F/gz+9/2gNS/UYBhKvGRdjq1Q
	 FioReKE6FDy3+qk2me2s6tNfW/H5nCSmpTAIMbUKUc/NGvJ77+qNR8cOWZ6nZYDspiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903720;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=+BDO8KC/36yguVhZ+bm4h7l/RhlVIXGN8LhhHu9L720=;
	b=16vVUw2qDZu7aC6VOhF1wbUMVPg/AMSuderkx15Ct8XQXi3FRiwyhVPBhihqPC9QLHyQ
	 wYC93aF7GSUHY18E8REeakdvAEXmUCUimm83+KO3enDRx9UCixCANaXbLjkXc8fAFK65O
	 VZnuHipiDCUjdkKdFfIqU2oDCh8cOzxcOwW5T/MS+yJSoF/VgFW50gqaFKv1Ze7tbqQOZ
	 CAY8Z/EdTtzcAwXMQ0rohGS/1M2yD+vH970Lz62uvUFHK2nXOvdkPTxA0r9U2dNhDR6Co
	 rYyqFYv0Tdn+oOxp5nOD0+NUqZubvzZQWUu0oLiGVWoYM+GityK4UY78yRsp9JCViZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775B7606A32A
	for <linux-next@vger.kernel.org>; Tue, 17 Nov 2026 08:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200FA1F000CA;
	Tue, 17 Nov 2026 08:21:58 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: p.zabel@pengutronix.de
Cc: broonie@kernel.org,
	kernel@pengutronix.de,
	linux-next@vger.kernel.org
Subject: Re: Moving reset branches to git.kernel.org
Date: Tue, 17 Nov 2026 09:21:57 +0100
Message-ID: <20261117082157.494071-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de>
References: <dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Philipp,

On Wed, 01 Jul 2026 at 17:42:07 +0200, Philipp Zabel wrote:
> Could you please update the linux-next repo urls to pull the reset/next
> and reset/fixes branches from
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git
> 
> instead of git.pengutronix.de? I'll send pull requests from the
> kernel.org repo from now on.

Oh, so that's why my copy of reset/next is still at v7.0-rc1...
Any plans for an update to MAINTAINERS?

Thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
