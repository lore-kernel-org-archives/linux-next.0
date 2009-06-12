From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Fri, 12 Jun 2009 11:14:10 +0530
Message-ID: <4A31EB2A.9080003@in.ibm.com>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A081002.4050802@in.ibm.com> <4A2909E8.6000507@in.ibm.com> <Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI> <4A2D001E.5060802@in.ibm.com> <20090609141903.GE15219@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:37748 "EHLO
	e23smtp05.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751323AbZFLFoN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2009 01:44:13 -0400
Received: from d23relay01.au.ibm.com (d23relay01.au.ibm.com [202.81.31.243])
	by e23smtp05.au.ibm.com (8.13.1/8.13.1) with ESMTP id n5C5g54t010965
	for <linux-next@vger.kernel.org>; Fri, 12 Jun 2009 15:42:05 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay01.au.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n5C5iDIL422156
	for <linux-next@vger.kernel.org>; Fri, 12 Jun 2009 15:44:14 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n5C5iDrF010730
	for <linux-next@vger.kernel.org>; Fri, 12 Jun 2009 15:44:13 +1000
In-Reply-To: <20090609141903.GE15219@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Pekka J Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

Nick Piggin wrote:
> I can't really work it out. It seems to be the kmem_cache_cache which has
> a problem, but there have already been lots of caches created and even
> this samw cache_node already used right beforehand with no problem.
>
> Unless a CPU or node comes up or something right at this point or the
> caller is scheduled onto a different CPU... oopses seem to all
> have CPU#1, wheras boot CPU is probably #0 (these CPUs are node 0
> and memory is only on node 1 and 2 where there are no CPUs if I read
> correctly).
>
> I still can't see the reason for the failure, but can you try this
> patch please and show dmesg?
I was able to boot yesterday's next (20090611) on this machine. Not sure
what changed(may be because of merge with linus tree), but i can no longer
recreate this issue with next 20090611. I was consistently able to
recreate the problem till June 10th next tree.

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
