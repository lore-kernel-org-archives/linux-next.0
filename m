Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4118B0F
	for <linux-next@vger.kernel.org>; Sun,  5 Jul 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783263588; cv=none; b=PwKlnaCbiK5HhBauHr51JhvsRhSH7tsBZENHKL7nb07iVZqBE9URc+Q20vO2V2kILdlmZbQEnIsR6WAmTIpx6VRHtc9NwRNeDUT2qet2mrqUZLCLGzpaZW9NdeE+uFtjniBeiXGQ0BNJ3VUHDjlU8tvUDfD7YunbcUfZMxRFzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783263588; c=relaxed/simple;
	bh=gM/jtKS0CIkfSCGsT93r1+NWy6zteb0yTzDPRnOWH5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADROSYRSURXpoZRMeoADJ+p0g06QTAN2c6XtCALGClL31nEBCi6omqhxc2oPsOO1uc8BVtnh7wd4S+mVUUxO8QxvaJM1wVYitD0XFmTHoJvXhXT8Uq9w1I2JhvIfpUipYUdSm1v+02PPMLt0lJSJVMIGfT1b2+AJjWsBad750tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWuHdQRU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWuHdQRU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92021F000E9;
	Sun,  5 Jul 2026 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783263587;
	bh=b16YrnrXu18dGTt6j0BZi3AR/iL9IQYjM3jMmyMLOds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EWuHdQRUg5Sd56iEAYpb1jIi0IWfjxl/ieoRUqEN57wGjTIWfucdigV+OpafkVgO1
	 HonO0abKes6FrXXUa+Xdkm2sF/RcBikBREDrfuoBGMzLgaoSWEt2DVHIB9vbJhThwT
	 +AO2QBUY+IWD9wTzVdxQ+BFnCOCjV6LGg92EEgdKphgF3ifCboK0Z8Rr7OrYTg3iiJ
	 CUnyRg4zat40rr2+2S8U4D/sQhVZNwe+/5H+btkNqKsAOgIoOYYJF3hL9kk1pMJazi
	 AsawCuNe0Ar5ePobUFLfnsL7ntDI9xslwK4j0JuBojGIId9Uj6AfCdepZY688tp61y
	 WQ8ElCrzoO0Ng==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id F2D1AF40072;
	Sun,  5 Jul 2026 10:59:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 05 Jul 2026 10:59:46 -0400
X-ME-Sender: <xms:YXFKatcYz954TnlMGNFqJQrgzmrbgiPZORIpCZwcOnCTozcPqxL25Q>
    <xme:YXFKau6weORFeLIfXqKmqyw3XTRJvSXCAu0Mk4Q9bfaBVhvkLPN9ASfKatXLT242c
    iaDaHLjMfrpatAu83bhy_3dP5CDlqBiwV2TgByIXWLbO8ePW6boKg>
X-ME-Received: <xmr:YXFKavJ2OP39FbD33fRt2gIknWN650PMGdDcit1MKWgtG4XiqNcqgxBhXUE4RpYtHyxO8xCf27p72GjJE_lfFB23V93MoZyR>
X-ME-Proxy-Cause: dmFkZTGNBHO/BT932ZOha8v1lHHLnpzFBS3o89833yUw8SnATv3M7cli/Kutj/zpUQ7WWo
    SSZOpnWJyp2+qRdSOFuVFUzT/OYvcPGAnmTGmw1nrjR7phd1UCTxTGE/A1X8A/kp5vmxav
    kJJ0gtR8Bjww57CqDJFmAG0DhJhDegjpjpKxv0cfA3wlQdRGhFKYefixDBf5hR8VrFbpeC
    nou4rTIdmbr+wG8zPWftMdn6s7ZBufLWUVhP0S9wcOpr051SThO7FaF/0EJ89DIk7l/Lt5
    tPM9nF2FRBsqBPXadb4evVPKvjhjpvdZiU8ys7M+Ihv0+gsTzisdpteI0VFA5ODKsaEFQW
    4fKJ9a8dQP9ufquJihYdMvvMTkoKLn5iYLUcVWISlnSFNFL4IqO8RtRy6Tfw2UrPyifKsA
    coKE0eK3TzCT/LQ4oK6+EL0LQZ6bg04/b0yRSaOU0vjOj16WOfFzZs2GifpB6GkPrwZc1E
    RI8wmx6nxYhh0nhrasrLil8ko7un5UtZFMrBcyff7yqs0/+Jcvr4AMBVOTv8L526jKepjv
    D4vunkYaD5Q/R59DaeIAby53L9QFbz48qWA/L4kt3aX4caL+TZu0tKasrBI7/ZMdHXdWMv
    GGWtjHKoRjM/4/5RSskzt9FPK4GBLCAoBWQXUVgyhC77CHB1moPGr0lQ+5yA
