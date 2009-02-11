From: Chris Mason <chris.mason@oracle.com>
Subject: Re: next-20090211: BUG: MAX_LOCKDEP_SUBCLASSES too low!
Date: Wed, 11 Feb 2009 09:01:36 -0500
Message-ID: <1234360896.8537.0.camel@think.oraclecorp.com>
References: <a4423d670902110414r72f14c1eq850cda59533bd9db@mail.gmail.com>
	 <1234355010.23438.132.camel@twins> <1234355070.23438.133.camel@twins>
	 <1234355201.23438.134.camel@twins>
	 <a4423d670902110452s5fb6d041l2363c8ad9b9618fb@mail.gmail.com>
	 <1234357467.23438.151.camel@twins>  <1234360834.23438.162.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756510AbZBKOCW@vger.kernel.org>
In-Reply-To: <1234360834.23438.162.camel@twins>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

On Wed, 2009-02-11 at 15:00 +0100, Peter Zijlstra wrote:

> > > > Could you run with the below patch, so that we can see where this
> > > > happens?
> > 
> > Tssk, Chris what you have been doing?
> 
> Would something like this work?
> 

It's almost perfect ;) I just need BTRFS_MAX_LEVEL, which is 8, will
test and merge up.  Thanks!

-chris
