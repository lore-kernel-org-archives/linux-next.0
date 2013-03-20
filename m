From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Wed, 20 Mar 2013 16:13:01 +0100
Message-ID: <5149D1FD.90400@suse.cz>
References: <20130320144233.10125800E4@viridian.itc.virginia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130320144233.10125800E4@viridian.itc.virginia.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Bill Pemberton <wfp5p@viridian.itc.virginia.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 03/20/2013 03:42 PM, Bill Pemberton wrote:
> Ok, for the unopened ports there *should* never be any actual data to
> push so the push is really doing nothing anyhow in these cases.  It's
> coming from the device sending an initial change port command.
> 
> Anyhow, so my patch adding more is_open logic can be dropped and then
> yours will apply fine.  What's the best way for me to handle this?
> Send a revert for my patch so yours will apply or send an updated
> version of your patch that removes my additions?

Asking Greg to revert should suffice. I commented on that patch, but in
a different thread, so Greg missed the comment the patch is not needed
IIRC. What was the title of the patch, I cannot find it immediately :/?


-- 
js
suse labs
