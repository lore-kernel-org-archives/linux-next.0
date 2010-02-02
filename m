From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
	pcmcia tree
Date: Tue, 2 Feb 2010 07:22:37 -0800
Message-ID: <20100202152237.GA15932@kroah.com>
References: <20100202170159.168a28e2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58107 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756216Ab0BBPXA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2010 10:23:00 -0500
Content-Disposition: inline
In-Reply-To: <20100202170159.168a28e2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Thomas Gleixner <tglx@linutronix.de>

On Tue, Feb 02, 2010 at 05:01:59PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/pcmcia/ds.c between commit
> 933a838aa1aae8388438bb002fbdaf6fca519a5c ("pcmcia: make use of
> pcmcia_dev_resume() return value") from the pcmcia tree and commit
> df5a0aec4591ae8a5deb67bc8cb6be3d0812abb2 ("drivers/base: Convert dev->sem
> to mutex") from the driver-core tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Fix looks fine, thanks for carrying it.

greg k-h
