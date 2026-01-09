Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B7265CDD;
	Fri,  9 Jan 2026 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767986598; cv=none; b=PlsaaZAbzG+Xvg+29IkOXdP0bj71s55yJsw/s852CxX/w1Ms3bSAXMDDeEuAmjeLrtOTRrxin6sOWYpMQ99J+uSHFp8Pji9mtU9sweTEJAdSgxMort7dp0/snQfUnh3LojeqB8HvkXqSB/YxZfZCGsTxu7+qs44XJvI7kyZIETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767986598; c=relaxed/simple;
	bh=LetmcGc2M/y2eSUPz9ra/B6YelEHuGxAfTAoiEV7V4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1BHsFGyxfz621xPQjQhbzQ+L6CVxDYmTSN7esM4q0aAUy6NcSsBpVBcwO0OLuYZNr0r0O/86V7fF+HGc4h7gn64ikhaX1IOHuymk3Je0nYzkvnE08UbHWUqnHIob3rjbjfRf0tv05jt98FXLnUY70xPnYG1hEs8kbdn13g+OB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJY4RUFu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJY4RUFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D23C4CEF1;
	Fri,  9 Jan 2026 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767986597;
	bh=LetmcGc2M/y2eSUPz9ra/B6YelEHuGxAfTAoiEV7V4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJY4RUFuabbM0tSXgBCjmJwcUY8XaAjsSTaI+knG/6akKivMCtHok/AiXLbRSwRc3
	 A75rPmwcHqR0xwQF7S/3vFE74UVTR4IxFBiO0OpY+boG0qDDdhmI/2m4SDgFLfeYkc
	 zYnq7Cr9PeyoWJ6fU39h8PIYar9VtAJDlJ896q7FXcbyiUWmNiyFk8hozr3VbJ+CqS
	 gnehCEFokHfqkXn81CsUSUx+J75Od+MxHH4fIAHDkv3f18GEESriJ7PUqRy0ommgQj
	 mxbvRSO+Z9DocTo8maot42RAB+RrRUrrRB3ToE3xliKxgBQ5SbA4Q97O9AFH6x9T7J
	 ojPwOt/1GOtPg==
Date: Fri, 9 Jan 2026 11:23:17 -0800
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kspp tree
Message-ID: <202601091123.36925D19@keescook>
References: <20260109135737.4e702041@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109135737.4e702041@canb.auug.org.au>

On Fri, Jan 09, 2026 at 01:57:37PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> WARNING: include/linux/slab.h:1031 function parameter 'GFP' not described in 'kmalloc_objs'
> 
> Introduced by commit
> 
>   275cca4fa7da ("slab: Introduce kmalloc_obj() and family")

Oops, thanks! I've fixed the typo now.

-- 
Kees Cook
