Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1A41B354
	for <linux-next@vger.kernel.org>; Tue,  7 Jul 2026 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429880; cv=none; b=siWpfaVqOjX3Hs+Nf1zRsTZhf0dEUQTRl+R7qlIO+3ryJcdG9JO9t9rzktv0ptx1olSEan+GhptsMGPaBvahhsIrGzeWLgrxzSsZdEdHqZ5da09iseIsFHZJf95TSdofte6dzDd7LIPbHrMijW9ZTWzTZYrGT/yQcp/ioxt2bs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429880; c=relaxed/simple;
	bh=q7FlM0oPhhDAQiaAYVZZXJOVZFSheHmkVV6ZaXSCRsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2xba+1D74afe7ijRHJSIDYm5bpwvdwEZhJbzRnsK0fIVgMFWeWnFX/Exn4OQRPN9lYS6nFa1uoNEdY6xDfoEVBGCtgY9kltewOvd10SEgUKqWaX7Vq8TxxOkcAVTu7ARGq/7rrl5ylDnInOgnMa3IdtllL+ZFAsZ7WlnKobzxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 667DBAHb008417;
	Tue, 7 Jul 2026 22:11:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 667DB2RR008389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 7 Jul 2026 22:11:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <90133e2c-60aa-456f-b2a8-d0af19b02395@I-love.SAKURA.ne.jp>
Date: Tue, 7 Jul 2026 22:10:58 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2] lockdep: Enable the printing of held locks of remote
 running tasks and print task CPU
To: Ingo Molnar <mingo@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, gregkh@linuxfoundation.org,
        syzkaller <syzkaller@googlegroups.com>, Theodore Tso <tytso@mit.edu>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <akoeSIQGwqd9cZwd@gmail.com>
 <2f7513c6-42e1-413b-8bd5-fa5abefe4b99@I-love.SAKURA.ne.jp>
 <akyopXs1SeH6rXu4@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <akyopXs1SeH6rXu4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav102.rs.sakura.ne.jp

On 2026/07/07 16:20, Ingo Molnar wrote:
> TL;DR: it should be fine to print the held locks of running
> tasks too, as long as we print out a warning when we print
> such a task, so that users are aware of any racy output.

Is there a warning we print out?
We dropped WARNING: in this version, didn't we?

> 
> Implementation:
> ==============
> 
> Implement that change.
> 
> Also re-flow the function and streamline the printout into
> a single statement for all cases, which changes
> the 'no locks held by' / '%d lock[s] held by' phrasing that had a
> dependency on English spelling of plurals, to a uniform:
> 
> 	locks held by bash/1234: %d
> 
> Which spells correctly for 0, 1 and higher values, and should also
> be easier to parse both for humans and for scripts.
> 
> Finally, print out the last CPU a task has ran on. This is very
> useful information for races and for locking bugs in particular.
> This basically extends the 'on CPU#%d' message we print for
> running tasks to all tasks we print.

I like this change. Thank you. ;-)

# echo t > /proc/sysrq-trigger; sleep 3; dmesg -c | cut -b 15-

Before:

 Showing all locks held in the system:
 4 locks held by pr/legacy/16:
 1 lock held by rcub/1/18:
  #0: ffffffff92ba36c8 (rcu_state){+.+.}-{0:0}, at: rcu_boost_kthread+0x15c/0x5d0
 3 locks held by bash/1221:
  #0: ffff8cd5dd8df500 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x9a/0x150
  #1: ffffffff92b9e080 (rcu_read_lock){....}-{1:3}, at: __handle_sysrq+0x56/0x140
  #2: ffffffff92b9e080 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184

After:

 Showing all locks held in the system:
 locks held by pr/legacy/16: 4, last CPU#0:
  #0: ffffffffaaf9a4a0 (console_lock){+.+.}-{0:0}, at: legacy_kthread_func+0x85/0x190
  #1: ffffffffaaf9a4f8 (console_srcu){....}-{0:0}, at: console_flush_one_record+0x92/0x710
  #2: ffffffffab1fb818 (printing_lock){+.+.}-{3:3}, at: vt_console_print+0x74/0x640
  #3: ffffffffaaf9e080 (rcu_read_lock){....}-{1:3}, at: rt_spin_trylock+0x61/0x140
 locks held by rcub/1/18: 1, on CPU#0:
  #0: ffffffffaafa36c8 (rcu_state){+.+.}-{0:0}, at: rcu_boost_kthread+0x15c/0x5d0
 locks held by bash/1206: 3, last CPU#0:
  #0: ffff8c62894da500 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x9a/0x150
  #1: ffffffffaaf9e080 (rcu_read_lock){....}-{1:3}, at: __handle_sysrq+0x56/0x140
  #2: ffffffffaaf9e080 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184

