Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C338229A;
	Wed, 12 Aug 2026 17:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554871; cv=none; b=qHxNG2D/il/a++bouak9ifBReCmSrk3xLbkFcKsK+GUNYYV85awSwqgbzdip8IGh+Q6qI0jMjFXbopGrxxsM6z8iy16rge2BMvV/ev0+iONjP8ccMM/H2nBP4f3EJcitKzx0cWcsztiOgb/A/NeOVHq5rEvZ189mthKp+yI2goA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554871; c=relaxed/simple;
	bh=3HhxNPoI+zgcpyBXJ22I307Yi21WkNZvkAm0CzB+lE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t10adt37DVZ2m4aocijfoCQyPOy1j1rCncpIdrb/5au0d+uV/Cb94PsMS80ry6NpgW3uvX3bhLrBiIw3No94hRa/oRvO2m3cQ4PaK95PjnQJTFyFqJQDQYjMiNg+HMU8d46Abm4gFknOhHeTluwFQNwM8fFi+jFMjFVSlC68IJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2ygkRPK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2ygkRPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CABD1F000E9;
	Wed, 12 Aug 2026 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786554869;
	bh=jRWeZo+DZaKSYFACngwhmjB9BJ/cy+4BTkxKWtpVr3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U2ygkRPKhkUgp+XDQSlywS2EK8ohkPvQ7a1Ex8XeAf9RdblLl6O7tCght2HdZLnp9
	 PsnZ6xzeguXjdSbDKa8XuUHUmkubCCpFXTxh5EvB5AmiER5cUFRGCSta4EW5CHpj6A
	 fQRIah1/+ghgUpmXsjmEL/uSapPwGqE7VirIeZR5w3I7e9zmbfuXwWVoaDCK1qDslg
	 RAHO5HrZeqCiHp4Bz7A+3wKBRZZV9QY1/LMILI/T8eDXZAY7gP1yqhOQTv9DMf7+pb
	 3WtF0+5hTEv1OKUCmPJPc+triZiG53aY/lefWeTlriPS6RQybO/E40Z6XsvZeV9zKC
	 5Ww7KRhqEWQgQ==
Date: Wed, 12 Aug 2026 14:14:25 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lee Jones <lee@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Breno Leitao <leitao@debian.org>, Mark Brown <broonie@kernel.org>,
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <anyp8V0kRWdrG57N@x1>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com>
 <20260812112723.643f9502@gandalf.local.home>
 <20260812155932.GV1072730@google.com>
 <5f25ba58-f62b-4cf0-bd82-682cc39c7b96@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f25ba58-f62b-4cf0-bd82-682cc39c7b96@roeck-us.net>

On Wed, Aug 12, 2026 at 10:10:17AM -0700, Guenter Roeck wrote:
> On 8/12/26 08:59, Lee Jones wrote:
> > On Wed, 12 Aug 2026, Steven Rostedt wrote:
> > > On Wed, 12 Aug 2026 04:42:21 -0700
> > > Breno Leitao <leitao@debian.org> wrote:
> > > > On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > > > Would getting rid of these ephemeral commits make linux-next easier
> > > > to work with?

> > > This has come up at the Maintainers Summit in the past. I believe it is
> > > even in the article I posted earlier in another thread.

> > >     https://lwn.net/Articles/1050027/

> > > We are even discussing issues about this in that other thread as well:

> > >    https://lore.kernel.org/all/0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk/

> > > I try to keep my linux-next branch clean, but I do rebase to add tags. I do
> > > on occasion remove commits if they prove to be totally broken. That's rare
> > > but I rather have that then having to push something to Linus where a bunch
> > > of commits are simply reverted.

> > +1

> > FWIW, I have always reserved the right to rebase in order to remove,
> > move around, reword and otherwise fix-up commits and do so often.  To
> > that end my 'next' branches are not, have ever been, nor do I intend
> > them to ever be, stable.

> Same here.

I do it as a last resort, but its better to avoid having bug+fix things
hitting upstream, i.e. trying to help with upstream bisectability.

- Arnaldo
