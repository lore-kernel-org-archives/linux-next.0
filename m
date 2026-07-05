Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82309378823
	for <linux-next@vger.kernel.org>; Sun,  5 Jul 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251371; cv=none; b=LraJ0EGUGYZov9kYAgMSdbWktR4daw8KcDIPujAfL5havVz9ly+gp2MYMnFoUqrF3o+Jg30BLH5kJz+gukFcNoyxSgUAHcGynU3PlieCWMw4LJYvyD9fizOszqFyJgtfYfrmAiCQhwwu1bWiJPMRuyrkBk+NXhOgnYWeFKqCeMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251371; c=relaxed/simple;
	bh=toax7owucsKBXPdrvFCNY+db2F47kCha3JZcWwCPCGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWTWXBYxL3LCh/mRj7zo26qsJGUALF599A2y6mnZacyaV8WCCM7iJeX6zKzTh5Ct2fI6a9mUzrJJmZn2EcSh6vIQWTBT1s4aNQN87zfkLwGrv0eRVmagldLAOYpAq0QmghstxIlNXPa9QczVh7vTWRktFjJ9xHIWZLNq3lFDO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 665Ba72r038193;
	Sun, 5 Jul 2026 20:36:07 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 665Ba6Eu038189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 5 Jul 2026 20:36:06 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <dc3c0e2a-a3fb-496a-ac82-fff849b8ba78@I-love.SAKURA.ne.jp>
Date: Sun, 5 Jul 2026 20:36:05 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Theodore Tso <tytso@mit.edu>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <akkGwsQg1k5ZfGwa@mit.edu>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <akkGwsQg1k5ZfGwa@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav301.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/07/04 22:22, Theodore Tso wrote:
> On Sat, Jul 04, 2026 at 02:06:43PM -0500, Miguel Ojeda wrote:
>> Now, reading the Google Groups thread you link, it seems like your
>> *actual constraint* doesn't come from syzkaller, but rather that you
>> want to use the compute resources Google allocates for big trees like
>> linux-next.
> 
> Note that if you are trying to debug a specific syzbot bug, you don't
> need to send it to linux-next.  You can just reply to reproducer with
> 
> #syz test: git://repo/address.git branch-or-commit-hash

For bugs which have reliable reproducers, "#syz test:" will work.
My debug printk() patches are for bugs which don't have reproducers (or
reproducer is too unreliable to reproduce). I need large compute resources
for debugging such bugs.

On 2026/07/04 21:06, Miguel Ojeda wrote:
> I understand it may be nice to use such resources, but the solution is
> to talk to both sides, as you do in that thread. From what I see, they
> even offered to add a mailing list for those patches:
> 
>   "Aleksandr says we can create a special mailing list to test draft
>   patches, so the series sent to that list is fuzzed for some time,
>   similarly to how upstream patch testing works now.
>   Do you think that would help you to debug these issues? "
> 
> So what happened with that? It seems there was a way forward there,
> no? (Cc'ing Alexander from that thread)

My response on that proposal is
https://groups.google.com/g/syzkaller/c/4Y3zvo_t_lI/m/jqRBCN5bBQAJ .
In short, if trees with custom patches were tested with as much resources
and many patterns/testcases as trees without custom patches, I won't need
to carry custom patches in linux-next. But I think that we can't afford
allocating so much resources for trees with custom patches.

I have carried custom patches in linux-next and it resulted in 10 patches
for https://syzkaller.appspot.com/bug?extid=881d65229ca4f9ae8c84 where
"#syz test:" did not work. Since remaining bugs are no longer easily
reproducible in linux-next, I want to carry custom patches in the networking
trees. But in general, git trees are not supposed to make "git reset --hard"
changes.

Therefore, I am using my git tree as if "quilt" for making "git reset --hard"
changes in linux-next tree. If a kernel config option which is used for fuzz
testing were available in upstream, it will make easier to manage custom patches
for temporary debugging and pinpoint-blocking stupid operations (like SysRq-b).

