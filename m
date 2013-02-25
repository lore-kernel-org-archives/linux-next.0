From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for Feb 23 [ fs/dcache.c: Root dentry has weird
 name <SYSV00000000> ]
Date: Mon, 25 Feb 2013 14:27:49 +0000
Message-ID: <20130225142749.GB4503@ZenIV.linux.org.uk>
References: <CA+icZUVE-KzZ_ZnhjK+WzaC9KWuwuOK0TAJbNcn+Vn=HC=snhQ@mail.gmail.com>
 <20130225135436.GA4503@ZenIV.linux.org.uk>
 <CA+icZUXLO6MX==1zz1CUL+ytXv1bt+HjDx8Gug2p7GmfqtYBHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:55963 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758155Ab3BYO1x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Feb 2013 09:27:53 -0500
Content-Disposition: inline
In-Reply-To: <CA+icZUXLO6MX==1zz1CUL+ytXv1bt+HjDx8Gug2p7GmfqtYBHw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Mon, Feb 25, 2013 at 03:22:03PM +0100, Sedat Dilek wrote:
> On Mon, Feb 25, 2013 at 2:54 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Mon, Feb 25, 2013 at 02:22:42PM +0100, Sedat Dilek wrote:
> >
> >> [  120.310366] Root dentry has weird name <SYSV00000000>
> >
> > Umm...  Almost certainly a result of switching to shmem_file_setup() to
> > d_alloc_pseudo(); I'll fix it (give the suckers ->d_op of their own).
> > For now, just ignore the warning - it's harmless.  Or revert commit
> > 7dbc68fcb0cdce27737dba9ee252f26d39d75fb6 and see if the rest of your
> > problems persist; I would be very surprised if anything other than this
> > warning had been caused by that commit.
> 
> Thanks for the quick fix!
> 
> YES, with "Revert "shmem_setup_file(): use d_alloc_pseudo() instead of
> d_alloc()"" I do NOT see these warnings anymore.

Umm...  Are the perf ones you are seeing eliminated by that as well?  I would
expect them to be an independent problem...
