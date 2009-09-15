From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [linux-next PATCH] MAINTAINERS: Generic UIO use M: "Michael S.
	Tsirkin" <mst@redhat.com>
Date: Tue, 15 Sep 2009 14:38:59 +0300
Message-ID: <20090915113858.GA4962@redhat.com>
References: <1252999424.19910.6.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:21208 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753246AbZIOLlk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2009 07:41:40 -0400
Content-Disposition: inline
In-Reply-To: <1252999424.19910.6.camel@Joe-Laptop.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, Sep 15, 2009 at 12:23:44AM -0700, Joe Perches wrote:
> Hi Michael.
> 
> Your new entry needs to be updated a bit.
> The P: entry is deprecated and M: is used for "name" <address>
> 
> Your name also needs to be quoted so people can copy/paste
> it and that scripts/get_maintainer.pl works.
> cheers, Joe
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70ca14b..1246238 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2237,7 +2237,7 @@ S:	Maintained
>  F:	include/asm-generic
>  
>  GENERIC UIO DRIVER FOR PCI DEVICES
> -P:	Michael S. Tsirkin <mst@redhat.com>
> +M:	"Michael S. Tsirkin" <mst@redhat.com>
>  L:	kvm@vger.kernel.org
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
> 
