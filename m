From: "Xu, Andiry" <Andiry.Xu@amd.com>
Subject: RE: linux-next: manual merge of the usb tree with Linus' tree
Date: Wed, 9 Feb 2011 10:31:02 +0800
Message-ID: <2DEEA3AB13739D45A22ADDB5086AEA0BF085DD@sshaexmb1.amd.com>
References: <20110207150802.4869bd47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:8834 "EHLO
	TX2EHSOBE002.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755507Ab1BICbS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Feb 2011 21:31:18 -0500
Content-Class: urn:content-classes:message
In-Reply-To: <20110207150802.4869bd47.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "He, Alex" <Alex.He@amd.com>, Alan Stern <stern@rowland.harvard.edu>

Hi,

I'll resend the PLL quirk moving patchset based on the latest linux-next
tree. 

Thanks & Best regards,
Andiry
 
> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, February 07, 2011 12:08 PM
> To: Greg KH
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Xu,
Andiry;
> He, Alex
> Subject: linux-next: manual merge of the usb tree with Linus' tree
> 
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/ehci-pci.c between commit
> baab93afc2844b68d57b0dcca5e1d34c5d7cf411 ("USB: EHCI: ASPM quirk of
ISOC
> on AMD Hudson") from Linus' tree and commit
> b7d5b439b7a40dd0a0202fe1c118615a3fcc3b25 ("USB host: Move AMD PLL
quirk
> to pci-quirks.c") from the usb tree.
> 
> I just use the version from the usb tree, but this may need fixing up
in
> pci-quirks.c.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
