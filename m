From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the nfs tree with Linus' tree
Date: Thu, 02 Apr 2009 09:56:37 +0100
Message-ID: <1229.1238662597@redhat.com>
References: <20090402114144.66eab5c3.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:56182 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760250AbZDBI5d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Apr 2009 04:57:33 -0400
In-Reply-To: <20090402114144.66eab5c3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Trond Myklebust <trond.myklebust@fys.uio.no>, linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>  -static int nfs_vm_page_mkwrite(struct vm_area_struct *vma, struct page *page)
>  +static int nfs_vm_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)

That is the correct fix.  I've it to my version of the patch.

David
