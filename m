From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 19 (media/video/au0828)
Date: Thu, 19 Mar 2009 09:54:48 -0700
Message-ID: <49C278D8.5010809@oracle.com>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:62229 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752493AbZCSQwk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2009 12:52:40 -0400
In-Reply-To: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090318:


when ADV_DEBUG=n:


drivers/media/video/au0828/au0828-video.c:1438: error: 'const struct v4l2_subdev_core_ops' has no member named 'g_register'
drivers/media/video/au0828/au0828-video.c:1453: error: 'const struct v4l2_subdev_core_ops' has no member named 's_register'


-- 
~Randy
