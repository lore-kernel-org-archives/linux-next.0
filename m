From: David Rientjes <rientjes@google.com>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Thu, 3 May 2012 14:57:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1205031454400.1631@chino.kir.corp.google.com>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au> <4F9ABF9C.2070707@xenotime.net> <alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com> <20120427132343.fbb443b9.akpm@linux-foundation.org> <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
 <20120427143646.8209627e.akpm@linux-foundation.org> <87fwbnag6u.fsf@skywalker.in.ibm.com> <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com> <CABEgKgqWo=b=o7PwOLc=QqCWXQxUaYvMX99GP9cR_Y-RoTEW3g@mail.gmail.com>
 <alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:37503 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756185Ab2ECV5l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 17:57:41 -0400
Received: by dady13 with SMTP id y13so2450288dad.5
        for <linux-next@vger.kernel.org>; Thu, 03 May 2012 14:57:41 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hiroyuki Kamezawa <kamezawa.hiroyuki@gmail.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

On Thu, 3 May 2012, David Rientjes wrote:

> Is this a claim that memory-intensive workloads will have the exact same 
> performance with and without memcg enabled?

I've just run specjbb2005 three times on my system both with and without 
cgroup_disable=memory on the command line and it is consistently 1% faster 
without memcg.  If I add XX:+UseLargePages to the command line to use 
hugepages it's even larger.  So why must I incur this performance 
degradation if I simply want to control who may mmap hugepages out of the 
global pool?

The functionality to control this is pretty important if I want to ensure 
applications aren't able to infringe on the preallocated hugepages of a 
higher priority application for business goals.
