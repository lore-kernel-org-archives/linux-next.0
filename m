From: Chris Friesen <chris.friesen@genband.com>
Subject: [BUG?] anyone aware of pagecache issues with 2.6.27?
Date: Tue, 27 Sep 2011 09:46:41 -0600
Message-ID: <4E81EFE1.9090000@genband.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from exprod7og112.obsmtp.com ([64.18.2.177]:39389 "EHLO
	exprod7og112.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab1I0QJj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 12:09:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org


I realize this is a long shot, but I figure it's worth a try.

What we're seeing is that "cached" gets large (several gigs) and "free" 
gets small, and when we get into this state our system responsiveness 
starts dropping.  If I do "echo 3 > /proc/sys/vm/drop_caches", then it 
immediately frees up a couple gig of memory and things work as expected.

Based on the fact that memory is immediately reclaimable from the cache 
it appears that the bulk of the cache is clean pages.  This shouldn't 
have a major impact on memory allocation, but at least on this setup it 
does.  It seems like there is something not quite right about the 
mechanism that reclaims clean pages from the cache.  Is anyone aware of 
issues in this area for 2.6.27-vintage kernels?

Is there a way to limit how much memory gets used for the page cache? 
drop_caches seems to help, but it's a really big hammer.

System details:
2.6.27 kernel, x86-64, 8GB RAM, no swap.  Root is on a tmpfs filesystem, 
local disks are used for miscellaneous stuff including /var/log, we have 
some sizeable network-mounted filesystems. 
/proc/sys/vm/overcommit_memory is set to 2, with overcommit_ratio set to 
100.


Thanks,
Chris


-- 
Chris Friesen
Software Developer
GENBAND
chris.friesen@genband.com
www.genband.com
