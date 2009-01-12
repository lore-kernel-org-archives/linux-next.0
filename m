From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 11:23:51 -0800
Message-ID: <20090112192351.GA7607@suse.de>
References: <20090112154539.4857f533.sfr@canb.auug.org.au> <496B899E.7060605@oracle.com> <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com> <1231787958.6383.18.camel@norville.austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:46052 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753219AbZALTZL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 14:25:11 -0500
Content-Disposition: inline
In-Reply-To: <1231787958.6383.18.camel@norville.austin.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Cc: Steve French <smfrench@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org

On Mon, Jan 12, 2009 at 01:19:18PM -0600, Dave Kleikamp wrote:
> On Mon, 2009-01-12 at 12:58 -0600, Steve French wrote:
> > There is not just the cifs md5 one (which has been around a long
> > time), but an md5_init (static) in crypto and the new one in rt.  The
> > addition of the new one (rt md5_init) causes the build problem.   It
> > would be nice if we could use the same md5 routines though ... last
> > time we checked the crypto one was not well suited for calculating
> > signatures as a network fs would do though.
> 
> Is that due to the byte-swapping?  Can the cifs and rt* drivers use the
> same code.  rt28[67]0/common/md5.c are identical files.  In fact those
> "common" directories should probably be combined into a single truly
> common directory.

Yes, the "common" directories are going to be merged, but as they
originally came from different driver sources, they didn't start out
that way.  It will take some refactoring to get it to work properly,
which is on my todo list...

thanks,

greg k-h
