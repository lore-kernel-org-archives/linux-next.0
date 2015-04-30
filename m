From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 9/9] sysfs: disallow world-writable files.
Date: Thu, 30 Apr 2015 11:32:05 +0930
Message-ID: <874mnyxtk2.fsf@rustcorp.com.au>
References: <CAB_aHcxDvUnqNaEJDhQ7e1Jd4U3-qvV1=99uyiBfD1384jku5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAB_aHcxDvUnqNaEJDhQ7e1Jd4U3-qvV1=99uyiBfD1384jku5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gobinda Maji <gobinda.cemk07@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Gobinda Maji <gobinda.cemk07@gmail.com> writes:
> Hi Rusty,

Hi Gobinda,

> I have a small doubt about the permission restriction (User perms >=
> group perms >= other perms) in VERIFY_OCTAL_PERMISSIONS(). Please Note
> that permission field of User, Group or Other consists of three bits.
> LSB is EXECUTE permission, MSB is READ permission and the middle bit
> is WRITE permission. Say for example, permission value is "0431". Here
> User has only READ permission whereas Group has both WRITE and EXECUTE
> permission and Other has EXECUTE permission. I guess, it is not good
> to give Group the WRITE permission whereas User itself has no WRITE
> permission.

You're absolutely right, well spotted!  The checks can be tightened.  We
don't really care about execute, but logically write is "more
privileged" than read.

Best to separate the tests; OTHER_WRITABLE <= GROUP_WRITABLE <= OWNER_WRITABLE
and OTHER_READABLE <= GROUP_READABLE <= OWNER_READABLE.

A patch would be welcome!

Thanks,
Rusty.
