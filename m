From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: block/proc tree build failure
Date: Thu, 12 Mar 2009 02:30:26 +0300
Message-ID: <20090311233026.GA2134@x200.localdomain>
References: <20090311224418.f1a7cb5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.153]:10939 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807AbZCKXX2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2009 19:23:28 -0400
Received: by fg-out-1718.google.com with SMTP id 16so58798fgg.17
        for <linux-next@vger.kernel.org>; Wed, 11 Mar 2009 16:23:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20090311224418.f1a7cb5f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Mar 11, 2009 at 10:44:18PM +1100, Stephen Rothwell wrote:
> --- a/drivers/block/ps3vram.c
> +++ b/drivers/block/ps3vram.c
> @@ -552,7 +552,6 @@ static void __devinit ps3vram_proc_init(struct ps3_system_bus_device *dev)
>  		return;
>  	}
>  
> -	pde->owner = THIS_MODULE;
>  	pde->data = priv;

Geert, driver should use proc_create_data() as well, and ->owner wasn't
necessary in the first place.
