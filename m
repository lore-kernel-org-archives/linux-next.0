From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Fix compiler warnings and remove debug messages
Date: Mon, 10 Aug 2009 17:01:12 -0700
Message-ID: <20090811000112.GB13314@kroah.com>
References: <20090810193653.f228cf06.sfr@canb.auug.org.au>
 <1249921736508-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752513AbZHKAC1@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1249921736508-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar Wassmann <LW@KARO-electronics.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier@gentoo.org>, Lothar Wassmann <lothar@ipc1.ka-ro>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 10, 2009 at 06:28:56PM +0200, Lothar Wassmann wrote:
> This patch fixes the reported compiler warnings and removes excessive debug messages.
> Compile tested only!

I'd prefer the correct fixes for this driver.  Mike, any thoughts on
some fixes for this?

thanks,

greg k-h
