Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927B042A82;
	Sat, 25 Jul 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784986064; cv=none; b=Un0iDsRHyEZMuF7FmTxaQM/fVRDUToBIefNzEvjIrCBMPSF9QeOzRs7iShvWkM+7kLil5rYzGzm4YxKsTWuLYa1k6N6UU8jZg+YHQyKCMzHfx2PmXIqABPhTFnJ2acEa9LD9RmkGigSe+rE2Zv7HERj9/iAlgY9T7owqz3zROBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784986064; c=relaxed/simple;
	bh=/to1rjadpksK4XQWfsm3T/QoMa5Xw97SYDHarnkWiHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gj7ARF1jnYvFgvutqk9ThH3NPW61+u4IjMOC0OxLWv0MsRPmpO8zh5qHs7RcdfLfJZnYWI8tY96T7lkF5nEVA5aArpfZ3ZoQRSo3boTm1nTQ7jymoAPXDyuYzlX+BZxG66VDrVKO9Pftu8UJAbJxfRpQLWXo+Q9L9X0PGN2yj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2DFFNVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2DFFNVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5365A1F00A3A;
	Sat, 25 Jul 2026 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784986063;
	bh=DLa0W6gV/T9TlPHj2hdI7uZofez5WsCzHaYPnyN3eJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2DFFNVcm8FzZM1eii3TynAyJNtmVUi1BcVDm1btSK1ziJr4yYLP6RCtB9kYjmAZP
	 TvO6k0Kurq85s48K0Ii4+I5B7mXhCHEfjcis2JHmlnsgqt5oRUuKxd7t00Uis7+FGY
	 XkWO6uGIY42jn1bG8TXkHCw1uOyBAHrPQQMb+9gO6yN9QDpb/U8yTLu6kPbPfuUsEb
	 GfdUTVQW/cGa1ueYs2GG6tDEnpCK9I9YBJQyI/P6uw0iJssP+bgkZiJnMWdaUwhwWe
	 XPSJ+787IpAap2RJr3p6o9bM6WLhbmyyX+0l+QNvHqHjgYbnOKo9Qb67SRNxGKEvE/
	 h9uVMt22jbvgw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6C104F4007B;
	Sat, 25 Jul 2026 09:27:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 25 Jul 2026 09:27:41 -0400
X-ME-Sender: <xms:zblkai450N2ARdcFcL4Ltc2qtbFnY1a4-VsRYdLHEOrJgDO7omShkA>
    <xme:zblkahbMDmo2Sb3ab-Qf8YDw0EcBnBQwwTvC6ii7Dq89d-8gAnda-ZFVkGLOY-hXF
    TVcCC9kMBwdVsQq0oD4N50T13Wb_pjH-CH4_9G4bl_Fc9hJ5XjXtkc>
X-ME-Received: <xmr:zblkapxACw4qyeg5_XH6NxBtgUQ6UTS_Eanzg8V8GQQeaT1dXhgjkFYwSe8>
X-ME-Proxy-Cause: dmFkZTEzejr9NzN4aJiO9Qjz+N9200b6QV2kprsk8lSvq+D0q+COmwjvuB55FSA2CsGo9+
    /lVrJrYSCoV8MSjoiRjc8dcfjPI8qLVmq1+CZJPaZ5uXt1PoFkdYF4VJsxcsKpvxbWsmlO
    KFn5Uo+oHh3djnWADngi6lVcPBTlpgf4qRYa6G2ZLhfko9cklKjX8HTcjrSuxZlS9QyEEo
    vTQng4kIh6xHVeE3ByBrqAgib0YA/iV/F48xfEH6pf8WTA8+TH1KEr6QBkZ81qeIKaridU
    ibTxun7/5//4pShFw8moTMiv6K3RJC74+imvkGbi7NVg0tnhlq0CB75gVet3q/nJWQzMA2
    d7kIFVpgZ0RjRE2XxLp7nlm4A//R8owETEvKGtFzPH1M9qP6zB1O7Sz38iNsnmQ3eb3Mam
    yIa3KKwrYygFFYSE/6b+dAl2mcUQ3omtd2nK45xb1l2VUmH8wz+dqZjO0d1FwviY9rrJSf
    /2tuWfA1m3nPWP3ph5tslymAekdzdsWgOKom96/FOeaFdIqr+gD9b2vWiyz/ITs0F3ijFg
    a5mVEI9qUImAadJI+08WwEKKXTY0Dl8i0m0qGnMxs9J1Qt32L3acN7NV/2hNT9AILa8XlM
    Ktv9EgSpYqjvKrRotevjYCaOE4l4SH/h9yo+ub7/US8dAB0RhZ7/o5oUlEIQ
X-ME-Proxy: <xmx:zblkatNpXYpl7sjLbOPnnsY7aXmir9AougQpGWVRUVZi4RugSh0Wug>
    <xmx:zblkan5XVGPnjhADsx4LYpGGXL0Qe75dxuj-UuCUV_2FE-bEkLgsHQ>
    <xmx:zblkajd-UhMB7t3BCMM6Q1VZXBdzAx9YdesDimQULpyIboP-ZY7rJQ>
    <xmx:zblkagKFHHmk-z3Ju43tFDjM57alkiLsUKjyIZCE8YHgnHx42ndzmA>
    <xmx:zblkahnAazzk1JJzfD66Z7oMKCPx8Dmv3lXxb0r3hZ1JilNqaq43sFcE>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jul 2026 09:27:40 -0400 (EDT)
Date: Sat, 25 Jul 2026 06:27:37 -0700
From: Boqun Feng <boqun@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Theodore Tso <tytso@mit.edu>,
	Alexander Potapenko <glider@google.com>,
	Mark Brown <broonie@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Aleksandr Nogikh <nogikh@google.com>, Gary Guo <gary@garyguo.net>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <amS5yR18GwwUZhy0@MacBook-0RXW5>
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <CANiq72=QFc1amaeoX3aceuQQCYbpkj_qb7bQgfGj1CRa=+NcOg@mail.gmail.com>
 <468a1156-05c8-459a-a93e-b0a7d0aa1907@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <468a1156-05c8-459a-a93e-b0a7d0aa1907@I-love.SAKURA.ne.jp>

On Sat, Jul 25, 2026 at 07:38:25PM +0900, Tetsuo Handa wrote:
> On 2026/07/25 18:38, Miguel Ojeda wrote:
> > No, what prevents you from debugging is that, from what you say,
> > nobody is giving enough compute resources for your task.
> 
> OK. Let's go back to https://lkml.kernel.org/r/bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp .
> 
> If I were able to use a kernel config option which minimizes impact for others,
> the technical problem for my task will be solved.
> 
> But including what kernel config options (or kernel command line parameters) I can use, there
> hardly is a discussion from developers / maintainers. The last discussion was 6 years ago:
> 

As I said [1], the reposting was stopped 6 years ago, and no one could
read other's mind to know whether it's still worth discussing.

>   https://lkml.kernel.org/r/20200413063317.7164-1-penguin-kernel@I-love.SAKURA.ne.jp
>   https://lkml.kernel.org/r/20200307135822.3894-1-penguin-kernel@I-love.SAKURA.ne.jp
> 
> Can we resume this discussion so that we can minimize surprising other developers / maintainers?
> 

Yes, resending the patches, talking about it in a conference, or giving
people a heads-up when planning to queue it via linux-next is the way to
resume the discussion. Could you please do any of these?

[1]: https://lore.kernel.org/lkml/akpxYEF2ZI7p1zn3@MacBook-0RXW5/

Regards,
Boqun
