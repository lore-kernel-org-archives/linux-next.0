Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A03FCB2C
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362610; cv=none; b=Ku2lCaO7UDee5i6wv/PTZ+XPM/nE+gTjzv845BbJNtacewdAJrl0HrNvwO54xybXwGBOqdk2O0feahrnhvAhvobrsW9Yq5uv5RX+4JQa4R0psRqgclxy9ZyETYuAXQOFittNu2FyxOSky8F3ALDbNVA16dlUMgd/IPaqH8s2umg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362610; c=relaxed/simple;
	bh=6fXl5zN6IVEAAHkoazCtprtiD5zy/68t8uFlPQ2UKGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QItMN7FhZhejzedyBTpdwIypOPH5mhvaL+rMJ2Bj4g1/bUtij2LkOYPorO0HrWOuhPPK/0/pV4L0O/rFGpqT46tmT7995m1TYEYbS+CSau2e3r5+WiDUmqFkuyLYDQPAiOmr/jaXsoUHlg+n+iktZTo0YbohwkV2o1MuLs9lNn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66TM3I2f064468;
	Thu, 30 Jul 2026 07:03:18 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66TM3IaV064464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 07:03:18 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <489926f3-795c-4e23-bb4a-cbbe2bd464a0@I-love.SAKURA.ne.jp>
Date: Thu, 30 Jul 2026 07:03:18 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Theodore Tso <tytso@mit.edu>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Mark Brown <broonie@kernel.org>,
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
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <amlXC0hahHo4Cdsx@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav302.rs.sakura.ne.jp

On 2026/07/29 10:46, Theodore Tso wrote:
> On Wed, Jul 29, 2026 at 08:46:16AM -0500, Tetsuo Handa wrote:
>>>
>>> i.e. I was wondering whether the system could ignore the "WARNING:"s
>>> (and avoid the kernel panicking on them etc.) until after boot, i.e.
>>> when the fuzzing starts.
> 
> It could, but it would involve making a change in syzbot.
> Specifically, syzbot would have to be changed to boot the kernel being
> tested without the kernel.panic_on_warn=1 boot command line function,
> and then in the syzbot reproducer, to add the moral equivalent of
> 
>    echo 1 > /proc/sys/kernel/panic_on_warn

That does not help. syzbot stops not because the kernel calls panic()
but because the kernel emits "WARNING:" etc. followed by a stack trace.
The list of patterns is at
https://github.com/google/syzkaller/blob/master/pkg/report/linux.go .

For example, loop_check_io_race() in
https://lkml.kernel.org/r/30ccdd3c-6353-4a0f-bdc7-230ec3bf4765@I-love.SAKURA.ne.jp
will be sufficient to stop syzbot. Mimicking BUG*() or WARN*() using printk() +
stack dump function in order to get a difficult to reproduce problem reported by
syzbot is helpful. But unfortunately, no response to my patch for two weeks... :-(

