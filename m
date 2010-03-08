From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] i2c: update for semaphore to mutex conversion of
 devices
Date: Mon, 8 Mar 2010 15:59:53 -0800
Message-ID: <20100308235953.GA7808@kroah.com>
References: <20100309102828.18351564.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100309102828.18351564.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Jean Delvare <khali@linux-fr.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 09, 2010 at 10:28:28AM +1100, Stephen Rothwell wrote:
> I have been carrying this patch in linux-next for some time and now
> mainline needs it.

Well, it's not required, but it is nice to have.  I didn't merge the
"convert the driver core semaphore to a mutex" patch as it was causing
too many false-positive lockdep warnings.

Hopefully the lockdep core will be tweaked to handle the locking tree
that the device core requires and then when that happens, I will merge
the patch that will require this fix in order to keep the build from
breaking.

But for now, it's not a requirement, although, it does make my life
easier.

thanks,

greg k-h
