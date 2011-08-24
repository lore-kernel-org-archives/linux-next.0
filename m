From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 24 (dynamic_debug)
Date: Wed, 24 Aug 2011 10:25:51 -0700
Message-ID: <20110824102551.8fc076b5.rdunlap@xenotime.net>
References: <20110824160404.ebad6370aee2cad82a990142@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110824160404.ebad6370aee2cad82a990142@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Baron <jbaron@redhat.com>, Bart Van Assche <bvanassche@acm.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 24 Aug 2011 16:04:04 +1000 Stephen Rothwell wrote:

> Hi all,

When CONFIG_NET is not enabled (I see this on i386 builds):

lib/built-in.o: In function `__dynamic_netdev_dbg':
(.text+0x9fda): undefined reference to `__netdev_printk'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
