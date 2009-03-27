From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Fri, 27 Mar 2009 08:28:59 -0300
Message-ID: <20090327082859.6127990a@pedra.chehab.org>
References: <20090327114035.d039243a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:52923 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbZC0L3I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2009 07:29:08 -0400
In-Reply-To: <20090327114035.d039243a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Isely <isely@pobox.com>

On Fri, 27 Mar 2009 11:40:35 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "pvr2_cs53l32a_subdev_update" [drivers/media/video/pvrusb2/pvrusb2.ko] undefined!
> 
> Probably caused by commit 0c0ffee771caed42ab9655c36cceb0c70f518eda
> ("V4L/DVB (11207): pvrusb2: Add composite and s-video input support for
> OnAir devices").
> 
> I have used the v4l-dvb tree from next-20090326 for today.

This was fixed by this patch:
	http://patchwork.kernel.org/patch/14545/

What's weird is that, after noticing it, I folded this patch together with the
original one. Maybe I forgot to push it or I've pushed after your pull.
Probably you won't have problem on today's build.


Cheers,
Mauro
