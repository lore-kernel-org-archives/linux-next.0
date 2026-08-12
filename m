Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33447986B
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786556259; cv=none; b=o1MgLNm6y8wHlqY/I7jaHOvgyO9fylAM1bevej2ZHe410jF6LWEmLuG3Eg0cLd5Yj4DzbKcaLEg/vue3UcbfP1raRUSsFT/yCdpn2pa5McaM9R7Su7Fbh+IsQn9mxawo8VHBpYIt1zzOBThJ2W8bdQQhNpslRB6aln5zB8sm9mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786556259; c=relaxed/simple;
	bh=NJMEwAWtvljQLi5Ypt5QTrQlDx43Aw7vJYH4v4Y4Wv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAe716SHNfc+gyQlcuAD51I8pnkg1TIwTSPLOd2dqKhCqSsBZjuiUTNB3hzZ5mdm0+qCIWFMDtc/hL15vdlTBWwLH266t2KjsapviQ4PUSPqSlonJLh9m3XzVUtq3sIzEr4m1A/aQr1JnZeTnAVGNX3EYlPI24b3mQX+6zhPHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoJo0PkR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoJo0PkR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1568187a91.0
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 10:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786556257; x=1787161057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GIA7PuYBvEiLKRCRd0qJEq7z+XSHyKUEpVajAn1CKE=;
        b=aoJo0PkRTp54T0VtYMUP1rloH7YY8HmFt30WvK+sVnX1Yaw35r+1R/VX+iHMlO9cgZ
         ZcS+/kXMdEO4aRHF5N0neVutymXd4TrGS3klN3fKhrMkFo9pp+wJDpp+Glpm1hLR7RsP
         kWPUHiXx/VBZn28VV1gA38Yydq4CSgqpBkw4rmeOhkgfPqW8Nc5tt8+3i+yP9FaH9yoX
         xnFR7YIQad4v0by8bpNgNJn/+TRgeDs0PCCmWOgFDVMm1gWZKOXlCH/P1Wu+dOlPFeaQ
         9d5RLhy+hmWkauZttSwRMqbGigQj3t7DmKQtAU9BIHep/XVvPLOhYklNCVe2PkTffSvN
         0fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556257; x=1787161057;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2GIA7PuYBvEiLKRCRd0qJEq7z+XSHyKUEpVajAn1CKE=;
        b=YBNlGP7PZ0Cc6gat18ioRW/fidrZBs3MydZR0ctq2yyCRf/FRLtAGiReZW4MFFedpw
         JWTyyvyLe0gt5DnMBPc9+enXyoYNrPt4IUL3o/lL3W9BoFv2xrny/ii4J7YkM+C5xbNy
         fznQLOEQnMc2euw2zTualXnvkKkyAeHvUsIn742lzH9hloElmCslXWnCFKbwLzI434EW
         IdqaEgnZmixA5NAelNNaxY65gdggHolOYawzbYVrLsPq7AVyRYgrEMF2k+gpYoKT224h
         QOKWcduhih8I8NmgdH8pNDEWTW315WwFEqt785huaIetJeFsoNbvFZBAa73WJAcQJG2j
         Tasg==
X-Forwarded-Encrypted: i=1; AHgh+Rqzkvj4g3Y7dhJDFXJUTkjseXOxuwguMMK5MPff2NyO/sDQgLwxxf4L45q/f0SYxRvSqg9FmwAfIZmZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9PwzlW7mbY/DGWKI5p01cKousuJmcHUGXOaczkCnyKZAQKP+
	/Uu0UunH0zr0YrzegCbRZNxa7ImzWTUtzcWdTd6llx5uamP8CQjxG+cq
X-Gm-Gg: AR+sD13gBCghnfzK7aShdozbLddEofr6wUUixFQ5LaSQg2qgYfXRdytQuTAlZo/l+b4
	hljwMeH3wrZ9t/whPN67lUvGXBfdm8mqrXiEHL/4vhHOwMWeLhFg0+P/kpS2gefs0S9BS+/l66w
	NLMIPkfLoMb48/OBVnOargTW6Q/dPGzArbZOurb0hltNky9sa5cim5vGeK2M7B6Xs6LSVMghrW1
	U0C3SslHAHrBlViUSSLjT+yNhFtpMvQozqX4BS806hzlY6ouXFDcowARxkJ2XMpDwyVz5IIAR8R
	fPKfA9oZ0ygQ249Dk5mkV8iQIhH0cbEbn/GQUNaXmkYgvPPdvr/j0yxkUw/6OVf0fkwVNINVW6p
	rglsPxzgj99RBoLhJvd6QzyVgpDR/Sf3z3MSb0LVfcjepe5BmZ8DMX/iErS9TwIR+IF5HqytDGw
	T3pEKf8+ELHij/sbwfuuthOSaiUbjRYoHR8pWhg3VIetNm8EJeUbewnbeEx4xOJ7PdJuMZes+aZ
	4YpUc+SDeUsDcl2svJonrLYhq574h1BDfznBw==
X-Received: by 2002:a17:90b:3f85:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-393012c974amr8404696a91.10.1786556257105;
        Wed, 12 Aug 2026 10:37:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm24272a91.0.2026.08.12.10.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:37:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9e805a87-73f2-4d8c-ad55-cab432bfe387@roeck-us.net>
Date: Wed, 12 Aug 2026 10:37:34 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Breno Leitao <leitao@debian.org>, Mark Brown <broonie@kernel.org>,
 ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
 linux-next@vger.kernel.org
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com> <20260812112723.643f9502@gandalf.local.home>
 <20260812155932.GV1072730@google.com>
 <5f25ba58-f62b-4cf0-bd82-682cc39c7b96@roeck-us.net> <anyp8V0kRWdrG57N@x1>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anyp8V0kRWdrG57N@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 10:14, Arnaldo Carvalho de Melo wrote:
> On Wed, Aug 12, 2026 at 10:10:17AM -0700, Guenter Roeck wrote:
>> On 8/12/26 08:59, Lee Jones wrote:
>>> On Wed, 12 Aug 2026, Steven Rostedt wrote:
>>>> On Wed, 12 Aug 2026 04:42:21 -0700
>>>> Breno Leitao <leitao@debian.org> wrote:
>>>>> On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
>>>>> Would getting rid of these ephemeral commits make linux-next easier
>>>>> to work with?
> 
>>>> This has come up at the Maintainers Summit in the past. I believe it is
>>>> even in the article I posted earlier in another thread.
> 
>>>>      https://lwn.net/Articles/1050027/
> 
>>>> We are even discussing issues about this in that other thread as well:
> 
>>>>     https://lore.kernel.org/all/0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk/
> 
>>>> I try to keep my linux-next branch clean, but I do rebase to add tags. I do
>>>> on occasion remove commits if they prove to be totally broken. That's rare
>>>> but I rather have that then having to push something to Linus where a bunch
>>>> of commits are simply reverted.
> 
>>> +1
> 
>>> FWIW, I have always reserved the right to rebase in order to remove,
>>> move around, reword and otherwise fix-up commits and do so often.  To
>>> that end my 'next' branches are not, have ever been, nor do I intend
>>> them to ever be, stable.
> 
>> Same here.
> 
> I do it as a last resort, but its better to avoid having bug+fix things
> hitting upstream, i.e. trying to help with upstream bisectability.
> 

That, but mostly adding tags.

Guenter

