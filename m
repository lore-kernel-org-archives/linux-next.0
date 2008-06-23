From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: ColdFire add support for kernel preemption
Date: Mon, 23 Jun 2008 23:23:08 +1000
Message-ID: <485FA3BC.5080807@snapgear.com>
References: <200805010216.m412GT6t004096@goober>	<20080501143336.552e39e1.akpm@linux-foundation.org>	<481AC07A.6080707@snapgear.com>	<20080502083755.GA13973@Chamillionaire.breakpoint.cc>	<20080502052235.eb9c336a.akpm@linux-foundation.org>	<485F3585.2080606@snapgear.com>	<20080622225102.5117f22b.akpm@linux-foundation.org> <20080623175326.ddf5d2d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755799AbYFWNXW@vger.kernel.org>
In-Reply-To: <20080623175326.ddf5d2d4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Stephen Rothwell wrote:
> Hi Greg,
> 
> On Sun, 22 Jun 2008 22:51:02 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>> On Mon, 23 Jun 2008 15:32:53 +1000 Greg Ungerer <gerg@snapgear.com> wrote:
>>
>>> Here is a git tree for the collection of patches for the m68knommu
>>> architecture that I intend for the 2.6.27 merge window.
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus
> 
> Added today (slipped it in at the end).

Great, thanks.


>>> I have created a general uclinux changes git tree as well,
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/uclinux.git for-linus
> 
> This tree currently has no for-linus branch.  You should create one (even
> if it just a subset of Linus' tree).  I've added it using its master
> branch for now, please let me know when it is fixed.

Ok, fixed now. There is an empty for-linus branch there.


> Also, these branches would normally be called for-next.  Most people keep
> for-linus for bug fixes for the current release.  If you decide to change
> the branch name, just let me know.

Ok, done too. Branches named for-next exist in both. The patches
on the for-linus branch in the m68knommu.git are now on the
for-next branch.

Do I need to send a request to Linus to pull this into his
tree during the next merge window?  Or will it migrate up
from linux-next?


> Repeat of the rules for linux-next: anything included must have been
> posted somewhere appropriate, reviewed and unit tested (i.e. your tree
> should build for you).
> 
>> Great, thanks.  But can we get them into linux-next please?  I'll pick
>> them up via that route.
> 
> Done.

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a Secure Computing Company      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
