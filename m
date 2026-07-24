Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24A344DB9
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906974; cv=none; b=daq5SZN6hhWeZsS4lxYeux+y5cm5TTkGvGLSL4g3eZSrzP3ziSTItkbQAoQv8qlvY25dvqdAt762HG76vnWSw/2VvpJLjajic1q6bsp6Nthahucg8VkN1y99eKofLlJPYo6N/Q4RAsfqY4++91srIYurN2SQ1nV/jLEgQsuAU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906974; c=relaxed/simple;
	bh=kQm6Hzdj2oLBM7NUiTygy5l5kv0zEPuz7KdsUS8Csk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSJG/PEsQjMsu4dttU+171eJo/iaTEPcbntjZrK+4DX9zIcZKa5+aspTSNHIRcrwX9QVM+mnDmNxhlkqQhwSIJDG0Y4LxI7nakfFa62CrGB+g34bS7L7zI1WjtoAP2UO7bAK7bTLngCgW8GPvNqwQcHZS/QiVeJScDjkJgU80hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66OFTVnC048597;
	Sat, 25 Jul 2026 00:29:31 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66OFTUiJ048593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 25 Jul 2026 00:29:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <7250a5ad-ec2d-4852-af56-9c1c653d24c7@I-love.SAKURA.ne.jp>
Date: Sat, 25 Jul 2026 00:29:27 +0900
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
References: <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <2d0d3f6b-4392-4081-9390-9b588e38de7a@I-love.SAKURA.ne.jp>
 <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <amN5Gu2J5mILKs_j@mit.edu>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <amN5Gu2J5mILKs_j@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp

On 2026/07/24 23:51, Theodore Tso wrote:
>> In other words, the interest (by the upstream Linux kernel community) on
>> fixing kernel bugs which syzbot found are decreasing. This is a deadlock
>> situation, and just saying "Not my business." is not helpful.
> 
> Perhaps if Syzbot could be improved so we can be more selective about
> which bugs are worth fixing, it might actually be better for the
> kernel's quality.

One non-critical bug in some module can prevent other critical bugs in
different modules from being discovered. We can't expect that syzbot can
find only critical bugs, without an effort to fix non-critical bugs.

> 
> But if the goal is to get ourselves to zero bugs, or zero syzbot
> reported issues, that's not a goal I can get behind.  It certainly
> isn't something my management chain isn't willing to support that
> goal, and it's NOT going to happen out of my own personal time.

https://www.youtube.com/watch?v=qrBVXxZDVQY or
https://events19.linuxfoundation.org/wp-content/uploads/2017/11/Syzbot-and-the-Tale-of-Thousand-Kernel-Bugs-Dmitry-Vyukov-Google.pdf 
says that the goal is "Reduce bugs/release 100x: 20'000 -> 200".

I know that individual maintainer cannot afford looking into all patches
that involve syzbot. A maintainer has the permission to accept/reject
patches on an area he/she maintains. The problem is that a maintainer
who has the permission to accept/reject patches tends to become defunctional
when syzbot is involved. What actions can the Linux kernel community take
in order to address this problem (instead of just ignoring developers
who are trying to fix bugs)?

