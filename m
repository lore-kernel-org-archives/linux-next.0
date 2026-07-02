Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0D4A138B
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001475; cv=none; b=KjFzq9ZiXMy+ZmzlfwGafLdB0/i6UlgDYKXcjo/v0Ljb0Bla62YQISBbGyMuib6DOU/SGl4aFJW6wsFWd87VrmWAcgN9AWWmmh4fDIKL9EmjMz1L2dvIV5C31U4WjdMB0F9ITJhpDCz9lJaHHShr1b9sV7742FavJ9mwhp3Q7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001475; c=relaxed/simple;
	bh=u7p0dz0vx/YyrqpIp3ZdiFvGTW7d3///65umS9NVczs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJ7jLoTeyO8u4O5c5b+M9g/EIP/9fxIbMDOWF0n5gb4GNDdgbzLbzUNxCJO3XNmh+ufjyzHVo4IZpaIZVr3KmR5MbjIUApIJgjxPF9mr1Y0zJ8y/vmpEdujxEnLQhtBgOrNQQpb2gBuRN0nMTBw/qD+O4Or+/fBGxU/Jo6FsWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIEIxcOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIEIxcOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2BD1F000E9;
	Thu,  2 Jul 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001474;
	bh=J2mCeFbKBmDF4oRa7ZrA9rUgmOt7M9KmN/OWLDUlJU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lIEIxcOD4Fe4F07FYu8YFsscZFH8rBHS0YYZMm6BOox3a+WbpXqfLsNwr+6BaE5R7
	 bmWcU+J3XY+WUFxvt088zopeidW+9xMEU/XylrKSWMoBpoizQbSeEoVPZZA96IFC+f
	 vPFmXPLt0nd7H9cy7b250/WsHITjI28nURXgUdJDyoO17XjonZcr9qIEwmpLNm5x+m
	 Fa85TuE++FtWL50HxaWx6yYxgAFpSIz7SUhNuLkQtpA8a0q7b12376oWta/GsO+N+x
	 CQ5gLO0JYZyTV9DewZieugzHsbKPhALIn/QpndJv9EOGUv2Xiyi5/yG7VeAiMxP9AJ
	 5qwBJCzI06sHw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 43449F40075;
	Thu,  2 Jul 2026 10:11:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 02 Jul 2026 10:11:13 -0400
X-ME-Sender: <xms:gXFGanIhCAJqe5MeV5v-vA06OQeKsTtO5k6L3uqIOQBk535_46IA4A>
    <xme:gXFGau2cYHoiIBiNIIsZZ0M09YU0nzG-4ThIrWBOc3xslPz9_PreLOHB11k0ZhWyZ
    Bh8wkj0JbcwTE-3jh029LRohy3SviBiyGGjHDnFEpWfY0CUvgmeUw>
X-ME-Received: <xmr:gXFGaoUME-CvH7cINjnNvqZkkLrYLlajqzC-o38MQqQUAawWYmG_RoCtPeb50e50lsxi-FKjLDe18oFytiZ2v7JSGL8aSqKV>
X-ME-Proxy-Cause: dmFkZTEa7swsFCRNAcCAHFQGahARfw/fetstkGzfmCtCZRSGE1g69JJJAt7F901vGOeDOI
    eyZgcRRQPv9LcVF0SD26m//aophJQpKAjbezo8lyNTLXrlDhyR2h//xrn82UhN4/sUQ9oY
    6HV3LEoNavCWg/3n+i3h6vwRNoyDWzFKQ5BaM26RJC5XeL3dz4qn/vmbTckDeXj485QcC2
    xLj3rX7FIUXr0E6/R95dCvToiHc+e2EsnHyvV0QA6EbkTwKvtPgcYhTwR40i03Bb5WfXi3
    QLjSEVAHYTJEocd+GbjbXdYCreh32AbM9A9zrbZGQ0ANNHN8KVUo4sP3ecZMn6rI6RpRfP
    6MhC1YNEdxNg2VLNotA2/w+XX7cvqc0bwanq0P07SJletpC3gmy7BG+LJFaZxHuHfWezFq
    d7BwNDNPmKI3RNhSN5q/shaACyX6vWoZg47wLM37GvoS3gH9gf4ntu/QGI1caniC5dz+hv
    4XvrFQRtsRwgEyE0FVRvQJdLXvNULpaChhxYo4f1VuC3y8dacdwVIwxagnTjs6NW77wU+F
    ygJSgel26xYtd5lYtgSHVtJcGHVClYSngo9+SPeRZ4E/+6DZNfaHazBSVhTrMldCcHrnlI
    SseNLN3zzGPf8tawoLKXRWlZ1U7lH3i1KmHQR7UfysgFe03yzRYVCNQa8AtA
