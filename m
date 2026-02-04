Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB6280CD2;
	Wed,  4 Feb 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770216977; cv=none; b=BlcPMTUeziDdgbz/68ndXJLMqEsZpZRE5SAk4eIz5DqfUF+4TcowENETfjGzml+6d07DOffHvWygbXTK2wz/66JHr9crXP1UEW42s8cPT6M8Uts1I2J978vrbyGwHv9SdnFjJ5vBToPh3iXtFUP4YsqwLZ3aKnXrbj1BkaurZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770216977; c=relaxed/simple;
	bh=onCDEBzeb3EDS2ExfR6dIkEK0hVm71Fe4xKUsqXjaQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIDKNEQSj1+8dIvYerAMq/6ALAQF1xkMk1CS0aqKVxexFWsgEA0aCfbkzm7DfBP0j24EP+iC91+ep624CM8SFHN4EJDYIIUeDjyPbGec+ZDDfj5ZP9DyUU3c5wrbafpWtz/G9iZBKnK1z97yC7ExgCyvQ5aueJKfmwwlpoEgkAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZDffdkIf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ujxYFcuE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZDffdkIf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ujxYFcuE"
Date: Wed, 4 Feb 2026 15:56:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770216975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc9FTJPTt88zJ6Ys+z9tCzTZ/0Oi2WzPyQsrnsZQ/vM=;
	b=ZDffdkIfvhSLxd41yS1rcQz4mqft/vhmxzpXDAeiY9gWmuTaLl8evscms+Z0tV6n3/VmTs
	Lrc8uw96tpi454rqJB2oZ2Y1PEfkU0ImqHOI4gMoPsOPa1l7LnhR79HlrF2aesICeVuD+P
	dnBf2FRbETpHWq/H0hUt7NsO8z5hHbHm7dQYka6n8UPZ6ezloqsDdFc1Zrd23LFOUeZGcm
	EVTjuxhKThKDYn6gQr1mf4BVD+YS8hbQ+DIJAw5dZqx+0tBIFV3/VJm0LP7414lxaXRcYs
	b4P2T2uDO1w9yKkadaSpH9IQjBya0+a9OGh+teLssg1CRAi7a/2bG2lfci1lrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770216975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc9FTJPTt88zJ6Ys+z9tCzTZ/0Oi2WzPyQsrnsZQ/vM=;
	b=ujxYFcuElA2qR5srhHkimLw3ZsshcpjGh9Ev/O6PNkfAM6BKfP6RN8lfcSSnHTAsrFsbhG
	Avo6JVZRJRO3E0DA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20260204145614.UgtBZzv9@linutronix.de>
References: <aYNPFdTRx4WDKlTV@sirena.org.uk>
 <e4acdf40-7d6d-48ee-9880-17bacc033961@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4acdf40-7d6d-48ee-9880-17bacc033961@intel.com>

On 2026-02-04 15:48:33 [+0100], Wysocki, Rafael J wrote:
> On 2/4/2026 2:52 PM, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >    drivers/thermal/qcom/lmh.c
> > 
> > between commit:
> > 
> >    80883ce8b1fd2 ("thermal/drivers/qcom/lmh: Remove spurious IRQF_ONESHOT")
> 
> I'll drop this one because I think that it's better to use IRQF_NO_THREAD in
> that driver.

I second this. IRQF_NO_THREAD should be used.

> Thanks!

Sebastian
