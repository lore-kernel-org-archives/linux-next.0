Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE362BD11
	for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 00:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785369878; cv=none; b=qe8Sst1+NV7KRXg34uZDIIM8avwhsbmfzuR8jR8i11WdJdEjTBkQl8kp5i5Ewzyjdu3WsbA96JK0yFAyK3gxCtPaSHV8rkBFuAPb32n9PRp1fIJ5dyTJFaPpSfmAHrr4SBqX3Rh97mRNwUh4DhrjMzUhBLa7Mo/oaKX8FNjsf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785369878; c=relaxed/simple;
	bh=Mev5aL4cRqa5xDk/Wg8W9Oiap/ivt22T7OddUjidC18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geCAG/kF3M8kUl2SQMRi4lrAXty64LhnbhPkEk4ctXgZC6owVZRBG2cUfQvyFmj+BbSbRG4e7W9QceUum1UP6MaaLOPf/Yf8v8YXAW9a8CPcShFsmb7tY5kBWUngNwuux40q1hyJkE2mhKkLdzqfeXzjGst6uKz5f6J+qcXhjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66U04WYl068891;
	Thu, 30 Jul 2026 09:04:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66U04Wni068888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 09:04:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b06d6fee-0e77-4147-a7ac-81dd482babb6@I-love.SAKURA.ne.jp>
Date: Thu, 30 Jul 2026 09:04:31 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        syzkaller <syzkaller@googlegroups.com>
Cc: Theodore Tso <tytso@mit.edu>, Mark Brown <broonie@kernel.org>,
        Leandro Ribeiro <leandro.ribeiro@collabora.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Daniel Stone <daniels@collabora.com>,
        Alexander Potapenko
 <glider@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
 <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
 <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
 <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
 <amlXC0hahHo4Cdsx@mit.edu>
 <489926f3-795c-4e23-bb4a-cbbe2bd464a0@I-love.SAKURA.ne.jp>
 <CANiq72=ps9obgSe3t0PV5hS30ifVY0g6qc2wxECLMZ1SzkKohw@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CANiq72=ps9obgSe3t0PV5hS30ifVY0g6qc2wxECLMZ1SzkKohw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav203.rs.sakura.ne.jp

On 2026/07/30 7:57, Miguel Ojeda wrote:
> On Thu, Jul 30, 2026 at 12:03 AM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>
>> That does not help. syzbot stops not because the kernel calls panic()
>> but because the kernel emits "WARNING:" etc. followed by a stack trace.
>> The list of patterns is at
>> https://github.com/google/syzkaller/blob/master/pkg/report/linux.go .
> 
> The point is that syzbot could skip those until a given point at boot.
> But in order to do that, of course, you still need to disable the
> panicking.

Suppose syzbot defers evaluation of

  ------------[ cut here ]------------
  [PLANE:35:plane-0] pixel format with alpha exposed but blend mode not setup
  WARNING: drivers/gpu/drm/drm_mode_config.c:873 at validate_blend_mode_for_alpha_formats drivers/gpu/drm/drm_mode_config.c:872 [inline], CPU#1: swapper/0/1
  WARNING: drivers/gpu/drm/drm_mode_config.c:873 at drm_mode_config_validate+0x1c6a/0x1e60 drivers/gpu/drm/drm_mode_config.c:938, CPU#1: swapper/0/1
  (...snipped...)

messages until a given point at boot, how can syzbot determine whether it is
appropriate to start (or continue) fuzz testing? This specific WARNING: is
harmless but almost all other WARNING: indicates something is wrong (e.g. the
kernel's state might be no longer consistent), like panic_on_warn is there.
Deferring could mitigate "being unable to follow daily next-YYYYMMDD" problem, but
it can force syzbot to fuzz-test on already broken kernels (adds a new problem).

If a Gen-AI is used while running syzkaller and that AI is capable of evaluating
whether it is appropriate to start (or continue) fuzz testing when encountering
individual WARNING: messages, syzkaller could skip this specific WARNING: as
harmless. But unlike Sashiko, syzkaller itself is not meant to require GPU for
running AI models when the kernel to be fuzz-tested is running.



I feel that the discussion is getting out of the point. Like I explained at
https://lkml.kernel.org/r/bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp ,
the point of this discussion is how to address the technical problem and the
procedural problem. For the former, I will start a new thread. But for the latter,
I sent "[PATCH v5] loop: Fix NULL pointer dereference in lo_rw_aio()" to ML but got
no responses / interests from developers / maintainers. This bug remains undebuggable
if you don't want me to send this patch to linux-next tree via my tree while saying
"Not my business.".
