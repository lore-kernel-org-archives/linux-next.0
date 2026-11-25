Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633596;
	b=rNtxvxeTZ+PID/MoKcAaqUrP3qlqikkAncLtAc345sYkUrhGJrJ46EjaBuTu5Yxi/fKL
	 76AAmK43Ktf7Y0Bcwv5gSpyYGXCrBy/v1MMHLid7frQYtXURlCSXOZ+W3G7aapINmwG5O
	 F+HHLcSaCPiAvVgwC4hrXBMWdLXJwhSRj7moqQaY08MLM6HJA9zmW+TDBaqIVCVNGavbp
	 a6yKuAfqoldAy40UcjmyKAutk2YTl2GIZ+Gw2anPsiB9ZfeswwoP0M/dw13qvu6wKWzmu
	 R8WT5NhfECXV/MiNLA5sd0mQN0xLumd8LYEF47MjZTLAT6YsiPWAo5sNa5cB/xgPmKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633596;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YktEvBCKUohHH8t3nDGO/E2Q+nGZUBNsqERxBjijWUg=;
	b=MbqiPHCR7di4OpeqsEBVnGO52yXiFc1/37LYE/XVm9ZDMH6qjDTe4IyvPnzJTdegkc5f
	 uMtDx0UIIm7pD7HaF67qV+u0Vd7NsacnWXq/pDYMujVH5HQvu9jTL9Hy+XaIxrby0su6Q
	 aiENd9E9ArLiIFH3+X8OlSxbiJSGF6TU1nMKOqgrFZBi7JRe6+cTJOJfUKV6n2NlpdTIk
	 xIIyFaBwcAMkHk3asK9u05T/+H8HGhcYRvnHOv/Pq7olZ6CibmMD3MCvqwTTgYo+m76e5
	 9LAGHVjjrXw2s55xAWGb/A4AmQvsvKuyNvgG4MsKPF9DjlMXB2/ZstiO1c8NiOeih+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wu8M+IMd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28F606A335;
	Wed, 25 Nov 2026 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wu8M+IMd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEFA1F000C6;
	Wed, 25 Nov 2026 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795633596;
	bh=YktEvBCKUohHH8t3nDGO/E2Q+nGZUBNsqERxBjijWUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wu8M+IMdeSe4BKNrlsWx5J4KdsHuw0n5u+R0yPrXbNv797dKxoGVBODmC9xfvGQWN
	 MhQZ+7gWCHZOCXHbmlsg/oUYhlzRJUoQ+MPQgKSGphWQTu6CWqCMayRNnmdvGRTDVR
	 1D7IuJKwuvxRyhVPxmCyJT04zi+MzPMIk6J/lNmg0oIlDs27u6zXRSvHctYRIX9MYB
	 GiP+dJupt+PK3CzphzUw7NmzOM/+TPvK4BroBH/GZg5/4y7qlrHZ657wpKsOxjtzaS
	 nhTXqlFNXVZrckbk2igcHYMrNpNE0jRergAcJqvvD9tjbHVnCEGIStiq9kOIbrGP05
	 cHJI+r0h2dBgw==
Date: Wed, 25 Nov 2026 11:06:33 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Mark Brown <broonie@kernel.org>, TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
Message-ID: <awcxubLIOQ2CNzi2@google.com>
References: <awbXUvbdJt6FcjKc@sirena.org.uk>
 <awcvrSCXa-CvH4Ah@google.com>
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
In-Reply-To: <awcvrSCXa-CvH4Ah@google.com>

On Wed, Nov 25, 2026 at 10:57:49AM -0800, Namhyung Kim wrote:
> Hello,
> 
> On Wed, Nov 25, 2026 at 12:40:50PM +0000, Mark Brown wrote:
> > Commit
> > 
> >   0215d3b0181da ("perf stat: Start tool events when enable_on_exec is used")
> > 
> > is missing a Signed-off-by from its author
> 
> Sorry for the trouble, I'll fix and force push soon.
> 
> TAKANO, can I get your sign-off?

Oh, I found it's in the original patch.  Will update.

Thanks,
Namhyung

