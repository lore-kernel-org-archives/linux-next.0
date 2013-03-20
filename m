From: wfp5p@viridian.itc.virginia.edu (Bill Pemberton)
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Wed, 20 Mar 2013 08:51:37 -0400
Message-ID: <20130320125137.EDCD3802B0@viridian.itc.virginia.edu>
References: <5149707F.5050003@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5149707F.5050003@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jslaby@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Jiri Slaby writes:
> 
> > drivers/usb/serial/quatech2.c: In function 'qt2_process_read_urb': 
> > drivers/usb/serial/quatech2.c:661:18: error: 'struct
> > qt2_port_private' has no member named 'is_open' 
> > drivers/usb/serial/quatech2.c:705:15: error: 'struct
> > qt2_port_private' has no member named 'is_open'
> > 
> > Caused by commit e4408ce3c23f ("TTY: quatech2, remove unneeded 
> > is_open").  grep is your friend (or searching while editting the
> > file).
> 
> I think this is caused by another commit. Bill added a check for
> is_open meanwhile I removed that member completely. Bill, could you
> fix that up, please?
> 

Is it legal to call tty_flip_buffer_push() without an open tty?  If
so, I can get rid of the is_open logic completely.  Otherwise, I need
to either keep is_open or otherwise check for a valid tty before
calling tty_flip_buffer_push().

-- 
Bill
