From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the bkl-trivial tree with the block tree
Date: Mon, 27 Sep 2010 09:05:02 +0200
Message-ID: <201009270905.02938.arnd@arndb.de>
References: <20100927144519.25cd3afa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:51391 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754387Ab0I0HFK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2010 03:05:10 -0400
In-Reply-To: <20100927144519.25cd3afa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>, Jens Axboe <axboe@kernel.dk>

On Monday 27 September 2010 06:45:19 Stephen Rothwell wrote:
> 
>   #undef DEBUG
>   
> + static DEFINE_MUTEX(ataflop_mutex);
>  -static struct request_queue *floppy_queue;
>   static struct request *fd_request;
>  +static int fdc_queue;
>   
>   /* Disk types: DD, HD, ED */
>   static struct atari_disk_type {

Looks good, thanks!

Vivek, since you are touching that file with other patches, are you interested
in taking the floppy part of my automated block driver BKL removal patch
as well?

I suspect it's possible to come up with a better solution than mine if you
know the code.

	Arnd
