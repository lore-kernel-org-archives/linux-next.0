From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Hung processes (root fs on USB pen-drive)
Date: Sat, 18 Oct 2008 11:05:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0810181101360.1469-100000@netrider.rowland.org>
References: <20081018143930.GA23473@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:2312 "HELO
	netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751453AbYJRPFm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Oct 2008 11:05:42 -0400
In-Reply-To: <20081018143930.GA23473@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Sat, 18 Oct 2008, Vegard Nossum wrote:

> Hi,
> 
> I was testing kmemcheck in -next and found that the machine can suddenly
> hang for no apparent reason.
> 
> This is what I did:
> 
>  - boot USB pen-drive (contains root fs)
>  - after the system has been up (and stable) for a long while, I
>    inserted/removed quickly a few other pen-drives
> 
> Now all new processes which access the filesystem will hang indefinitely.
> See output of SysRq-l and SysRq-w below.

Which device holds your root fs?  I'd guess it was 1-6, since that 
device has address 2.

> usb 1-2: USB disconnect, address 12
> usb 1-6: reset high speed USB device using ehci_hcd and address 2
> usb 1-6: device descriptor read/64, error -110
> usb 1-6: device descriptor read/64, error -110
> usb 1-6: reset high speed USB device using ehci_hcd and address 2
> usb 1-6: device descriptor read/64, error -110
> usb 1-6: device descriptor read/64, error -110
> usb 1-6: reset high speed USB device using ehci_hcd and address 2
> usb 1-6: device not accepting address 2, error -110
> hub 1-0:1.0: unable to enumerate USB device on port 2
> usb 1-6: reset high speed USB device using ehci_hcd and address 2
> usb 1-6: device not accepting address 2, error -110
> usb 1-6: USB disconnect, address 2

The log shows a disconnect on usb 1-2 and a failed reset followed by a
logical disconnect on usb 1-6.  If either of those was the root fs,
it's understandable that your system would hang.  After all, you can't
expect it to do much when the root fs is gone.

Alan Stern
