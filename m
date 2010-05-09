From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for April 28 (logfs)
Date: Sun, 9 May 2010 08:20:10 +0200
Message-ID: <20100509062010.GA9485@elte.hu>
References: <20100428164341.cee2911a.sfr@canb.auug.org.au>
 <20100428085604.0566092a.randy.dunlap@oracle.com>
 <20100505092020.66a461fa.randy.dunlap@oracle.com>
 <20100505203548.GI25129@logfs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51034 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750944Ab0EIGUU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 May 2010 02:20:20 -0400
Content-Disposition: inline
In-Reply-To: <20100505203548.GI25129@logfs.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: J??rn Engel <joern@logfs.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, logfs@logfs.org


* J??rn Engel <joern@logfs.org> wrote:

> On Wed, 5 May 2010 09:20:20 -0700, Randy Dunlap wrote:
> > On Wed, 28 Apr 2010 08:56:04 -0700 Randy Dunlap wrote:
> > 
> > > When CONFIG_BLOCK is not enabled:
> > > 
> > > fs/logfs/super.c:142: error: implicit declaration of function 'bdev_get_queue'
> > > fs/logfs/super.c:142: error: invalid type argument of '->' (have 'int')
> > 
> > Still have this build error in linux-next-May 5-2010.
> 
> Should be fixed now.  Sorry about the delay.

Please post the fix itself as well, i've ran into this and so did others.

Thanks,

	Ingo
