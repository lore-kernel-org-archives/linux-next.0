Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F62D46A1;
	Wed,  4 Feb 2026 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196872; cv=none; b=hmDux4ArXvZa6WunowTMl6MDArfPshd4nx9hk66WmzUNOzuqGxoBGIEhaEpiXmSuGvBAk7UI2zNAo9h5rB90ogYLLt/Av9rUW4yHUzCk6KpU02mZhxyHErNNGzGiVnI31qPCpkh8LDK5gD7i8SXV1aLQlJpVFwo7gQSZoY5Y2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196872; c=relaxed/simple;
	bh=FP3EkZzfamyZegcWbl20bwYCDaJYw8r8PcswvzCc+o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8o0wXch3PQs9uonY3+xfOkYDLXjGdoWQc8S2648oy2prL3taBU1VnV8C7C2Q56LIYqLs9s2MWqw6yKE3q7bOG+IuAyEfeLfdqBlGuvsGJwRMPRkJXEtqtwRlbjeufMlf31Wuv5Pea5zcwpYw8vfbGYa2q5V82bxFRwFrzW/XQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2K8oY6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2K8oY6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3162C4CEF7;
	Wed,  4 Feb 2026 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770196872;
	bh=FP3EkZzfamyZegcWbl20bwYCDaJYw8r8PcswvzCc+o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2K8oY6SArOEtxSMlxfEZPV7LJKLSjXx4GFWTug8XZ5Dk4a4nfyLV1lttDDWsJbKI
	 KCQiOQ2kvw2+c2xpHRWpjNPEajUw+uThCf7VLozl8SEAvMi3Nj+hihzXn4iiZLm9db
	 N8zhnoKZcDdaeQ0cuvqdl9uZdre7skB4gzUdGzCiJrNkvMXhJ1CwxGWvnc7Dm2xKUj
	 ELWYP1kfRxTJaffOw+RocKn95WYAvLaZn+TO5bpsfAoQjB6oWUkqB5diNqyjRTPaYa
	 xpprm5tkMKaWRBBfRZABoNXQzKrLJw+N80WTXyZ7bn8LeciothQimLnL0KA0Mwds/O
	 EEJ0IIa95QZ9Q==
Date: Wed, 4 Feb 2026 09:21:07 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20260204092107.GA911837@google.com>
References: <20260109124558.25b0eebc@canb.auug.org.au>
 <aca32e97-9fc5-4cb7-908c-a4410ff98055@sirena.org.uk>
 <3cd56914-a83d-468f-9a1c-76c24cfd2c5e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cd56914-a83d-468f-9a1c-76c24cfd2c5e@sirena.org.uk>

On Tue, 03 Feb 2026, Mark Brown wrote:

> On Mon, Feb 02, 2026 at 02:56:27PM +0000, Mark Brown wrote:
> > On Fri, Jan 09, 2026 at 12:45:58PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the leds-lj tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > 
> > This issue is still present in today's -next, the leds-lj tree is still
> > using the version from 8th January.
> 
> This means that these commits have never been in -next and we're at -rc8
> now:
> 
> Daniel Mack (3):
>       dt-bindings: leds: Add issi,is31fl3293 to leds-is31fl32xx
>       leds: is31f132xx: Re-order code to remove forward declarations
>       leds: is31f132xx: Add support for is31fl3293
> 
> Nam Tran (3):
>       dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
>       leds: Add basic support for TI/National Semiconductor LP5812 LED Driver
>       docs: leds: Document TI LP5812 LED driver
> 
> Steffen Trumtrar (3):
>       dt-bindings: leds: Add LP5860 LED controller
>       leds: Add support for TI LP5860 LED driver chip
>       leds: lp5860: Fix unused-but-set-variable warning
> 
> Jishnu Prakash (2):
>       dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible
> 
> Lukas Timmermann (2):
>       dt-bindings: leds: Add new as3668 support
>       leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
> 
> Duje Mihanović (1):
>       leds: expresswire: Fix chip state breakage
> 
> Haotian Zhang (1):
>       leds: qcom-lpg: Check the return value of regmap_bulk_write()
> 
> J. Neuschäfer (1):
>       dt-bindings: leds: Allow differently named multicolor LEDs
> 
> Krzysztof Kozlowski (1):
>       leds: lp55xx: Simplify with scoped for each OF child loop
> 
> Vivek BalachandharTN (1):
>       leds: lm3692x: Fix kernel-doc for struct lm3692x_led
> 
> The leds-lj tree in -next currently contains only:
> 
> Lukas Timmermann (2):
>       dt-bindings: leds: Add new as3668 support
>       leds: as3668: Driver for the ams Osram 4-channel i2c LED driver

Apologies, I was on vacation all last week.

I have removed the offending commit.

-- 
Lee Jones [李琼斯]
