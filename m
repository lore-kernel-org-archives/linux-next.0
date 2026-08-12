Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A747FB03
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554621; cv=none; b=aatg2oMRvxS42wbYsYY4j+iwMNqmA7lcZsyVXt9iyjNxBL9VqVrbzbT5D2ZxPY/V3z4976XmKzs/7GcEaL7l2KIey8VkzTdpdTyQLd0rlDh6AfCdBIdHHcjLoAKsmXhrhPTWQcT/2vqRmrgUcNrW6R1AQ/QcuFLTEwspXLkCkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554621; c=relaxed/simple;
	bh=ojSTKNBcskuW2SsJ8/4fWt9fKJJXu/xTaC5a1AOYW2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLgaiEao0Ins5ZC16zuexn6D3nOpkUYX+MtmyS+APNtQOgF2w5WEXO3FKLtG85uSOf1kNj7FJy2jAaniZcCRnuLJWXyctzqEt1smJiawwN8FzznCCzTpxfAbANwVgfwRBfeGntTTY6k5lykYoLlgINQgUMaNL0V/zpKDhvpZmIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IubLLYxr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IubLLYxr"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1429405a91.0
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786554619; x=1787159419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxYYrIikJjUPytPGC0bLQChCD8Fu6xGtoN+OZS4B790=;
        b=IubLLYxrleR5ytk4YX5pUxOGA09XE9JTuda/1azpASVMKp45rsbO8ph+r7V4fD2RM8
         SRVnm2iD0jvKyy5NzkqfrN+itxm+91/U8c5tSFooLzR7A+8uxvHiK3xtgH21k89pKIhL
         4lRGemGVoB5QvdXFcQh2r9zsC5z0ZgWuNY09YQWyuxFpAKo0XcoOa0gRr1rCrGsVKJC8
         QNxJyiO8HBSu1z1DxGdjIjfjQf1l/GHa9seNRNO5wNWbz2mRrXPe3fBc8crNLV8U6I3x
         9zxdSOEpw4lAP4NhpMLBYgTFgb8B3/xSIiLs8FiTJDremDXdU1Cwp9b8zh6HeoB1gQvl
         oMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786554619; x=1787159419;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxYYrIikJjUPytPGC0bLQChCD8Fu6xGtoN+OZS4B790=;
        b=gMenyi9IUGtsy19NSpFIwgfv+qK3Z+Ybuse6X7Jz1/8utxarOJlw4MX3NTS67wuv4o
         +HfzfyvqDJ/9qOP/7BqXB109699gmMZ8kyYGG5kPMQhjL6w5WKd1Iii+5SrpzU1IBsr/
         WLLRyq1JxtZ9dboP4F6tyEM9hj+MjwcwPuRleXHW2VHN4Ue+NNPLMcMhY3jBjFucFtXD
         qHK1ujW65h0ALoU96h0iNhRJaNqmFFVJDUzdHTvlv3VEVW7gZGflSS1QeOdpmgSwpMNt
         Ihmy5vFTFz/TZbrKYYSpLGxAKCKmKlDcEtA+sfpWjFgRF+hSKr9V2SoHyVpG+LvZg2Y1
         x8ew==
X-Forwarded-Encrypted: i=1; AHgh+Ro6o0twtzWsdTtgCRzIryVgxcD1KZPfeY4eX7qpBA5ftwRMHLyCF5YGHlPSWob9CZyKr7IOii0hQ6Kc@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBczqpguyv2/91DLPTk2x7SQ/NJIb9DMZGyi+4wdOvbFO7e7B
	+SNj8XDRhPz/HUNeKOp5QOYubHcljRa9zZ/VPpGlZMHvbYKDkxJwf3hx
X-Gm-Gg: AR+sD110yZoAv4JMttXV3gc4kJlnNt8j+6rJN9sAHMfRJWuFh+Yq/WgHl+R+w1FQKXv
	tjYX8f7yvddvzXfsKGgV0d0ZPsd29xnbuxYyocceQUmX8DgDZ/Cu3I1lT/8qm1xxc9KM4jOvcgG
	ckFkn8xCgLsWf93k5jmXy8WlaZ0tgdwY6r10QBClI4IREKi5aji+zUZlKHh+Uin/4KN/usQLiGt
	uEe5s2R2pvY/01Ol7KEvc8C2HACB9d/bKp9cCHQIPt0O6Z381cjjddDj5x6pYhA5GExMvrnGLQc
	x2Axt2p33FkU/oVkunmO8aAZHuX5/+4WEgLsGoekXHpjlw2L9R/Dai0Pe9SogESW4LNP3iKVcjS
	1cqGD0I3vxNuSIYbrZqljO5sVWklkdh3pCOrv/pJwbJXh2t7ALI14N+6A0LiZ614oFfg8TUapw5
	UyFXQO/AUfLGMLhMKlWlSGabZpeQEnSPlSspt10Bc4E/OUV7pnhBfsrx31NxrOh0owEY0fOR4K2
	t0CCFEeitfjtVtts9KdLJQsDD9nEOd2/Q7HLA==
X-Received: by 2002:a17:90b:4406:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39301663a8fmr6398274a91.15.1786554619317;
        Wed, 12 Aug 2026 10:10:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cdce7fasm128473a91.17.2026.08.12.10.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:10:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5f25ba58-f62b-4cf0-bd82-682cc39c7b96@roeck-us.net>
Date: Wed, 12 Aug 2026 10:10:17 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
To: Lee Jones <lee@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Breno Leitao <leitao@debian.org>, Mark Brown <broonie@kernel.org>,
 ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
 linux-next@vger.kernel.org
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com> <20260812112723.643f9502@gandalf.local.home>
 <20260812155932.GV1072730@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260812155932.GV1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 08:59, Lee Jones wrote:
> On Wed, 12 Aug 2026, Steven Rostedt wrote:
> 
>> On Wed, 12 Aug 2026 04:42:21 -0700
>> Breno Leitao <leitao@debian.org> wrote:
>>
>>> On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
>>>> Any other ideas?
>>>
>>> I'm new to this area, so please forgive what might be a silly
>>> question: would it make sense for maintainers' -next trees to keep
>>> a stable git history?
>>>
>>> Some maintainer trees are already stable and append-only, which
>>> gives linux-next users/testers stable commits to point to, instead
>>> of ephemeral commits that can disappear later due to history
>>> rewrites.
>>>
>>> Would getting rid of these ephemeral commits make linux-next easier
>>> to work with?
>>
>> This has come up at the Maintainers Summit in the past. I believe it is
>> even in the article I posted earlier in another thread.
>>
>>     https://lwn.net/Articles/1050027/
>>
>> We are even discussing issues about this in that other thread as well:
>>
>>    https://lore.kernel.org/all/0a8c1e90-1de1-4a76-b0fa-e367a4bd4f55@sirena.org.uk/
>>
>> I try to keep my linux-next branch clean, but I do rebase to add tags. I do
>> on occasion remove commits if they prove to be totally broken. That's rare
>> but I rather have that then having to push something to Linus where a bunch
>> of commits are simply reverted.
> 
> +1
> 
> FWIW, I have always reserved the right to rebase in order to remove,
> move around, reword and otherwise fix-up commits and do so often.  To
> that end my 'next' branches are not, have ever been, nor do I intend
> them to ever be, stable.
> 
Same here.

Guenter

