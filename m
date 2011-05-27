From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 27 (ocfs2)
Date: Fri, 27 May 2011 09:30:43 -0700
Message-ID: <20110527093043.0840ac30.randy.dunlap@oracle.com>
References: <20110527155231.3a9925c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:55755 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab1E0QbJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2011 12:31:09 -0400
In-Reply-To: <20110527155231.3a9925c0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 27 May 2011 15:52:31 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110526:

ocfs2 on i386 has build errors:

ERROR: "__udivdi3" [fs/ocfs2/ocfs2.ko] undefined!
ERROR: "__umoddi3" [fs/ocfs2/ocfs2.ko] undefined!

or when builtin:

fs/built-in.o: In function `ocfs2_find_victim_alloc_group.clone.0':
move_extents.c:(.text+0x1fb01a): undefined reference to `__udivdi3'
fs/built-in.o: In function `ocfs2_validate_and_adjust_move_goal':
move_extents.c:(.text+0x1fb12e): undefined reference to `__umoddi3'
move_extents.c:(.text+0x1fb15a): undefined reference to `__udivdi3'
fs/built-in.o: In function `ocfs2_find_victim_alloc_group.clone.0':
move_extents.c:(.text+0x1fb01a): undefined reference to `__udivdi3'
fs/built-in.o: In function `ocfs2_validate_and_adjust_move_goal':
move_extents.c:(.text+0x1fb12e): undefined reference to `__umoddi3'
move_extents.c:(.text+0x1fb15a): undefined reference to `__udivdi3'
fs/built-in.o: In function `ocfs2_find_victim_alloc_group.clone.0':
move_extents.c:(.text+0x1fb01a): undefined reference to `__udivdi3'
fs/built-in.o: In function `ocfs2_validate_and_adjust_move_goal':
move_extents.c:(.text+0x1fb12e): undefined reference to `__umoddi3'
move_extents.c:(.text+0x1fb15a): undefined reference to `__udivdi3'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
