Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA153B42CE
	for <linux-next@vger.kernel.org>; Mon, 24 Aug 2026 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566033; cv=none; b=iJsb5EizinkIuBhVFv/ZTDIDNu+kkyvyfZSG8vSY0+II5/m24KekP2KGiHBvxLsdMyppKeQY0kdDv5PngeLIGHoVenY9jCp6J9OTb1fedPgbQxq3S8QeHNjngcrFDp5iYBKCnpCXqIQS212b/2aTHFcb7voqeN2UarcVOZbRAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566033; c=relaxed/simple;
	bh=FeKhEJOLtsR0OSp5zSfjeZb70L45wBtbjze91lWid94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MY3P/QnEZJzmCgOZBCn3v4fCHwpRBomxjCr/LeS8xBH8OATKrRccJ+ac8sPD/J+F9de+W4v4bKp1q332q48feKMHr/s84nIThRtpIze4UwOQOVMbzuD2fkh/DsWzQXd5jgYvNHZmXbZV1v4DJbPWVOitqAzpVQ9HLNRDm8LK1gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JY26VEMF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JY26VEMF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-481595afa73so266892f8f.0
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2026 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787566030; x=1788170830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEFHmYMkDTSXJZFNXwL1AX76LI3IFY5Vpud0ERmcRDE=;
        b=JY26VEMFJBrEjAjJoENwQOJQfmFBnTfun3w9FymvUBn1Foce5B9uzRaMkc4bya2BhE
         H5zGB6y6b67p2l1PLaarZ+E+zlFcMukU9TS2Klnul4Lu3TYjoJPIS2QdhHk6qUNU6vsD
         zQaw0cr6P3tY7iUcbTEFAlkkg6uK3e7B5G9n2BqlktTRXZZg4Yec61RqmKrOaY2I9IkO
         2Chb9JV4sG3nuzH8ka9HV4bLYcvIV78ysxfxTCNkuiunlFY0F/C6AiTY1fEHdMwX+qP9
         rhcawP/esVxnJJvbXBluyK3fWYeYfNigF2RZK4h2BNhMy6Ulv8tr228naspY41spxlLU
         ubCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566030; x=1788170830;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEFHmYMkDTSXJZFNXwL1AX76LI3IFY5Vpud0ERmcRDE=;
        b=hBVmKXlBCqjabN6Q1oMFLCGADR1kAD3/X6prjgZsWbCernCJU9YnnPoudInfzLShEK
         rI3EQW6XZwpezy9EmKa70N8gXa50wIWh6Dua2YV2LIIXp33CV5GqySAVSbAef9F7nOeO
         QT1QoGSrE+IkwmF9TfG9svQDAxaqifMUUqCAf00iVhIr/tWbmnQMZ7S3Pu1I9oTIR5Qb
         XYA02IyqOhE7HXOnWXimeFI/xfKiDaTxcPu4GkTREWUGWEz9VgiCPb3Wqv4UKyDJAwvo
         +3PqX/Y0GjkuHBSO/n6zvAOMtyFyx9Ku6XjnpFSY3aM8BOnQiJHrmxqIF27k7+svgvQr
         xGtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrzk7W687HF5z/sDXYzkgpdQMfyM+SBctiSrM9s+LIwXoQu8LHYLSWcWVohc5lb7znwtG6vZqlUmcPS@vger.kernel.org
X-Gm-Message-State: AFuF++lZr2f/ZMphTJ9oBniO2U7vo5Wv/vj+rikA2tirptx0cuRqW2Bz
	YrZZIw5qncNQpRPlYP8m/7NbbmZ6Rtj6NyHG+zahAJead7rdz5zWCfVP849dVyruZiLjkG0ohsD
	lzFpxdfs=
