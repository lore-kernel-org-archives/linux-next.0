Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CD3FB042
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456243; cv=none; b=l2ekWFFYqqmSmsLMOWekGpJ2Dgt6oV27Kk7To7EuOTbeh0PPCgME09Avhs39XfOhbdk4GPOz0ljHZtkvFBaRJNz6WC72VDXIY8+bh/JrGeEW7Nj+ld8fvbYrqe+XJUJ82kVWaVx0KVZcLbwrDVUI3tSojH6TVI54uzmU0KoDUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456243; c=relaxed/simple;
	bh=lT2ALcUCCqZWxU5iQHgAoKe0cGnXaF8tvbAiiagQ3CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfivMxx3xKv57CX95KgdOQ3nJL9P7xyH9B1SWTWzUDSsoNJeJTUPvDBDDVWIxDk5Q7rvRKvX47gIH0B5W6/8hMXUFvuUK+0O0JuV7obYHrUjJVhh0qcW1HsP4iVS5V9Rn+Zi2yr36eFemYRhZcLwvcCgpnAt05bNWp2gZLjUWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=CjMVrqaT; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="CjMVrqaT"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d7e5e8c907so3771282a34.0
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774456237; x=1775061037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgIg+cFiInAhwUxmjGvPfIq4uIe/XeIJrcZrRaOQ0Lk=;
        b=CjMVrqaT+CMxx5VTIiG/DaP6Us93AxSfIeBwtGpYP3VLX0euBqWTmWO+JF5rqR3I28
         2osiJhyGDg3kYKSN/6mqBvqTyqFr1dqxkvdcI5cy00TI9ZtgveE6OSkvgdYBGxM8UEkU
         mEj5AE/4ilK++oXywa8poR1VeXoXdrknO6fPb7DOs/Rdk6AXGTUFjs8jj7XqoNCMrFod
         KCSzFdcFQdMa7B2TjX2KgXO2nm/oajd89geb8qE0kWFTBM2kIYzo4/e5p0+XkF2hZMKG
         Tr1sYm/cwvkzXBTvWYgr5g2dnmfXAOAaD4t+TdId4pPGI+eyS7aCzRU75bG3exZlDlYm
         q1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456237; x=1775061037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgIg+cFiInAhwUxmjGvPfIq4uIe/XeIJrcZrRaOQ0Lk=;
        b=gqRb5ustRJY68BMywjojt3pG6BMBoRii7EzVFLhQXJxnaq4LcQJfyF+/m7gOgGfzfT
         ZfeZwokOOmmKoNOsKG79GnzeTvIXtfMzcLNIIpo+AFYiyatyLdYGXjH60cb6fNZm0Lby
         lE5W6YNWl2K4q9Hz+KemrhSqtoGe5qfr7Nk4XQnvxQeHqgQ23cxV9izTJnSz4kqC58QU
         NElwG9DJyjKmA8MWQxv8flLUgxvtvDT0GCPEDqLX/reQytTkI4PYPNySP0X14V0sh48X
         O9KY9nxnlTIKCM9eTSNbsvya1U15g4bxYif3EjNKqYSERZ56nvxvbtslArvz8p5AlUEH
         glYg==
X-Forwarded-Encrypted: i=1; AJvYcCV2on6SiQyq05pbxCsFgJKfn87RLIMNkjmZn3BwYVF5pxe9wzDlO3YgVlak8cTt4UT6kBJaxLe02uwh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EuLNPunnwWBTJAWkEDerYP3qTHXcCY9vY56txkQGNzYgY9bG
	hiWN/iSfloaezGoAx3GgaSO/qNJDeL1vqwtxaSDx/FYUDIvCC3NOlUcYE9Kp7iJIOZY=
X-Gm-Gg: ATEYQzxxRL6wQxXR3gK3/xVxPXt3wULnEP+vgxmnCyxsMXKxVMHQDb0aTstRqtBBJi7
	e+SdFuzHir1hFqZSU4MOA2RbEcsx3FPPAlaNVOmMpFgHr0w1UaNW1gE3D5i4CCT2x+gH8+6thZG
	GvzIQHPt4RcLovs5p3ShFeT92JwCGPp1BDD1JQkHv7oIueOCL72W2HZZV9fzyFVvrBBe4CxpbDW
	9JfsAqMzBbkSxqEPB4yf2/LyFvU2B08pVbvtpoY0jF5Gg4G6XZX/eg/VR/3pLGi9eh9Toj7sFWt
	UNEo12gCU4c6meu2ZNWeK0mFMQMa/FXPNHHDby8e2+aEp/bTIcKyVV0caPcIeV83yxfbaytKBqm
	PyHuQfKjxSkfBsw0t79YTLEfem1Fnp37r+4jMmqdYCUoSomH5bacvqGAUNSu6gXIptlDsL+oJWN
	xZbk+2NBdW1wfrdLCfIExfVEYCSR6mVwriFg4bqPZKJiGfKJ0gh8fITwjnl1gCuSAVIOhUNGOd+
	xlCPD+MEkP11Dq/vE8=
