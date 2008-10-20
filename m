From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: vfs tree build failure
Date: Mon, 20 Oct 2008 03:40:35 -0400
Message-ID: <20081020074035.GA5603@infradead.org>
References: <20081020171830.9ece287f.sfr@canb.auug.org.au> <20081020071338.GQ31761@disturbed>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:34419 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753477AbYJTHkl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 03:40:41 -0400
Content-Disposition: inline
In-Reply-To: <20081020071338.GQ31761@disturbed>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Lachlan McIlroy <lachlan@sgi.com>

On Mon, Oct 20, 2008 at 06:13:38PM +1100, Dave Chinner wrote:
> >  
> > -	return d_obtain_alias(cip->i_vnode);
> > +	return d_obtain_alias(&cip->i_vnode);
> >  }
> 
> Hmmmm - looks like the VFS patches aren't using the correct
> accessor function like the original code did. The fix should
> be:
> 
> +	return d_obtain_alias(VFS_I(cip));

When I did the VFS patches VFS_I wasn't around yet..
