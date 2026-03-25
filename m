Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE0A3E9580
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459994; cv=none; b=qDU4zyuhoLphJjDgzWz7DOohdwHm3oHu3xP7GlfcJ/xTWbaL8i40dnCPb0z3fG2KO1qisDBzjPcbtd+niKlx7OVxGdTupq/HyvBI70oHqBdlFQ2eBoFnw0kTRWyDgncVkfmw6KqkXnvpEsbXQqRLeh+uYNrhCsDX4mQrqvHb0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459994; c=relaxed/simple;
	bh=6mC6rnROd5UC1Xykedq/XYApI5Pw9LFgMLHdSq7X8X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qq2F/iYUPaY5CjX1xf569q9bJPoNt4GdbqM+5+VAvMDf+oPl9ne4V32nvqktxoaT8o5Wk8zulTb/rjwlfI/S7G2mlw2C1lLbowdehsea4XedOGe+YJbBIUzPHm0bE9WGNHHJHDhqEOuXN+QmFyRLsp088p3P0mQTAvSZVYqK1NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=FW+Rdcof; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="FW+Rdcof"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-487012ce896so767355e9.0
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774459992; x=1775064792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sZ1KbtfZr+zgwPW/a767v1N740zE1aNzyInaMTvgi8=;
        b=FW+Rdcof60Rhq62Ojg5gycHGEFybdRqQf4jJuif5v7g7GzEy83Xa/V0syrFwsd9CVZ
         o9cdT1L2H7CvTjjjMHlHpUPKSjSDyJa/sIfFEYlfyJtMYqOL9Dgtj76gIN0KHuipZTe3
         A/V78pPvvqvyrc2u+oT43qovTH/48CoJ5/ZlMVryAVEnAx2nm8RE6nyNlgRLHcgOttoS
         dTJClTfjFJSEfZJsC0VTtmfECXho+58pxbDP/b3C3P1c3LbnKVrckFLrVjC6f0lWiEbR
         6HkDylfk9xhyrmgcESgu7TZjtaoZe9+OiyV09Q29G2T4YoaHnGitLSzF0CoZnjJZEKFk
         Kqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459992; x=1775064792;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sZ1KbtfZr+zgwPW/a767v1N740zE1aNzyInaMTvgi8=;
        b=OW15MaqsLX4OVEuywS20KGymL2VbvWBgHNrnzxRDOkwvBoBS/yTGmmPFkDMcyJtGdp
         1E+wUK3CBbY+7yvGq2TigH7nIAYPwoquw0R0yg2h99Bde9Ykw44WOlDalzc8RPhudsdh
         +12WZaAZhf8LRAOXBuBz15f7ElaTI7kMKGquAMHjdfxlZvlVhk/0thLkvWQnLFOqv8wH
         /Ft1IUZ9ailT/2dj8loCAf8i+h5APpyqb2DpmH5q8ERFint/D2170VodIOXt5E9mci9C
         AAcO8BZ4ZbU0EE4VbozrVmUBhcRHk2kvFmygjPtw19CoSbWcxsosagxWcwKt+1nmQZ69
         7EIA==
X-Forwarded-Encrypted: i=1; AJvYcCWRPsL5EIRgVKIkBGd83kLR6SRcb5Rsj83zNmOOfN3Ynr92GQHOjWaDvq1/7ynA+howSe37vXtogFxO@vger.kernel.org
X-Gm-Message-State: AOJu0YxV+iDYg/jQ6H9zepPyQ4vygnp4gopI3+mVJtz+9ciA2HgR+YCU
	3WNuqc/Jbd/+o31tPQv+WaH5JWkM1cxNhRTChTK16C6o43LFOr430t5X7PrpgS7Zau8=
X-Gm-Gg: ATEYQzzOC7G5UvIEStQ5CCEHCCx1K9JoPmmeSG3paPzixekJ1OMd9M71eCJ2acqSP/e
	dBwqO7XX5qoJW/qhaQGfclmJayDwsvFX3WY4vRTQsePQtRMK8RvPtMpMBAABsade4loOvN++sZY
	AaRVTH6vsho9LPUGixyXOgjvduW/1M17mPjSyFGpEAyCXTNdwj9SNMtfBQBoTUWrMF44MwOouhy
	1nk8RD+ZdD6oJYeZn+4ROw8/UZ8os5lIwHRSvdoXRhN64vXcQGswZecOJEII4ZbfnCxDi+yYcn9
	iNSCdT7GcsdWAP7+nSkJDJATAXL/Svlo5+qVaL+CLvOtlDzWJr2DU4HE2qzkM1dM2Dhuq09a5Np
	Q4glYS5goPx9xxEPN9dEvL6X4kcMeu3eWcxoAMuK4+qvp6GjFBV4QAcLUtLs+RiaBwE3fH6irVv
	8J71HMFBqBKhqy1jvUsTqSJO1QOHI/ARfZfkRnTN+ZTKpDSYZHpCrdgoxO4XLLwIREvfZkrof+B
	POa6QH7K2IFHXA=
X-Received: by 2002:a05:600c:5296:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-4871605ceb5mr68310965e9.16.1774459991563;
        Wed, 25 Mar 2026 10:33:11 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871e5ec987sm8271955e9.4.2026.03.25.10.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 10:33:10 -0700 (PDT)
Message-ID: <ea26bf6b-ad04-4d7e-9f6a-bdbbc8acf594@linbit.com>
Date: Wed, 25 Mar 2026 18:33:09 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner
 <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
 <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
 <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
 <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
 <be3cce14-c069-4325-b093-12dd26892119@sirena.org.uk>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <be3cce14-c069-4325-b093-12dd26892119@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Am 25.03.26 um 17:57 schrieb Mark Brown:
> On Wed, Mar 25, 2026 at 05:47:34PM +0100, Christoph Böhmwalder wrote:
>> Am 25.03.26 um 17:30 schrieb Jens Axboe:
> 
>>> I won't submit the changes in for-7.1/drbd, but just expect you to send
>>> a new series against for-7.2/block when that is a thing. The 7.2 one
>>> should be closer to going upstream, and so forth. Within a few revisions
>>> of the mainline kernel, we'll get to the point where for-7.x/drbd can be
>>> included in the merge window pull request as well, and we're done at
>>> that point and future drbd changes will just get submitted against
>>> for-7.x/block like any other block driver.
> 
>> Sounds like a plan. I'll send the rebased series this week.
>> We already have a few "get it closer to going upstream" patches in the
>> pipeline targeted for the 7.1 and 7.2 merge windows, but none of them
>> are truly ready yet. So this approach would fit very well.
> 
>> Exactly, once we are done with all this we will adopt a "normal"
>> upstream-first dev approach again. We've already discussed changes to
>> our internal workflow to make sure we never digress this far from
>> upstream again -- I think that's in all our interests :)
> 
> So I should just drop the drbd tree entirely from tomorrow?

I guess that would actually be the easiest path then, yes.
Sorry for the churn on your side.

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

