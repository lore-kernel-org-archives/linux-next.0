Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C623E3156
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454221; cv=none; b=qO2LP2Ako9vOK313Ps2Map5DSEihND0JvQayrpe1HMg3dfsWiB7soxfAAUk8toKiSy3wkbHlD1hMOUpr2xe+8jtU+JEGgxaXAoIrFYlRz+Efp4EqLXvqDKV2rrAQOeQMQLgKBwpE1cctqeZZM+u3XglM23dMQwkVLsdEQ6cM0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454221; c=relaxed/simple;
	bh=DKN8i8jOf5NuUa1gZlgxBbn2Fc5ZKuuYcSXkGO0mlbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LphqnW+5pOFaccbRnQPe9SOr/9Oa+VLbR4Ie/Xupt+TYcT/KxjeyiuqCaww4yXZhNFCi1TcnnmCcAeFnfGxdpYuEmjUn7k/A4I002xLSSdulnla9evl8E5L0cPwz+25iXLHx0TRWyS0o4hM09fEDJXlMv4wpPJtngtfluOhGzrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=2TP18ePm; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="2TP18ePm"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7422b4ff1so2285479a34.3
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774454219; x=1775059019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mr0E5mH6E+HB2qNXgv+E+FIaRdPop+SyDUYPeWja64M=;
        b=2TP18ePm0okfSEz1T1KAxBve4TOO5DFC8xUwYKVvgBVnWHaqSek2/jMr4DVp8za1XN
         2ZeV9kn3klGXopV51tBi0vIbTxo7SG2rwBw32uRUS2RI7MwpcEhTQvD5vBnYLzDfHYyN
         uuO+sAcpjTMGDsKwOv5cWnivP+Ubs0me3EA+X3S1o1XNyRrtCAhJDxELUwdd2YwATTeg
         eVi0BzXDWeGZHtSc3CTa/md/ZaMk1FYCvR1toMsXI0hS/ekhd3YBGpqwr7A8pPEZ11kt
         m3lhMOWEEZb3DD73dbpFmy6y1pXR4KXGhLtE2r2YUbCo1NQyrGuZJzRT4pvnQqpXlBom
         HPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454219; x=1775059019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mr0E5mH6E+HB2qNXgv+E+FIaRdPop+SyDUYPeWja64M=;
        b=QFdMZU43acjoLbumwjd7F3nO6a525Xv3tMSXmHMNGQoOkkMY6x9gxD70vDGGPoPyj7
         jgXcOmEPCbm7I7UGsS10FRgMG5O7lJDb5NGGGyfNg8XJh25LdrV3ysRx8gJ2qQgCMU4i
         OJS/B0W+gQiVua6RwIcXdH6AKnIyjw5nbr2oo7iiMS0voTuLzTIsLzh6PWVvMPIBrs6b
         GSFaqfFdwqkvpBDAcv/jr4F4UCA98VUSTwi50oRolavXzlztl0UGtvvI0tzbzdponX0K
         3Kr1bfAhOGgvSYXIsLFG5GoEw/oMF/a69Jr16V0hU/k8iw25yM5RCaTu6Qq99o7/4vcJ
         A/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq9CN/rqYO/KAUyHNIVmFmva4KOcldlGRvSWT2WCcP7p7LpEBp3EsM4v/cN2yQvXdk1P2urSx7PN3r@vger.kernel.org
X-Gm-Message-State: AOJu0YxQzpL6e/N/GpJCzWhueDusRKIXRXpFcedVb2fQnrpcSlALrM4w
	JqOZB90MKG+SBpvDiDbazz483N0cnI2YK4D/zR08j7MyWX7LGRoQ/mW3bO98f0TqPNs=
X-Gm-Gg: ATEYQzyJUdOpJH1cppUW6ze/bOd6kkPz1KLoZObaZxzWt5Fi+nfAOJrBO1t2KyY4jKP
	L3bGd/BnajIlPLtRVsaMzvhEr9VJ1LSVja8O0LByvWGGTDgLFEaAtaQymdzkP436U7PuA04DG9n
	FiRHtoHB+0BRJgnlmmLGYpFnXJIUBo6CcTndEFRTzroEGnVoAVbu5q1DtbFETKGBt6ioRANY0cr
	/KfPcFtzsiidNUgOIndr1y9/MQ+mkd1cy8FQYq9KfaLsc4K2XlJ18bmDNvo1LiE1l/+g9xyS/32
	E7W0WzYmUDjtJfSlSCU+c5HrGIuUooUkdLjOn8iCVjcKmFtgOVc8tjwne/jiWv5TMZAEEZYUtZb
	Kds+1PwlqEb44PqynFO7qqIKuNJz8Wtc69EdHJI+jrxE8Emo/sfklmocD4lbCcKJJdBu3bpXIs+
	eEYRZ4cKsGr8qMymvzciSXf9vWyuQHm9swCP8NadIiew2wktcj79aTEbrr+Oyx+Hvp+Ek2L9eGt
	w1rsm4Y
X-Received: by 2002:a05:6830:3698:b0:7d7:dfc6:e1d1 with SMTP id 46e09a7af769-7d9d662b9admr1937890a34.3.1774454218635;
        Wed, 25 Mar 2026 08:56:58 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e6fb2e11sm57802a34.3.2026.03.25.08.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:56:58 -0700 (PDT)
Message-ID: <1fdb5cbf-fd41-456b-a2cb-c270353cb871@kernel.dk>
Date: Wed, 25 Mar 2026 09:56:57 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <acQCDMhGqwhzLuzt@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 9:41 AM, Mark Brown wrote:
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

Christian... See previous reply on this.

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

It _should_ feed into there, for some reason their tree got added to
-next rather than go the usual route.

-- 
Jens Axboe

