From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH] edac: fix i7core build
Date: Sun, 8 Nov 2009 01:45:51 -0200
Message-ID: <20091108014551.2efb8f66@pedra.chehab.org>
References: <20091104170931.4aa51b77.sfr@canb.auug.org.au>
	<20091104135733.cb878718.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:4876 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753477AbZKHDqA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 7 Nov 2009 22:46:00 -0500
In-Reply-To: <20091104135733.cb878718.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Em Wed, 4 Nov 2009 13:57:33 -0800
Randy Dunlap <randy.dunlap@oracle.com> escreveu:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build warning (missing header file) and
> build error when CONFIG_SMP=n.
> 
> drivers/edac/i7core_edac.c:860: error: implicit declaration of function 'msleep'
> drivers/edac/i7core_edac.c:1700: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Mauro Carvalho Chehab <mchehab@redhat.com>

Hi Randy,

Thank you for the patch.

FYI, I've just added your and Alan's fixes on my linux-next tree for i7core:

http://git.kernel.org/?p=linux/kernel/git/mchehab/i7core.git;a=commit;h=0480ce880b999703fbb73912054f4de187da543a
http://git.kernel.org/?p=linux/kernel/git/mchehab/i7core.git;a=commit;h=df0a7a70df5e9c5d612b249661f8b3883be41331

Sorry for not doing it earlier. I was handling a big backlog I had here, due to
a training course and my trip to Japan (that happened at the week after the training).

Cheers,
Mauro