X-ME-Proxy: <xmx:gXFGahwaeJaGP_0uMHKJcLaAnpqh1bqSLPC3kgRkCNBA8pTYEKhLHQ>
    <xmx:gXFGavzN0nH-RWU7wBIX4t1Cv8E4qe0WAqtW6rIa2ThJget6ft6LlA>
    <xmx:gXFGam1bQOZ23dft7xD2KyHlh9T7FEHeSXD0K13bTXJTgxXirE2GkQ>
    <xmx:gXFGatpugoyWGQIOIDlBu_IahVACcFceS7MLvpPm4JbmHXw0tTxjOw>
    <xmx:gXFGasCO-YBh9sf-lTYmbxF_mePPFwPfOcpP8HtPXeOhzzZg_WV6p6L9>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 10:11:12 -0400 (EDT)
Date: Thu, 2 Jul 2026 07:11:11 -0700
From: Boqun Feng <boqun@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <akZxfzEtam8yPXEh@MacBook-0RXW5>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>

[Cc Locking & Greg]

On Thu, Jul 02, 2026 at 09:49:43PM +0900, Tetsuo Handa wrote:
> On 2026/07/02 20:49, Gary Guo wrote:
> > Hi Mark,
> 
> Thank you for raising this problem.
> 
> > 
> > While testing lockdep changes on linux-next, I found there is a commit
> > ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks() always print if
> > CONFIG_DEBUG_AID_FOR_SYZBOT=y") applied to lockdep. Checking the history it
> > looks like this commit has been in linux-next for quite a while (at least 2
> > months); there were no emails on LKML about this commit at all.
> 
> Yes, these patches are for debugging difficult problems.
> 
> For example, ca65ccfdc5b3 has been a concern for almost 8 years without progress
> because developers show little interest for this change:
> 
>   https://lkml.kernel.org/r/1535975097-19080-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp
>   https://lkml.kernel.org/r/7e0d2bbf-71c2-395c-9a42-d3d6d3ee4fa4@i-love.sakura.ne.jp
> 

This email was from 6 years ago, if that's the latest version, I'm not
so sure you could say "developers show little interest for this change".
Maybe you could provide more context about this that I missed? Also Greg
left a comment there, you neither replied nor send a version to resolve
it. Again I'm not sure if that could count as "developers show little
interest for this change".

