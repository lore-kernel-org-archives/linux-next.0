Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24F37F747;
	Wed,  8 Apr 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660078; cv=none; b=WMRCqA97ajp79M2vrZj2K0LxxQfO7RZMqRSqdbxDaBi+GjXe1sJbfnKcgkhPRbh5qL9V5t1gafLRgIyGWAn93pREiKZpKZfVKy/D3+gTp82dlAsTdEZcPR8jh8zaRH6yT1LeWWwGNiWNj10WdC6WWbTVrsSFK+7vKX+SF/QmgIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660078; c=relaxed/simple;
	bh=s99VHO5SegIFo9A/i7KnU7hLM32kppwBEiCUks/7ndQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sL9UYr5E92xTcT/P2vl+0u0Yo2OhP+H+SThM7ffZL1boeD7se2vio26vaOAlVGL6n8f5TXuuTSn+iuFZp0/WVcyj82S2qrHzuVpUy4SyMzZW6NSyQGeo+Qce3z1AQeMLoQgfrthb8MuXAGWpp1wgnl73KW2rsjWH0lc41ZZSMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v8uxEN/c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pkIEYvPg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v8uxEN/c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pkIEYvPg"
Date: Wed, 8 Apr 2026 16:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775660075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pHuXDtDNpr2Fhg6aa+qt+HMiaeqaDxNB4YUNsCH3adY=;
	b=v8uxEN/cGOJx+ALvrW+GE0zFC8FtLo3MyWoBwx1zgmOUGT7U3Rxbm5qcdi6K7LjpQ9JsAl
	do4UOr1oEUAS4ZVfdG4hbgNatmJ8IZBx3qPfuD7m+QPT53b0D3OfoK+xyE+HQFg/RgTRrw
	GlmHwPe+OHNM0fRfpsgikTjM7sTRhys0Ec8HPlHbzzf/OMyDMEFXFrssIp/lDvWeMpxIBr
	Po9VVPkoVQg+EswFMtvUv5nNDUE+FzF4l+PIfh2dMuEFnYw90928kCMsdPlwgmrWRjkw3/
	Y9pHo9nIHFRVAw3ntNcg4zDsE6Yp9MxWtEHWn+Fbf6w8h2qa1EHXya4zC6NXvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775660075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pHuXDtDNpr2Fhg6aa+qt+HMiaeqaDxNB4YUNsCH3adY=;
	b=pkIEYvPgj9ZDyLJRMX0evzpa5mUK8Vw1dvC6jaFxZq6P8eMZsmCFi2kg+Xx8bVc2MpW7Dl
	71oevBYSsrNpcNCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Snyder <josh@code406.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip-fixes tree
Message-ID: <20260408165335-f3dd4d2e-d3fa-4a93-b4a5-4d9b441c1154@linutronix.de>
References: <adZNmIpSOkd6P5c7@sirena.org.uk>
 <d39364de-70ae-4878-bcd6-1b9497bb394d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d39364de-70ae-4878-bcd6-1b9497bb394d@sirena.org.uk>

On Wed, Apr 08, 2026 at 03:50:44PM +0100, Mark Brown wrote:
> On Wed, Apr 08, 2026 at 01:44:08PM +0100, Mark Brown wrote:
> 
> > After merging the tip-fixes tree, today's linux-next build (arm64 kunit)
> > failed like this:
> 
> > [12:39:34] [FAILED] <missing>
> > [12:39:34] Testing complete. Ran 0 tests: errors: 1
> > [12:39:34] Test results stored in /tmp/next/arm64_kunit.json
> > [12:39:34] Elapsed time: 316.083s total, 0.002s configuring, 16.074s building, 300.006s running
> 
> > which isn't super helpful.  I haven't isolated which commit but it'll be
> > one of the three:
> > 
> >   b81207470caf ("clockevents: Prevent timer interrupt starvation")

Should be fixed by:

--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -369,7 +369,7 @@ int clockevents_program_event(struct clock_event_device *dev, ktime_t expires, b
        if (dev->next_event_forced)
                return 0;
 
-       if (dev->set_next_event(dev->min_delta_ticks, dev)) {
+       if (dev->set_next_event(dev->min_delta_ns, dev)) {
                if (!force || clockevents_program_min_delta(dev))
                        return -ETIME;
        }


https://lore.kernel.org/lkml/20260408155353-42aeefa4-db66-48aa-ab07-0538a8cfdbf0@linutronix.de/


Thomas
