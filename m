From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: tty changes in (I assume) Greg's tree
Date: Fri, 4 Jul 2008 00:02:29 -0700
Message-ID: <20080704000229.dc94e071.akpm@linux-foundation.org>
References: <20080703233148.2db44cee.akpm@linux-foundation.org>
	<20080704065206.GA26261@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:50979 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752266AbYGDHCm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 03:02:42 -0400
In-Reply-To: <20080704065206.GA26261@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, 3 Jul 2008 23:52:06 -0700 Greg KH <greg@kroah.com> wrote:

> On Thu, Jul 03, 2008 at 11:31:48PM -0700, Andrew Morton wrote:
> > 77-tty-break-errorhandler
> > 69-tty-split-ldisc
> > 22-more-tty_port-fields
> > etc
> > 
> > aren't terribly good patch titles.  Were they merged up incorrectly?
> 
> Heh, that's alan's tree, not mine :)

<looks>

OK, it's a quilt tree at http://www.linux.org.uk/~alan/ttydev/

And it tries to get it right.  For example,
http://www.linux.org.uk/~alan/ttydev/77-tty-break-errorhandler has

  tty: rework break handling
  
  From: Alan Cox <alan@redhat.com>
  
  Some hardware needs to do break handling itself and may have partial
  support only. Make break_ctl return an error code. Add a tty driver flag
  so you can indicate driver hardware side break support.
  
  
  Signed-off-by: Alan Cox <alan@redhat.com>
  

But I assume that Stephen's scripts did not behave as desired.


(It's strange that there are two patches prefixed "77-", and many
similar)
