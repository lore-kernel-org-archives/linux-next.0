From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next build failure
Date: Wed, 30 Oct 2013 13:50:42 -0700
Message-ID: <20131030135042.9c40bca11370c2cfef29ff51@linux-foundation.org>
References: <1383146865.11574.3.camel@deneb.redhat.com>
	<20131031073700.f9642ce6c35674a45b3905bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48014 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752697Ab3J3Uun (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2013 16:50:43 -0400
In-Reply-To: <20131031073700.f9642ce6c35674a45b3905bc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Salter <msalter@redhat.com>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, ccross@android.com

On Thu, 31 Oct 2013 07:37:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> [Jut add Andrew to the cc list]
> 
> On Wed, 30 Oct 2013 11:27:45 -0400 Mark Salter <msalter@redhat.com> wrote:
> >
> > This patch causes a build failure for no-MMU builds:
> > 
> >   commit 41df2957cb010edfa2f9d394d3617da6beeeb660
> >   Author: Colin Cross <ccross@android.com>
> >   Date:   Wed Oct 30 11:45:39 2013 +1100
> > 
> >       mm: add a field to store names for private anonymous memory
> >     
> > The problem is:
> > 
> >   kernel/built-in.o: In function `sys_prctl':
> >   (.text+0x19854): undefined reference to `madvise_set_anon_name'
> > 
> > madvise doesn't make sense without an MMU.
> > 
> > --Mark

OK, thanks.  I'll drop

mm-rearrange-madvise-code-to-allow-for-reuse.patch
mm-add-a-field-to-store-names-for-private-anonymous-memory.patch
mm-add-a-field-to-store-names-for-private-anonymous-memory-fix.patch
mm-add-a-field-to-store-names-for-private-anonymous-memory-fix-fix-2.patch

for now.  They have other question marks - let's revisit everything
after 3.13-rc1.
