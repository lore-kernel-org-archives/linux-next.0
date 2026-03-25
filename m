Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AAD3321BD
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463718; cv=none; b=oVxobLavMf7SxxLf9F0NEwRbT2gD6LJdWbbVGqACNaUp6BzmMbEgU38N9OZ3xvhZYe0xnpqaZfdBlBilryZoNVc5ynCHrrEC4IzUOROX9hJtRXcKU7QNl5Zhr58AyyT8BLDwyWQ+Q5PTPL9BhJXh6NutIPnRZi2ac2HLh83jExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463718; c=relaxed/simple;
	bh=x9QudzsaSySlqDc5nPdgEbsf8mngdFAQeCHc7GS74c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCN5yMqibeNYwOCNh7VsqHCRVKK58GrVdcNGca/LU1gRHq5d6K2gCJ8o9B2JhQDle/xiar5D8mpDKh4NbDVFM4B7fGKnM1gonsstchttLDE+uaRCnIA42p2SN8nrquDDsaK3y//uqopEE7XBem2VrIR2MrcQma5yQC77TLfRu/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MEkYcF1/; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MEkYcF1/"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d7ebe11bffso101772a34.0
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774463715; x=1775068515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL/aDbiIB/0bGDTPthx5vaevNPIm9qQu6Q67hGtSITc=;
        b=MEkYcF1/PqLPw9z4a84wT+mMEyVkC/SEbIMEWXd8sCgoxyZ4oOPpKZ1GP+W7chA4h0
         VdinSMyGUzfpiogW5l5dexq+mwwqiPduTT3tWptUDlw6JbX+5ODdxccIDCsBTJp+n0kL
         1ebZiWfF6cPFACSWsAJ0E3zjmGGzmXVwZ9GKWIL0l/uZK3ZujjhbglgI/Os/nlb8SQWB
         rDvoh0PouD6YoYZtoDu5HbT41sv+cNV3eKkyr2IzAqP7n63vm9i5ioaqxoDYJAOCyCRE
         1r4YivdmqO0qEQhM7BvArr9e2FGxUGM2xv7Xhbnzsb7OValHzLuEgwwj19c+z7MC26qI
         ahRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463715; x=1775068515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL/aDbiIB/0bGDTPthx5vaevNPIm9qQu6Q67hGtSITc=;
        b=sV+8Gxebi20jrwzffGul7uToadcKNucFZ42pTxDpp5FAdhgXfqs4q+SmHvhqlbYKb8
         rBq8hHMZFBetfTYgnqaqIPdX1Ju2FTmUVZQWTCkEeujac55VMPo3mpg6w8FWS88wsMC4
         wfrEkAl3Fls+LSth6NpQNSSQJvhB+ZZj4XzGY1VzzXygG2ZNDZlBrX7KBPgkgh722Wer
         +3rzNWdSne7OyX95MUpx8z7xgPhtKtt+2vtFsUwyHUuGCs1i/U6P1KNsSu/D4ez0d+sN
         4d9WTtkiFyN8AyoSUHiYGidWCqeJPafZew230WIjThQVFGUk1SHwX1btI3qQ8areGZ2x
         SRJg==
X-Forwarded-Encrypted: i=1; AJvYcCUnlby7CTae6qI4q0RqCFWKFdLRjhf/OGUnCmo/t4PhCVO+87/beWXHDbUoxazM3/X++qAKb04SkyTs@vger.kernel.org
X-Gm-Message-State: AOJu0YwSK2oThUYEjpniAaA8BT/c3vrbyw4NC+52u0IYlK8DQAEvFwip
	RXSjklHtk8yHfgMcAdmyhC2o5/xTKTUjqHusbBXXQ50hKR2/ybAvg8TIsJzkVVHxTz0=
X-Gm-Gg: ATEYQzzKyla6+V8CnIeQMbpZePqE1dhOHTDqjmvXvBBhc3OWE01B3pqzNr7KL9q6puA
	qp/DjO12b86pj3Nz1jbX/65zUXtrV2N0JS+0GMHiTPMfvMfP1GaObmD57iR46pocXn11X2oQOEQ
	9VsziIjokBzQ/srbZKe8uxBhgiidCfJmSVzcB0sL9oRj+5grTfqT3z90/1jlloogdVMWpvgjibn
	ZZhMZER+c8VlkDdB4Oinv4bkcuimHdVKghJ6HOdkIvH5KDntEGDa9GbzolZXHEL1Wm9J/iszfFo
	vIOj3WODrYamctxvjX2y4XQ+r235ql/ROSy4yzwxa3gH0j6rBOvAqvn4PN0OZ2rk3z+bSESCfr5
	NYvi/86A3GcqEZlIgTsczXoAqSNPDgIeI2047U/07UBynGLhKLHPOPtzuv9uySpbud329zdr0Eo
	rmlhh80POK5VdLQQ7CQs4xhO0lnYWnvr7ZfFGe8pOFizsYQS/1Awp1OcNl60H3vYQ1kO77NmX9y
	brFnB4Se+mvkczo1yo=
X-Received: by 2002:a05:6830:2403:b0:7d7:570b:6800 with SMTP id 46e09a7af769-7d9d6942dd2mr2361890a34.23.1774463714897;
        Wed, 25 Mar 2026 11:35:14 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e701545bsm359497a34.11.2026.03.25.11.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:35:14 -0700 (PDT)
Message-ID: <24fa5385-a09f-4850-ab5c-57fc718346e9@kernel.dk>
Date: Wed, 25 Mar 2026 12:35:13 -0600
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
 <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
 <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 10:47 AM, Christoph B?hmwalder wrote:
> Am 25.03.26 um 17:30 schrieb Jens Axboe:
>> On 3/25/26 10:07 AM, Christoph B?hmwalder wrote:
>>> Jens, how do you want to handle this?
>>> Should I send the (technically working, but maybe
>>> old-userspace-breaking) DRBD 9 patch series to you so you can carry it
>>> in block/for-next? So far I was under the impression that these patches
>>> would be too large and unfinished for the block/for-next branch.
>>
>> How about this - rebase it against for-7.1/block, and send the series.
>> I can stash it in for-7.1/drbd, which can go into for-next. Then the
>> separate tree can be dropped.
>>
>> I won't submit the changes in for-7.1/drbd, but just expect you to send
>> a new series against for-7.2/block when that is a thing. The 7.2 one
>> should be closer to going upstream, and so forth. Within a few revisions
>> of the mainline kernel, we'll get to the point where for-7.x/drbd can be
>> included in the merge window pull request as well, and we're done at
>> that point and future drbd changes will just get submitted against
>> for-7.x/block like any other block driver.
>>
>> ?
>>
> 
> Sounds like a plan. I'll send the rebased series this week.
> We already have a few "get it closer to going upstream" patches in the
> pipeline targeted for the 7.1 and 7.2 merge windows, but none of them
> are truly ready yet. So this approach would fit very well.
> 
> Exactly, once we are done with all this we will adopt a "normal"
> upstream-first dev approach again. We've already discussed changes to
> our internal workflow to make sure we never digress this far from
> upstream again -- I think that's in all our interests :)

OK, all on the same page then! Thanks.

-- 
Jens Axboe
