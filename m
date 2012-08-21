From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: inux-next: Tree for Aug 21 (call-trace when suspending: PM?)
Date: Tue, 21 Aug 2012 13:14:36 +0200
Message-ID: <CA+icZUXD+oWqTKB2b_xu8UEDnX6mSs_aELaGu9UQs_U4fHaKGQ@mail.gmail.com>
References: <CA+icZUWg7qEFvAsTMb9OFKmdW7XD4op14Ps2y6PLByZRArjeLg@mail.gmail.com>
	<CA+icZUVjr6aaopVAhGRr13RLDy=epdnU30YTHOhjXmrWb2sAjA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:47392 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751643Ab2HULOi (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Aug 2012 07:14:38 -0400
In-Reply-To: <CA+icZUVjr6aaopVAhGRr13RLDy=epdnU30YTHOhjXmrWb2sAjA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Ingo Molnar <mingo@elte.hu>, Al Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>

On Tue, Aug 21, 2012 at 1:03 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Tue, Aug 21, 2012 at 1:02 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> On Tue, Aug 21, 2012 at 8:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Hi all,
>>>
>>> Changes since 20120820:
>>>
>>> The rr tree gained a conflict against Linus' tree.
>>>
>>> The tip tree still has its build failure so I used the version from
>>> next-20120814.
>>>
>>> The workqueues tree gained a conflict against the hid tree.
>>>
>>> The drivers-x86 tree still has its build failure so I used the version
>>> from next-20120817.
>>>
>>> The signal tree gained a conflict against Linus' tree.  I have still
>>> reverted 3 commits from the signal tree at the request of the arm
>>> maintainer.
>>>
>>> ----------------------------------------------------------------------------
>>>
>>
>> Hi,
>>
>> I have compiled linux-next (next-20120821) and see the attached
>> call-trace when suspending.
>> Suspending did NOT work (Xorg seems to cause it) - machine came back to desktop.
>>
>> With yesterday's next-20120820 I haven't seen this.
>>
>> I am not sure what is this causing... PM, x86/sched or even VFS?
>> Any help for debugging appreciated.
>>
>> I am on Ubuntu/precise AMD64 and use systemd-v43 as init-system.
>>
>> Regards,
>> - Sedat -
>
> Forgot attachment!
> If you don't succeed - try try try...
>
> - Sedat -

[ CC danvet ]

I have pulled in drm-intel-fixes into my local GIT tree and rebuilt
i915 - this seems to fix the problem.
Daniel any suggestion which patch in d-i-f did it?

[1] http://cgit.freedesktop.org/~danvet/drm-intel/log/?h=drm-intel-fixes
