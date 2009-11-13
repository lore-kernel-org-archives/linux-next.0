From: Mike Galbraith <efault@gmx.de>
Subject: Re: -next: Nov 12 - kernel BUG at kernel/sched.c:7359!
Date: Fri, 13 Nov 2009 17:12:11 +0100
Message-ID: <1258128731.6284.2.camel@marge.simson.net>
References: <20091112195101.63263490.sfr@canb.auug.org.au>
	 <4AFBF73B.5040500@in.ibm.com> <1258027820.4039.129.camel@laptop>
	 <4AFBFE3D.80507@in.ibm.com> <1258028831.4039.152.camel@laptop>
	 <1258045831.4039.736.camel@laptop>  <20091113095801.GA29977@in.ibm.com>
	 <1258107368.4039.1149.camel@laptop>  <1258108281.22655.5.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:32801 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754667AbZKMQMO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Nov 2009 11:12:14 -0500
In-Reply-To: <1258108281.22655.5.camel@laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: ego@in.ibm.com, Sachin Sant <sachinp@in.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Fri, 2009-11-13 at 11:31 +0100, Peter Zijlstra wrote:

> /me goes try a PREEMPT=n kernel, since that is what Mike reports boot
> funnies with..

My highly intermittent funny is still there unfortunately.

dmesg|grep span
[    0.504026]  domain 0: span 0,3 level MC
[    0.504032]   domain 1: span 0-3 level CPU
[    0.504042]  domain 0: span 1-2 level MC
[    0.504047]   domain 1: span 0-3 level CPU
[    0.504055]  domain 0: span 1-2 level MC
[    0.504060]   domain 1: span 0-3 level CPU
[    0.504069]  domain 0: span 0,3 level MC
[    0.504073]   domain 1: span 0-3 level CPU

	-Mike
