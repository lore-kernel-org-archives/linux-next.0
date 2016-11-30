From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the edac
 tree
Date: Wed, 30 Nov 2016 08:50:13 -0200
Message-ID: <20161130085013.4798b4a7@vento.lan>
References: <20161128143726.7fda1849@canb.auug.org.au>
        <20161128082734.bdl4dhothemm7ja5@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:50997
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755790AbcK3Ku0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 05:50:26 -0500
In-Reply-To: <20161128082734.bdl4dhothemm7ja5@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Mon, 28 Nov 2016 09:27:35 +0100
Borislav Petkov <bp@alien8.de> escreveu:

> On Mon, Nov 28, 2016 at 02:37:26PM +1100, Stephen Rothwell wrote:
> > Hi Borislav,
> > 
> > Today's linux-next merge of the edac-amd tree got a conflict in:
> > 
> >   drivers/edac/edac_mc.c
> > 
> > between commit:
> > 
> >   ef91afa61088 ("edac: move documentation from edac_mc.c to edac_core.h")
> > 
> > from the edac tree and commit:
> > 
> >   c73e8833bec5 ("EDAC, mc: Fix locking around mc_devices list")
> > 
> > from the edac-amd tree.
> > 
> > I fixed it up (see below - there may be more fixes needed in
> > edac_core.h) and can carry the fix as necessary. This is now fixed as
> > far as linux-next is concerned, but any non trivial conflicts should be
> > mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.  
> 
> Just one issue which has nothing to do with linux-next. There's still
> that in ef91afa61088:
> 
> > +/**
> > + * edac_mc_find: Search for a mem_ctl_info structure whose index is @idx.
> > + *
> > + * @idx: index to be seek
> > + *
> > + * If found, return a pointer to the structure.
> > + * Else return NULL.
> > + *
> > + * Caller must hold mem_ctls_mutex.
> > + */  
> 
> That last sentence in the comment is not true anymore - edac_mc_find()
> is grabbing the mutex itself as it should be. Mauro, please fix that in
> your tree.

Fixed. If you have a stable branch, I can rebase it on the top
of your patches, in order to avoid the confict at linux-next.

Regards,
Mauro