X-Gm-Gg: AR+sD12rJ/gKQfP4B/+V4cMAyt5JpR8KDcec2jKu3pRSIdUMmkJVebDSQNiB4lEA/aE
	1cjiuFSRzhBP5/nOiEvcrViKnx+uTrNo/kBHMXSaoprL0bBKte4H/UrM1VUDHU4KIiMigg7sCZm
	tdK397PP1PAcAsAJfzMBR6IIG4YFHV4CjHyZ6Pdakyhbc/8smcF9RCsrOLI3iH+sq7z4f1V3LA9
	EgMwXtZwB2SrZlB9osajJwZIQ1E0OnOrId6ksgXDN+EhrKt2fhu0a0JD8Tth/C++DL5JB6BxVx3
	aZ9UArYP9ZmOQFE4jSQbW23d/cbm7OXxGKyhi4zUiYSZP82LBl23scJwTHm/HkSLIMEaPoJQs6G
	ENK37XumZNjEzavN6OoleHC6o2IdXgUieZl8U653VrtoxHHKicFNDSrC6MLk0IO42JUP9SOVNdq
	on8Bzf7iRakSnvmoi9/lgrYLd2eDQHdTWRg8m9eY0IWe1w9BjReOX5qA==
X-Received: by 2002:a05:6000:1448:b0:47f:9283:1f9a with SMTP id ffacd0b85a97d-482c0b92fb6mr15111694f8f.2.1787566029963;
        Mon, 24 Aug 2026 03:07:09 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903::e14? ([2001:1a48:8:903::e14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69a60sm7789214f8f.1.2026.08.24.03.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:07:09 -0700 (PDT)
Message-ID: <b1adf43b-f37c-4c8b-8370-d5f8f179678a@suse.com>
Date: Mon, 24 Aug 2026 12:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Content-Language: en-US
To: Mark Brown <broonie@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
 Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
 <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
 <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
 <a0e4b0ac-41d1-40bb-b704-67ba71e8ce43@sirena.org.uk>
From: Vlastimil Babka <vbabka@suse.com>
Autocrypt: addr=vbabka@suse.com; keydata=
 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
 pYekxJujNeEDkUlky0Y=
In-Reply-To: <a0e4b0ac-41d1-40bb-b704-67ba71e8ce43@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/26 14:36, Mark Brown wrote:
> On Thu, Aug 13, 2026 at 09:31:58AM +0200, Geert Uytterhoeven wrote:
>> On Wed, 12 Aug 2026 at 18:44, Mark Brown <broonie@debian.org> wrote:
> 
>> > > The advantage is that if commit B breaks something there are less
>> > > intermediate trees that don't contain B and you can still test on e.g.
>> > > D+E.
> 
>> Sounds like a nice idea to me!
>> And you can put the trees that usually cause the most conflicts in
>> the same subgroup ;-)
> 
>> It may also help in bisecting an issue.  I have the impression "git
>> bisect" on linux-next (against Linus' tree, not against yesterday's
>> next) shows me more "a merge base must be tested" test points than
>> expected/optimal.
> 
> IME it tends to walk down the linear history of -next until it find
> which branch introduced the regression.  I've never investigated in
> detail but my feeling is that the inefficiency is more driven by the
> size of the branch it lands on.

When bisecting -next, I actually use the "git bisect --first-parent" mode
first explicitly to find the culprit branch (or precisely, its merge), then
do a second bisect only within it. It avoids wild changes of the tree
between bisection steps due to the differing bases.

The suggested binary tree merging approach would make this strategy somewhat
more difficult.

>> > There's also the issue of incremental build benefits.
> 
>> That should be more or less the same as before. After all you're
>> building the same number of times, it's just the changes that are
>> reshuffled. And you do use ccache, I hope?
> 
> No ccache, it was enabled in the past but it got turned off by Stephen,
> I suspect the reuse over what you get from just doing incremental builds
> is questionable.  We did have mediocre experiences with it on KernelCI
> too.
> 
> The thing isn't just the number of builds, it's how often those builds
> change headers that trigger full rebuilds, and we're only sampling the
> builds rather than actually doing every single one so that the merge
> completes in a viable amount of time.  That might miss stuff, but due to
> the way trees are ordered it will likely be only things that will get
> resolved before they go anywhere near Linus anyway.

