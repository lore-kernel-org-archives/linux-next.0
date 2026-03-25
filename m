Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6D13FA5F9
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457262; cv=none; b=joMhcZCj0XbOmn529v/bBgnyeNO7sf+7Pt8fswNwnfUNotIxV20VnnjCJIQWD9WW+PbAuo4mCV6DyguTUhq/F4rb07geBTKm/qQTeGdQgAMbRFsRJ78UMt3oOehGoa7RUF7i216qT4jTCRaQP0gjWGua6e0S7OoIZMwIUjnrGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457262; c=relaxed/simple;
	bh=ENpOIRzHCCzwzpFBflXSROphq8zewpQWpM+fjyz8dIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDHal3lGZLhglaNe51ZnQU6WSgeC5KZx5+HBXLtV2do2nu2oPFwOJd2k+Sw9KAnx0XSu2SXSiQhBKFQQEOjdgriVtnJQU0GEHyNq8EXfrtjc44ep9OEZZPMz7JadIHxZb9A8UEDxHy5JXZoU/VGYhwTC6vZyFlP9E0aJ8XcTB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=HV3jRaaa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="HV3jRaaa"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so4287166b.2
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774457256; x=1775062056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gpjr8AHBEf04c0p5RoIvYnJKFbb304DAr4/8vNVC4JM=;
        b=HV3jRaaaygNraLtm9XR/HbuRI560i2d9N6U9KMGg7gF3odGnZ5PnlmAMbMUP29Zu9Z
         xR4OcCPix8a1txRrFJQTNVlKOiC9daYVG1nb2vyupDSsGCPzeEdNfkhASqamejWipY4w
         9M6uaxk3DyF249l1BaD1POKJ291EFpR4XOJ4/Kdc7IrM2USpUQv6nxapIkhke/bOlmZs
         7Uzde1R+RKSOXdvbFdyKztezS5x00KzokYsogc+PPxYsSY25RPHAU0zm0TPAmCO7Yfl5
         8IIE9gQv+J04LIr1Ag+nawAXlTTZ8f2yhHI7GEFWwyO5QnjHtHkqDNMvujxDf60qDW2s
         fbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774457256; x=1775062056;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gpjr8AHBEf04c0p5RoIvYnJKFbb304DAr4/8vNVC4JM=;
        b=iBlTDAG4vkw5sYc5DIKu2+Q4upHcUYwDQN6jQx8zkk2e8csSQlWJ9t+D5bklOwDSTr
         iA5AxsTt1MPfBR9wg10brmkQDvn+vA0jEHFUzxI9zLyOwfTZll1I8MSu3kU2XdXsUFB2
         CEcwEKLMxhwLW69ABxyxc3bl/nsFv9iVIM5K/C8k75k7NeKdrn6tjSjtu4PZh3ow7VRu
         SvyMPtEAEGjpv7uDkEmidSo8cPhmSVZXDaBi0VIb9aT+hpiraw3Psy3v0FJYz9/HDK3D
         1HCvbonu4R7VfzBgZLl4EryJoeamQpfDJcbH1ol779njRofwVtB67DbGTSojD3IV1zIS
         +uaw==
X-Forwarded-Encrypted: i=1; AJvYcCXuGHmv2Fq+imgKK3bATxSlugVMkhS9r/9qSwisgrA0wuuz0Lnrz+gTUIQKqA26cuxUd1IE/VmMlQki@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzPvRkOC5LWutj5NaHC3ZjEV/n5axcg6o8FoBiBNstORvI+d/
	9JXqq2KFRRNdgDZMbhFe702fET+5xCiY6tZitneORZHxJMblRSX7iD76+X2aKXEgndcxO7RBBAD
	R4wTV
X-Gm-Gg: ATEYQzw5mIdPP5A30Ib67DLxmXkqKP2l3t6Q5b8uRAb+EJwyNovYf/W2hPV0RHU4O1X
	XCvMT44EJqq7ENcGdtPOtMhdbNtYuJDKIp0F2lpKVxSMUGub1h1DRhDAVPwfkKej1Kc06+a6TM5
	EYOqFNgsYfeKASo70xxJzuSYqPnGSZNr5bqbMVJt9qJ7nft77Lg9cOk1VBakQpeF39J7X5j9oj5
	ZXbo2r07nPLHiiQ7zPjqtBs3a66fodL0iGD+JPYLMT9cT38of+oe5upHa+csNUF9kh4fOMtBVnq
	en8HKrRda5jnYgzJThOobaEuS4cUKC6eiop9xdI8wXEjrhW/KSXRecOyPrzvGogjA8FchO8shRd
	8Q6VctZgWpRvStVLybADboQkg85/vqCkwIg+tV6fHfqvB3Lya1oOIkMoGdQnJIeWu6JB5aOG1b8
	IHN7zai7yQLrRF428JcoO0pJne3Kqbm0YvmKva/eTEpSFd6Gnk9MQgGYzY3vZmj70BGuUT1Pb5B
	B7RggOsHDv3OFU=
X-Received: by 2002:a17:907:c205:b0:b98:3b5d:e143 with SMTP id a640c23a62f3a-b9a3f16153cmr296535466b.6.1774457256103;
        Wed, 25 Mar 2026 09:47:36 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef851sm7334466b.45.2026.03.25.09.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:47:35 -0700 (PDT)
Message-ID: <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
Date: Wed, 25 Mar 2026 17:47:34 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
To: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
 <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
 <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 25.03.26 um 17:30 schrieb Jens Axboe:
> On 3/25/26 10:07 AM, Christoph B?hmwalder wrote:
>> Jens, how do you want to handle this?
>> Should I send the (technically working, but maybe
>> old-userspace-breaking) DRBD 9 patch series to you so you can carry it
>> in block/for-next? So far I was under the impression that these patches
>> would be too large and unfinished for the block/for-next branch.
> 
> How about this - rebase it against for-7.1/block, and send the series.
> I can stash it in for-7.1/drbd, which can go into for-next. Then the
> separate tree can be dropped.
> 
> I won't submit the changes in for-7.1/drbd, but just expect you to send
> a new series against for-7.2/block when that is a thing. The 7.2 one
> should be closer to going upstream, and so forth. Within a few revisions
> of the mainline kernel, we'll get to the point where for-7.x/drbd can be
> included in the merge window pull request as well, and we're done at
> that point and future drbd changes will just get submitted against
> for-7.x/block like any other block driver.
> 
> ?
> 

Sounds like a plan. I'll send the rebased series this week.
We already have a few "get it closer to going upstream" patches in the
pipeline targeted for the 7.1 and 7.2 merge windows, but none of them
are truly ready yet. So this approach would fit very well.

Exactly, once we are done with all this we will adopt a "normal"
upstream-first dev approach again. We've already discussed changes to
our internal workflow to make sure we never digress this far from
upstream again -- I think that's in all our interests :)

Thanks,
Christoph

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

