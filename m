From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: cifs tree build failure
Date: Tue, 02 Dec 2008 19:19:25 -0800 (PST)
Message-ID: <20081202.191925.208352769.davem@davemloft.net>
References: <20081202132318.7e1581db.sfr@canb.auug.org.au>
	<20081203135312.60d4518d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:53494
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752653AbYLCDTZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Dec 2008 22:19:25 -0500
In-Reply-To: <20081203135312.60d4518d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: smfrench@gmail.com, linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, harvey.harrison@gmail.com, jlayton@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Dec 2008 13:53:12 +1100

> Hi Steve, Dave,
> 
> On Tue, 2 Dec 2008 13:23:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > fs/cifs/cifsfs.c: In function 'cifs_show_options':
> > fs/cifs/cifsfs.c:363: error: 'NIP6_FMT' undeclared (first use in this function)
> > fs/cifs/cifsfs.c:363: error: (Each undeclared identifier is reported only once
> > fs/cifs/cifsfs.c:363: error: for each function it appears in.)
> > fs/cifs/cifsfs.c:364: error: implicit declaration of function 'NIP6'
> > 
> > Caused by the interaction of commits
> > b189db5d299c6824780af5590564ff608adb3dea ("net: remove NIP6(), NIP6_FMT,
> > NIP6_SEQFMT and final users") from the net tree and
> > 20c4eef4f817ff65337e2fb3f1f5df52eeca09eb ("cifs: display addr and
> > prefixpath options in /proc/mounts") from the cifs tree.
> 
> Today I have fixed this by applying a merge fix patch (see below) and
> will carry this as necessary.

Looks good, thanks Stephen.
