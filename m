Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D643ED13E
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454854; cv=none; b=G0Zzl8LcdTevKpiERuTmNZw+tKqSNZsxw8q+G71vYDiV8sguat/mEri4+p45X+7C+mPvOmeLz+8WbBjyM3yJomRNhkZ04O4/E7VzyoV8qsqTvNjZ6Ub72kcmW1Dxa/mtbl8lcXTQQArXWuReG4aEgTCx30aeHSYkqemtxld/gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454854; c=relaxed/simple;
	bh=FH5JCd6BfJHiLBlh4yk5NBY0gRb7erW1xuTyJM3f280=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9hqGDosMIMT/5DOKGBY5fPg/M/6xCF+3aDMYIGSTp0Lvai5ariEmp2TwTuO03tvAIh4uwZPaU6dmxQYEofDA70qBSIbWpY42RQHzJB6CcfNqDhqdbYO6mSYqLiRbjvv7lDYNLtJUr3Ez1w4rm3h+Kw1R+Gs+6/65eqqnSYbLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=gR7aztUB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="gR7aztUB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b5bded412so2049791f8f.0
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774454850; x=1775059650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WoigNGk5cMWhKXOt/Vv6EUh1Su5Qhq3xBfx8jQN83d0=;
        b=gR7aztUBjwnYg+R5GgeC9wgsGeuP397+w36d0uZiYydxZTYPTwmS874IjqeH5s2xkZ
         k5VXC+baIn9mVOR/FAW6fE2YwQtPtyKjg3oJ4GZ/S296OKQSJkoXUZksbScLy/ASTZBH
         DxhqMbV5u6/QXu3o8HfCP54Rr2iDNHiQ8rdO2/lwa/k6cOdZg74izkqEk4zd99MwKt2g
         sgrhYMWac1qHZ+BOnLV6Ss5syVpBygMup0+TaprlMVtbyb6eIqncJ7KwoT69HEDVw2xm
         wCAAbpYMgChyVERBVRO+wkfeWx7mzp45WsK+eNjxgIz4K6jHDU788z0EscsnrFXCWEDM
         MHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454850; x=1775059650;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoigNGk5cMWhKXOt/Vv6EUh1Su5Qhq3xBfx8jQN83d0=;
        b=GF9BozkVPFGgRF8sFXEzu9eRychHpswzNf7Ijoa6Fy5mgkloT73/Jun1+8BrZPEL16
         v4xTPwjdADH8At4yYyMuCOyhZDS+Ehcdij5KLyeLR/U2LRXDeambj5O6lOdX0aV7L/LE
         fmwyKJQGZmF0GUBwVu5U+6YyqLx/4ohlYOK7rqZiCmx0AmPj7wWojZgi97G7QUtSgtzf
         5bAPhb8PCwgM1t0j5diMbY6q+Pel/VkHYWkLZeGIbMGA22EqSgtKlmYDBZYgeWqiKWgR
         y9GRVbzTSdTQQjcI0x0Gg+RP8riPytKSdsE7xqWMVMP816E6IggdlIL5TIR0Z6nJCp2M
         vMLA==
X-Forwarded-Encrypted: i=1; AJvYcCWSMIdSbL/4jbLoBNbUJPKGk0xq8+hzmEj+yJr9sFj5TfLp5tQ2KCkOy52U6LMOAASYMxdnZDino1n9@vger.kernel.org
X-Gm-Message-State: AOJu0YwN91DQy/KQ7fXQpfTtexfJERgrhz214FZ39iTGWO5W4mU43+zh
	RTro4xHuQKqjgYAd3r5Y0qNQv5xUs8/1JqbraSQHYGUTKAzfGT0ICDq9nLKdG1/Ue3M=
