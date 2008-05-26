From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core/i2c merge conflicts
Date: Sun, 25 May 2008 23:05:46 -0700
Message-ID: <20080526060546.GA14578@kroah.com>
References: <20080526121820.03d27324.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:58362 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbYEZGPe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 May 2008 02:15:34 -0400
Content-Disposition: inline
In-Reply-To: <20080526121820.03d27324.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jean Delvare <khali@linux-fr.org>

On Mon, May 26, 2008 at 12:18:20PM +1000, Stephen Rothwell wrote:
> Hi Greg, Jean,
> 
> Today's linux-next merge of the i2c tree got conflicts in
> drivers/i2c/i2c-core.c between "i2c-use-class_for_each_device" from the
> driver-core tree" and "i2c: Use class_for_each_device", "i2c: Use
> list_for_each_entry_safe" and "i2c: Simplify i2c_del_driver()" from the
> i2c tree.
> 
> I used the version from the i2c tree except I added NULL for the new
> parameter to class_for_each_device.  This merge fixup has replaced the
> build fixup in the previous linux-next tree.

Thanks, the fixup is fine, I ended up duplicating the same work in the
i2c tree accidentally for a different reason, as it is needed for some
class rework in the driver core tree.

thanks,

greg k-h
