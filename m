From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: unsigned commits in tpmdd tree
Date: Thu, 3 Mar 2016 12:14:13 +0200
Message-ID: <20160303101413.GA6003@intel.com>
References: <20160302074218.7aa0a06b@canb.auug.org.au>
 <20160302142956.GA8341@intel.com>
 <20160303073441.5ba3aa0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:10336 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751243AbcCCKOQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 05:14:16 -0500
Content-Disposition: inline
In-Reply-To: <20160303073441.5ba3aa0d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 03, 2016 at 07:34:41AM +1100, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> On Wed, 2 Mar 2016 16:29:56 +0200 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > On Wed, Mar 02, 2016 at 07:42:18AM +1100, Stephen Rothwell wrote:
> > > Hi Jarkko,
> > > 
> > > All the new commits in you tree today have no Signed-off-by from you as
> > > the committer.  
> > 
> > Oops :( This is my mistake. Do you want me to do git reverts and redo
> > commits?
> 
> Reverting doesn't really fix the problem (since eth original commits
> would still be there), you would have to rebase (maybe onto the same
> base commit) all the commits and add the Signed-off-by lines.

They are now rebased.

> -- 
> Cheers,
> Stephen Rothwell

/Jarkko
