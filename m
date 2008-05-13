From: Greg KH <gregkh@suse.de>
Subject: Re: Problem compiling linux-next without sysfs
Date: Tue, 13 May 2008 09:45:08 -0700
Message-ID: <20080513164508.GA31570@suse.de>
References: <20080513164326.GA18799@coyote.octets.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns.suse.de ([195.135.220.2]:38344 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751604AbYEMQpq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 May 2008 12:45:46 -0400
Content-Disposition: inline
In-Reply-To: <20080513164326.GA18799@coyote.octets.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philippe Roussel <p.o.roussel@free.fr>
Cc: linux-next@vger.kernel.org

On Tue, May 13, 2008 at 06:43:26PM +0200, Philippe Roussel wrote:
> Hi Greg,
> 
> I ran into this while building randconfigs
> 
> In file included from include/linux/kobject.h:21,
>                  from include/linux/module.h:16,
> 				 from include/linux/crypto.h:21,
> 				 from arch/x86/kernel/asm-offsets_32.c:7,
> 				 from arch/x86/kernel/asm-offsets.c:2:
> include/linux/sysfs.h: In function 'sysfs_rename_dir':
> include/linux/sysfs.h:141: error: implicit declaration of function
> 'kobject_set_name'

Yeah, it's a header file cross-dependancy, people are already working on
fixing it.

thanks,

greg k-h
