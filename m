Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD3346A11
	for <linux-next@vger.kernel.org>; Sat, 25 Jul 2026 03:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784951062; cv=none; b=GifKz2BV959bG9stbTHmPKdFGFHinlKQZhT5CD2eHAcwJ+FU61vWzejg1jZk3M6ehG1URO2g4DLulQ7yN8LwrenDWvDiGlAhbbuF368JLSvN8uV9r2T6+UaKCy7g6kxQZceREuNro0k3yp7tZju+b12oME5jxAO1eyp7K2STvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784951062; c=relaxed/simple;
	bh=swc7tVOm9IA+Xf2gZV9k6lcCJeja8Q+p35D3Z56fmMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deC/g3c0ndYE7Q/HzR8qBTpG6gP9DSzSRabrbYQtu1n8Jkh/qdHn8wSXsNpTOBbB8GteIFOQJM9IKvIVG2tvWAZghAEhN7d4qdytBUl5xnDPdrSIMAvIIIq5T6dpkOb9xQ/8zPa/DQx06zt1cbosn1VWI4XzHa/D0z26qm4AK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66P3iHaq023059;
	Sat, 25 Jul 2026 12:44:17 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66P3iGTc023056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 25 Jul 2026 12:44:16 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
Date: Sat, 25 Jul 2026 12:44:17 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>,
        Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav301.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/07/25 2:49, Miguel Ojeda wrote:
> On Fri, Jul 24, 2026 at 4:35 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>
>> Those who hate my attempts (i.e. sending patches to linux-next without
>> being reviewed/acked by maintainers) are expecting that any patch is
>> reviewed/acked by maintainers. But some maintainers are considering bugs
> 
> It is not "hate", it is just the linux-next rules:
> 
>     "
>       * submitted under GPL v2 (or later) and include the Contributor's
>          Signed-off-by,
>       * posted to the relevant mailing list,
>       * reviewed by you (or another maintainer of your subsystem tree),
>       * successfully unit tested, and
>       * destined for the current or next Linux merge window.
>     "
> 
> That is why nobody is expecting random patches to appear there --
> because every maintainer receives those rules when they add their tree
> to linux-next.

Excuse me, but what does "successfully unit tested" mean? Broken patches
that do not build, or trigger oops by just "/bin/cat" _are_ arriving at
linux-next tree, which in turn preventing continuous testing by syzbot.

e.g. https://lkml.kernel.org/r/83eb9325-9688-4a6c-9727-e137df773694@I-love.SAKURA.ne.jp
     (and I was using
      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?h=next-20260702&id=110ef9f94f84d425ab55d09b2d70ed12ceffdf08
      in order to help syzbot continue testing)

e.g. https://lkml.kernel.org/r/ee4992b1-06ce-40f9-b554-bfcadd45cf97@I-love.SAKURA.ne.jp
     (and I was using a linux-next only patch which disables this module for syzbot kernels
      (link to this patch already gone because this patch was more than 3 months ago)
      in order to help syzbot continue testing)

Also, WARN*() is abused just like printk() for catching oversights rather than
introducing grace period for confirmation, which is also preventing continuous testing
by syzbot. Sadly, developers/maintainers do not think that WARN*() is effectively panic()
for continuous testing systems. Unless developers/maintainers can apply all necessary
fixes within few days, WARN*() should not be used.

e.g. https://lkml.kernel.org/r/5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp
     (and I was not able to use a linux-next only patch because WQ is a core component
     which cannot be disabled for syzbot kernels)

The latest one seems to be https://lore.kernel.org/all/al1pElMQZsDfpAYI@michalis-linux/T/
     (but I am not able to use a linux-next only patch which disables this module
      for syzbot kernels in order to help syzbot continue testing, for I currently
      have no route to help syzbot continue testing)

> 
> And those rules make sense -- adding patches that are not ready or
> unexpected can confuse others, break the build, add conflicts or,
> worse of all, silently invalidate testing of normal patches going to
> Linus.

I am OK to post my debug patches to the relevant mailing list. But without
responses from developers / maintainers, my debug patches won't be able to
find a route to linux-next, which in turn prevents us from debugging.

