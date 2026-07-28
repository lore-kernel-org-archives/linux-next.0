Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD55446BF5
	for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249975; cv=none; b=jZruvkxCXfZYITL0W16d/hdtreLFp1qQ2fsoHfCuSNZK8lA6/yVEC9t9mzpukrbkEZ9/LVTc72f7jkYbw1S2YHOrmx1ToA2UEjJr7Fx2B1TbX87koBgz0vP9d3RG7Borcv5WqH5fGN4Du9LCUx/scs0CsiAdltIeoflt36chc0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249975; c=relaxed/simple;
	bh=UMR/nCJBfHp/XplCcOziPdQ8tL9OkrUZAPJlNxQWQ7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ub1cPOMj/GmSyEZHVM/PppZZj1m5Z+G+9A25u6+NqGaVOM3uHgcGFypAEUM5ui17B/yIo5C31EDAZ7ThOUOnprXh9fV5x23Aa9YkYtjiUYwlMZcSIbxfsdr6hxDWJ32mr7Qll+QXDtPiaGf5eGYshAHceklcjIvClxJnxTP8mJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66SEk4N4051112;
	Tue, 28 Jul 2026 23:46:04 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66SEk4ga051108
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 28 Jul 2026 23:46:04 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
Date: Tue, 28 Jul 2026 23:46:04 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Mark Brown <broonie@kernel.org>,
        Leandro Ribeiro <leandro.ribeiro@collabora.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Daniel Stone <daniels@collabora.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
 <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav402.rs.sakura.ne.jp

On 2026/07/28 2:39, Mark Brown wrote:
>> For the latter example, syzbot is still using next-20260714 because a maintainer
>> who should accept/reject https://lkml.kernel.org/r/al1pElMQZsDfpAYI@michalis-linux
>> is not responding. As a result, syzbot is unable to test changes made between
>> next-20260714 and next-20260726.
> 
> This really just looks like another case where you (or someone) need to
> commuicate if something is urgent - I would have a hard time telling
> from that thread that there's a particularly big problem, the only reply
> indicating any kind of problem with the posted patch (from Joshua) was
> then followed up saying to disrgard it and there's nothing at all at any
> point in the thread or original report about the scope of the issue or
> any practical impact it's having.  Frankly I'm not clear that Michail
> (who posted the patch) is aware that there's any urgency here and isn't
> just acting reasonably and promptly on what was in the report mail.

This problem is caused by commit 860e748bddcc ("drm: ensure blend mode supported
if pixel format with alpha exposed") at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=860e748bddcc9291cbdd23e801640aeeba30cc44 .

That commit says "Drivers triggering this warning must be fixed.". That is,
they know that it is expected that WARN*() fires. But they don't know that
syzbot stops upon encountering "BUG:" or "WARNING:" within printk() output.

They also don't know that syzbot builds-in almost all modules into vmlinux.
That is, initialization functions of most modules are executed upon boot.
If one of modules emits "BUG:" or "WARNING:" line, the boot fails.

Maintainers sometimes apply commits that cause some in-tree modules to emit
"BUG:" or "WARNING:" line, without having grace period for confirming that
all in-tree modules are updated/fixed. Such decision is annoying for syzbot.

> 
> Even if someone were to click through the syzbot link the report is
> flagged as low priority in the dashboard and the config is just a link
> to a raw config so there's no indication if this is defconfig,
> randconfig or whatever.  There's absolutely nothing in the sysbot
> dashboard or list report that indicates to me that this has any kind of
> impact beyond "a warning is displayed during boot".

That priority is determined based on how critical the bug is (e.g. use-after-free write).
Therefore, being unable to build or boot is considered low priority because it can't cause
e.g. use-after-free write. However, the real impact of "being unable to build or boot" is
indicated at https://syzkaller.appspot.com/upstream/manager/ci-upstream-linux-next-kasan-gce-root .
Currently syzbot is failing to update linux-next kernels for two weeks due to
commit 860e748bddcc being in the linux-next tree.

All new bugs which are introduced while syzbot is unable to update linux-next kernels
are reported only after syzbot succeeded to update linux-next kernels. The "being unable
to build or boot" caused by addition of WARN*() can break whole testing by syzbot.

