From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] (linux-next) Cleanups in drivers/staging/comedi
Date: Wed, 27 May 2009 08:03:23 -0700
Message-ID: <20090527150323.GA31054@suse.de>
References: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com> <20090527150310.GD5982@nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52472 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758598AbZE0PI5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2009 11:08:57 -0400
Content-Disposition: inline
In-Reply-To: <20090527150310.GD5982@nowhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Gerard Lledo <gerard.lledo@gmail.com>, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, May 27, 2009 at 05:03:13PM +0200, Frederic Weisbecker wrote:
> On Wed, May 27, 2009 at 05:35:17PM +0300, Gerard Lledo wrote:
> > 
> > These are 2 small patches that fix one warning and a build faulure in the
> > comedi subsystem.  Both of them were build-tested.
> 
> 
> Hi,
> 
> Don't forget to Cc linux-kernel and also Greg who is
> the staging subsystem maintainer.
> 
> (adding the missing Cc)

My scripts caught them, they are now in my ever-growing "to-apply"
queue.

thanks,

greg k-h
