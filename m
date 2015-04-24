From: Bob Peterson <rpeterso@redhat.com>
Subject: Re: [Cluster-devel] linux-next: Tree for Apr 20 (gfs2)
Date: Fri, 24 Apr 2015 08:45:25 -0400 (EDT)
Message-ID: <1363963253.6292735.1429879525504.JavaMail.zimbra@redhat.com>
References: <20150420154533.3361abe4@canb.auug.org.au> <55351DDC.9060409@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx6-phx2.redhat.com ([209.132.183.39]:58496 "EHLO
	mx6-phx2.redhat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751541AbbDXMpv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2015 08:45:51 -0400
In-Reply-To: <55351DDC.9060409@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

----- Original Message -----
> On 04/19/15 22:45, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any v4.2 material to your linux-next included trees
> > until after v4.1-rc1 is released.
> > 
> > Changes since 20150415:
> > 
> 
> on i386:
> 
> ERROR: "__divdi3" [fs/gfs2/gfs2.ko] undefined!
> 
> 
> 
> --
> ~Randy

Hi,

My apologies. I've pushed an addendum patch that fixes the problem to
the for-next branch of the linux-gfs2.git git tree.

Regards,

Bob Peterson