> > 
> > I asked Boqun and as a maintainer of the file he's not aware of such changes
> > being made. This commit is being added to linux-next via the TOMOYO security
> > module tree; checking the merge it appears that none of the changes pulled in
> > via the TOMOYO tree is related to LSM at all:
> > 
> > e07d10ed0f23 lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
> 
> e07d10ed0f23 is for reproducing https://syzkaller.appspot.com/bug?extid=3f51ad7ac3ae57a6fdcc
> in linux-next so that we can debug this problem in linux-next.git / test patches before
> sending to linux.git .
> 
> > 8f598d86dc9c net: add "struct dst_entry" debugging
> > 295e1a24166f net: update dev_put()/dev_hold() debugging
> 
> 8f598d86dc9c and 295e1a24166f are for debugging https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
> in linux-next because netdev people are hardly responding to patches
> (e.g. https://lkml.kernel.org/r/2bc332e0-b250-4679-a075-1c413ad843ce@I-love.SAKURA.ne.jp )
> that will finally make these patches unnecessary.
> 
> > ca65ccfdc5b3 locking/lockdep: make lockdep_print_held_locks() always print if CONFIG_DEBUG_AID_FOR_SYZBOT=y
> 
> Explained at top.
> 
> > 83d2b1cd5d27 lib/Kconfig.debug: add CONFIG_DEBUG_AID_FOR_SYZBOT option
> 
> This is also a long-remaining concern without progress because developers show little
> interest for this change:
> 
>     (2019-12-16 09:59) [PATCH] kconfig: Add kernel config option for fuzz testing.
>     https://lkml.kernel.org/r/20191216095955.9886-1-penguin-kernel@I-love.SAKURA.ne.jp
>     (2020-03-07 13:58) [PATCH v2] Add kernel config option for fuzz testing.
>     https://lkml.kernel.org/r/20200307135822.3894-1-penguin-kernel@I-love.SAKURA.ne.jp
>     (2020-03-08 16:13) Re: [PATCH v2] Add kernel config option for fuzz testing.
>     https://lkml.kernel.org/r/CAHk-=wjCcCmQig8w8QEfyqyXACLzDc7b4TSW-KzAMzmS-QvJ+Q@mail.gmail.com
>     (2020-04-13 06:33) [PATCH v3] Add kernel config option for tweaking kernel behavior.
>     https://lkml.kernel.org/r/20200413063317.7164-1-penguin-kernel@I-love.SAKURA.ne.jp
>     (2020-04-13 18:13) Re: [PATCH v3] Add kernel config option for tweaking kernel behavior.
>     https://lkml.kernel.org/r/CAHk-=wgbMi2+VBN0SCEw9GeoiWgui034AOBwbt_dW9tdCa3Nig@mail.gmail.com
>     (2020-04-16 00:47) Re: [PATCH v3] Add kernel config option for tweaking kernel behavior.
>     https://lkml.kernel.org/r/5a72a7e8-f7fe-4560-0145-02d5570efa34@i-love.sakura.ne.jp
> 
> > 
> > For obvious reasons I have concern about this practice; being a maintainer
> > shouldn't mean that you're allowed to add random stuff to linux-next. This
> > reminds me of another case last month
> > https://lore.kernel.org/all/20260604210704.41751-1-ojeda@kernel.org/ where the
> > added stuff via TOMOYO tree breaks Rust build on linux-next. I think this
> > practice is questionable and I would like a clarification on the policy of
> > adding stuff that is not upstream material.
> 
> If maintainers were more responding to patches that help debugging difficult problems /
> avoiding stupid behaviors, many of these patches would not have been staying as
> "linux-next only" patches.
> 
> > 
> > I recognize that there is a need to add commits that serve as testing and
> > debugging purpose to linux-next, but I think any of these changes should be
> > temporary in nature and have acknowledgement from maintainers of touched code.
> > Perhaps these changes should also be in a separate topic branch which gets
> > pulled from linux-next temporarily.
> 
> I'm happy if we can assign a git tree and a ML that are intended for temporary patches.
> But please note that asking fuzzers to test a tree for hosting temporary patches is not
> a choice. We need to test on massive instances to reproduce problems. linux.git is the

I don't understand why it's not an option, couldn't you just ask syzbot
to apply the patches only for linux-next, or merge a tree but only for
linux-next? The point is not just syzbot consumes linux-next, everyone
does. Although I trust your good intents, but temporarily patches
(especially when they are silently merged into linux-next) can undermine
what linux-next is supposed to be.

By "silently" I mean I didn't see you gave a heads-up about doing this
either, e.g. an email saying "hey I'm including these into the
linux-next". Maybe I'm missing something here?

Regards,
Boqun

> best tree for reproducing problems because of massive instances. But since we don't
> want to pollute linux.git with temporary patches, I'm using linux-next.git as the place
> for reproducing problems.
> 
> This practice is questionable, but just rejecting with "stop doing this practice" won't help.
> I need interests / assistance from developers / maintainers for avoid doing this practice.
> 
