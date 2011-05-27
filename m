From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 27 (ocfs2)
Date: Fri, 27 May 2011 11:21:09 -0700
Message-ID: <20110527112109.78501105.randy.dunlap@oracle.com>
References: <20110527155231.3a9925c0.sfr@canb.auug.org.au>
	<20110527093043.0840ac30.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110527093043.0840ac30.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 27 May 2011 09:30:43 -0700 Randy Dunlap wrote:

> On Fri, 27 May 2011 15:52:31 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110526:
> 
> ocfs2 on i386 has build errors:
> 
> ERROR: "__udivdi3" [fs/ocfs2/ocfs2.ko] undefined!
> ERROR: "__umoddi3" [fs/ocfs2/ocfs2.ko] undefined!
> 
> or when builtin:
> 
> fs/built-in.o: In function `ocfs2_find_victim_alloc_group.clone.0':
> move_extents.c:(.text+0x1fb01a): undefined reference to `__udivdi3'
> fs/built-in.o: In function `ocfs2_validate_and_adjust_move_goal':
> move_extents.c:(.text+0x1fb12e): undefined reference to `__umoddi3'
> move_extents.c:(.text+0x1fb15a): undefined reference to `__udivdi3'
> fs/built-in.o: In function `ocfs2_find_victim_alloc_group.clone.0':
> move_extents.c:(.text+0x1fb01a): undefined reference to `__udivdi3'
> fs/built-in.o: In function `ocfs2_validate_and_adjust_move_goal':
> move_extents.c:(.text+0x1fb12e): undefined reference to `__umoddi3'
> move_extents.c:(.text+0x1fb15a): undefined reference to `__udivdi3'
> fs/built-in.o: In function `ocfs2_find_victim_alloc_group.clone.0':
> move_extents.c:(.text+0x1fb01a): undefined reference to `__udivdi3'
> fs/built-in.o: In function `ocfs2_validate_and_adjust_move_goal':
> move_extents.c:(.text+0x1fb12e): undefined reference to `__umoddi3'
> move_extents.c:(.text+0x1fb15a): undefined reference to `__udivdi3'

Fixed by just-merged mainline commit:

Gitweb:     http://git.kernel.org/linus/6aea6f5068cb86e89a6ac243c3fc131045b6563a
Commit:     6aea6f5068cb86e89a6ac243c3fc131045b6563a
Parent:     dda54e76d7dba0532ebdd72e0b4f492a03f83225
Author:     Tristan Ye <tristan.ye@oracle.com>
AuthorDate: Fri May 27 15:19:56 2011 +0800
Committer:  Tristan Ye <tristan.ye@oracle.com>
CommitDate: Fri May 27 14:52:53 2011 +0800

    Ocfs2/move_extents: Avoid doing division in extent moving.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
