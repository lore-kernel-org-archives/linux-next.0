From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] linux-next: manual merge of the drm-misc tree with
 the arm tree
Date: Wed, 22 Jun 2016 14:11:25 +0200
Message-ID: <CAKMK7uHR5wa4xTGkJ8-0_K-j85=VBBEFjuCcbd-u=qU_O9e6Ww@mail.gmail.com>
References: <20160622114704.5b0c97eb@canb.auug.org.au> <CAKMK7uFDQPdUinsDQaFxCW31k5T9qXoiNkzQ-CuqYQPPbz99pA@mail.gmail.com>
 <20160622082110.GM22276@flint.armlinux.org.uk> <20160622082336.GN23520@phenom.ffwll.local>
 <20160622084336.GN22276@flint.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33107 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926AbcFVML3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2016 08:11:29 -0400
Received: by mail-oi0-f65.google.com with SMTP id w141so3246088oia.0
        for <linux-next@vger.kernel.org>; Wed, 22 Jun 2016 05:11:29 -0700 (PDT)
In-Reply-To: <20160622084336.GN22276@flint.armlinux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>

On Wed, Jun 22, 2016 at 10:43 AM, Russell King <rmk@armlinux.org.uk> wrote:
> On Wed, Jun 22, 2016 at 10:23:36AM +0200, Daniel Vetter wrote:
>> On Wed, Jun 22, 2016 at 09:21:11AM +0100, Russell King wrote:
>> > On Wed, Jun 22, 2016 at 09:31:18AM +0200, Daniel Vetter wrote:
>> > > On Wed, Jun 22, 2016 at 3:47 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > > > Hi all,
>> > > >
>> > > > Today's linux-next merge of the drm-misc tree got a conflict in:
>> > > >
>> > > >   drivers/gpu/drm/sti/sti_drv.c
>> > > >
>> > > > between commit:
>> > > >
>> > > >   062993b15e8e ("drm: convert DT component matching to component_match_add_release()")
>> > >
>> > > Why did that one end up in the arm tree? Should it go in through
>> > > drm-misc instead?
>> >
>> > Mine is part of a three part patch series which is part of the component
>> > helper updates (which I'm the author and maintainer of).
>> >
>> > Then someone came up with an alternative way of some of part of it.
>> >
>> > You can't merge the above DRM part, because that means you also need to
>> > merge patch 1, which is core component stuff.
>>
>> Makes sense, but generally in that case I ask Dave for an explicit ack for
>> merging through another tree to avoid confusion. Lack of that is why I
>> asked.
>
> It got posted to the appropriate mailing lists with CCs, including David.
> Just three people responded.
>
> One of the responses was that people didn't like the duplication.  I
> posted v2 the same day, the DT people didn't like the file location, so
> I went back to v1.  That then sparked someone to start working _against_
> me, cleaning up the existing duplication, and acknowledging that it'll
> cause _me_ problems.
>
> So, as it was done maliciously and intentionally to give these porblems,
> I'm not budging on this.  Sorry.
>
> There are times when working on the kernel is not very nice.  This is one
> of them.

Please don't jump the gun right away, I just wanted to figure out
what's going on and make sure collaboration and coordination is
working smoothly. At least from what I could see that discussion
didn't happen on dri-devel (or I missed it), so totally didn't know
what's up.

Also, please don't just charge ahead, at least here in the drm
subsystem we try hard to work together and be friendly, and in my
experience there's no isssue at all in getting acks for cases like
this. And really, the conflict with drm-misc seems to be trivial.

But immediately building a castle and marking an aggressive defensive
stance ("I'm not budging on this.") isn't helping anyone. Indeed I
think it's actively harming collaboration and our community,
especially in this case here where I think there wasn't even a problem
to begin with (on the drm side at least, like I said didn't know about
dt). I don't think this is acceptable conduct, next time around please
calm down first before replying in anger. I, and the drm community
here, would really appreciate this.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
