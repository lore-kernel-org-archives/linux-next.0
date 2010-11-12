From: Alan Cox <alan@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Fri, 12 Nov 2010 10:44:38 +0000
Message-ID: <20101112104438.34b8c7b6@linux.intel.com>
References: <20101112125751.7f364d58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:55178 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751457Ab0KLLEt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Nov 2010 06:04:49 -0500
In-Reply-To: <20101112125751.7f364d58.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russ Gorby <richardx.r.gorby@intel.com>

On Fri, 12 Nov 2010 12:57:51 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/serial/ifx6x60.c: In function 'ifx_spi_reset':
> drivers/serial/ifx6x60.c:928: error: implicit declaration of function
> 'msleep'

Patch sent to Greg

Alan
