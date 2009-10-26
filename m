From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: Tree for October 26 (gfs2)
Date: Mon, 26 Oct 2009 16:00:14 +0000
Message-ID: <1256572815.6052.677.camel@localhost.localdomain>
References: <20091026172104.205f15af.sfr@canb.auug.org.au>
	 <20091026084356.847d1ae2.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55088 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752945AbZJZQAX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Oct 2009 12:00:23 -0400
In-Reply-To: <20091026084356.847d1ae2.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, cluster-devel@redhat.com, Benjamin Marzinski <bmarzins@redhat.com>

Hi,

On Mon, 2009-10-26 at 08:43 -0700, Randy Dunlap wrote:
> On Mon, 26 Oct 2009 17:21:04 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20091016:
> 
> 
> on i386:
> 
> (.text+0x723a8b): undefined reference to `__divdi3'
> 
> super.c::gfs2_statfs_change():
> 		percent = (100 * l_sc->sc_free) / m_sc->sc_free;
> 
> 
> I guess it needs to use div64() etc.
> 
> ---
> ~Randy

Yes, it looks like it,

Steve.