X-Received: by 2002:a05:6830:43aa:b0:7d7:ea9f:c104 with SMTP id 46e09a7af769-7d9d63b3aeamr1942585a34.0.1774456237611;
        Wed, 25 Mar 2026 09:30:37 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e680456bsm168775a34.0.2026.03.25.09.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:30:37 -0700 (PDT)
Message-ID: <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
Date: Wed, 25 Mar 2026 10:30:36 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Mark Brown <broonie@kernel.org>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
 <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 10:07 AM, Christoph B?hmwalder wrote:
> Am 25.03.26 um 16:41 schrieb Mark Brown:
>> Hi all,
>>
>> Today's linux-next merge of the block tree got a conflict in:
>>
>>   drivers/block/drbd/drbd_nl.c
>>
>> between commit:
>>
>>   ffa847f8ff11d ("drbd: rework netlink interface for DRBD 9 multi-peer config")
>>
>> from the drbd tree and commit:
>>
>>   630bbba45cfd3 ("drbd: use genl pre_doit/post_doit")
>>
>> from the block tree.
>>
>> These changes are both quite large and the conflicts substantial,
>> ffa847f8ff11d ("drbd: rework netlink interface for DRBD 9 multi-peer
>> config") in particular has a diffstat of:
>>
>>  drivers/block/drbd/drbd_nl.c | 7260 ++++++++++++++++++++++++++++++------------
>>  1 file changed, 5167 insertions(+), 2093 deletions(-)
>>
>> which would be enormous even for a non-mechanical change, based on the
>> size and a glance over the changelog it seems clear to me that it should
>> be split up into a series of patches.  This would make resolving the
>> conflicts much more tractable as it would be clearer what each change is
>> trying to accomplish.
>>
>> 630bbba45cfd3 ("drbd: use genl pre_doit/post_doit") is much less of a
>> concern as while it's fairly large it is mostly mechanical.
>>
>> Since I've got no confidence in my ability to do so rather than
>> resolving this I have marked the DRBD driver as BROKEN for today
>> (there's a half completed merge in the tree which shows how far I got)
>> and I will reorder the drbd tree after the block tree going forward
>> since it seems to feed into there.
> 
> Ah, sorry, that's on me, I should have called ahead.
> 
> It's a long story: the DRBD changes in drbd-next (and thus linux-next)
> replay about 15 years of development history. The out-of-tree DRBD
> module got de-synced from the in-tree version, and never truly caught
> up. The gap just grew over the years, and we're trying to fix that now.
> That's how we ended up with the enormous patch series that is now in
> linux-next.

At least that's a worthy goal, I believe I have complained about that
multiple times over the last couple of years :)

> We submitted the preliminary series to linux-next to "test the waters"
> in regards to integration with the mainline kernel, CI checks, etc.
> This preliminary series still breaks some old userspace tooling, though,
> so we can't truly submit it "officially" yet.
> 
> And that is precisely what we are working on now: we intend on starting
> a new genetlink family that enables compatibility with both the old and
> new userspace tools. This will take some more time, we are taking the
> first preparing steps now (such as "drbd: use genl pre_doit/post_doit").
> Since this is useful for the current in-tree module as well, we have
> decided to submit those patches "normally" via the block tree.
> And obviously that caused conflicts with the next tree, since that has
> not been rebased (yet).
> 
> Jens, how do you want to handle this?
> Should I send the (technically working, but maybe
> old-userspace-breaking) DRBD 9 patch series to you so you can carry it
> in block/for-next? So far I was under the impression that these patches
> would be too large and unfinished for the block/for-next branch.

How about this - rebase it against for-7.1/block, and send the series.
I can stash it in for-7.1/drbd, which can go into for-next. Then the
separate tree can be dropped.

I won't submit the changes in for-7.1/drbd, but just expect you to send
a new series against for-7.2/block when that is a thing. The 7.2 one
should be closer to going upstream, and so forth. Within a few revisions
of the mainline kernel, we'll get to the point where for-7.x/drbd can be
included in the merge window pull request as well, and we're done at
that point and future drbd changes will just get submitted against
for-7.x/block like any other block driver.

?

-- 
Jens Axboe
