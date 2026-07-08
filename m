Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1F4028E8;
	Wed,  8 Jul 2026 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499871; cv=none; b=ALBz0UcnraS/st+6srSozwjq5eSi7StpcLrpZqGRSI37cWJqHO/KSj0Rt+BA2rTDDdFuRV2q9T2k9Q5yHAuPQaZkYzg0XE9hT59sSzoqPhUwReBfJX+QaUlXoTrvEmtRNAj4VeVAoEMUZP+ZNtuhuWpm1f55VRwATJac6ZPVy8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499871; c=relaxed/simple;
	bh=CW8crfyqzTnCIIq9fuLDHl5nGF0x9M1weQN8ZLhVfsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnWSY8KAzXw4icnXYjuo44GwzCz62fjnbSu8U9sa7sR/3s/LQ49XDKiujw9ClQDpwJblhOaEWHrHbDabjQzoFeCqyWKD0JX3T1TP6x1CaEDnMc2PDNGD7MYl43zCYwfx/efzSQmGaVEubek5IGwCiaDmW2xwreIMf0uCCeuXOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O22WL1U5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O22WL1U5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047051F000E9;
	Wed,  8 Jul 2026 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499869;
	bh=pbmA6WVk8ye5KSefVwqmo3q4Pjoaf+um+5lJFzkYcvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O22WL1U50eyq2j9axLSAWIZva/P5VHs/+2DrOB3S22qZ/ZCW64yu+hq23OoMhWv23
	 H8cgHkECLyh5Y7x+jTCbrEMg1QYavFDx8Ta9rXJGig0a9scR+ImYBOU9sshOyhhYd6
	 /VprWs7+wPC4ndlsV7wH2MFk41ABY2wvZsFJnCbJDT2hh5QBaP11BoNwenzDMHzJ+o
	 g6+rd/qstn4CiaB5gIOTgNyUNWVTkdOw3bjzK16GQItHswhYpmnyistssBS2BgtQEc
	 Ssy8J3xx13y5+t1a+MsOYa0V1bUdYUnwmPEgr+0HnX8mCWUfM2/jVNsZbzGUBMPDsP
	 Q8TuvIzVmuesA==
Date: Wed, 8 Jul 2026 10:37:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	gregkh@linuxfoundation.org, syzkaller <syzkaller@googlegroups.com>,
	Theodore Tso <tytso@mit.edu>
Subject: Re: [PATCH -v2] lockdep: Enable the printing of held locks of remote
 running tasks and print task CPU
Message-ID: <ak4MV48dg-OePgG2@gmail.com>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <akoeSIQGwqd9cZwd@gmail.com>
 <2f7513c6-42e1-413b-8bd5-fa5abefe4b99@I-love.SAKURA.ne.jp>
 <akyopXs1SeH6rXu4@gmail.com>
 <90133e2c-60aa-456f-b2a8-d0af19b02395@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90133e2c-60aa-456f-b2a8-d0af19b02395@I-love.SAKURA.ne.jp>


* Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:

> On 2026/07/07 16:20, Ingo Molnar wrote:
> > TL;DR: it should be fine to print the held locks of running
> > tasks too, as long as we print out a warning when we print
> > such a task, so that users are aware of any racy output.
> 
> Is there a warning we print out?
> We dropped WARNING: in this version, didn't we?

Indeed - I fixed the changelog.

> > Finally, print out the last CPU a task has ran on. This is very
> > useful information for races and for locking bugs in particular.
> > This basically extends the 'on CPU#%d' message we print for
> > running tasks to all tasks we print.
> 
> I like this change. Thank you. ;-)
> 
> # echo t > /proc/sysrq-trigger; sleep 3; dmesg -c | cut -b 15-
> 
> Before:
> 
>  Showing all locks held in the system:
>  4 locks held by pr/legacy/16:
>  1 lock held by rcub/1/18:
>   #0: ffffffff92ba36c8 (rcu_state){+.+.}-{0:0}, at: rcu_boost_kthread+0x15c/0x5d0
>  3 locks held by bash/1221:
>   #0: ffff8cd5dd8df500 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x9a/0x150
>   #1: ffffffff92b9e080 (rcu_read_lock){....}-{1:3}, at: __handle_sysrq+0x56/0x140
>   #2: ffffffff92b9e080 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184
> 
> After:
> 
>  Showing all locks held in the system:
>  locks held by pr/legacy/16: 4, last CPU#0:
>   #0: ffffffffaaf9a4a0 (console_lock){+.+.}-{0:0}, at: legacy_kthread_func+0x85/0x190
>   #1: ffffffffaaf9a4f8 (console_srcu){....}-{0:0}, at: console_flush_one_record+0x92/0x710
>   #2: ffffffffab1fb818 (printing_lock){+.+.}-{3:3}, at: vt_console_print+0x74/0x640
>   #3: ffffffffaaf9e080 (rcu_read_lock){....}-{1:3}, at: rt_spin_trylock+0x61/0x140
>  locks held by rcub/1/18: 1, on CPU#0:
>   #0: ffffffffaafa36c8 (rcu_state){+.+.}-{0:0}, at: rcu_boost_kthread+0x15c/0x5d0
>  locks held by bash/1206: 3, last CPU#0:
>   #0: ffff8c62894da500 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x9a/0x150
>   #1: ffffffffaaf9e080 (rcu_read_lock){....}-{1:3}, at: __handle_sysrq+0x56/0x140
>   #2: ffffffffaaf9e080 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184

Great, and you are welcome.

I've added your Tested-by tag as well, and graduated the updated
commit to tip:locking/core, to be merged into v7.3 if everything
goes fine.

Thanks,

	Ingo
