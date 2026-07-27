Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B1411F9E
	for <linux-next@vger.kernel.org>; Mon, 27 Jul 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158382; cv=none; b=FxuavjL0xxkmyH++9LaJjTSkcIunEDXuCZAoLWhZkeXoeFvLu+Yxx5YGYSvNjZfyNMbA6lhXitEBopFR2nESOqiI/+dWPhe0aPRODF1eDXrIXbbdfvjAf0PuJkjkT10jLjtElffJLdJg6SRHXtDfrnq3vV/KRZ6vkGc36hTO/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158382; c=relaxed/simple;
	bh=AUkjzg+qTs9Zmv4wuTl2SJbFyp+FXHp+S1m2B9zAg/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjHAsJLMWhZjGadZa9+30xMAOsyXL+JX101jjwwfHrwCARKt//T7gSsMSc+QH0i4sXt4SIraAMWqcb/9CTHtQQZ8IjF/oYyvDuMcfkRncNHbggwi7FdJh8HHBKoUYXWgm30A1iDzgC+lCCQba4RGHaRnn7hvrf63FLZjqZQkC/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66RDJU6q056491;
	Mon, 27 Jul 2026 22:19:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66RDJUFZ056474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 27 Jul 2026 22:19:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
Date: Mon, 27 Jul 2026 22:19:26 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav203.rs.sakura.ne.jp

On 2026/07/27 2:49, Mark Brown wrote:
> On Sat, Jul 25, 2026 at 12:44:17PM +0900, Tetsuo Handa wrote:
> 
>> Excuse me, but what does "successfully unit tested" mean? Broken patches
>> that do not build, or trigger oops by just "/bin/cat" _are_ arriving at
>> linux-next tree, which in turn preventing continuous testing by syzbot.
> 
> You're supposed to make some reasonable effort to ensure that things
> work, if you break things badly enough and pay little enough attention
> your tree will get kicked.  To even get merged in -next on a given day a
> tree has to build in some of the more common configurations, and not
> break KUnit.  It's not expected that everything will be perfect, people
> can't be reasonably expected to to test all possible configurations - a
> big part of the point of -next is to pool coverage - but it's expected
> that people will be making a reasonable effort.

You and I are talking about different topics.

You are saying that I should not submit patches that break linux-next.
I am saying that maintainers are submitting patches that break linux-next
(and then stop responding after a breakage was found in linux-next).

Some maintainers respond quickly (e.g. remove problematic commits from the tree)
when syzbot sends a report that there was a build failure or boot failure with
linux-next kernel, but other maintainers respond very slowly.

For the latter example, syzbot is still using next-20260714 because a maintainer
who should accept/reject https://lkml.kernel.org/r/al1pElMQZsDfpAYI@michalis-linux
is not responding. As a result, syzbot is unable to test changes made between
next-20260714 and next-20260726.

Since one of purposes for linux-next.git is "find bugs before bugs reach linux.git",
being unable to follow daily next-YYYYMMDD is annoying. For example,
https://lkml.kernel.org/r/1a9f53d4-6f48-4df8-a3d8-2b0e442a163a@I-love.SAKURA.ne.jp (which
caused a rust-next breakage while trying to find possible fix for this problem) was not
discovered immediately because syzbot was unable to test next-202604{03,06,07,08,09,10}
due to a different bug. This problem was introduced at the worst timing (i.e. unable to
test around the merge window), and maintainers are not responding.

To minimize period of being unable to follow daily next-YYYYMMDD, I was sometimes sending
linux-next only patches that disable specific module under CONFIG_DEBUG_AID_FOR_SYZBOT=y, for
we can't predict when a maintainer responds to a build failure or boot failure in linux-next.
But now that you want me to stop sending linux-next only patches that disable specific module
under CONFIG_DEBUG_AID_FOR_SYZBOT=y, my question is what we can do to mitigate this "being
unable to follow daily next-YYYYMMDD" problem.

