Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258A3E6DE3
	for <linux-next@vger.kernel.org>; Thu, 12 Mar 2026 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330458; cv=none; b=DblANZPF0wBnlU+ZGSB4ASG28lnN5WaWGJDZm8WuujBjIFfudRNqIG1Pbh9bUhyyhIvl00LkN9EBjfsL6ifxFxZFk/afcSDtHwtpq8zJGxbbEmb6NIP9BUSmLpsQt+3GPxGDdb7MVIyEEslWK2jSTxz0v1o+tbSkG1oudk2ztp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330458; c=relaxed/simple;
	bh=Z86+A8JRng7UI2sF2Tua+R88v0ug0pwspifJ/PNCf28=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=UV7IPHONhPZgLEU9hJNKqCmSc401nPYEXAL/Ib3SisSAyQwKJQILpggEDH4wrmTlgbVrOgwiiV3AwAmlGlEd7G3Nxshe8A21gjA5wy355/TxlA+cNx3L+QgAQebACUAFzV98e5CWm6+YUtVFCS7Co90U8753wrjhOlmxT8MqzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqPu6mhn; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqPu6mhn"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso533681a12.3
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2026 08:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773330453; x=1773935253; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D885OaMthHKzMazfSmWLjhSizdtYPijabBVqN1Os/BE=;
        b=LqPu6mhnKK1TDBKEOSkdpxYoNOUohdhgI2YvQcmdU8a7tLxho0GkvhfDGDITWR6iaN
         3/5jtCVR/tmFlDr+CoiG5Nef1S+poILn5dgLmBXbNTvjj2lEO5PqqJfK/Ql8Laol7ACJ
         kyFAIgm1ZVGc0WNrY01cnwhGNj/oi2Wjj7I79CXc5VB+LbBEpmpgPtr1uGb3xDMJkDGu
         fSdS+Ci7vJ7cQaQknG7vyso+9kWdQ1xkGU4PdKndDWswsqk6GC9eHyzwcWaDrdB31mnA
         wr3wbB+fg7FpR27vSF0CE4lWtch7k0svxOqNhmRjgSePEOQbu78/LqPIqDpshsRDSbGg
         SPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330453; x=1773935253;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D885OaMthHKzMazfSmWLjhSizdtYPijabBVqN1Os/BE=;
        b=OFX1vk0asYiIJo9gfB3iDcGBRb7FWTDrDqR5UmeuNJxsG/z0a/rag4jvR6FJpGDYPj
         6qRtc8Gmo6RspX2sZehEmZ6aFGDWBAE0vkGasi7RRUE8jnKxIaSDQ66V50EheDmk8HCe
         bLLaTZzmAbSLZkj6vrSh8Jwkdv2frMsXlWYJe7/2WoySheN5oxpPj0k6dJWkNfMfb3Ae
         93f8HUAlsoYyAfh8VdhrtudVA0WnvX6w/K9rBvkhqWQzPkMPn8W9lJgm+bCB1CjiQDes
         rcfUCuIlspVZsDbv4de3EZqPNgI5bKz+APDBcuDEZDTH4hlUYDeIlWauedsIcVx49iIn
         npQg==
X-Forwarded-Encrypted: i=1; AJvYcCUSuA3FBeqWZwxNnoo2sFBPfLd8Z2zzFcwVSkRzluD/s++WlVIJRsX8cJKaKD+/ToahlqZCwogTMLku@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4/Sl/+yS/aVdUiUEG/WrK+z7zBGtWWbkpXha8ppPaG6PNSnZ0
	LJoSE1DnMvZ5otmIasymiWxYTNys+9BwTsaLI6cf480pKIT47YPe2ta6
X-Gm-Gg: ATEYQzzFMdV+WKoXm8dQgn8U9HjT5yefzVWr3vUWxffma/soUQmfb3qKx5FJgHM4oJk
	5dV+XRDGkVb6OiY42X5APpq4Zd7WwJ2RWa48Kb3FDIwZefUvPbLLnvJ0xdAfEf0BXayPSNr/wPQ
	1yawX3OhJB5OM+pheJgxAg6rssUWj+clamMxRGvmWoL6TItnltfuZm426Qwa+kmPSmHgzSgqfSu
	p8VL49Ll16QuOB2cQkSPqqk9AgXHCZI5fJhwXNYQAo+fjwIJ50dHTMV0bGEVSZTIa/W7y3NUT5X
	4tmsjN4sIHmBKkctl0/bTahEGnc3eJV8tDXwGJHOJBny+Y1c24wp8T4pxb2ySulS2bVsPOBZOII
	4+gcyJLo8OfRBUMOp1AXFKYMhhzQTVY48BOHW+72eXWSptG1nnxgxsnW1jDjIUnUkxpUB9bCm39
	8uWDXp3kb8zWMIJ7sGcd+4zA==
X-Received: by 2002:a05:6a21:6e0c:b0:398:a71b:a0f8 with SMTP id adf61e73a8af0-398c5ee81femr6563496637.14.1773330452717;
        Thu, 12 Mar 2026 08:47:32 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf0e5afsm5678092a12.2.2026.03.12.08.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:47:32 -0700 (PDT)
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Mark Brown <broonie@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ojaswin Mujoo <ojaswin@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, willy@infradead.org, yi.zhang@huawei.com, jack@suse.cz, tytso@mit.edu, linux-ext4@vger.kernel.org
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <0d21783c-5299-4488-9708-def0b1a4dcbe@sirena.org.uk>
Date: Thu, 12 Mar 2026 21:13:47 +0530
Message-ID: <wlzht5n0.ritesh.list@gmail.com>
References: <abBizpKaBlTZSYh6@sirena.org.uk> <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk> <20260311103743.GK606826@noisy.programming.kicks-ass.net> <abF9Ti4pTYnnsMdq@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com> <20260311160904.GP606826@noisy.programming.kicks-ass.net> <0d21783c-5299-4488-9708-def0b1a4dcbe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Mark Brown <broonie@kernel.org> writes:

> On Wed, Mar 11, 2026 at 05:09:04PM +0100, Peter Zijlstra wrote:
>> On Wed, Mar 11, 2026 at 08:03:50PM +0530, Ojaswin Mujoo wrote:
>> > On Wed, Mar 11, 2026 at 11:37:43AM +0100, Peter Zijlstra wrote:
>
>> > I believe this issue is resolved with [1]. However, I think this might
>> > not be the same as the issue reported originally as we the original
>> > issue seems to be in mballoc-tests rather than extent-tests. I'll try to
>> > look into it a bit more.
>
>> > [1] https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df57473be8.1772381213.git.ritesh.list@gmail.com/
>
>> I can confirm that solves the KASAN splat; it also cures the defconfig
>> hang that was initially mis-attributed to the mutex patch, but turned
>> out to be memory corruption due to that issue KASAN found.
>
>> FWIW:
>
>> Tested-by: Peter Zijlstra (Intel) <peterz@infradead.org> 
>
> Yes, that seems to work for me too - looks like tip just triggers it
> more aggressively for some reason:
>
> Tested-by: Mark Brown <broonie@kernel.org>

Thanks Mark, Peter & Ojaswin for testing.

++linux-ext4 so that if someone observes the same issue in ext4 kunit
tests, they could find this discussion on linux-ext4.

-ritesh
