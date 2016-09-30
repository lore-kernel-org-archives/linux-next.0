From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the tty tree with the v4l-dvb tree
Date: Fri, 30 Sep 2016 09:09:34 +0200
Message-ID: <b401cb59-3545-758e-2f5a-2245651e8314@atmel.com>
References: <20160930133319.57ac11a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:4009 "EHLO
        eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbcI3HJk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2016 03:09:40 -0400
In-Reply-To: <20160930133319.57ac11a3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Songjun Wu <songjun.wu@microchip.com>

Le 30/09/2016 à 05:33, Stephen Rothwell a écrit :
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   71fb2c74287d ("[media] MAINTAINERS: atmel-isc: add entry for Atmel ISC")
> 
> from the v4l-dvb tree and commit:
> 
>   5615c3715749 ("MAINTAINERS: update entry for atmel_serial driver")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Both changes are merged well. Thanks Stephen,
-- 
Nicolas Ferre
