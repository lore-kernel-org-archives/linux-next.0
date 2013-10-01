From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the sh tree
Date: Tue, 1 Oct 2013 06:53:36 -0700
Message-ID: <20131001135336.GB19805@kroah.com>
References: <20131001110344.GA20249@ulmo.nvidia.com>
 <1380625644-11331-7-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:52041 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752995Ab3JANxc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Oct 2013 09:53:32 -0400
Content-Disposition: inline
In-Reply-To: <1380625644-11331-7-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Simon Horman <horms+renesas@verge.net.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 01, 2013 at 01:07:23PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the sh tree got conflicts in
> 
> 	arch/sh/kernel/cpu/sh2a/Makefile
> 	drivers/tty/serial/sh-sci.c
> 	include/linux/serial_sci.h
> 
> I fixed them up (see below). Please check if the resolution looks correct.

Looks correct to me, thanks for doing this.

greg k-h
