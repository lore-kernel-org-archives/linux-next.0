From: Marek Vasut <marex@denx.de>
Subject: Re: linux-next: manual merge of the hid tree with Linus' tree
Date: Mon, 10 Sep 2012 07:49:26 +0200
Message-ID: <201209100749.27199.marex@denx.de>
References: <20120910113359.ddc30b010fcd73f00c993d23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120910113359.ddc30b010fcd73f00c993d23@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-next.vger.kernel.org

Dear Stephen Rothwell,

> Hi Jiri,
> 
> Today's linux-next merge of the hid tree got a conflict in
> drivers/hid/usbhid/hid-quirks.c between commit 67ddbb3e6568 ("HID: add
> NOGET quirk for Eaton Ellipse MAX UPS") from Linus' tree and commit
> 2843b673d034 ("HID: add quirk for Freescale i.MX28 ROM recovery") from
> the hid tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary (no action is required).

Looks obviously correct, thank you Stephen!

Best regards,
Marek Vasut
