Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241A03D6CDE;
	Thu,  6 Aug 2026 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997235; cv=none; b=HOGcBSkQ1HpVnSvbwRjZ/Ar71t6OpEFwr+Z1zdZy8tsxZUb+Tr5FNf27lYJhM2EW6QqCgGF9bYmelj/hosBL50gFAGuKpa6C4XRsX6VSjv9ZUq42XbsyjeXOB1tsGLwRk5Ur3+6zsph2ClCk/xpAJuh+K+2uqNq0LEAiQkKt+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997235; c=relaxed/simple;
	bh=FbWlS0CaaAsenFyagahyTOjUzwnV/o2ipRUKSS7x+Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQWXBeJYOVE9Whu3Wz7/pS5lEA0Aw4kY8TALsOu/BBKWobqnyxRJ9owIMhmDg1p9IaTr4l8v+HkE1oO6myMYb8zYSaXF68vnUCsy0ItEp8d6G9UK8jG3Y+B4eQGD227jmBh3OzdtPp5fF0M2L1t9EAZaQZ6CjWw5gVy14IwUePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kCwbK9ry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kCwbK9ry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C1B1F000E9;
	Thu,  6 Aug 2026 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785997233;
	bh=YsQ/4i7KcQrxLjiPoRr9nv+NI+n8BHSXAVZJDLKPn6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kCwbK9ry2SJG0/wJDLuXf7uvFZLZ3pcE0xMuHWKjCPBR0AdCcYpaRvWoh95evTqxi
	 c7ZJmSmQlvbvZD3suuUZAXi/9BoFk17K811t5SsawZjI1ijF9+XckXapeBBLPlDqEn
	 aNjA6KAW7CFfy9BSmW15SB2fg6usdZBs8cQvMOI8=
Date: Thu, 6 Aug 2026 08:19:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Willy Tarreau <w@1wt.eu>
Subject: Re: linux-next: manual merge of the jc_docs tree with the
 char-misc.current tree
Message-ID: <2026080653-tamale-unsworn-43fe@gregkh>
References: <anMt5iPbjY3hxA6Q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anMt5iPbjY3hxA6Q@sirena.org.uk>

On Wed, Aug 05, 2026 at 01:34:46PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/process/coding-assistants.rst
> 
> between commit:
> 
>   3d7c44f73765d ("docs: coding-assistant: explain important steps when looking for bugs")
> 
> from the char-misc.current tree and commits:
> 
>   d699a5da10394 ("docs: link AI coding assistants and tool-generated content pages")
>   816d9992d9ed4 ("coding-assistants: simplify attribution")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Documentation/process/coding-assistants.rst
> index e71df7d28467e,e62c9577d91a2..0000000000000
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@@ -56,41 -56,4 +56,41 @@@ Basic development tools (git, gcc, make
>   
>   Example::
>   
> -   Assisted-by: Claude:claude-3-opus coccinelle sparse
> +   Assisted-by: LLM coccinelle sparse

Looks good to me, thanks!

greg k-h
