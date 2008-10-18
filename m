From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: Hung processes (root fs on USB pen-drive)
Date: Sat, 18 Oct 2008 17:17:28 +0200
Message-ID: <19f34abd0810180817s603929f9wb563eef15459d3da@mail.gmail.com>
References: <20081018143930.GA23473@localhost.localdomain>
	 <Pine.LNX.4.44L0.0810181101360.1469-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.178]:62463 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453AbYJRPR3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Oct 2008 11:17:29 -0400
Received: by wa-out-1112.google.com with SMTP id v27so551894wah.21
        for <linux-next@vger.kernel.org>; Sat, 18 Oct 2008 08:17:28 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.44L0.0810181101360.1469-100000@netrider.rowland.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Sat, Oct 18, 2008 at 5:05 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Sat, 18 Oct 2008, Vegard Nossum wrote:
>> I was testing kmemcheck in -next and found that the machine can suddenly
>> hang for no apparent reason.
>>
>> This is what I did:
>>
>>  - boot USB pen-drive (contains root fs)
>>  - after the system has been up (and stable) for a long while, I
>>    inserted/removed quickly a few other pen-drives
>>
>> Now all new processes which access the filesystem will hang indefinitely.
>> See output of SysRq-l and SysRq-w below.
>
> Which device holds your root fs?  I'd guess it was 1-6, since that
> device has address 2.
>
>> usb 1-2: USB disconnect, address 12
>> usb 1-6: reset high speed USB device using ehci_hcd and address 2
>> usb 1-6: device descriptor read/64, error -110
>> usb 1-6: device descriptor read/64, error -110
>> usb 1-6: reset high speed USB device using ehci_hcd and address 2
>> usb 1-6: device descriptor read/64, error -110
>> usb 1-6: device descriptor read/64, error -110
>> usb 1-6: reset high speed USB device using ehci_hcd and address 2
>> usb 1-6: device not accepting address 2, error -110
>> hub 1-0:1.0: unable to enumerate USB device on port 2
>> usb 1-6: reset high speed USB device using ehci_hcd and address 2
>> usb 1-6: device not accepting address 2, error -110
>> usb 1-6: USB disconnect, address 2
>
> The log shows a disconnect on usb 1-2 and a failed reset followed by a
> logical disconnect on usb 1-6.  If either of those was the root fs,
> it's understandable that your system would hang.  After all, you can't
> expect it to do much when the root fs is gone.

I agree :-) The root fs was plugged in all along, and I didn't touch
it. The root fs was this (from same log):

usb 1-6: configuration #1 chosen from 1 choice
usb 1-6: New USB device found, idVendor=090c, idProduct=1000
usb 1-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-6: Product: DISK 2.0
usb 1-6: Manufacturer: USB
usb 1-6: SerialNumber: 9GXZ0MZLH75GCAH7

So it seems that maybe the disk itself is bad? But it is also an odd
coincidence that it would only happen when (re-)plugging other USB
devices?


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
