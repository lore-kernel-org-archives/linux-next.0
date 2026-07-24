Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9073C65FD
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895099; cv=none; b=AOeIZf/tmXMaExsLJm60jfE92ofqBsNeUzVlSZlLz2PjslOf1I1o/OBKcmllNizfaOUhRHs6SSDKztnenm42E1iHA+yHtEe3dXeyac9cS79+iZrIg6g1vHHiIkAYk7Czn5Yd2amzDmXecmvvWVIihPy9OHi1MbQHsB+9aMAE9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895099; c=relaxed/simple;
	bh=c16mMhMP4+5WgWo/Sqx4SBxHaMAKs/2nLZNXckLsS3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pa/+BhSNJDXMm58WH4g0rw7gzQeocrLiVrd/LjkXROqnjbspZpUvH4pjU5B9gZv4NQ3CoCB8JNxyNqLy/ReN9tWYJ+tb9Acb9H6sUIbFxExC6md4telqFcxKVDkyFBo9yM4nwBHfGZ7KhQqXyVu7vyQTPJLoqj3QUgrrFTxTQIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66OCBRT8008749;
	Fri, 24 Jul 2026 21:11:27 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66OCBQig008741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jul 2026 21:11:27 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
Date: Fri, 24 Jul 2026 21:11:27 +0900
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
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <amEAzMTbA9R9HgN7@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav403.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/07/23 2:47, Theodore Tso wrote:
> On Thu, Jul 23, 2026 at 12:07:44AM -0500, Tetsuo Handa wrote:
>> The procedural problem is that developers / maintainers are too busy
>> to respond to my debug patches. Since I am debugging difficult bugs
>> where nobody else are willing to spend resources, this is an
>> expected result. I am OK to post my debug patches to ML. But without
>> responses / interests from developers / maintainers, this problem
>> won't be able to make progress.
>>
>> Just saying "Not my business." is not helpful.
> 
> Is what is happening that when your security LSM (Tomoyo) is enabled,
> this causes lockdep or warnings or other issues in other subsystems?

No. Problems are not related to tomoyo.

What is happening is that I am using tomoyo git tree as a hook for
executing debug printk() (using linux-next git tree) in order to debug
problems which syzbot has found but nobody can afford looking into.

Individual git tree is not served as a hook for applying debug patches
like "quilt push"; one of reasons is that "git" (compared to "quilt") is
not intended for removing a patch when that patch became no longer
necessary (due to problem being fixed).
