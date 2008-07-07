From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the selinux tree
Date: Tue, 8 Jul 2008 00:43:56 +1000 (EST)
Message-ID: <Xine.LNX.4.64.0807080042090.11950@us.intercode.com.au>
References: <20080707225130.ca52d527.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from namei.org ([69.55.235.186]:60904 "EHLO us.intercode.com.au"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753426AbYGGOof (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 10:44:35 -0400
In-Reply-To: <20080707225130.ca52d527.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Paris <eparis@redhat.com>, Stephen Smalley <sds@tycho.nsa.gov>, Paul Moore <paul.moore@hp.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Mon, 7 Jul 2008, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the selinux tree got a conflict in
> fs/proc/task_mmu.c between commit
> 5d7e0d2bd98ef4f5a16ac9da1987ae655368dd6a ("Fix pagemap_read() use of
> struct mm_walk") from Linus' tree and commit
> ca9b1a1413bac6ea5e5c8cb81044a39bdb3b4bc8 ("Security: split proc ptrace
> checking into read vs. attach") from the selinux tree.
> 
> The former removed some of the code that the latter changed.  It is
> probably worth a check on the code in pagemap_read to make sure I got it
> right.

I couldn't locate your updated version, but have resolved it in my own 
tree (which is being rebased).  

One thing we need to understand is why there were two separate 
ptrace_may_attach() calls in the earlier version of pagemap_read().



- James
-- 
James Morris
<jmorris@namei.org>
