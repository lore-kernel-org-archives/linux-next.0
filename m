From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the integrity tree with the vfs tree
Date: Mon, 04 Jan 2016 07:32:28 -0500
Message-ID: <1451910748.2772.35.camel@linux.vnet.ibm.com>
References: <20160104135221.0e5515ac@canb.auug.org.au>
	 <20160104031621.GP9938@ZenIV.linux.org.uk>
	 <1451883997.2772.27.camel@linux.vnet.ibm.com>
	 <20160104162308.52349acd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp07.in.ibm.com ([125.16.236.7]:53701 "EHLO
	e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753603AbcADMcs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2016 07:32:48 -0500
Received: from localhost
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zohar@linux.vnet.ibm.com>;
	Mon, 4 Jan 2016 18:02:45 +0530
In-Reply-To: <20160104162308.52349acd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>, James Morris <jmorris@namei.org>

On Mon, 2016-01-04 at 16:23 +1100, Stephen Rothwell wrote:
> Hi Mimi,
> 
> On Mon, 04 Jan 2016 00:06:37 -0500 Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> >
> > On Mon, 2016-01-04 at 03:16 +0000, Al Viro wrote:
> > >
> > > FWIW, I'm going to pull the part that introduces memdup_user_nul() into
> > > a never-rebased branch and if security.git is willing to pull it and handle
> > > that conversion in ima_write_policy() themselves, I'll be only glad to drop
> > > the corresponding chunk in vfs.git#for-next  
> > 
> > As memdup_user_nul() is not in the security tree, it would break the
> > security tree builds.  Having the patch in the linux-integrity/next
> > branch wouldn't help matters.
> 
> I think Al intends for you to merge his "never-rebased branch" that
> contains the memdup_user_nul patch into the integrity tree (or James to
> merge it into the security tree).  He will also merge the same branch
> into his vfs tree and remove the patch that updates ima_write_policy()
> to use memdup_user_nul() and you (or James) could apply that patch in
> the integrity (or security) tree.
> 
> This way we end up with the same commit creating memdup_user_nul() in
> both trees and no left over conflicts.

Thank you for the explanation.  It sounds like a plan.  James, are you
ok with this?

Mimi
