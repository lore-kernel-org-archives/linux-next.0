Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5743B481FDF;
	Thu,  2 Jul 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996601; cv=none; b=YDt6yyfgNwSMusCsvUT5bkwXAzLu4ZK/O/634VpQ9AldYoaWZQY8coWwS33Odwj2jiJf5HQPd9lMA2EHKV8jz/7ArR+Y9439IQjUoPurWgwGLsjwalC7z21bRcjj+z6L/Hr+H0071kBp9sMi+9hEb+SrK27fTibw/6kPGAuoqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996601; c=relaxed/simple;
	bh=Xfc6LvidRLloX/KwrLp5YZ9FfI//hnHai7zuQhNUnAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6zkCcVJrUz232UTVk0sdivoZqmdP1g6s3xGB69LFQ/jRCn43tr7oPy80V1rZ5T9z0ClqLeLDXnaCL5SarOFkbiVv0msPMMgdpfHzUFupC2T+A3+cRsPoVws4UiVkYUNsuLQrfeR48CScqkLmZQgCagRo9lW/PHBok0WXuXsDbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 662CngOK009080;
	Thu, 2 Jul 2026 21:49:42 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 662Cngqr009071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 2 Jul 2026 21:49:42 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
Date: Thu, 2 Jul 2026 21:49:43 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
        Boqun Feng <boqun@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav205.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/07/02 20:49, Gary Guo wrote:
> Hi Mark,

Thank you for raising this problem.

> 
> While testing lockdep changes on linux-next, I found there is a commit
> ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks() always print if
> CONFIG_DEBUG_AID_FOR_SYZBOT=y") applied to lockdep. Checking the history it
> looks like this commit has been in linux-next for quite a while (at least 2
> months); there were no emails on LKML about this commit at all.

Yes, these patches are for debugging difficult problems.

For example, ca65ccfdc5b3 has been a concern for almost 8 years without progress
because developers show little interest for this change:

  https://lkml.kernel.org/r/1535975097-19080-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp
  https://lkml.kernel.org/r/7e0d2bbf-71c2-395c-9a42-d3d6d3ee4fa4@i-love.sakura.ne.jp

> 
> I asked Boqun and as a maintainer of the file he's not aware of such changes
> being made. This commit is being added to linux-next via the TOMOYO security
> module tree; checking the merge it appears that none of the changes pulled in
> via the TOMOYO tree is related to LSM at all:
> 
> e07d10ed0f23 lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.

e07d10ed0f23 is for reproducing https://syzkaller.appspot.com/bug?extid=3f51ad7ac3ae57a6fdcc
in linux-next so that we can debug this problem in linux-next.git / test patches before
sending to linux.git .

> 8f598d86dc9c net: add "struct dst_entry" debugging
> 295e1a24166f net: update dev_put()/dev_hold() debugging

8f598d86dc9c and 295e1a24166f are for debugging https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
in linux-next because netdev people are hardly responding to patches
(e.g. https://lkml.kernel.org/r/2bc332e0-b250-4679-a075-1c413ad843ce@I-love.SAKURA.ne.jp )
that will finally make these patches unnecessary.

> ca65ccfdc5b3 locking/lockdep: make lockdep_print_held_locks() always print if CONFIG_DEBUG_AID_FOR_SYZBOT=y

Explained at top.

> 83d2b1cd5d27 lib/Kconfig.debug: add CONFIG_DEBUG_AID_FOR_SYZBOT option

This is also a long-remaining concern without progress because developers show little
interest for this change:

    (2019-12-16 09:59) [PATCH] kconfig: Add kernel config option for fuzz testing.
    https://lkml.kernel.org/r/20191216095955.9886-1-penguin-kernel@I-love.SAKURA.ne.jp
    (2020-03-07 13:58) [PATCH v2] Add kernel config option for fuzz testing.
    https://lkml.kernel.org/r/20200307135822.3894-1-penguin-kernel@I-love.SAKURA.ne.jp
    (2020-03-08 16:13) Re: [PATCH v2] Add kernel config option for fuzz testing.
    https://lkml.kernel.org/r/CAHk-=wjCcCmQig8w8QEfyqyXACLzDc7b4TSW-KzAMzmS-QvJ+Q@mail.gmail.com
    (2020-04-13 06:33) [PATCH v3] Add kernel config option for tweaking kernel behavior.
    https://lkml.kernel.org/r/20200413063317.7164-1-penguin-kernel@I-love.SAKURA.ne.jp
    (2020-04-13 18:13) Re: [PATCH v3] Add kernel config option for tweaking kernel behavior.
    https://lkml.kernel.org/r/CAHk-=wgbMi2+VBN0SCEw9GeoiWgui034AOBwbt_dW9tdCa3Nig@mail.gmail.com
    (2020-04-16 00:47) Re: [PATCH v3] Add kernel config option for tweaking kernel behavior.
    https://lkml.kernel.org/r/5a72a7e8-f7fe-4560-0145-02d5570efa34@i-love.sakura.ne.jp

> 
> For obvious reasons I have concern about this practice; being a maintainer
> shouldn't mean that you're allowed to add random stuff to linux-next. This
> reminds me of another case last month
> https://lore.kernel.org/all/20260604210704.41751-1-ojeda@kernel.org/ where the
> added stuff via TOMOYO tree breaks Rust build on linux-next. I think this
> practice is questionable and I would like a clarification on the policy of
> adding stuff that is not upstream material.

If maintainers were more responding to patches that help debugging difficult problems /
avoiding stupid behaviors, many of these patches would not have been staying as
"linux-next only" patches.

> 
> I recognize that there is a need to add commits that serve as testing and
> debugging purpose to linux-next, but I think any of these changes should be
> temporary in nature and have acknowledgement from maintainers of touched code.
> Perhaps these changes should also be in a separate topic branch which gets
> pulled from linux-next temporarily.

I'm happy if we can assign a git tree and a ML that are intended for temporary patches.
But please note that asking fuzzers to test a tree for hosting temporary patches is not
a choice. We need to test on massive instances to reproduce problems. linux.git is the
best tree for reproducing problems because of massive instances. But since we don't
want to pollute linux.git with temporary patches, I'm using linux-next.git as the place
for reproducing problems.

This practice is questionable, but just rejecting with "stop doing this practice" won't help.
I need interests / assistance from developers / maintainers for avoid doing this practice.

