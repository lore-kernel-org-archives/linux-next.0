From: Ryan Mallon <ryan@bluewatersys.com>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current
 tree
Date: Mon, 16 Feb 2009 13:18:52 +1300
Message-ID: <4998B0EC.5020302@bluewatersys.com>
References: <20090216103947.12d84612.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 203-96-159-182.paradise.net.nz ([203.96.159.182]:34854 "EHLO
	hayes.bluewaternz.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754039AbZBPAYc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 15 Feb 2009 19:24:32 -0500
In-Reply-To: <20090216103947.12d84612.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Marc Pignat <marc.pignat@hevs.ch>

Stephen Rothwell wrote:
> Hi Russell,
> 
> Today's linux-next merge of the arm tree got a conflict in
> arch/arm/mach-at91/gpio.c between commit
> 2b768b6cdbcf7fa0761e6c35c6ea288297582c43 ("[ARM] 5391/1: AT91: Enable
> GPIO clocks earlier") from the arm-current tree and commit
> f373e8c0639f1720d2d0fe414990f504e113c2ba ("[ARM] 5373/2: Add gpiolib
> support to AT91") from the arm tree.
> 
> Overlapping changes.  I fixed it up as below (which may not be correct,
> so needs checking) and can carry the fix for a while.

The fix looks okay. Stupid question: What is the easiest/best way for me
to apply the same fix into my tree to replicate the merge? My tree has
some additional stuff in it to support the custom AT91 board I am using.
I tried downloading the patch 5391/1 from the patch system and using
git-apply, but there doesn't seem to be a way to force it into a merge
like you can with git-am (and I can't find that patch on the mailing
list). If I can figure out how to do this, I'll test the code to make
sure it is still okay.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Ryan Mallon                              Unit 5, Amuri Park
       Phone: +64 3 3779127                     404 Barbadoes St
       Fax:   +64 3 3779135                     PO Box 13 889
       Email: ryan@bluewatersys.com             Christchurch, 8013
       Web:   http://www.bluewatersys.com       New Zealand
       Freecall Australia  1800 148 751         USA 1800 261 2934
