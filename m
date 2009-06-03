From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: Tree for June 3 (driver core)
Date: Wed, 03 Jun 2009 14:44:55 -0700
Message-ID: <m1skihm1pk.fsf@fess.ebiederm.org>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
	<4A269BB2.4050508@oracle.com> <20090603212206.GA20804@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:34589 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754706AbZFCVo6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 17:44:58 -0400
In-Reply-To: <20090603212206.GA20804@suse.de> (Greg KH's message of "Wed\, 3 Jun 2009 14\:22\:06 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Greg KH <gregkh@suse.de> writes:

> On Wed, Jun 03, 2009 at 08:50:10AM -0700, Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>> > Hi all,
>> > 
>> > Looks like a real rush since -rc7 ...
>> 
>> 
>> drivers/built-in.o: In function `register_mem_sect_under_node':
>> (.text+0x1d305b): undefined reference to `sysfs_create_link_nowarn'
>> 
>> 
>> I can't find this function's implementation when CONFIG_SYSFS=y.
>
> Ah, it looks like this shows up when CONFIG_MEMORY_HOTPLUG_SPARSE is
> set.
>
> Eric, your patch, "sysfs: Remove now unnecessary error reporting
> suppression." caused this.  Turns out it is still used in the tree, and
> you forgot to remove the function from sysfs.h at the same time.
>
> I'm going to drop it, and the other two patches I took from you for
> sysfs, as it doesn't make sense to have them in the tree yet.
>
> Care to rework your series with this fixed?

Sure.

My apologies it looks like sysfs_create_link_nowarn grew an extra
user since last time I audited that patch thoroughly.

How I missed the header I don't know.

Eric
