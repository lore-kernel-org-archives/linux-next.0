From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 20 (gfs2)
Date: Fri, 20 Jul 2012 09:07:23 -0700
Message-ID: <5009823B.2010700@xenotime.net>
References: <20120720151322.d952c13390b3078b2a5505bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120720151322.d952c13390b3078b2a5505bd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, cluster-devel@redhat.com, Steven Whitehouse <swhiteho@redhat.com>
List-Id: linux-next.vger.kernel.org

On 07/19/2012 10:13 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120719:
> 




on i386 (modular):

ERROR: "__divdi3" [fs/gfs2/gfs2.ko] undefined!

or builtin:

fs/built-in.o: In function `gfs2_fallocate':
file.c:(.text+0x232086): undefined reference to `__divdi3'





-- 
~Randy
