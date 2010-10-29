From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: manual merge of the xen-pvhvm tree with the xen
 tree
Date: Fri, 29 Oct 2010 17:28:59 +0100
Message-ID: <alpine.DEB.2.00.1010291728470.1407@kaball-desktop>
References: <20101029114237.ae45f678.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.eu.citrix.com ([62.200.22.115]:27013 "EHLO
	SMTP.EU.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751572Ab0J2QaA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2010 12:30:00 -0400
In-Reply-To: <20101029114237.ae45f678.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Juan Quintela <quintela@redhat.com>, Jeremy Fitzhardinge <Jeremy.Fitzhardinge@citrix.com>, Ian Campbell <Ian.Campbell@eu.citrix.com>

On Fri, 29 Oct 2010, Stephen Rothwell wrote:
> Hi Stefano,
> 
> Today's linux-next merge of the xen-pvhvm tree got a conflict in
> arch/x86/xen/setup.c between commit
> a1857ddc9ba2dfdbfd70171181e481f2f64b8d0b ("xen: do not release any memory
> under 1M in domain 0") from the xen tree and commit
> 4ec5387cc36c6472a2ff2c82e9865abe8cab96c2 ("xen: add the direct mapping
> area for ISA bus access") from the xen-pvhvm tree.
> 
> Just differences in a comment.  I just used the version from the xen
> tree ...

I think is fine
