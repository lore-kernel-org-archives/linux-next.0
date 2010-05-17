From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next -> 2.6.34: Tree for April 28 (logfs)
Date: Sun, 16 May 2010 20:48:26 -0700
Message-ID: <20100516204826.2625eed2.randy.dunlap@oracle.com>
References: <20100428164341.cee2911a.sfr@canb.auug.org.au>
	<20100428085604.0566092a.randy.dunlap@oracle.com>
	<20100505092020.66a461fa.randy.dunlap@oracle.com>
	<20100505203548.GI25129@logfs.org>
	<20100509062010.GA9485@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:21577 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752842Ab0EQDua (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 May 2010 23:50:30 -0400
In-Reply-To: <20100509062010.GA9485@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: J??rn Engel <joern@logfs.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, logfs@logfs.org

On Sun, 9 May 2010 08:20:10 +0200 Ingo Molnar wrote:

> 
> * J??rn Engel <joern@logfs.org> wrote:
> 
> > On Wed, 5 May 2010 09:20:20 -0700, Randy Dunlap wrote:
> > > On Wed, 28 Apr 2010 08:56:04 -0700 Randy Dunlap wrote:
> > > 
> > > > When CONFIG_BLOCK is not enabled:
> > > > 
> > > > fs/logfs/super.c:142: error: implicit declaration of function 'bdev_get_queue'
> > > > fs/logfs/super.c:142: error: invalid type argument of '->' (have 'int')
> > > 
> > > Still have this build error in linux-next-May 5-2010.
> > 
> > Should be fixed now.  Sorry about the delay.
> 
> Please post the fix itself as well, i've ran into this and so did others.


This fix is now needed in 2.6.34....

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
