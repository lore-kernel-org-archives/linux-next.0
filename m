Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF38332D7F8
	for <linux-next@vger.kernel.org>; Wed, 27 May 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894008; cv=none; b=DlOEdZ1Gd5axpEKuaSxqfXTPIyMNcoOtCVY97TRLh6tDIaB3iYK5Rn4zUTLYpmKFMVbD2CcuaRr1ccuTqdpUa4NK3EuHXUOCPK7MPwn+TLhtkfeJVm0D9a+ARr2ReiNr3eHpKGjn5HneQU6mDhLeB7nXKdYUJmYcnaYTio8Q0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894008; c=relaxed/simple;
	bh=W6WhPVRO6ttAZZCOzwzG1k5gaQCk7jvT2zmQGpzO5iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUOqV2cInovUP/9TPpL2dnbUgQhwFr/2pFChDPXCcVyDVdpiKK6N5s1Cjg7KM0p8LaTDU6S4XUgZPlnvials1ObG/GVKKDfnaCx6hGu6WBo75SWgLXZaox+a9FT6WwR2oRgw77n1nAJpPp+yTVtovxatiPwbfx2qzDILBURXRJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=f5psM39H; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="f5psM39H"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcdd1b492eso11533015a34.1
        for <linux-next@vger.kernel.org>; Wed, 27 May 2026 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779894004; x=1780498804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhdKEt8RLrSHFZHMt1CU6xq88LShxo+BGCrAl1tL8fo=;
        b=f5psM39HIpU0XmTCmASo+f3SrCPNBbYnfDCI681PXUEGHG4ivysNVyx/E0O+yt/wUO
         oDC7YS3kTSm3YyDpCqyiCmWsW7SQtCvWALg1MojD+Xeja7olSzMFuqYl00SCwtH3Y+Cu
         dWRkmKMpSTwV0TLJgcCZJvddezacmt2pwGg1p3xePnU425AILtw8JLAyN74x2Dn+PZcy
         70eIJpgEdNCqkhRqrBltYhPglvVqisFksYZ1rVWJLUdRZrz71tKcHTiBqS9or3sl2meQ
         XQnPsbwWLvnWMyTA+feO7H/cA2X1Dk3DZcpY47B5x7xywZrIxdMNUh1zAWsQySOcp8M9
         ZuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894004; x=1780498804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhdKEt8RLrSHFZHMt1CU6xq88LShxo+BGCrAl1tL8fo=;
        b=NRGhQu1jBZX7Z0djKYYA4j1VI4NhMmWBmg9AWsfTXL1czbZunqqBjh/hwClnXn7Cm7
         o4RRTBHTNdJ2Fv1bW5fGKtE/PyjK5xdM+nAyVpMlB9gyUbAgVHDleomqtmnrfJikFQh/
         yOmtEbR4mmVX6nY06ef0oXnl88NvxdzSkL2tSKRAmSwQTT7PWmgLiAYfHQA3OkN/KI9v
         4LUAEbbPMusFPDml1A1J/5vflaklH+xrz7wjfCIBrxF2NHHJgtT69JyukGON9XttHnFW
         yrwPiKxfjC+NG4YDSkd7SIRRg8IZH2a2WSDQOrtJziDL6DNDD24GeMNc6YEr0DCWEqD/
         OKNA==
X-Forwarded-Encrypted: i=1; AFNElJ/8eXq7eRxHmhQMHh2kSpa6OdYmbt0RHypLfldXH2qWWK9jB9uot6JyGs/65g2Ye3DqzVaPVkbl56f7@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpUPJgMHeB3YlDbT8+YLfBneNHNSdlNv+6sqrIEvVWbN/qTon
	RZeSdS0CSzxjoK9m8xG4AU7G7XYMI/SMKcY+T+4VHBNmhZ+Q7JdiRqr2sMFi14eQWBiatutCFu2
	KFklUAiE=
X-Gm-Gg: Acq92OHLBQdE234lP0vNOJkFEyqDDcVlHRwoCrKA5MnE4Qq+kt86Pcng0ddcVTGssUw
	0PWjPWZKYmCVkVY+i9ovWuq8vtkjkuJu5LqRGG8BYYlCNZkvgSXGKjEuKTwkcGFSNwpaXXt/RVA
	xGmT1fu304s0GgZoDAHGB9pwXFSuqHjoJSL3VR1mx302wr8xjgcvmfZi6kSPvOfPS515MVaAvjg
	DaBh8Dp2Lau4ED+dLrAwM9Ft17gLk2vjCFp9BaZQSrBHz3sVGqjAUtM7n816Y3UdyY2sCaeMerp
	162LHUjWgqijHjPnxLzhnYe/rhAGhetTJbVSMSIKN5Ps2iX4Z3tygxXH6oxxeWj4VpPWMWAPfKW
	1JgSzyxo11dCVHs6on5aMvqJR+1xNu0y+DK/47CGSoB63taGvfsZNIFDkEnNmcuuFX0P6aecCH6
	8D9vMqGWZECuybdhmQOMfXgEFde+zeKoI5IEaILXg9jYy+I49NbjJ8XzQ778D5uhhZalCQd7cvB
	lV4++xdaK9LX8iTea0=
X-Received: by 2002:a9d:6a50:0:b0:7de:cf3f:1b3d with SMTP id 46e09a7af769-7e5ea37d7c9mr9991989a34.7.1779894004187;
        Wed, 27 May 2026 08:00:04 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606459f67sm11649519a34.3.2026.05.27.08.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:00:03 -0700 (PDT)
Message-ID: <3f516364-f281-4671-9890-bf00e7c5b041@kernel.dk>
Date: Wed, 27 May 2026 09:00:02 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ahb8y-KE12lOUIVz@sirena.org.uk>
 <a9f231c8-f48a-4743-97f7-6ce7f545b400@kernel.dk>
 <d2ba5386-03a7-41c6-ba67-b44ffa85e403@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <d2ba5386-03a7-41c6-ba67-b44ffa85e403@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/26 8:55 AM, Mark Brown wrote:
> On Wed, May 27, 2026 at 08:39:16AM -0600, Jens Axboe wrote:
>> On 5/27/26 8:16 AM, Mark Brown wrote:
> 
>>> possibly interacting with some rust change but I'm not sure.  I have
>>> used the tree from next-20260526 instead.
> 
>> Hmm, not sure we should let rust build issues gate whether a tree is
>> current in -next or not. For, by far, most systems, it's not a
>> requirement for a functional device.
> 
> That's also true for a huge proportion of the issues that get caught
> with an allmodconfig, and allnoconfig is not exactly a realistic
> configuration either.

While that is true, the big difference here is that everybody should
build allmodconfig themselves, but only a (much) smaller subset of those
have rust enabled/available.

> that come up in people's coverage tests.  TBH the rust stuff originally
> got turned on because I ran the allmodconfig on a machine that happened
> to have a usable rustc installed, I was intending to enable it at some
> point anyway.

I think it's good to have coverage, but I think it should be more of the
notification variety than a gating factor. For this particular time and
branch it didn't matter, but sometimes I shove things in there that I
absolutely need a quick test turn-around on. For exposure reasons. And
getting a -next cycle delay on that would be unfortunate, and I think
also unwarranted if the only issue is that the rust build broke.

Does highlight that apparently my build no longer does rust builds,
which it did used to... Something to look into on my end.

Not trying to start a debate, just voicing my opinion on the matter :-)

-- 
Jens Axboe
