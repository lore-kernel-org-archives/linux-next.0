From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 3 (KVMTOOL_TEST_ENABLE)
Date: Fri, 04 Nov 2011 09:59:33 -0700
Message-ID: <4EB419F5.6070308@xenotime.net>
References: <20111103172036.0795ce9559ab2dbfd5740a26@canb.auug.org.au> <4EB33525.808@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:41218 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932825Ab1KDRAU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Nov 2011 13:00:20 -0400
In-Reply-To: <4EB33525.808@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, x86 maintainers <x86@kernel.org>, Pekka Enberg <penberg@cs.helsinki.fi>

On 11/03/2011 05:43 PM, Randy Dunlap wrote:
> On 11/02/2011 11:20 PM, Stephen Rothwell wrote:
>> Hi all,
> 
> 
> When KVMTOOL_TEST_ENABLE is enabled but CONFIG_BLOCK is not enabled, there are
> MANY build errors.  This one (case) is probably fixed by adding "select BLOCK", but it's
> all rather ugly.

kconfig even tells us:

warning: (KVMTOOL_TEST_ENABLE) selects KGDB which has unmet direct dependencies (HAVE_ARCH_KGDB && DEBUG_KERNEL && EXPERIMENTAL)
warning: (KVMTOOL_TEST_ENABLE) selects BLK_DEV which has unmet direct dependencies (BLOCK)


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
