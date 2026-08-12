Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF934F247;
	Wed, 12 Aug 2026 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534949; cv=none; b=O+oIDyJZlVvM/vkAmWZqfJ6oSIAXAG7oa3mA6vPNx4itnM3MXLP9pprPMixOzZ5kd83p4NeCk1c0z2MwmXC3CIbh6q7L92ESCkEqbOeRS1NX/4YL0H6DgFf/9HZkt/66XcWF5pakEv12PGnCTRViJtwu8EgIsbF22vEZYSLdwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534949; c=relaxed/simple;
	bh=tfmJki5qxRWimdNixr1xqQQBBeBzj1HBy5//OOOQIlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Id5TT644lJevmrm5DsXfu27Kx/m+lDUIbWvS+TpNhVDeHfWnNue3Ympa0pEAuWJl+yt0FQufmvqgTk2/Q1F4YyOYT+9Uvk539v+IvggkzDzw9V/x/wsOhawXNEwipXn4Lns+RjosJfRXhlIWy6ZyMhJIlcn18gmfgWEjsN3FQ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=AXVdG0sP; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="AXVdG0sP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tfmJki5qxRWimdNixr1xqQQBBeBzj1HBy5//OOOQIlo=; b=AXVdG0sP2YJvAFaWuc/iDvC+9s
	w9tdNJV52pDfLbf4K6j/ml4v35WZ1yjEDzAP7jY59q9sidF556otZe0Kg5+OYu6tXMM6hnYidKY7L
	LK4++qt+Bu4MubVcTCAuONLy0tKNBpjVVxgjBVtZBl7JaYDRrLqnB/vmcCjGkGe6yfdJwC0hnekcZ
	L0eZSUA4TDlqsr6cCOXVtJEtFAXGWeDl1dt9OoEjUFhCYdGzzGm7Ox1VrY1V6lhaI0DN3UanXEjrW
	2nhPwLCdHhxhLfRU9qyIppKRFSzqViGogHkZmF0JqZpyVbuiMLbyJEeo03DNRsg3g2WwGyh3bU/n2
	phBBEWLA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wu7Ll-004Jdg-19;
	Wed, 12 Aug 2026 11:42:25 +0000
Date: Wed, 12 Aug 2026 04:42:21 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>, 
	linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <anxaYg9XL7nD9w40@gmail.com>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
X-Debian-User: leitao

On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> Any other ideas?

I'm new to this area, so please forgive what might be a silly
question: would it make sense for maintainers' -next trees to keep
a stable git history?

Some maintainer trees are already stable and append-only, which
gives linux-next users/testers stable commits to point to, instead
of ephemeral commits that can disappear later due to history
rewrites.

Would getting rid of these ephemeral commits make linux-next easier
to work with?
