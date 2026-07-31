Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ECD45040D;
	Fri, 31 Jul 2026 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524599; cv=none; b=qanxFw2V45dcaBUISghMUSSLo8oh+Zhn86eS8HKCDKPH99GprRNU/okX9JVb44XBIhslZNxQko0yddRYx6aoj4oJJbA8e0zwrhMaBJjuT7GCIy5lFFs5Iu+U3yBlKG1FrU+USNDTfvy7Ifn9C4WEuNGYnJumapyYpp6XeQsFL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524599; c=relaxed/simple;
	bh=RmSDx266ZXd7RGI5NO9jiKvWYylzwBIxUh2aed8kdhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpMpXUBR11wawEpbT8seTNJApb7OijwgSY2Xp60rsqg3LS4xCtLSR5+lo5gHqHwO9GqGSbpLrL3mchaAa2XSfoxTSFcBYa4xETVc647+4a1cJaDiQe02Bv5SHpvpcoN8tJO/meKwUjOEJCUuexJGC2qYyZD/Jr9sV4BJzdiY16w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOBanNey; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOBanNey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679ED1F00AC4;
	Fri, 31 Jul 2026 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785524598;
	bh=sRUasoaETF3WO21Kw7dk8VHlNmKUkE4lxiFMGvCEjZM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=gOBanNeyMjDxip06ACwtS1BcvVkkKafFTq6v79OEL5rrk/8jQxDupWWTUxqXLEgEF
	 avefvHghwKAQCrg/OHuq+bwfGJb2xZx/7A9cEFzEKNpgD99TEU45X/Fg8P1zjzla85
	 iDoffP8xEa/KP9NMQyhXkMa/nCoy2w8Q1W9N7jaEgyJGmKu7Ors/RQ5ICrv6+KAKuN
	 /f4LLJrWiBMFWVOwJRmgF1AUtxYRAfx83TSIsgf8Lw5mgMYXf6w7SXOqyMO4keyv2I
	 uwkSrzzQ7RnOfN2eHaXFOj3UdvReZFiPpxnMc9nME5Hp2DSdq0+Shc1Cvbo7o1ZrsR
	 Yb57+cvGNEgAg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2179ECE11BE; Fri, 31 Jul 2026 12:03:18 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:03:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the paulmck tree with the tip tree
Message-ID: <bc3c02ea-c5bd-4474-9f79-d6079110a7d8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <amyyLKFqzpkn4BQT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amyyLKFqzpkn4BQT@sirena.org.uk>

On Fri, Jul 31, 2026 at 03:33:16PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the paulmck tree got a conflict in:
> 
>   include/linux/hrtimer.h
> 
> between commits:
> 
>   d3dc7fabd4c4a ("hrtimer: Move hrtimer_callback_running() to hrtimer_bases.h")
>   a116c7582d7f7 ("hrtimer: Move hrtimer_update_function() to hrtimer.c")
> 
> from the tip tree and commit:
> 
>   07abbb755f8e3 ("hrtimer: Apply READ_ONCE() to lockless base->running loads")
> 
> from the paulmck tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> This only resolves the conflict, the READ_ONCE() got dropped.
> 
> diff --cc include/linux/hrtimer.h
> index 29072d89e5cb3,b8636e81ca005..0000000000000
> --- a/include/linux/hrtimer.h
> +++ b/include/linux/hrtimer.h

Ouch!  I am pulling this from the pile for the upcoming merge, for the
moment, anyway.

							Thanx, Paul
