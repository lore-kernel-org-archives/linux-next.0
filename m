Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2EE2D8376
	for <linux-next@vger.kernel.org>; Sat, 25 Jul 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784975916; cv=none; b=G7EyAUB9cO+e2YVm2M4NsNU95Ph41Y6lobubIYyLQdGZjjXBI3ADvXNTlRwXAGbsA7NLEgoaXpxjKI4y/fHncguXK5I0Bj20qiB25WDL74EQLQUjn6xsrt0UkX9PAG3TXvpDuPvHDWQTmesTed3mA8eZ5X0aYCIutbhPqLVQsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784975916; c=relaxed/simple;
	bh=66cpQiISEswByClXVXgkkuHEj6ib1EUoNG37kJZPWc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ss6CLSyYAbifQfbPdZ1E2CYJbMSjiH2HGzw4pABCwozza42TkVnYC4z4sUbUzKYboAdKrMYTFS5HW/4cY0Ra9/LYfcBjyQG2eA2eUmUrWfJqK15T6Q2/UDX5H5G+3MN7KLR1+d6ywBjx/yoQxfzybEBwztU9VXH+yfVmprs7mjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66PAcTQE011398;
	Sat, 25 Jul 2026 19:38:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66PAcTuS011392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 25 Jul 2026 19:38:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <468a1156-05c8-459a-a93e-b0a7d0aa1907@I-love.SAKURA.ne.jp>
Date: Sat, 25 Jul 2026 19:38:25 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>,
        Mark Brown <broonie@kernel.org>, Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
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
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <CANiq72=QFc1amaeoX3aceuQQCYbpkj_qb7bQgfGj1CRa=+NcOg@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CANiq72=QFc1amaeoX3aceuQQCYbpkj_qb7bQgfGj1CRa=+NcOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav203.rs.sakura.ne.jp

On 2026/07/25 18:38, Miguel Ojeda wrote:
> No, what prevents you from debugging is that, from what you say,
> nobody is giving enough compute resources for your task.

OK. Let's go back to https://lkml.kernel.org/r/bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp .

If I were able to use a kernel config option which minimizes impact for others,
the technical problem for my task will be solved.

But including what kernel config options (or kernel command line parameters) I can use, there
hardly is a discussion from developers / maintainers. The last discussion was 6 years ago:

  https://lkml.kernel.org/r/20200413063317.7164-1-penguin-kernel@I-love.SAKURA.ne.jp
  https://lkml.kernel.org/r/20200307135822.3894-1-penguin-kernel@I-love.SAKURA.ne.jp

Can we resume this discussion so that we can minimize surprising other developers / maintainers?

