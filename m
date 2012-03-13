From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the powerpc tree
Date: Tue, 13 Mar 2012 12:26:11 -0600
Message-ID: <20120313182612.0546D3E053B@localhost>
References: <20120313160100.c8cc3fd2b3d1f485ef7e7954@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120313160100.c8cc3fd2b3d1f485ef7e7954@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gavin Shan <shangw@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On Tue, 13 Mar 2012 16:01:00 +1100, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
> 
> Today's linux-next merge of the devicetree tree got a conflict in
> include/linux/of.h between commit eb740b5f3e65 ("powerpc/eeh: Introduce
> EEH device") from the powerpc tree and commit 0f22dd395fc4 ("of: Only
> compile OF_DYNAMIC on PowerPC pseries and iseries") from the devicetree
> tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/of.h
> index bdb1c07,533603e..0000000
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@@ -75,14 -72,10 +75,17 @@@ struct of_phandle_args 
>   	uint32_t args[MAX_PHANDLE_ARGS];
>   };
>   
>  +#if defined(CONFIG_EEH)
>  +static inline struct eeh_dev *of_node_to_eeh_dev(struct device_node *dn)
>  +{
>  +	return dn->edev;
>  +}
>  +#endif

Ben, What is this?  I don't want the eeh_dev pointer in struct device_node.  Up to
now we've avoided putting any reverse references into device_nodes.  For everything
else we use a reverse lookup, particularly for devices, to avoid growing the
device_node for each new type of lookup.

g.
