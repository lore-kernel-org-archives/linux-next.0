Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874E3B0ADE;
	Wed, 29 Jul 2026 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308121; cv=none; b=D3T/xtOwvC18qrnAaMDY9IODo48vCMmaZgmcoX0vGRrzd3KsNLhIhnPmxI8PTOIgVj2FJ7QzWLXLjksZZDzG6aGD4jYdJp1I0voYExVPR/7Jvisff54a34Ani4RIQxtz+jpyjCWIQgBSMnByeEKRWEceMv3Bx//08XDPp1jqHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308121; c=relaxed/simple;
	bh=YcSyS5QQRFt3NS9f56u4roOufQMe6RPUIqMxk2ecL5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqTTWDEazZ6y+5+8zqk5LhDeNcQzp776DzZorxdM6dI+oQEQV0tBD2ZHVK4YYyaGwRC/Ddsv+fwvWOCRgbGyACOCjec1ZxnnOGHud4zzLg4+LnSBivRIyMLXnfYwWlAGVOG0vHoYMP36oLg4XQfJ9kzTKN6VZST61e61H6wZKjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV05luN+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV05luN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33671F00A3A;
	Wed, 29 Jul 2026 06:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785308119;
	bh=wl3whG/7bKwmaoueojp8aj/NMQ6I4fZije6SzWxgaaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aV05luN+9OhEw1VE2lcTPZUrpF+fAS1zRT9DEPqOAKT6sUhqesVdWir9hZh0f+lyA
	 pmV77s6tqEUBuTWTtrrMzQa0GBI5Y3Nf2NNJqPsKOKW6WpxmPn16ckr6cI5iLcIEBv
	 /jejkbnFvcPB1U8CReLjpYLAoH9yovdFZwXlXHaXGeUjg/89Y65Ow5wttSuJ2CHSI6
	 SqWxCrqm8VoMoacmyc3qOs8WFvKUaL6bT+jhBlEJAmgmWKmutSNGLrEOXCiXVs41xA
	 j4WEyTXbgcwa+Kb6pGRMyncdZmA7TjH1lKIyPpSeQPK1XcG8Z+D08ET16gTXIkweXl
	 uenYy/kXtcQ7Q==
Message-ID: <22be4c2d-c5ee-4b45-a12b-5c3d538ca5e3@kernel.org>
Date: Wed, 29 Jul 2026 07:55:16 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the fastrpc tree
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <amaNYEchEvJAcnQT@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <amaNYEchEvJAcnQT@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/26/26 11:42 PM, Mark Brown wrote:
> Hi all,
> 
> After merging the fastrpc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/misc/fastrpc.c:599:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   599 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
This is now fixed in fastrpc tree.

--srini

>       |                                    ^
> /tmp/next/build/drivers/misc/fastrpc.c:737:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   737 |         ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret) |
>       |                      ^
> /tmp/next/build/drivers/misc/fastrpc.c:2711:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>  2711 |         ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
>       |                 ^
> /tmp/next/build/drivers/misc/fastrpc.c:2735:4: error: format specifies type 'unsigned long long' but the argument has type 'int' [-Werror,-Wformat]
>  2733 |                         "Stale glink response ctx 0x%llx (expected seq 0x%llx), dropping\n",
>       |                                                                          ~~~~

>       |                                                                          %x
>  2734 |                         rsp->ctx,
>  2735 |                         FIELD_GET(FASTRPC_CTXID_SEQ_MASK, ctx->ctxid));
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
>   165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |                                      ~~~     ^~~~~~~~~~~
> /tmp/next/build/include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
>   285 |                            dev, fmt, ##__VA_ARGS__)
>       |                                 ~~~    ^~~~~~~~~~~
> /tmp/next/build/include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
>   261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
>       |                                                                  ^~~~~~~~~~~
> /tmp/next/build/include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
>   259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
>       |                                                                        ^~~~~~~~~~~
> /tmp/next/build/include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
>   231 |                 func(&id, ##__VA_ARGS__);                       \
>       |                             ^~~~~~~~~~~
> 4 errors generated.
> 
> 
> Caused by commit
> 
>   10555ba6126ed (misc: fastrpc: Replace hardcoded ctxid mask with GENMASK)
> 
> (and one of the subsequent ones that also uses those macros).  I have
> use the tree from next-20260723 instead.

