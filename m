From: Greg KH <greg@kroah.com>
Subject: Re: next: parport: forgotten semicolon
Date: Tue, 12 May 2009 09:16:09 -0700
Message-ID: <20090512161609.GC16247@kroah.com>
References: <a4423d670905060758x32774671o796ae46fbb43997c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:35180 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752844AbZELRNO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 13:13:14 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670905060758x32774671o796ae46fbb43997c@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Greg KH <gregkh@suse.de>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 06, 2009 at 06:58:44PM +0400, Alexander Beregalov wrote:
> Hi Greg
> 
> Please fix parport-remove-driver_data-direct-access-of-struct-device.patch
> 
> -       struct parport *p = dev_get_drvdata(&dev->dev)
> +       struct parport *p = dev_get_drvdata(&dev->dev);

Now fixed, thanks for pointing it out.

greg k-h
