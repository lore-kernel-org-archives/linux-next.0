From: David Gibson <dwg@au1.ibm.com>
Subject: Re: [powerpc] Next tree Nov 2 : kernel BUG at mm/mmap.c:2135!
Date: Wed, 18 Nov 2009 13:36:27 +1100
Message-ID: <20091118023627.GC11991@yookeroo>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au>
 <4AEEA279.4040106@in.ibm.com>
 <4AF175D4.7030507@in.ibm.com>
 <20091105001650.GD3613@yookeroo.seuss>
 <4AFBEE98.2070208@in.ibm.com>
 <20091113013729.GB18848@yookeroo.seuss>
 <20091113021048.GA4865@yookeroo.seuss>
 <4AFD2865.5090503@in.ibm.com>
 <20091117052542.GB2576@yookeroo>
 <4B02529F.1060801@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:48950 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbZKRDc2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2009 22:32:28 -0500
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [202.81.31.246])
	by e23smtp06.au.ibm.com (8.14.3/8.13.1) with ESMTP id nAI3WVY1024179
	for <linux-next@vger.kernel.org>; Wed, 18 Nov 2009 14:32:31 +1100
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id nAI3TEaF999488
	for <linux-next@vger.kernel.org>; Wed, 18 Nov 2009 14:29:15 +1100
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id nAI3WWmU025889
	for <linux-next@vger.kernel.org>; Wed, 18 Nov 2009 14:32:32 +1100
Content-Disposition: inline
In-Reply-To: <4B02529F.1060801@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org

On Tue, Nov 17, 2009 at 01:07:03PM +0530, Sachin Sant wrote:
> David Gibson wrote:
> >Hrm.  Ok.  I am truly baffled.  Well, below is a revised debug patch
> >which I hope will shed some sort of light on things.  I do also notice
> Thanks for the debug patch. I have attached the collected information.
> 
> >from your full log that it looks like the bug is happening shortly
> >after we start userspace.  So it may be differences in my userspace
> >set up that meant I haven't been able to reproduce it.  I'll have
> >another look at that when I get a chance.
> Let me know if you need access to the system on which i can recreate the
> bug. I can make that system available for you to debug this issue.

That's probably a good idea.  I'm still pretty baffled by this, so it
will probably take several more rounds of debug patches to start
getting a handle on it.


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
