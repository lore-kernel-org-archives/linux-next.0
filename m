From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: Tree for April 30 (CONFIG_SYSFS=n)
Date: Wed, 05 May 2010 14:35:03 -0700
Message-ID: <m1d3xa1188.fsf@fess.ebiederm.org>
References: <20100430163538.7253a9e0.sfr@canb.auug.org.au>
	<20100430105016.40b51636.randy.dunlap@oracle.com>
	<20100505091738.7ec27479.randy.dunlap@oracle.com>
	<20100505162459.GA20296@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:32798 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752Ab0EEVfM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 17:35:12 -0400
In-Reply-To: <20100505162459.GA20296@suse.de> (Greg KH's message of "Wed\, 5 May 2010 09\:24\:59 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Greg KH <gregkh@suse.de> writes:

> On Wed, May 05, 2010 at 09:17:38AM -0700, Randy Dunlap wrote:
>> On Fri, 30 Apr 2010 10:50:16 -0700 Randy Dunlap wrote:
>> 
>> > On Fri, 30 Apr 2010 16:35:38 +1000 Stephen Rothwell wrote:
>> > 
>> > > Hi all,
>> > > 
>> > > Changes since 20100429:
>> > 
>> > 
>> > When CONFIG_SYSFS is disabled:
>> > 
>> > include/linux/sysfs.h:330: error: parameter 1 ('type') has incomplete type
>> 
>> 
>> Still have this in linux-next of May 5-2010.
>
> Eric, this is due to your changes, care to fix it up?

Apologies for not looking at this earlier.  I just took a look
at this and I believe this error is the result of a gcc bug.


This appears to the fragment that doesn't compile.

enum kobj_ns_type;
static inline void sysfs_exit_ns(enum kobj_ns_type type, const void *tag)
{
}


I could either include kobject.h or make the fragment:
static inline void sysfs_exit_ns(int type, const void *tag)
{
}

I really don't like either option. 

Does anyone know how to smack gcc up the side of the head and convince
it has all of the information it needs, and get it to stop complaining?


Eric
