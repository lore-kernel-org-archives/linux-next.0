From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for Dec 10
Date: Wed, 10 Dec 2014 17:27:36 -0500
Message-ID: <20141210222736.GA19788@kroah.com>
References: <20141210204822.3359b7ef@canb.auug.org.au>
 <20141210113014.GB10836@hudson.localdomain>
 <20141211075142.5fe2993a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33762 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758095AbaLJW1h (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2014 17:27:37 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id BA501209D2
	for <linux-next@vger.kernel.org>; Wed, 10 Dec 2014 17:27:36 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141211075142.5fe2993a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremiah Mahler <jmmahler@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 11, 2014 at 07:51:42AM +1100, Stephen Rothwell wrote:
> Hi Jeremiah,
> 
> On Wed, 10 Dec 2014 03:30:14 -0800 Jeremiah Mahler <jmmahler@gmail.com> wrote:
> >
> > Just a FYI.
> > 
> > As of -next 20141210 commit d32394fae95741d733b174ec1446f27765f80233,
> > which caused a suspend hang bug [1], is still in the tree.  Greg created
> > a revert patch for it in driver-core [2] but I am not sure if this will
> > make its way to -next.
> > 
> >   [1]: https://lkml.org/lkml/2014/12/3/215
> > 
> >   [2]: https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-testing&id=f1c488a78d9f1a22cdb15648c15e70fd82ed229a
> 
> Unfortunately, I can't control how often maintainers update the
> versions of their trees that are included in linux-next :-(

Oops, sorry about that, with travel this week, I forgot to push that one
out to the git.kernel.org, my fault.  Now done.

greg k-h
