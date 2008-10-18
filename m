From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Hung processes (root fs on USB pen-drive)
Date: Sat, 18 Oct 2008 11:44:50 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0810181135380.1469-100000@netrider.rowland.org>
References: <19f34abd0810180817s603929f9wb563eef15459d3da@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:2356 "HELO
	netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750824AbYJRPov (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Oct 2008 11:44:51 -0400
In-Reply-To: <19f34abd0810180817s603929f9wb563eef15459d3da@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Sat, 18 Oct 2008, Vegard Nossum wrote:

> > The log shows a disconnect on usb 1-2 and a failed reset followed by a
> > logical disconnect on usb 1-6.  If either of those was the root fs,
> > it's understandable that your system would hang.  After all, you can't
> > expect it to do much when the root fs is gone.
> 
> I agree :-) The root fs was plugged in all along, and I didn't touch
> it. The root fs was this (from same log):
> 
> usb 1-6: configuration #1 chosen from 1 choice
> usb 1-6: New USB device found, idVendor=090c, idProduct=1000
> usb 1-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-6: Product: DISK 2.0
> usb 1-6: Manufacturer: USB
> usb 1-6: SerialNumber: 9GXZ0MZLH75GCAH7
> 
> So it seems that maybe the disk itself is bad? But it is also an odd
> coincidence that it would only happen when (re-)plugging other USB
> devices?

Some sort of hardware problem caused the communication with 1-6 to fail 
when 1-2 was unplugged.  No way to tell exactly what went wrong without 
using a bus analyzer -- and even that might not give an exact answer.  
For instance, it's possible that the EHCI controller hardware got 
confused as a result of the disconnect occurring on port 2 while data 
was being transferred over port 6.

You could try getting a hub and plugging the flash drives into the hub 
rather than into the computer.  That might make a difference.

Alan Stern
