From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 6-July 9 (percpu/x86)
Date: Thu, 9 Jul 2009 10:22:48 -0700
Message-ID: <20090709102248.01e2312c.randy.dunlap@oracle.com>
References: <20090706162632.fdde002e.sfr@canb.auug.org.au>
	<20090706095343.df21d4c9.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754459AbZGIRXJ@vger.kernel.org>
In-Reply-To: <20090706095343.df21d4c9.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Tejun Heo <htejun@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, 6 Jul 2009 09:53:43 -0700 Randy Dunlap wrote:

> On Mon, 6 Jul 2009 16:26:32 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20090703:
> > 
> > The percpu tree lost all its conflicts but gained another against the tip
> > tree.
> 
> arch/x86/mm/pageattr.c: In function 'cpa_process_alias':
> arch/x86/mm/pageattr.c:749: error: implicit declaration of function 'pcpu_lpage_remapped'
> 
> config attached.


Still present in 20090709...


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
