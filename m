Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567E399031
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548447; cv=none; b=XEFgXrtblIiYnaYHU1V91b48JmYzj1F5Dbr5v3Pt+AaF2C1AEaJTKA/yS7CYadOonz22GkXodwSaEFq3t3Ff3VVzl47V9NinSYIE8tiFaxZVqJKT4ZEOxQWTf7vkA3Ebt008RhQmhiKHM4+tBdLODSka8vS5NwKCdsQxrhvBwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548447; c=relaxed/simple;
	bh=W8BDtGafd67deGkn0gqvwQt5IcNOmrrSope5Te+4Orw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMX7W9Xc7NgPt4L488W8fcsWcZ+o23/ZR6Ik8CjYsL7CMLZDHBvaUzAkwzdXyRYvI1O1B4MD2Y88le/kTo29QoAVG4Ut+R0EK6lT7JncGie3x6VTiV0bnhBhwcUWEohNTA9tPXG6aEbSKN/xl8N+r7Pu9wSt2NBlFqnJmhAqyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 61582803F0;
	Wed, 12 Aug 2026 15:27:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 8D78A2001E;
	Wed, 12 Aug 2026 15:27:09 +0000 (UTC)
Date: Wed, 12 Aug 2026 11:27:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Brown <broonie@kernel.org>, ksummit@lists.linux.dev, Thierry Reding
 <thierry.reding@kernel.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <20260812112723.643f9502@gandalf.local.home>
In-Reply-To: <anxaYg9XL7nD9w40@gmail.com>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
	<anxaYg9XL7nD9w40@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: uwpqbecrdp1pa795whtr3k4r333cj7cs
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 8D78A2001E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19OkGugwwNhirT7Sg8Y81ynR68O27nAi58=
X-HE-Tag: 1786548429-347555
X-HE-Meta: U2FsdGVkX18NjuaY6rzQws8sXsG2e9AnnwInFA/36tQQQSIhRh1elZN969Xlbxinhb/0E/scDkPvp/NDQ1u4P3IverPQsJd5cUhJOGL0S7N5NFE4ITfbF80wplICSABc20kpnJhWFLz9h2EzbOEDmyPEl2E+xtUERG/vlua4ySZRIt5UmOFm7PH0R+phr+N2Lyeboanm0PalnHC5AbB09SC43eY2vkYQmJMTlXoMT8ruwVIP6bS7xUUuMHMczZ6S45MTb73JVu5fdQk4ExqDcQRkilkC+uuD3Gmq0vuSfZTBCtN8AyU8juJZFTqwWNN4B8mdfaJQfAfmWpDDSX0SNBOmc8NgIESAS6+OB8FJcDSZEgBBn3IOGiWDFkdoeOgwQHCm7arf+MfNhUo/FVoiTrjAcYEyOkaLXukBagsAdb427AEUcc5DePluBU47CdK/XU7TSN4V3Vy1T3o/k8lwJukTMrR+YwBH7ohg5qPzdx4=

On Wed, 12 Aug 2026 04:42:21 -0700
Breno Leitao <leitao@debian.org> wrote:

> On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > Any other ideas?  
> 
> I'm new to this area, so please forgive what might be a silly
> question: would it make sense for maintainers' -next trees to keep
> a stable git history?
> 
> Some maintainer trees are already stable and append-only, which
> gives linux-next users/testers stable commits to point to, instead
> of ephemeral commits that can disappear later due to history
> rewrites.
> 
> Would getting rid of these ephemeral commits make linux-next easier
> to work with?

This has come up at the Maintainers Summit in the past. I believe it is
even in the article I posted earlier in another thread.

   https://lwn.net/Articles/1050027/

We are even discussing issues about this in that other thread as well:

  https://lore.kernel.org/all/0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk/

I try to keep my linux-next branch clean, but I do rebase to add tags. I do
on occasion remove commits if they prove to be totally broken. That's rare
but I rather have that then having to push something to Linus where a bunch
of commits are simply reverted.

-- Steve
