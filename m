From: Gavin Shan <shangw@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the powerpc
 tree
Date: Wed, 14 Mar 2012 09:53:56 +0800
Message-ID: <20120314015356.GA4028@shangw>
References: <20120313160100.c8cc3fd2b3d1f485ef7e7954@canb.auug.org.au>
 <20120313182612.0546D3E053B@localhost>
Reply-To: Gavin Shan <shangw@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp08.au.ibm.com ([202.81.31.141]:42617 "EHLO
	e23smtp08.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965036Ab2CNByH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Mar 2012 21:54:07 -0400
Received: from /spool/local
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <shangw@linux.vnet.ibm.com>;
	Wed, 14 Mar 2012 01:51:41 +1000
Content-Disposition: inline
In-Reply-To: <20120313182612.0546D3E053B@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>, benh@kernel.crashing.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Grant,

> > 
> > Today's linux-next merge of the devicetree tree got a conflict in
> > include/linux/of.h between commit eb740b5f3e65 ("powerpc/eeh: Introduce
> > EEH device") from the powerpc tree and commit 0f22dd395fc4 ("of: Only
> > compile OF_DYNAMIC on PowerPC pseries and iseries") from the devicetree
> > tree.
> > 
> > Just context changes.  I fixed it up (see below) and can carry the fix as
> > necessary.
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > 
> > diff --cc include/linux/of.h
> > index bdb1c07,533603e..0000000
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@@ -75,14 -72,10 +75,17 @@@ struct of_phandle_args 
> >   	uint32_t args[MAX_PHANDLE_ARGS];
> >   };
> >   
> >  +#if defined(CONFIG_EEH)
> >  +static inline struct eeh_dev *of_node_to_eeh_dev(struct device_node *dn)
> >  +{
> >  +	return dn->edev;
> >  +}
> >  +#endif
> 
> Ben, What is this?  I don't want the eeh_dev pointer in struct device_node.  Up to
> now we've avoided putting any reverse references into device_nodes.  For everything
> else we use a reverse lookup, particularly for devices, to avoid growing the
> device_node for each new type of lookup.
> 

It's used to trace the EEH device. When EEH (Enhanced Error Hanlding) is enabled,
EEH device will be created against PCI sensitive OF node to trace the EEH state
accordingly. Since you don't want see this in struct device_node, we have to change
struct eeh_dev for a little bit to so that all struct eeh_dev instances will form
a global list and we can search eeh_dev according to the given device_node through
the global list. 

I don't know the policy or rule here for much. I think we can have 2 options.

1. Keep the code as being, and fix it later.
2. Fix it now.

Thanks,
Gavin