X-ME-Proxy: <xmx:YXFKaoVYgD8IN7N9iHC9v9WHDJF070xHiE9CbToEAssMgvkamdpuQQ>
    <xmx:YXFKarG2M2m3u7C6fcMMy25KLWJn_3bVg8G_AEkdeQsmoHboTgK4Nw>
    <xmx:YXFKan4OcshLq5izd3gIrLppScTrrZlvlCWpKUngdPhqQ44Ax4OumA>
    <xmx:YXFKahfzOFSVCkY0d0TFqvvSN7lbUaPBYNAEGrlPfl-x98FFvCg4UA>
    <xmx:YXFKarmqulK2cDNzN21lzN3sdWj2guHLra64fXAcEVUhLznqyE2lMXND>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jul 2026 10:59:45 -0400 (EDT)
Date: Sun, 5 Jul 2026 07:59:44 -0700
From: Boqun Feng <boqun@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <akpxYEF2ZI7p1zn3@MacBook-0RXW5>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>

On Sat, Jul 04, 2026 at 07:14:32PM +0900, Tetsuo Handa wrote:
> On 2026/07/02 23:11, Boqun Feng wrote:
> >>> While testing lockdep changes on linux-next, I found there is a commit
> >>> ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks() always print if
> >>> CONFIG_DEBUG_AID_FOR_SYZBOT=y") applied to lockdep. Checking the history it
> >>> looks like this commit has been in linux-next for quite a while (at least 2
> >>> months); there were no emails on LKML about this commit at all.
> >>
> >> Yes, these patches are for debugging difficult problems.
> >>
> >> For example, ca65ccfdc5b3 has been a concern for almost 8 years without progress
> >> because developers show little interest for this change:
> >>
> >>   https://lkml.kernel.org/r/1535975097-19080-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp
> >>   https://lkml.kernel.org/r/7e0d2bbf-71c2-395c-9a42-d3d6d3ee4fa4@i-love.sakura.ne.jp
> >>
> > 
> > This email was from 6 years ago, if that's the latest version, I'm not
> > so sure you could say "developers show little interest for this change".
> > Maybe you could provide more context about this that I missed?
> 
> I don't remember whether some discussions are done somewhere else. But judging from
> the fact that code remains unchanged, nobody else has attempted or succeeded to
> make this change.
> 

Maybe we have some misunderstanding here, I'm not following you. Nobody
else has attempted or succeeded to make the change maybe because the
change is not important to anyone else. So if you want to make that
chagne, you are kinda responsible to keep the communication going. If
the communication stopped since 6 years ago, I cannot think of anyone
better than you should bring back the communication, but silently
putting it in linux-next is certainly not the right way. Since you
stopped reposting the patch 6 years ago, people may think your problem
has been resolved in other ways. 

Yes, it can be frustrating sometimes (maybe always :)), when you have to
keep remindering people about an issue, but this is the nature of the
human being communication. People ignore conversations for mutliple
reasons: too busy, losing interests, getting interrupted, wanting to get
a proper response but getting interrupted, etc. So if you think the
topic is important, we are looking forwards to your help to drive the
communication. Thank you!

[...]

> > 
> > By "silently" I mean I didn't see you gave a heads-up about doing this
> > either, e.g. an email saying "hey I'm including these into the
> > linux-next". Maybe I'm missing something here?
> 
> I'm fine with announcing to ML that I am about to make debug/temporary changes.

You should have in this case, until Gary raised this up, it was poorly
communicatd (because there is no intent to communicate).

Regards,
Boqun

> But we might want a prefix for debug/temporary patches that are not intended for upstream?
> Also, we might want a kernel config option (e.g. CONFIG_DEBUG_AID_FOR_SYZBOT) for
> minimizing users affected?
> 
