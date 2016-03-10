From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: removal of the rpmsg tree
Date: Wed, 9 Mar 2016 21:31:05 -0800
Message-ID: <CAOCOHw4Y-iY+pOr4_L1zeDb6SES66_o=tBJy4wOD2ikgzMJPjg@mail.gmail.com>
References: <20160309162826.60d6b72b@canb.auug.org.au>
	<CAK=WgbaDinH5VC+tP5NYZMbh7CiOSfqNbkZEbaN3cT5pZhae5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK=WgbaDinH5VC+tP5NYZMbh7CiOSfqNbkZEbaN3cT5pZhae5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 9, 2016 at 7:07 AM, Ohad Ben-Cohen <ohad@wizery.com> wrote:
> Hi Stephen,
>
> On Wed, Mar 9, 2016 at 7:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Ohad,
>>
>> I noticed that the rpmsg tree
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git branch for-next
>>
>> has not been updated since November 2014.  I am going to remove it from
>> linux-next tomorrow unless I hear that it may be useful.  It can always
>> be easily added back if it proves useful in the future.
>
> That should be fine.
>
> FWIW, Bjorn will most likely setup another rpmsg tree and ask you to
> add it to linux-next, as he's co-maintaining
> remoteproc/rpmsg/hwspinlock now.
>

Thanks for the poke.

Stephen, I'm co-maintain the hwspinlock, rpmsg and remoteproc
subsystems; and will as such maintain the next branches.

Could you please pull the remoteproc next patches from the "for-next" branch of:
git://github.com/andersson/remoteproc.git



I will let you know when we have patches in hwspinlock and rpmsg to
set those up as well, but at the moment we don't have anything
incoming there.

Regards,
Bjorn
