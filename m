Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418103191D0
	for <linux-next@vger.kernel.org>; Wed, 15 Jul 2026 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106214; cv=none; b=pp0GgMtBDSvsc19Eil6527vStmNuFl+UVxd8Cm1G2MHbB/1IVkl09x/Hqjkjr2vj4UNYnEhutA+viNMJi53FMyNiijeGixRNGZyfn78Mhd5i750lSm7YQ5T25YvUoD6VGWTkdwuEGgBVy76JUIZwRit9BBqnioBLg1lvtDbdLDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106214; c=relaxed/simple;
	bh=zyu4X+ZSb20XpydVeQY+2MEoeQTwEL8zMGDk30C55tQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bTHYcehWj0XNQajXNfRp5a9w0mwdz7yyMxaijXoZHG5gnyqNa4aC+CLqktqTAVyCT+xTUz+abb1QMybR4GvtA7XftrhYNQhZEgkZVTks8N+3MSkr9E3U+yosq5hk58Dq5RNRh9zuA9+EZG4maogiNzrtE2hLUvkc3IljY17l7pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kT22nQy5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kT22nQy5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493ce4b7777so38227185e9.3
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2026 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784106211; x=1784711011; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejS3rIcK2thH0Gu4iY01K7ZjGg6/nfVWDg1a3wJWEiM=;
        b=kT22nQy5kSjFT6JwMVXrgl+gBxVZ/cLvggnN5cEv46mKwk1D5yXR8tBjnYXQHiloon
         +czDZu7GqSwo3Bs7YqQjyOaBTzha5+oDAEuCcHDxHKMxOBzDf+1fiBGhg8nrczRabOon
         DSoAs/NEH/RK7guzD6ZguFI/5QohFdc1FQRM4Pmq/Vkxh6dBeVKMWCzCVIwHyZ1n8wxL
         ZEx94DUCdnsUFlUCzt8sD578ognN0j2SQsHw5lYEZ3cG3NMGuhi2B+FAYtKKS4U1g7Mb
         52wh7jmuPvUFt0s2fWwXJ+w/d82dMkpLIjLyYg119xpCPrnjdV5J5rfRft4uAnbohQUb
         3DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106211; x=1784711011;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejS3rIcK2thH0Gu4iY01K7ZjGg6/nfVWDg1a3wJWEiM=;
        b=MNlIdxcPd9XxOizgCYn2YvpueEB2bPyuTP2UhrwdFPm//g6fm74eaTR38uGwzX3zTn
         uoYrxDwAfhVor1FHkRYJI7t7TWvYcXv+Maor8M3brPGCy2kn04V7U5NAcfCsubuBHOR9
         Cdd8R0MZPFvEwu2rmnDph8A+F6p+0n9REpzIlF9Cu0V/Vpl5GaVRRfcvdVWq2ZBxT2K/
         GJ8P7OoIh/DUk3kUBPqzxTFLB0ZoAeKR3bzdDHZ4ZYbRIPBwqchGGZcmpy3bZKgbgGJ9
         hr+qZ6GE7Mo386NiVlrQCSYEFbEpU6+VfbjgZPqQbWvjHrRmnr8dpnmbBo3eo8+Oi73s
         nzqw==
X-Forwarded-Encrypted: i=1; AHgh+Rro0kDylLP/GfTCNJJFG8ZEA0j1ZL5z/JOY9xzpf8ppPGgl/uUpK0liuvYC8JdpbbzE6sRsL9uWl4of@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0HXBijr9gzh24xKAnr4vUIWwDXx1WudXe0bvCtw4SWMYS9ag
	OmjhWq5HToQoTn5Wrq6DyTtVdIboy5IADk9eqRIsp/sklhj9nSTrvYDisYH5EslM6sflncQhtKM
	dGOEqmyDDp0A6xeebWg==
X-Received: from wmbg24.prod.google.com ([2002:a05:600c:a418:b0:494:491:fb92])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:32a9:b0:493:bcef:5646 with SMTP id 5b1f17b1804b1-4953c15615dmr14772195e9.12.1784106211029;
 Wed, 15 Jul 2026 02:03:31 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:03:30 +0000
In-Reply-To: <2026071408-colt-vaseline-3250@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <alTxRkflyqvAaGc-@sirena.org.uk> <alYvsW4eRWsA46YU@google.com>
 <2026071439-magnify-submersed-b5c0@gregkh> <cc5e4243-d179-4224-a196-7337d1ac51f8@sirena.org.uk>
 <2026071423-joyride-gainfully-f851@gregkh> <b8939935-19dd-425f-aae0-8879fe3fa68b@sirena.org.uk>
 <2026071408-colt-vaseline-3250@gregkh>
Message-ID: <aldMwQAUndxKqWEB@google.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin tree
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <greg@kroah.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Keshav Verma <iganschel@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 14, 2026 at 05:14:25PM +0200, Greg KH wrote:
> On Tue, Jul 14, 2026 at 04:06:00PM +0100, Mark Brown wrote:
> > On Tue, Jul 14, 2026 at 04:22:30PM +0200, Greg KH wrote:
> > > On Tue, Jul 14, 2026 at 03:19:41PM +0100, Mark Brown wrote:
> > 
> > > > The resolution in -next today (when it's published, hopefully not too
> > > > long) should have integrated Alice's patch.
> > 
> > > Cool, I'll copy that, thanks!
> > 
> > Just pushed it out.
> 
> Great, I've taken your resolution.  Alice, if I messed anything up,
> please let me know.

The resolution looks good, thanks.

Alice
