Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A32E6CCD
	for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 23:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785282382; cv=none; b=V46roeSv3iXjQT3ZOzWIENaXoemiMBqGqUoDqXCPg8+or2geIu6mAIJzdku1qloXI8MTcHm5RJPjL6fMlBwU3z0TfTARTCLfJtrhaAdNMVRQzry4ZLk591NtlaiszFqRzN4Ibgs26HD3wa+x4Aw/V9nyy55cM/BzLDQ8ruWWOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785282382; c=relaxed/simple;
	bh=J3McRJSujVflgppvVzDbvnU9xnBEJzEAivXml95dsak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKD8Q8fwOP+Hy41jlP53XB4+3QHHjQLnwFy4/rJmqy3hfqNhRSWcPpyX91zN9qsLVQ4/BCKPeodLnKXQbU8zV4wiNRXDYJIF5CvIg1rs9Bfc2uzOCcKfVYgdf/2DAphKb+KZvLQuckj7E3Igty+FylU30Vc5x2WX+zWNAJh9I6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66SNkHWB007868;
	Wed, 29 Jul 2026 08:46:17 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66SNkGqZ007858
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 29 Jul 2026 08:46:17 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
Date: Wed, 29 Jul 2026 08:46:16 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
        Leandro Ribeiro <leandro.ribeiro@collabora.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Daniel Stone <daniels@collabora.com>, Theodore Tso <tytso@mit.edu>,
        Alexander Potapenko <glider@google.com>,
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
 <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp

On 2026/07/29 7:11, Miguel Ojeda wrote:
> On Tue, Jul 28, 2026 at 4:46 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>
>> syzbot stops upon encountering "BUG:" or "WARNING:" within printk() output.
> 
> Out of curiosity, is that a fundamental property or something that
> could be optionally be relaxed (for certain linux-next runs only,
> perhaps) so that you can continue testing in certain cases where the
> "WARNING:" may be harmless (i.e. irrelevant for your particular
> fuzzing)?
> 
> i.e. I was wondering whether the system could ignore the "WARNING:"s
> (and avoid the kernel panicking on them etc.) until after boot, i.e.
> when the fuzzing starts.

syzbot uses kernel.panic_on_warn=1, for most of WARN*() users are reporting
problems that should not be ignored. Therefore, WARN*() must not be used for
reporting recoverable mistakes like -EINVAL. Abusing WARN*() like
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/workqueue.c?id=6e845bcb78c95af935094040bd4edc3c2b6dd784#n5855
is a fatal barrier for continuous testing systems like syzbot.

Quoting from https://lkml.kernel.org/r/5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp :

  Please never try to emit WARNING: or BUG: message just for letting developers
  update their code. If you can't use panic() instead of WARN*() or BUG*(), you
  should not use WARN*() or BUG*(). The patch author who changes the behavior of
  in-tree code is responsible for updating all in-tree code.

Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
with alpha exposed") must be reverted or updated not to emit "WARNING:" string.
Until authors of that commit respond, that commit had better be excluded from
the linux-next tree.

