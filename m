From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Thu, 5 Mar 2009 18:51:50 -0300
Message-ID: <20090305185150.69d8aff9@pedra.chehab.org>
References: <20090305113550.4369fe92.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:59074 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951AbZCEVwU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2009 16:52:20 -0500
In-Reply-To: <20090305113550.4369fe92.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Igor M. Liplianin" <liplianin@netup.ru>

On Thu, 5 Mar 2009 11:35:50 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/media/dvb/frontends/stv6110.c:31:21: error: cx23885.h: No such file or directory
> 
> Probably caused by commit f8d3ae06b31f28ae98567407c529751032936fd6
> ("V4L/DVB (10799): Add support for ST STV6110 silicon tuner").
> 
> I have dropped the v4l-dvb tree for today.

Fixed.

Stephen,

>From time to time, I got an weird message like this when updating my remote
repository:

$ git --git-dir /home/v4l/tokernel/bare/linux-next.git push -f origin
Counting objects: 194, done.
Compressing objects: 100% (70/70), done.
Writing objects: 100% (93/93), 14.19 KiB, done.
Total 93 (delta 82), reused 24 (delta 23)
warning: updating the currently checked out branch; this may cause confusion,
as the index and working tree do not reflect changes that are now in HEAD.
To ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git

What's more weird is that I never touch directly
on /home/v4l/tokernel/bare/linux-next.git, since this is just a local bare
tree. My procedure is to update the patches on a work tree, then push it to the
bare repository and then to kernel.org.

Any ideas?

Cheers,
Mauro
