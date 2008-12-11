From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: scsi-post-merge tree build failure
Date: Thu, 11 Dec 2008 12:35:14 +0000
Message-ID: <20372.1228998914@redhat.com>
References: <20081211192737.44532af0.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:52846 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751838AbYLKMfV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 07:35:21 -0500
In-Reply-To: <20081211192737.44532af0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next build (powerpc ppc44x_config) failed like this:
> 
> arch/powerpc/lib/dma-noncoherent.c:80: error: redefinition of 'struct vm_region'
> 
> Caused by commit f65466230e8afd45f716e5b836711ce270f45105 ("NOMMU: Make
> VMAs per MM as for MMU-mode linux").

Sigh.  Someone's already taken the name vm_region for a struct.  I guess I
need to find a different name:-(

David
