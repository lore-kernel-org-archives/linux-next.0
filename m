Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FA9389111
	for <linux-next@vger.kernel.org>; Sat, 25 Jul 2026 05:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956833; cv=none; b=FgLNhfQREuCb/hqE0iQZnnq/hcc5/I/txaZnTxZT7siLCqewFsfI1zrUGooY4VS9thix+gq4fqUXxLh8TjY/hiVumXW40DcdHsuK3qw2R85FFyIcd7zxjYwf2dQ3i2aHYIVcywqXr8DkCTb2qSEvqNOxDRlewgTq7ktVEVOJO2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956833; c=relaxed/simple;
	bh=AMU7Ri4ZT0+oQAVip7d44Mlpao+8ycC8iU24Ai7oiXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsyejFh40j8xecEQi9MNZTBLL1Pp2U55PQbuAXDZWRDCIWLXNHHeLwayDtq3K8WBsGijGif9HKvTKnPsRArEmwhJ42B1mvz0MUu1nA3cXKIKqjg0zq8mI2AouLcYlttn0kB0aL7zHZUjbisiyMf3ZNYKbmc9KnLSuhXRivyMEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66P5KT0l043815;
	Sat, 25 Jul 2026 14:20:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66P5KShZ043812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 25 Jul 2026 14:20:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c0272e64-a849-4fe0-8131-ecf6c724f558@I-love.SAKURA.ne.jp>
Date: Sat, 25 Jul 2026 14:20:29 +0900
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
References: <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <amN5Gu2J5mILKs_j@mit.edu>
 <7250a5ad-ec2d-4852-af56-9c1c653d24c7@I-love.SAKURA.ne.jp>
 <amPGflb7w6RcOO1M@mit.edu>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <amPGflb7w6RcOO1M@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav203.rs.sakura.ne.jp

On 2026/07/25 6:05, Theodore Tso wrote:
> On Sat, Jul 25, 2026 at 12:29:27AM -0500, Tetsuo Handa wrote:
>> The problem is that a maintainer who has the permission to
>> accept/reject patches tends to become defunctional when syzbot is
>> involved. What actions can the Linux kernel community take in order
>> to address this problem (instead of just ignoring developers who are
>> trying to fix bugs)?
> 
> Fundamentally, not all bugs are worth fixing.  And if you believe that
> all bugs are worth fixing, you need to convince companies to **fund**
> that work, and not leave it as unfunded mandate.  If you give me some
> minions who can be dedicated to help fix bugs, I'm certainly willing
> to provide technical direction.  But there's no such thing as a free
> lunch --- and the business case is not as clear cut as you seem to be
> assuming.

Have you ever seen https://syzkaller.appspot.com/upstream/syz-dungeon which
ranks contributors (kernel developers) based on their achievements in fixing
bugs found by Syzkaller? You can find that I am the second top contributor.

Also, my activity for fixing bugs found by syzbot is not my $WORK. I am working
on those bugs using my private time. I am neither working at Google-related
companies nor a member of syzbot team (who can change kernel config for syzbot
kernels in order to help syzbot continue testing).

> 
> In essence, this is a cost allocation problem.  When you ask for help
> from other maintainers to fix something that you care about, if it's
> not important to them or their company / management chain, you are
> dumping costs from you to them.  This can work if you can also help
> them in turn in other areas.  This happens all the time, actually, and
> it's what makes Open Source work.

That is wrong. I make not only debug printk() patches but also bug-fix patches.
I am asking for approval from maintainers to fix bugs that syzbot found.
It is really annoying that maintainers keep silence for unknown reason
(maybe they are thinking that "I don't care about this bug"). I can't make
forward progress if maintainers keep silence. What are the maintainers for?

At the panel discussion in LinuxCon Europe 2011, Linus Torvalds has said
"the average age at the summit has risen by one year every year"
( https://lwn.net/Articles/464530/ ). If maintainers are there to let
developer's effort be sent to /dev/null, trying to contribute is waste of time
and new developers won't grow up.

> 
> So I think the way we solve this problem is by finding ways to
> allocate the costs to those companies or organizations that think it
> is a good fit for their business, and to reduce the burden on those
> whose company (or management chain) doesn't think the business case is
> sufficiently compelling.

Not all developers have enough money to pay to companies/organizations.
Some developers (including me) are contributing by spending their time
instead of paying money.

Your statements sound like "Poor men/women cannot participate into the Linux
kernel development." Please don't assume that everything is controlled by
"who pays the money?".

> 
> Other solutions might include finding some AI solution which can
> filter the low-priority quality Syzbot reports from the high-quality
> ones.  If some companies or some departments may have different
> priorities, perhaps they can use different filuters, so they can work
> on those bugs that they think are important.

syzbot already has a priority filter. But trying to make patches based on
that filter will result in a waste of time if maintainers are not responding.

Please respond to syzbot-related patches. For example, if you are not
interested in a bug syzbot has reported, respond to that report like

  "I do not think that this bug is important enough to fix. Therefore,
   I won't give you Reveiwed-by: nor Acked-by: even if you propose a patch."

. Then, the developers can consider what to do. For example, use a different ML
which handles unloved patches, and make it possible to send the proposed patches
to linux-next and linux without Reveiwed-by: or Acked-by: from maintainers,
unless Sashiko finds a new problem introduced by the proposed patches.

Current situation (no response from developers / maintainers) is a deadlock.

