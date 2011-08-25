From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [Patch] numa: introduce CONFIG_NUMA_SYSFS for
 drivers/base/node.c
Date: Wed, 24 Aug 2011 19:14:30 -0700
Message-ID: <20110824191430.8a908e70.rdunlap@xenotime.net>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au>
	<20110804152211.ea10e3e7.rdunlap@xenotime.net>
	<20110823143912.0691d442.akpm@linux-foundation.org>
	<4E547155.8090709@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <4E547155.8090709@redhat.com>
Sender: owner-linux-mm@kvack.org
To: Cong Wang <amwang@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

On Wed, 24 Aug 2011 11:34:45 +0800 Cong Wang wrote:

> Hi, Andrew,
> 
> Do you think my patch below is better?

Hi,

This causes build errors for me because node.o is not being built:

arch/x86/built-in.o: In function `topology_init':
topology.c:(.init.text+0x3668): undefined reference to `register_one_node'
drivers/built-in.o: In function `unregister_cpu':
(.text+0x7aecc): undefined reference to `unregister_cpu_under_node'
drivers/built-in.o: In function `register_cpu':
(.cpuinit.text+0xc1): undefined reference to `register_cpu_under_node'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
