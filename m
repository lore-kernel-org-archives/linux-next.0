From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Fri, 29 Jul 2011 01:10:06 -0300
Message-ID: <4E32329E.2010203@infradead.org>
References: <20110729131735.911ce0d16367933036fa9e6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110729131735.911ce0d16367933036fa9e6f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oleg Drokin <green@linuxhacker.ru>, Tony Lindgren <tony@atomide.com>, Linus <torvalds@linux-foundation.org>, Kalle Jokiniemi <kalle.jokiniemi@nokia.com>
List-Id: linux-next.vger.kernel.org

Em 29-07-2011 00:17, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in
> arch/arm/mach-omap2/board-rx51-peripherals.c between commit 786b01a8c1db
> ("cleanup regulator supply definitions in mach-omap2") from Linus' tree
> and commit 75ccf268d504 ("[media] OMAP3: RX-51: define vdds_csib
> regulator supply") from the v4l-dvb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.  I am sure
> Linus' will cope with this merge fixup as well, so you do not need to
> rebase/merge to his current tree before sending a pull request.

Thanks!

Yeah, I prefer to base it at vanilla 3.0, instead of basing into a
random point of the Linus tree. I should be submitting the patches
tomorrow to Linus, after giving people some time to do some random
builds with -next.

Mauro
