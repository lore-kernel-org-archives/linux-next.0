From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the pm tree
Date: Tue, 12 Jul 2016 16:31:49 +0100 (BST)
Message-ID: <alpine.DEB.2.10.1607121631270.26575@sstabellini-ThinkPad-X260>
References: <20160712140926.49958101@canb.auug.org.au> <2723893.NgNEmdq9TU@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34654 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932083AbcGLPb6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jul 2016 11:31:58 -0400
In-Reply-To: <2723893.NgNEmdq9TU@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Shannon Zhao <shannon.zhao@linaro.org>

On Tue, 12 Jul 2016, Rafael J. Wysocki wrote:
> On Tuesday, July 12, 2016 02:09:26 PM Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the xen-tip tree got a conflict in:
> > 
> >   drivers/acpi/scan.c
> > 
> > between commit:
> > 
> >   68bdb6773289 ("ACPI: add support for ACPI reconfiguration notifiers")
> > 
> > from the pm tree and commit:
> > 
> >   c8ac8b6fb495 ("Xen: ACPI: Hide UART used by Xen")
> > 
> > from the xen-tip tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Looks good to me, thanks Stehpen!
 
Looks good to me too.

Cheers,

Stefano
