From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 1 (virtio_blk warning)
Date: Tue, 6 Apr 2010 13:58:59 -0700
Message-ID: <20100406135859.ed1fa4c4.randy.dunlap@oracle.com>
References: <20100401172317.80b6d961.sfr@canb.auug.org.au>
	<20100401091312.85775242.randy.dunlap@oracle.com>
	<201004061210.48840.rusty@rustcorp.com.au>
	<4BBB7A44.2020300@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:37125 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756564Ab0DFVAE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2010 17:00:04 -0400
In-Reply-To: <4BBB7A44.2020300@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: john cooper <john.cooper@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marc Haber <mh+qemu-devel@zugschlus.de>

On Tue, 06 Apr 2010 14:15:32 -0400 john cooper wrote:

> Rusty Russell wrote:
> > On Fri, 2 Apr 2010 02:43:12 am Randy Dunlap wrote:
> >> On Thu, 1 Apr 2010 17:23:17 +1100 Stephen Rothwell wrote:
> >>
> >>> Hi all,
> >>>
> >>> Changes since 20100331:
> >>
> >> drivers/block/virtio_blk.c:228:13: warning: multi-character character constant
> >>
> >> due to:
> >>
> >> 	if (cmd == 'VBID') {
> > 
> > John?  That looks suspiciously like untested code.
> 
> It does work as advertised although gcc is obliged to squawk
> at multi-byte character constants due to portability concerns.

Thanks.  I wasn't aware of that gcc extension.

> Note I'd intended that only as an example for the benefit of
> completeness in the associated patch set, and to stick out
> like a sore thumb of sorts.  Marc Haber had suggested exposing
> the id string to the guest userland via /sys which is what I
> had expected to displace the loose ioctl example above.  In
> fact that discussion is what prodded revisiting this issue in
> the first place.
> 
> Unsure whether Marc (cc'ed here) is still planning to pursue
> that interface so unless I hear something to the contrary in
> the next day or so I'll package up a suitable ioctl interface
> and forward a patch.  It doesn't hurt to provide ioctl access
> to the info in addition to exposing it via /sys, but I'd
> hoped the latter would overshadow the need to do so.

---
~Randy
