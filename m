From: Jeff Garzik <jgarzik@redhat.com>
Subject: Re: linux-next: net-current/net merge conflict
Date: Mon, 26 May 2008 16:27:36 -0400
Message-ID: <20080526202736.GA12992@devserv.devel.redhat.com>
References: <20080526133234.d6ae478e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:33975 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755279AbYEZU1y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 16:27:54 -0400
Content-Disposition: inline
In-Reply-To: <20080526133234.d6ae478e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, May 26, 2008 at 01:32:34PM +1000, Stephen Rothwell wrote:
> Hi Dave, Jeff,
> 
> Today's linux-next merge of the net tree got a trivial conflict in
> drivers/net/cpmac.c between commit
> f917d58031fce6dfd7cea71259ea6a2b663ec813 ("cpmac bugfixes and
> enhancements") from the net-current tree and commit
> 7d2e3cb7000b883a8e489485ac249be572fe17b1 ("[netdrvr] Trim trailing
> whitespace for several drivers") from the net tree. The former removed a
> comment that the latter made a whitespace fix to.

Please make sure to CC my author email address.  jgarzik@redhat.com is
only for legal sign-offs.

	Jeff



