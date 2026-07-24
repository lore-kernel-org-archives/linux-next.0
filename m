Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AF2F7EF9
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903744; cv=none; b=DlqopfTzwCcPc5LyeX6x8+l1rrKU4hgwMjAbvOQC1HyVbxm1LhYVvnOK88bqxPH/FKGuZ/q4e+lQa0Lq4e3yNChhz+wczaeXry1izSoyRksYfYLK2EG+8ymRdlItJvsNvDSfs5Znik1O+WNo0YXI4lKnnp7tVQ0gWZ2LsZxOEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903744; c=relaxed/simple;
	bh=6xYtT2OcTA4oORutzBm7cIPdifITflG9fnL9YkFsWM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+YH4WpfJ8jXwxb/mrV4UbTfPLTC6faYxJIhX6aF5MpxW4IMxlny962elr9JQYry3VWLQVoroUdLTwGnMqGODFQp1yg1LwFNHs5qAeNXmQdTBXIrA91khSwtRm/dBV7t3jPRwSWfKyMNROrpI4VxDifXFd1EIRDk570EDetCE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66OEZeK5037853;
	Fri, 24 Jul 2026 23:35:40 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66OEZd1a037842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jul 2026 23:35:39 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
Date: Fri, 24 Jul 2026 23:35:36 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Theodore Tso <tytso@mit.edu>
Cc: Alexander Potapenko <glider@google.com>, Mark Brown <broonie@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <amNsDFyTbsyAASjt@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp

On 2026/07/24 22:50, Theodore Tso wrote:
> On Fri, Jul 24, 2026 at 09:11:27PM -0500, Tetsuo Handa wrote:
>>
>> What is happening is that I am using tomoyo git tree as a hook for
>> executing debug printk() (using linux-next git tree) in order to debug
>> problems which syzbot has found but nobody can afford looking into.
>>
>> Individual git tree is not served as a hook for applying debug patches
>> like "quilt push"; one of reasons is that "git" (compared to "quilt") is
>> not intended for removing a patch when that patch became no longer
>> necessary (due to problem being fixed).
> 
> Ah.  In that case, what if you simply have a separate tree which just
> has these debugging patches, and then either Mark Brown or the Syzbot
> team could create a new git tree / branch which takes linux-next and
> then merges this debug tree on top of the latest linux-net?

Yes, how to apply debug printk() patch will be solved if there were git
trees which applies debug patches on top of linux.git , linux-next.git ,
net.git etc.

But there is a potential problem. Developers might not try to look into
downstream git trees. How many developers would "git clone" when syzbot
reports an issue found in git trees with debug patches applied?

> The only question then is how much does the Syzbot team is willing pay
> to help provide the resources you need to resolve those syzbot issues.

I wonder whether it is appropriate to call "syzbot issues". syzbot is
finding bugs in upstream git trees. Unless the cause of a bug is either
syzbot is doing a stupid thing or compiler/toolchain is broken, it is
"an upstream kernel issue".

> I will say that *my* particular management chain at $WORK has
> authorized ignoring a whole class of syzbot bugs because they are
> utterly irrelevant for our production environment, and so it's not so
> much a "can't afford", but "has insufficient business value relative
> to our budget / head count authorization".

Yes, that is the biggest issue.

Those who hate my attempts (i.e. sending patches to linux-next without
being reviewed/acked by maintainers) are expecting that any patch is
reviewed/acked by maintainers. But some maintainers are considering bugs
reported by syzbot as "not worth looking into". Therefore, not only
debug printk() patches (for bugs found by syzbot) but also bug fix patches
(which syzbot has found) are getting ignored.

There are many patches which are not promptly applied into relevant git
trees. For example, syzbot is still using linux-next-20260714
( https://syzkaller.appspot.com/upstream/manager/ci-upstream-linux-next-kasan-gce-root )
despite the latest linux-next tree is linux-next-20260723 because e.g.
https://lore.kernel.org/all/al1pElMQZsDfpAYI@michalis-linux/T/ is not yet
applied. There is little effort in the community that "we try to make it
possible to continue fuzzing the linux-next.git tree in order to find new
bugs as early as possible and fix new bugs before it reaches linux.git tree".

In other words, the interest (by the upstream Linux kernel community) on
fixing kernel bugs which syzbot found are decreasing. This is a deadlock
situation, and just saying "Not my business." is not helpful.

