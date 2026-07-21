Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE9374186
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634548; cv=none; b=P5GizBeVIivBT50iwdThRme4cvv2BozVvtjkRMjdNhFEj1zwDkGhVkeW5WctpzERCN8NxpskXCgDGfQe1lv74bY5FLtmmszzeJ0B5Ap1fdTbQRPVcpJ+zj0s89BBOC4PxbCI5vPfQwOMzFN1Ovmt1GyLFefS8sulRzBfiPmzx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634548; c=relaxed/simple;
	bh=A2z++gxupEIbeOSE4vildMcYhSVjHi+aD0FEEGg5SOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwX5dLX8xNi6xxDdqqa/1obB3m1JrfVBPhSX0tvCWto5SW8XCuqb6ktda38LeLwIeIlJvjUbfYBUJiBH0tTutdDBBIb5xnbh/1BctPz6m0+N1R+FSsr8WW4kV++SP0tsDDZ8n9rVk+jVQeGoq24k9hsRfxmBOQ8kUPULdqPdKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66LBmvb7064678;
	Tue, 21 Jul 2026 20:48:57 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66LBmvhi064675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 21 Jul 2026 20:48:57 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
Date: Tue, 21 Jul 2026 20:48:56 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Alexander Potapenko <glider@google.com>,
        Aleksandr Nogikh <nogikh@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav204.rs.sakura.ne.jp

On 2026/07/21 18:38, Alexander Potapenko wrote:
> Hi Tetsuo,
> 
> You can send patches to syzbot@lists.linux.dev.
> 
> E.g. I ran
> 
> $ git send-email  --suppress-cc=all --to=syzbot@lists.linux.dev
> patches/kcov-tetsuo-v7/0001-kcov-fix-data-corruption-and-race-conditions-on-PREE.patch
> 
> to test your latest kcov patch and got the results here:
> https://ci.syzbot.org/series/33930a89-bb2a-4c5a-b6c5-d45829d5c94c
> 
> The fuzzing ran on 8 VMs for 3 hours, and there were no new reports.
> 
> Please let us know what you think of this workflow.

Unfortunately, 8 VMs for 3 hours would be too little to stop my linux-next only patches.

syzbot took more than one month in linux-next until I was able to report
https://lkml.kernel.org/r/73ed3aa5-f6e1-47b6-9e5d-428ac1f4cbf3@I-love.SAKURA.ne.jp .
I could have reported within 24 hours if all VMs (I don't know how many VMs are assigned)
for networking trees were tested with my linux-next only patch.

syzbot was not able to trigger
"BUG: %s/%u is doing I/O request on loop%d in Lo_rundown state.\n" message
using https://lkml.kernel.org/r/30ccdd3c-6353-4a0f-bdc7-230ec3bf4765@I-love.SAKURA.ne.jp
in linux-next tree. syzbot could have triggered this message within 24 hours if all VMs
for upstream trees were tested with my linux-next only patch.

What I want is a workflow that can test with patches for many days and many VMs.

