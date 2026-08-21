Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FB399011;
	Fri, 21 Aug 2026 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326141; cv=none; b=PT9LYpMGuCJ/LAw7QQUQMZDQYoSaj3F81dYL0xJenOlmddxUumZDVNlIMUnhXaM8VHojm9IHXjrXGkTbK6jDpmCyEM72IZuIyMpzVrDcMujfStpAQyRC1XHHhpDkig1tOQLOtRFavJzRNMB9CnD0fIOCjXux/hWgsGtkcq7iokM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326141; c=relaxed/simple;
	bh=K2ShBU/Faa9RFT6pniqS2SVInwBWsCchA6LyQRGu9xE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Konz1fs1z8lwnTGnA0H6fxRpYrCCxX8AHlyIs2QwXHL/2MmbSvTOhiWYfDnKVTYvwSyh4s6zBJT6aam+wkVhm1DbV6AMn0RW241/ZLNmh9MKyfASISbOv9ZT3gBhtEjj3zDXMYn0NXTVzqfdj/KjKVMyrwbLPw1fpEs5lYz/BoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=i/zZJMQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="i/zZJMQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014731F000E9;
	Fri, 21 Aug 2026 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787326137;
	bh=Wz8vf0GfOCiv7rCV0QPh3KZ57rSw3W8NLse4/K3zrsw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i/zZJMQqcveOqEeuo64+NJFU04Lbq+ZbH6KqrTAK2Exjm+xvTdQ/WSSvy15B8kIA/
	 MPkTGGx6m11nefl15VuPgHEBYGoM/hOWVwtnAMZnEtr9wDxOAKR92EC56iE+CE6xXD
	 7uW5ZNoKjocKI0W4UnBcakf/k0uYqSSuEEVNSTwY=
Date: Fri, 21 Aug 2026 08:28:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the mm-nonmm-unstable tree
Message-Id: <20260821082856.2bea96b054ed39586590fcec@linux-foundation.org>
In-Reply-To: <aog8_8UJwW2xSpQT@sirena.org.uk>
References: <aog8_8UJwW2xSpQT@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 12:56:47 +0100 Mark Brown <broonie@kernel.org> wrote:

> In commit
> 
>   aa060b1946136 ("USB: gadgetfs: do not WARN about excessively large memory allocations")
> 
> Fixes tag
> 
>   Fixes: b3c466ce5129 ("page allocator: do not sanity check order in the fast=
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>   - Subject does not match target commit subject

Stupid MIME.  Thanks, fixed.

