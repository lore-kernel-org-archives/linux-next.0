From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for March 18 (staging/comedi)
Date: Wed, 18 Mar 2009 09:33:19 -0700
Message-ID: <20090318163319.GA9706@suse.de>
References: <20090318173830.7ea03dfb.sfr@canb.auug.org.au> <49C121C7.1040903@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55045 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757969AbZCRQfv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2009 12:35:51 -0400
Content-Disposition: inline
In-Reply-To: <49C121C7.1040903@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Mar 18, 2009 at 09:31:03AM -0700, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090317:
> 
> 
> drivers/staging/comedi/comedi_compat32.c: In function 'compat_chaninfo':
> drivers/staging/comedi/comedi_compat32.c:135: error: dereferencing pointer to incomplete type

<snip>

Ick, sorry about that, I'll fix it up for tomorrows -next release.

thanks,

greg "forgot to build last night on x86-64" k-h
