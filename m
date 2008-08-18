From: David Brownell <david-b@pacbell.net>
Subject: Re: linux-next: Tree for August 18 (usb gadget build error)
Date: Mon, 18 Aug 2008 15:55:32 -0700
Message-ID: <200808181555.33062.david-b@pacbell.net>
References: <20080818175931.52d2b2d6.sfr@canb.auug.org.au> <20080818123739.93111805.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp117.sbc.mail.sp1.yahoo.com ([69.147.64.90]:38045 "HELO
	smtp117.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752219AbYHRWze (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 18:55:34 -0400
In-Reply-To: <20080818123739.93111805.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lud <linux-usb@vger.kernel.org>

On Monday 18 August 2008, Randy Dunlap wrote:
> ERROR: "ecm_bind_config" [drivers/usb/gadget/g_cdc.ko] undefined!
> 
> config attached.

I'm guessing that's associate with Greg's patches to
split the gadget drivers up into lots of little modules.

I'm really not keen on that, and I guess that means I'll
have to send the alternate patches (even though I got no
feedback from my posts on those topics).

- Dave
