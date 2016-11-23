From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: Tree for Nov 22 (ext4 + dax)
Date: Tue, 22 Nov 2016 23:28:23 -0500
Message-ID: <20161123042823.qoca5jswwa5tctjj@thunk.org>
References: <20161122213032.2a88af29@canb.auug.org.au>
 <bdfc4395-0df1-15d2-d084-3b84944dcbe7@infradead.org>
 <20161123041935.6644679f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:45776 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755568AbcKWE2a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 23:28:30 -0500
Content-Disposition: inline
In-Reply-To: <20161123041935.6644679f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>

On Wed, Nov 23, 2016 at 04:19:35AM +1100, Stephen Rothwell wrote:
> > I don't see why this is happening but I reproduced it multiple times.
> > 
> > fs/built-in.o: In function `ext4_dax_fault':
> > file.c:(.text+0x6278b): undefined reference to `dax_iomap_fault'
> > file.c:(.text+0x627dc): undefined reference to `dax_iomap_fault'
> >
> > Full randconfig file is attached.
> 
> CONFIG_FS_IOMAP is not set ...

I've just added a Kconfig fixup from Jan Kara to address this.

     	  	  	  	     	 - Ted
