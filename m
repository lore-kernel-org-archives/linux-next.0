From: Greg KH <gregkh@suse.de>
Subject: Re: next: parport: forgotten semicolon
Date: Wed, 6 May 2009 08:05:08 -0700
Message-ID: <20090506150508.GA4232@suse.de>
References: <a4423d670905060758x32774671o796ae46fbb43997c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45257 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757228AbZEFPSE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 11:18:04 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670905060758x32774671o796ae46fbb43997c@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 06, 2009 at 06:58:44PM +0400, Alexander Beregalov wrote:
> Hi Greg
> 
> Please fix parport-remove-driver_data-direct-access-of-struct-device.patch
> 
> -       struct parport *p = dev_get_drvdata(&dev->dev)
> +       struct parport *p = dev_get_drvdata(&dev->dev);

Great eye, thanks, I'll go fix that up.

greg k-h
