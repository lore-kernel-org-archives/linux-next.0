From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Fri, 27 Apr 2012 08:47:40 -0700
Message-ID: <4F9ABF9C.2070707@xenotime.net>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:39662 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1759972Ab2D0PrP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Apr 2012 11:47:15 -0400
In-Reply-To: <20120427161146.95422142968526faaff615d4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>

On 04/26/2012 11:11 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120424:



uml on x86_64 (defconfig):

mm/memcontrol.c:256:30: error: 'HUGE_MAX_HSTATE' undeclared here (not in a function)


-- 
~Randy
