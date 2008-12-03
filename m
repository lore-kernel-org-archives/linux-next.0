From: Jeff Layton <jlayton@redhat.com>
Subject: Re: linux-next: cifs tree build failure
Date: Wed, 3 Dec 2008 06:57:21 -0500
Message-ID: <20081203065721.1b68a5a1@tleilax.poochiereds.net>
References: <20081202132318.7e1581db.sfr@canb.auug.org.au>
	<20081203135312.60d4518d.sfr@canb.auug.org.au>
	<20081202.191925.208352769.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:41287 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751348AbYLCL7h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 06:59:37 -0500
In-Reply-To: <20081202.191925.208352769.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, smfrench@gmail.com, linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, harvey.harrison@gmail.com

On Tue, 02 Dec 2008 19:19:25 -0800 (PST)
David Miller <davem@davemloft.net> wrote:

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 3 Dec 2008 13:53:12 +1100
> 
> > Hi Steve, Dave,
> > 
> > On Tue, 2 Dec 2008 13:23:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > > 
> > > fs/cifs/cifsfs.c: In function 'cifs_show_options':
> > > fs/cifs/cifsfs.c:363: error: 'NIP6_FMT' undeclared (first use in this function)
> > > fs/cifs/cifsfs.c:363: error: (Each undeclared identifier is reported only once
> > > fs/cifs/cifsfs.c:363: error: for each function it appears in.)
> > > fs/cifs/cifsfs.c:364: error: implicit declaration of function 'NIP6'
> > > 
> > > Caused by the interaction of commits
> > > b189db5d299c6824780af5590564ff608adb3dea ("net: remove NIP6(), NIP6_FMT,
> > > NIP6_SEQFMT and final users") from the net tree and
> > > 20c4eef4f817ff65337e2fb3f1f5df52eeca09eb ("cifs: display addr and
> > > prefixpath options in /proc/mounts") from the cifs tree.
> > 
> > Today I have fixed this by applying a merge fix patch (see below) and
> > will carry this as necessary.
> 
> Looks good, thanks Stephen.

Looks good to me too -- I don't think we have any more changes in the
CIFS ipv6 address formatting code coming too soon...

Still, is there some reason that NIP6/NIPQUAD stuff needs to be removed
at the same time as we add %pI4/%pI6? An period where the old NIP*
defines still live in the tree seems like a reasonable thing.

-- 
Jeff Layton <jlayton@redhat.com>
