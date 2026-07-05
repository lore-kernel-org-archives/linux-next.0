Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7371E98E3
	for <linux-next@vger.kernel.org>; Sun,  5 Jul 2026 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260970; cv=none; b=DMax0c1gg8VGayiu4ULgea8urNvNH9dlam+zndrlZmxuFAcrmas1rBMGZTwAG3OQI179kHIInDC5KAt9Z/syRp2+gpycLthHt1UxwJhwUlFkwkcG/DUjQ56gBDPlwSMUY8GAt+DYHYfd4gGQnCsT+2p15xdCxuFR5ginqAX4TJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260970; c=relaxed/simple;
	bh=bKtwCdTA0MBqxfev/reGTVCaaWHFROYluK50pqf0ccE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjeoGDCvu4X3UZowkFFyJOsgX15VKnp2pjKGF6JQQnovAuO1d+a1438WLDL2s7rnvr0Oa7QJQiAhq6v5gpL//QKsKZGOg2Phlz5ioACeXyCgZq2iXG2l31mOP1KuG8DdDoD0xPbKun9N8FgwsXwamAMMsBGOQ0kgyG0dI5tovqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 665EG6GT033940;
	Sun, 5 Jul 2026 23:16:06 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 665EG69W033936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 5 Jul 2026 23:16:06 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <4aecbe01-1ad8-488c-9a77-d5134def6f24@I-love.SAKURA.ne.jp>
Date: Sun, 5 Jul 2026 23:16:02 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Mark Brown <broonie@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <akpI0IIqgXCXmQhQ@sirena.co.uk>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <akpI0IIqgXCXmQhQ@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav405.rs.sakura.ne.jp

On 2026/07/05 21:06, Mark Brown wrote:
> On Sat, Jul 04, 2026 at 02:06:43PM +0200, Miguel Ojeda wrote:
>> On Sat, Jul 4, 2026 at 12:15窶ｯPM Tetsuo Handa
> 
>> For the latter, it simply says that sometimes debugging patches have
>> been added in the past to linux-next. It doesn't say it was done
>> unilaterally. (And even if it did, it is just a third-party document).
> 
> ...
> 
>> I understand it may be nice to use such resources, but the solution is
>> to talk to both sides, as you do in that thread. From what I see, they
>> even offered to add a mailing list for those patches:
> 
> Right, this seems to be something where people need to talk more.  It
> does seem like there's real communication problems that need to be
> addressed, it looks like some progress is being made thanks to this
> thread.

Yes, thanks to this thread. There is real communication problems.
Developers / maintainers are too busy to continue threads on my patches.
Let's see several examples.

Example 1: (not a problem with linux-next only patch, but a communication problem)

  Linus's "None of this makes any sense." comment at
  https://lkml.kernel.org/r/CAHk-=wjmFiptPgaPx9vY3RG=rqO452UmOAPb1y_f9GQBtuJVjg@mail.gmail.com
  made Mikulas to say "I don't know what else to do." at
  https://lkml.kernel.org/r/290bd5eb-9638-53ce-3c71-23b996d6ba54@redhat.com , causing
  https://lkml.kernel.org/r/329e1951-0704-4d90-aeeb-ffc7123f4262@I-love.SAKURA.ne.jp and
  https://lkml.kernel.org/r/9a05e50c-75c1-4452-b40f-f5a8b487f3ed@I-love.SAKURA.ne.jp to stall.
  We need clarification from Linus or response from Mikulas.

Example 2: (a problem with moving from linux-next only patch to networking patch, but a communication problem)

  I responded to Jakub's "Have you see netdev_hold() / netdev_put() ?" comment at
  https://lkml.kernel.org/r/20260325192214.133ffaaf@kernel.org but got no response.
  I need clarification or response from Jakub. If some core maintainer asks network
  people "Let's update all existing dev_put()/dev_hold() users to use netdev_put()/
  netdev_hold()", some progress would be made. No progress as long as no response.

Example 3: (a problem with linux-next only patch, but a communication problem)

  I responded to Al's "Not a peep in the logs, breakage still there" comment at
  https://lkml.kernel.org/r/ebceac56-6a65-4918-b47c-1fb87aa66989@I-love.SAKURA.ne.jp
  but got no response. Therefore, I sent an updated version
  https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=3ae78a69d3a9a4ad1d3b267324bd742654f40965
  to linux-next, and I am currently waiting for syzbot to reproduce this problem.

