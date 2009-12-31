From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 31 (kgdb)
Date: Thu, 31 Dec 2009 11:07:47 -0800
Message-ID: <20091231110747.5efc1efa.randy.dunlap@oracle.com>
References: <20091231112314.a51e160b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:20517 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753038AbZLaTIu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Dec 2009 14:08:50 -0500
In-Reply-To: <20091231112314.a51e160b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net

On Thu, 31 Dec 2009 11:23:14 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> This one has also not had the build testing *between* merges, but has had
> all the normal build testing at the end.There may be more unbisectable
> points in the tree then usual.
> 
> Changes since 20091230:
> 
> My fixes tree is again empty with the equivalent of its patch being added
> to Linus' tree.


when CONFIG_PROC_FS is not enabled:

kernel/built-in.o: In function `kdb_summary':
kdb_main.c:(.text+0x6a413): undefined reference to `_meminfo_proc_show'


when CONFIG_KGDB_KDB is not enabled:

kernel/built-in.o: In function `kdb_dmesg':
kdb_main.c:(.text+0x6b5c4): undefined reference to `kdb_syslog_data'

when CONFIG_KDB_KEYBOARD is not enabled:

drivers/built-in.o: In function `cleanup_kgdboc':
kgdboc.c:(.text+0x1ee2df): undefined reference to `kdb_get_kbd_char'
drivers/built-in.o: In function `configure_kgdboc':
kgdboc.c:(.text+0x1ee463): undefined reference to `kdb_get_kbd_char'



---
~Randy
