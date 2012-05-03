From: David Rientjes <rientjes@google.com>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Thu, 3 May 2012 13:39:36 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1205031338440.1631@chino.kir.corp.google.com>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au> <4F9ABF9C.2070707@xenotime.net> <alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com> <20120427132343.fbb443b9.akpm@linux-foundation.org> <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
 <20120427143646.8209627e.akpm@linux-foundation.org> <87fwbnag6u.fsf@skywalker.in.ibm.com> <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>User-Agent: Notmuch/0.11.1+346~g13d19c3 (http://notmuchmail.org) Emacs/23.3.1 (x86_64-pc-linux-gnu)
 <87ehr1xtdz.fsf@skywalker.in.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:58010 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758639Ab2ECUji (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 16:39:38 -0400
Received: by dady13 with SMTP id y13so2353083dad.5
        for <linux-next@vger.kernel.org>; Thu, 03 May 2012 13:39:38 -0700 (PDT)
In-Reply-To: <87ehr1xtdz.fsf@skywalker.in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

On Thu, 3 May 2012, Aneesh Kumar K.V wrote:

> All the use cases I came across requested for limiting both memory
> and hugetlb pages. They want to limit the usage of both.

And as cgroups moves to a single hierarchy for simplification, this isn't 
hard to do by mounting both cgroups.
