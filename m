From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: Tree for March 19 (media/video/au0828)
Date: Thu, 19 Mar 2009 19:28:46 -0300
Message-ID: <20090319192846.30dceaa2@pedra.chehab.org>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au>
	<49C278D8.5010809@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:36793 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761761AbZCSW3V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2009 18:29:21 -0400
In-Reply-To: <49C278D8.5010809@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org

On Thu, 19 Mar 2009 09:54:48 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090318:
> 
> 
> when ADV_DEBUG=n:
> 
> 
> drivers/media/video/au0828/au0828-video.c:1438: error: 'const struct v4l2_subdev_core_ops' has no member named 'g_register'
> drivers/media/video/au0828/au0828-video.c:1453: error: 'const struct v4l2_subdev_core_ops' has no member named 's_register'

Fixed, thanks!

Cheers,
Mauro
