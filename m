From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Wed, 20 Mar 2013 09:17:03 +0100
Message-ID: <5149707F.5050003@suse.cz>
References: <20130320141211.52b44d0e202d32812c3e3c0c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:34150 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756167Ab3CTIQ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 04:16:28 -0400
In-Reply-To: <20130320141211.52b44d0e202d32812c3e3c0c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>

Hi,

On 03/20/2013 04:12 AM, Stephen Rothwell wrote:
> drivers/net/caif/caif_serial.c: In function 'update_tty_status': 
> drivers/net/caif/caif_serial.c:94:11: error: 'struct tty_struct'
> has no member named 'warned'
> 
> Caused by commit 6865ff222cca ("TTY: do not warn about setting
> speed via SPD_*").

I wonder why this didn't trigger locally. I have to check if I have
debugfs enabled. In any way, I will send a patch to fix this later today.

> drivers/usb/serial/quatech2.c: In function 'qt2_process_read_urb': 
> drivers/usb/serial/quatech2.c:661:18: error: 'struct
> qt2_port_private' has no member named 'is_open' 
> drivers/usb/serial/quatech2.c:705:15: error: 'struct
> qt2_port_private' has no member named 'is_open'
> 
> Caused by commit e4408ce3c23f ("TTY: quatech2, remove unneeded 
> is_open").  grep is your friend (or searching while editting the
> file).

I think this is caused by another commit. Bill added a check for
is_open meanwhile I removed that member completely. Bill, could you
fix that up, please?

thanks,
-- 
js
suse labs
