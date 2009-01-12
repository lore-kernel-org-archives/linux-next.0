From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 11:13:30 -0800
Message-ID: <20090112191330.GC7111@suse.de>
References: <20090112154539.4857f533.sfr@canb.auug.org.au> <496B899E.7060605@oracle.com> <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:48645 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752919AbZALTPT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 14:15:19 -0500
Content-Disposition: inline
In-Reply-To: <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org

On Mon, Jan 12, 2009 at 12:58:42PM -0600, Steve French wrote:
> There is not just the cifs md5 one (which has been around a long
> time), but an md5_init (static) in crypto and the new one in rt.  The
> addition of the new one (rt md5_init) causes the build problem.   It
> would be nice if we could use the same md5 routines though ... last
> time we checked the crypto one was not well suited for calculating
> signatures as a network fs would do though.

I'll fix up the staging rt drivers to not do this, but cifs shouldn't be
declaring such functions as globals either :)

thanks,

greg k-h
