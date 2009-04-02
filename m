From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Staging: pohmelfs: should include fs_struct.h
Date: Thu, 2 Apr 2009 16:32:26 -0700
Message-ID: <20090402233226.GA18563@kroah.com>
References: <a4423d670904020437q446f7c62xa209822f10573c28@mail.gmail.com> <20090402211754.GA7479@ioremap.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:48712 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755875AbZDBXlY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Apr 2009 19:41:24 -0400
Content-Disposition: inline
In-Reply-To: <20090402211754.GA7479@ioremap.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, Apr 03, 2009 at 01:17:54AM +0400, Evgeniy Polyakov wrote:
> Hi Alexander.
> 
> On Thu, Apr 02, 2009 at 03:37:10PM +0400, Alexander Beregalov (a.beregalov@gmail.com) wrote:
> > drivers/staging/pohmelfs/path_entry.c: In function
> > 'pohmelfs_construct_path_string':
> > drivers/staging/pohmelfs/path_entry.c:48: error: dereferencing pointer
> > to incomplete type
> > drivers/staging/pohmelfs/path_entry.c:49: error: dereferencing pointer
> > to incomplete type
> > drivers/staging/pohmelfs/path_entry.c:50: error: dereferencing pointer
> > to incomplete type
> > drivers/staging/pohmelfs/path_entry.c: In function 'pohmelfs_path_length':
> > drivers/staging/pohmelfs/path_entry.c:95: error: dereferencing pointer
> > to incomplete type
> > drivers/staging/pohmelfs/path_entry.c:96: error: dereferencing pointer
> > to incomplete type
> > drivers/staging/pohmelfs/path_entry.c:97: error: dereferencing pointer
> > to incomplete type
> > 
> > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> 
> Looks good. Ack.
> Greg please queue it for inclusion.

Will do.  Give me a few days to catch up, was away for a week...

thanks,

greg k-h
