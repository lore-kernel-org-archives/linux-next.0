From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] JFS: do not ignore return code from write_one_page()
Date: Fri, 26 May 2017 23:36:00 -0700
Message-ID: <20170526233600.100aed6f6568e5f6119e9740@linux-foundation.org>
References: <20170526124324.058c3d2a@canb.auug.org.au>
        <1495793788.2926.4.camel@redhat.com>
        <db45ab67-55c7-08ff-6776-f76b3bf5cbf5@oracle.com>
        <6a709681-3f25-b4b7-4eb3-942f86e712d5@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38664 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751882AbdE0GgE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 27 May 2017 02:36:04 -0400
In-Reply-To: <6a709681-3f25-b4b7-4eb3-942f86e712d5@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Jeff Layton <jlayton@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>, Matthew Wilcox <mawilcox@microsoft.com>, Christoph Hellwig <hch@lst.de>

On Fri, 26 May 2017 15:48:51 -0500 Dave Kleikamp <dave.kleikamp@oracle.com> wrote:

> Andrew,
> 
> Do you want to pick this up into akpm-current? I could push it through
> the jfs tree, but without the change to write_one_page(), my version of
> the patch would need a manual merge. It'd be a simple one, so maybe
> that's not a big deal.

Yes, I'll add this to Jeff's series, thanks.
