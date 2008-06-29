From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for June 26
Date: Sun, 29 Jun 2008 13:36:43 +0200
Message-ID: <200806291336.44603.rjw@sisk.pl>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au> <200806290215.03792.rjw@sisk.pl> <1214726476.10393.289.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:44224 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758488AbYF2Lev (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Jun 2008 07:34:51 -0400
In-Reply-To: <1214726476.10393.289.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jaswinder Singh <jaswinder@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-testers@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Sunday, 29 of June 2008, David Woodhouse wrote:
> On Sun, 2008-06-29 at 02:15 +0200, Rafael J. Wysocki wrote:
> > On Saturday, 28 of June 2008, David Woodhouse wrote:
> > > On Sat, 2008-06-28 at 15:24 +0530, Jaswinder Singh wrote:
> > > > Here is updated patch :-
> > > > 
> > > > http://git.infradead.org/users/jaswinder/firm-jsr-2.6.git?a=commitdiff;h=aa8b184d8eb4f1d7b5e37d5ad449fb7c02ad79c2
> > > 
> > > You can ignore that; it's just the same as today's linux-next (which in
> > > turn is just the same as yesterday's + the patch which fixes the problem
> > > for Kamalesh but not for you + the other minor error path cleanup.
> > > 
> > > Please could you try the other debugging patch I just sent, on top of
> > > today's linux-next? It should confirm that you're using the 'Tso5'
> > > firmware, as I told Jaswinder yesterday, and give us a little more clue
> > > as to what's going on.
> > 
> > I tested with the debug patch on top of
> > http://git.infradead.org/users/jaswinder/firm-jsr-2.6.git?a=commitdiff;h=aa8b184d8eb4f1d7b5e37d5ad449fb7c02ad79c2
> > 
> > dmesg output is at: http://www.sisk.pl/kernel/debug/20080627/dmesg-1.log
> > the .config is at: http://www.sisk.pl/kernel/debug/20080627/config-1
> > 
> > and it looks like the card just can't load the firmware.
> 
> Ah, you have it configured as a module, not built-in. You need to run
> 'make INSTALL_FW_PATH=/lib/firmware firmware_install'

# make INSTALL_FW_PATH=/lib/firmware firmware_install
make -C /home/rafael/src/linux-next O=/home/rafael/src/build/next/albercik/. firmware_install
make[3]: *** No rule to make target `firmware/acenic/tg1.bin', needed by `/lib/firmware/acenic/tg1.bin'.  Stop.
make[2]: *** [firmware_install] Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2
