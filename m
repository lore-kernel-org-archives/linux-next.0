From: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: [-next] ERROR: "epapr_hypercall_start"
 [drivers/tty/ehv_bytechan.ko] undefined!
Date: Fri, 10 Aug 2012 18:58:58 +1000
Message-ID: <1344589138.27290.18.camel@concordia>
References: <CAMuHMdV9dgjdHuz3avU1dubyekcZwT70x=5W+CL7iHQuoC1n_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:43034 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757944Ab2HJI65 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Aug 2012 04:58:57 -0400
In-Reply-To: <CAMuHMdV9dgjdHuz3avU1dubyekcZwT70x=5W+CL7iHQuoC1n_w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linuxppc-dev@lists.ozlabs.org, Linux-Next <linux-next@vger.kernel.org>, yu.liu@freescale.com, stuart.yoder@freescale.com, Timur Tabi <timur@freescale.com>

On Fri, 2012-08-10 at 09:43 +0200, Geert Uytterhoeven wrote:
> Sicne a few days, powerpc allmodconfig fails with:
> 
> ERROR: "epapr_hypercall_start" [drivers/tty/ehv_bytechan.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/6883300/


Yep, modular build is broken.

Since this commit by the looks of it:

commit 6d2d82627f4f1e96a33664ace494fa363e0495cb
Author: Liu Yu-B13201 <Yu.Liu@freescale.com>
Date:   Tue Jul 3 05:48:56 2012 +0000

    PPC: Don't use hardcoded opcode for ePAPR hcall invocation
    
    Signed-off-by: Liu Yu <yu.liu@freescale.com>
    Signed-off-by: Stuart Yoder <stuart.yoder@freescale.com>
    Signed-off-by: Alexander Graf <agraf@suse.de>



cheers
