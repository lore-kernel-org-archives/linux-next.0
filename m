Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67A374183
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784732878; cv=none; b=rB0ZLn8XPiuLbPyjSWziXL7l5UlmwD+oU72USEwctkk9ipOcDEr+dBe/Uk0CZlzoaDdOqPs8fQQbrxo1UYFDy9GuVY5zc5VeoSAodVjrNSrItx8wzIiLTOdk0q9t0NQ0vDyTV63WTO+7xq+iu6M+eB9q2qPTbS4IZEpJ3c5lRdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784732878; c=relaxed/simple;
	bh=yiqkXYOzna117Aq9VwGx152ABG4qNJTBh6HI+2qIeTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvmvhE0Fz/KndhBqQv7ueDuqsOrOp7nWfoe9uQ7Z6WOAGHGWHejm1of5pY37VeLtmGgT3QSL8o8edx7y0ic0vFiC2h2yV13teMQEbdIkG0osHQQpog/5VmdwrdAsk0VcZ5Q+WxAMCg4CpVgCI88DeBpWq6BWCMMW7XrQAEo4vUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66MF7iGJ057995;
	Thu, 23 Jul 2026 00:07:44 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66MF7hO1057992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 23 Jul 2026 00:07:44 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
Date: Thu, 23 Jul 2026 00:07:44 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Alexander Potapenko <glider@google.com>, Mark Brown <broonie@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Cc: Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
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
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav404.rs.sakura.ne.jp

On 2026/07/22 23:19, Alexander Potapenko wrote:
> During that time, we would stop fuzzing the main net/net-next
> repositories.

I don't want to stop the main repositories. 

> I am afraid the only way to achieve that is to ensure the patch
> reaches upstream.

Yes, I know. I think there are two problems (technical one and procedural one).

The technical problem is that adding debug patches can impact performance
(especially when printk() is called frequently). We have CONFIG_KCOV in the
upstream kernels but we don't have something like CONFIG_DEBUG_AID_FOR_SYZBOT
in the upstream kernels. If we can assume that kernels built with CONFIG_KCOV=y
are not subjected to performance regression tests, I can try to minimize impact
by guarding with CONFIG_KCOV=y. But if we can't assume, I want a switch like
CONFIG_DEBUG_AID_FOR_SYZBOT.

The procedural problem is that developers / maintainers are too busy to respond
to my debug patches. Since I am debugging difficult bugs where nobody else are
willing to spend resources, this is an expected result. I am OK to post my debug
patches to ML. But without responses / interests from developers / maintainers,
this problem won't be able to make progress.

Just saying "Not my business." is not helpful.

