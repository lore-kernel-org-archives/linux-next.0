From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Tue, 29 May 2018 10:12:05 +0200
Message-ID: <20180529081205.GB1416@lst.de>
References: <20180529143357.2a66b0af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180529143357.2a66b0af@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

Meh.  Do we really need these switch to octal patches to start
with?  I mean, I personally prefer octal, but just switching around
in random code that isn't otherwise changed creates nothing but churn.

On Tue, May 29, 2018 at 02:33:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/block/DAC960.c
> 
> between commit:
> 
>   3f3942aca6da ("proc: introduce proc_create_single{,_data}")
> 
> from the vfs tree and commit:
> 
>   5657a819a8d9 ("block drivers/block: Use octal not symbolic permissions")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/block/DAC960.c
> index 6918c3d9482e,7c3887a7e534..000000000000
> --- a/drivers/block/DAC960.c
> +++ b/drivers/block/DAC960.c
> @@@ -6553,11 -6587,9 +6548,11 @@@ static void DAC960_CreateProcEntries(DA
>   		 "c%d", Controller->ControllerNumber);
>   	ControllerProcEntry = proc_mkdir(Controller->ControllerName,
>   					 DAC960_ProcDirectoryEntry);
>  -	proc_create_data("initial_status", 0, ControllerProcEntry, &dac960_initial_status_proc_fops, Controller);
>  -	proc_create_data("current_status", 0, ControllerProcEntry, &dac960_current_status_proc_fops, Controller);
>  +	proc_create_single_data("initial_status", 0, ControllerProcEntry,
>  +			dac960_initial_status_proc_show, Controller);
>  +	proc_create_single_data("current_status", 0, ControllerProcEntry,
>  +			dac960_current_status_proc_show, Controller);
> - 	proc_create_data("user_command", S_IWUSR | S_IRUSR, ControllerProcEntry, &dac960_user_command_proc_fops, Controller);
> + 	proc_create_data("user_command", 0600, ControllerProcEntry, &dac960_user_command_proc_fops, Controller);
>   	Controller->ControllerProcEntry = ControllerProcEntry;
>   }
>   


---end quoted text---
