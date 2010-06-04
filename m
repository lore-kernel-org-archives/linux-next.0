From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: Tree for June 3
Date: Fri, 4 Jun 2010 15:50:41 -0700
Message-ID: <987664A83D2D224EAE907B061CE93D530114C3DE4D@orsmsx505.amr.corp.intel.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
 <AANLkTilr92GkR8bfgyjtb8ToYEEAv4oCsFsfsy04HJRU@mail.gmail.com>
 <AANLkTim6v2s-Q5BndAKLOZKaA1wYgbU3UKJwNy-6Jkki@mail.gmail.com>
 <201006032222.57411.rusty@rustcorp.com.au>
 <AANLkTikN_3oLIFQ0CRiLwXUV79myy_aqriezdCgnZHFT@mail.gmail.com>
 <alpine.LFD.2.00.1006041255210.8175@i5.linux-foundation.org>
 <987664A83D2D224EAE907B061CE93D530114C3DC47@orsmsx505.amr.corp.intel.com>
 <alpine.LFD.2.00.1006041452130.8175@i5.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44590 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751530Ab0FDWuo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2010 18:50:44 -0400
In-Reply-To: <alpine.LFD.2.00.1006041452130.8175@i5.linux-foundation.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Dave Young <hidave.darkstar@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

> Does this fix it? I stopped looking for other possible causes when I found 
> this one.

It gets rid of the oops. So that's good.  Something is still
hokey in linux-next land though because no modules get loaded.
So no ehci/uhci available :-(

No obvious looking error messages on the console.

-Tony
---
 kernel/module.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 69a3f12..9a0b275 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2653,9 +2653,10 @@ static struct module *load_module(void __user *umod,
 	module_unload_free(mod);
  free_module:
 	module_deallocate(mod, &info);
+	mod = ERR_PTR(err);
  free_copy:
 	free_copy(&info);
-	return ERR_PTR(err);
+	return mod;
 }
 
 /* Call module constructors. */
