Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC283F166A;
	Wed, 27 May 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884515; cv=none; b=d4g0ipLiGQ4XxyXTnCB4gETqvbWHOoT9tDyqeT4vz3QbYZbJKVkl6iAoeP9TyAWzqavwTgqlX5l+yM+FULJY4Fx/066al3pbXQ2Bpx7q6+oLYIWxFEfU3LDTU4QDSVD4Dm8xVALU3ZCXHW350Ev2epJcB59Gl+qVab//5gBVN6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884515; c=relaxed/simple;
	bh=+ock5BjmwIc4mIc7jvSCt0nuLwfaywRtFxLwOz7V/Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLE2GdEJNNtb6Sd8O9vr584sR/CAqvNTH62kiRxhoob8tXyz0y2CsjHlgFC97G+NRLQUDLOlq8wDkoC2THvix/VmXchT+tGwjEGlEt+d9ZO1Vq742IGOQ7DdvHfqMipqCoJxKeg/+NKHqnN833MFTMKAjvw7iAvNh/IlejvMs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4h+W9e9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4h+W9e9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9061F00A3A;
	Wed, 27 May 2026 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884513;
	bh=dh+fq42X8hy2doN6uVl/5NOyT+rMEbtomgNRKD7VrAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W4h+W9e9bsnypnBKYUYut8kGsIYQ38xzHwZyAdCaZ1TOK53QJ+5s+okmdE7HT1Ptx
	 M/rR3qiC0VNQh44kf+LSqD8EraRf4ZKekT+VT/G6AQ4aD3DNFWbStbhsJMSroWpBz+
	 JHd1SbiVK6kA9SxrqmEdvnEJ9tdzWc6pf0FHP3BYFJCwtVpWRyJxRwVFTSEaR+LyR+
	 U29ZmqgKnSb/mU+rK5tqZMcUmE/pOqX7gAgv4sJkeFAymCApwf1R/0B6TsLSGx6yha
	 QbvwHfyqMHGu3/ULGImjHzBRZmCWt8xwyfcX/2KnPG+sLLztUsIoOAgxEOXL7cQBqi
	 xVNVnpar81OSg==
Date: Wed, 27 May 2026 14:21:49 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Mark Brown <broonie@kernel.org>, 
	Dorjoy Chowdhury <dorjoychy111@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Aleksa Sarai <aleksa@amutable.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
 <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>

On Thu, May 21, 2026 at 03:58:05PM +0200, Jori Koolstra wrote:
> 
> > Op 19-05-2026 18:24 CEST schreef Mark Brown <broonie@kernel.org>:
> > 
> >  
> > On Mon, May 18, 2026 at 09:12:44PM +0200, Jori Koolstra wrote:
> > > > Op 18-05-2026 19:13 CEST schreef Mark Brown <broonie@kernel.org>:
> > 
> > > > Figured it'd be an arch specific version of a similar thing - I didn't
> > > > audit them as you can see.
> > 
> > > These confusions with octal numbers in lists that aren't even ordered is
> > > why I would prefer to use shifted values instead. I don't see any reason
> > > actually why we should not just convert them all, apart from churning and
> > > perhaps not doing it correctly (which would be bad). My rationale for mixing
> > > was to use 1 << n at least for the remaining bits. If I remember correctly,
> > > this is also what Aleksa preferred.
> > 
> > Yeah, shifted values do make sense to me as well - other than the
> > inconsistent style the only issue I saw was that it's a bit less obvious
> > that the values collide.
> 
> Yeah, that's unfortunate.
> 
> @Christian, can we get rid of these octal values? Or is that too much churn?

Do it.
