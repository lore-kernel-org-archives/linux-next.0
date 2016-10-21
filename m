From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: including PHY tree in linux-next
Date: Fri, 21 Oct 2016 10:09:45 +0530
Message-ID: <58099C11.8050700@ti.com>
References: <5808995C.3010300@ti.com>
 <20161021090041.46cc5fee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:48800 "EHLO comal.ext.ti.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752051AbcJUEjx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Oct 2016 00:39:53 -0400
In-Reply-To: <20161021090041.46cc5fee@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi,

On Friday 21 October 2016 03:30 AM, Stephen Rothwell wrote:
> Hi Kishon,
> 
> On Thu, 20 Oct 2016 15:45:56 +0530 Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>
>> Can you include the following branches for linux-phy tree into linux-next?
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git next
>> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git fixes
> 
> Added from today (called phy-next and phy respectively).  Will these be
> merged via Dave Miller's trees, or directly to Linus?

I send pull request to gregkh. This tree contains USB, SATA and other PHYs
except ethernet PHY. greg generally merges it into his USB tree.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,

hmm.. I see atleast 4 drivers in drivers/phy which has just
MODULE_LICENSE("GPL"). I can check if these can be changed to GPL v2.
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

sure, I understand and agree to all of this.

Thanks
Kishon
