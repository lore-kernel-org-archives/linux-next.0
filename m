From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: Tree for Apr 24 [ PM: Device 1-1.2 failed to resume
 async: error -32 ]
Date: Thu, 25 Apr 2013 11:49:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1304251145110.948-100000@iolanthe.rowland.org>
References: <CA+icZUX96ADfV5rxce+2t4J870BvZTPGOCCSgVcJ8_Hc2RMxeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:39209 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758475Ab3DYPtw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Apr 2013 11:49:52 -0400
In-Reply-To: <CA+icZUX96ADfV5rxce+2t4J870BvZTPGOCCSgVcJ8_Hc2RMxeg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux PM List <linux-pm@lists.linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-usb@vger.kernel.org

On Thu, 25 Apr 2013, Sedat Dilek wrote:

> [ Run logging on USB-bus #1 ]
> 
> # cat /sys/kernel/debug/usb/usbmon/1u > /tmp/usbmon-1u.txt <--- USB-bus #01
> 
> [ Do suspend plus resume ]
> 
> ...
> 
> [ Check /tmp/usbmon-1u.txt file ]
> 
> ...
> 
> File attached!

That also looks normal.  Did you have CONFIG_USB_DEBUG enabled during 
this test?  If you did, you could try turning it back off to see if the 
original problem returns while still doing a usbmon trace.

Alan Stern
