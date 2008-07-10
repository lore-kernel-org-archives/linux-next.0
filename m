From: "pHilipp Zabel" <philipp.zabel@gmail.com>
Subject: Re: linux-next: manual merge of the arm tree
Date: Thu, 10 Jul 2008 08:29:23 +0200
Message-ID: <74d0deb30807092329x4d6bf2ceo1a3d256e49d11eb2@mail.gmail.com>
References: <20080710143354.729601d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:16019 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753320AbYGJG31 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jul 2008 02:29:27 -0400
Received: by nf-out-0910.google.com with SMTP id d3so1005694nfc.21
        for <linux-next@vger.kernel.org>; Wed, 09 Jul 2008 23:29:23 -0700 (PDT)
In-Reply-To: <20080710143354.729601d6.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>

On Thu, Jul 10, 2008 at 6:33 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Russell,
>
> Today's linux-next merge of the arm tree got a conflict in
> drivers/usb/gadget/ether.c between commit
> 41df25fad30d0e88ddc042358556f19a72d70054 ("usb ethernet gadget: use
> composite gadget framework") from the usb tree and commit
> 7a8576204333d133d58cbcc59dacf49a5546e3e4 ("[ARM] 5120/1: pxa: correct
> platform driver names for PXA25x and PXA27x UDC drivers") from the arm
> tree.
>
> I am not actually sure what to do with this.  To make it build, I have
> just take the usb tree's version, but there is probably more to it than
> that.

To make it build, I guess that's just fine. The arm patch changed some
configuration variable names that the usb patch now doesn't depend upon
anymore. To make USB CDC ethernet actually work on platforms that don't
support CDC ECM, the can_support_ecm function in f_ecm.c,
which was introduced in cf4cacff582185952e6977a0e79e833df9ba357b
("usb ethernet gadget: split CDC Ethernet function") would have to be
updated to return 0 for those.
I don't know whether that is the case for pxa25x or not.

regards
Philipp