X-Gm-Gg: ATEYQzzwly07cJwVkgTDlYDn9J+R6xJj81583gbNY8aCxXgJGmzbAVbcXAqfQm0dkbX
	aQOmovRViTfVO8QWMaQ7xZLhoNG7O4Bq3VOkiezQF5EZd8zdA+GfkK/m/qabaP9Obfe33X0c5Vh
	QqzAPUi+pdgZ/22bnkSZI32oAokZS3CoQ+MTJflt0+q8tbVUaFq3BVVX2i3YgCQLewGa2bXsqyn
	Z6p1zQn/FG2UFTcHMQGNQdVht9hQU6olStiwtcdXEC0aWqfmphFmQ0TOyIszImXiwv6Mk7JZN7U
	k67kPUk6HujLltM6PShS6JRRRcdGdml3+OznXMzW3OY3LFcwknmhNBO/t4H5hoCBi24PE9uW6fZ
	lrianbfQ4mR3Ydo87utDlS4EpLFuF8nVeqkKd07S/MH+TvCjopz1snqzPozQMOg06m8bOj+jO5D
	OfXLvtMJrOImA3+LkQFl2Jba38PyMbJnRAMo1n/ixnBBq4Fn4OZDs5fcTs+R0/d98uiLz5I5KKA
	AygHn+Ye8vG2vk=
X-Received: by 2002:adf:f78c:0:b0:43b:9111:a1d1 with SMTP id ffacd0b85a97d-43b9111a1dbmr951145f8f.0.1774454850327;
        Wed, 25 Mar 2026 09:07:30 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm655408f8f.30.2026.03.25.09.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:07:29 -0700 (PDT)
Message-ID: <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
Date: Wed, 25 Mar 2026 17:07:28 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
To: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <acQCDMhGqwhzLuzt@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 25.03.26 um 16:41 schrieb Mark Brown:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/block/drbd/drbd_nl.c
> 
> between commit:
> 
>   ffa847f8ff11d ("drbd: rework netlink interface for DRBD 9 multi-peer config")
> 
> from the drbd tree and commit:
> 
>   630bbba45cfd3 ("drbd: use genl pre_doit/post_doit")
> 
> from the block tree.
> 
> These changes are both quite large and the conflicts substantial,
> ffa847f8ff11d ("drbd: rework netlink interface for DRBD 9 multi-peer
> config") in particular has a diffstat of:
> 
>  drivers/block/drbd/drbd_nl.c | 7260 ++++++++++++++++++++++++++++++------------
>  1 file changed, 5167 insertions(+), 2093 deletions(-)
> 
> which would be enormous even for a non-mechanical change, based on the
> size and a glance over the changelog it seems clear to me that it should
> be split up into a series of patches.  This would make resolving the
> conflicts much more tractable as it would be clearer what each change is
> trying to accomplish.
> 
> 630bbba45cfd3 ("drbd: use genl pre_doit/post_doit") is much less of a
> concern as while it's fairly large it is mostly mechanical.
> 
> Since I've got no confidence in my ability to do so rather than
> resolving this I have marked the DRBD driver as BROKEN for today
> (there's a half completed merge in the tree which shows how far I got)
> and I will reorder the drbd tree after the block tree going forward
> since it seems to feed into there.

Ah, sorry, that's on me, I should have called ahead.

It's a long story: the DRBD changes in drbd-next (and thus linux-next)
replay about 15 years of development history. The out-of-tree DRBD
module got de-synced from the in-tree version, and never truly caught
up. The gap just grew over the years, and we're trying to fix that now.
That's how we ended up with the enormous patch series that is now in
linux-next.

We submitted the preliminary series to linux-next to "test the waters"
in regards to integration with the mainline kernel, CI checks, etc.
This preliminary series still breaks some old userspace tooling, though,
so we can't truly submit it "officially" yet.

And that is precisely what we are working on now: we intend on starting
a new genetlink family that enables compatibility with both the old and
new userspace tools. This will take some more time, we are taking the
first preparing steps now (such as "drbd: use genl pre_doit/post_doit").
Since this is useful for the current in-tree module as well, we have
decided to submit those patches "normally" via the block tree.
And obviously that caused conflicts with the next tree, since that has
not been rebased (yet).

Jens, how do you want to handle this?
Should I send the (technically working, but maybe
old-userspace-breaking) DRBD 9 patch series to you so you can carry it
in block/for-next? So far I was under the impression that these patches
would be too large and unfinished for the block/for-next branch.

Mark, thanks for your efforts and please keep the drbd-next branch
marked as broken for now. I will rebase the tree in the following days,
and we'll see via which path it gets resubmitted.

Thanks,
Christoph

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

