From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH -next] random: needs linux/device.h for struct device
Date: Mon, 4 Nov 2013 11:32:48 -0500
Message-ID: <20131104163248.GC7108@thunk.org>
References: <20131104175916.763e3c0cf001b9f948f2baa7@canb.auug.org.au>
 <5277C5F8.3080609@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:54124 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753397Ab3KDQc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Nov 2013 11:32:58 -0500
Content-Disposition: inline
In-Reply-To: <5277C5F8.3080609@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Mon, Nov 04, 2013 at 08:06:16AM -0800, Randy Dunlap wrote:
> on x86_64:
> 
> drivers/char/random.c: In function 'add_device_attach_randomness':
> drivers/char/random.c:837:41: error: dereferencing pointer to incomplete type
> 
> 
> need to #include <linux/device.h> for struct device, I think.

The patch which introduced this is going to be dropped from the random
tree because I'm concerned the amount of entropy that will be added
will get overstated, especially on CPU's that don't have cycle
counters (ARM and MIPS in particular).

I plan to rework it to be safer, although I suspect using device
attach times simply won't be doable on CPU's that don't have a cycle
counter register, or some other fine-grained, highly light-weight
timer (I can't use the clocksource infrastructure since those time
sources are not necessarily available during early boot, and there is
no guarantee how expensive some of the clock sources might be; some
can be quite expensive, <cough> IBM X440 servers with their
"scalability cable" <cough>).

	   	       	    	    	 - Ted
