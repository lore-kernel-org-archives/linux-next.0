From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-20081103: oxu210hp-hcd.c:3849: error: implicit declaration of
	function 'set_irq_type'
Date: Mon, 3 Nov 2008 18:50:47 +0300
Message-ID: <20081103155047.GA14489@x200.localdomain>
References: <20081103183214.aac32543.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:31844 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754389AbYKCPrd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 10:47:33 -0500
Content-Disposition: inline
In-Reply-To: <20081103183214.aac32543.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, giometti@linux.it, gregkh@suse.de

On sparc:

drivers/usb/host/oxu210hp-hcd.c:3849: error: implicit declaration of function 'set_irq_type'

and including linux/irq.h doesn't cut it CONFIG_GENERIC_HARDIRQS aren't set.
