From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the quota tree
Date: Tue, 10 Feb 2009 14:52:19 +0100
Message-ID: <20090210135219.GA10904@placka.suse.cz>
References: <20090210183438.2099164f.sfr@canb.auug.org.au> <alpine.LNX.1.10.0902101039520.11630@jikos.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.suse.de ([195.135.220.2]:33455 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753344AbZBJRFi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2009 12:05:38 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.10.0902101039520.11630@jikos.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue 10-02-09 10:42:17, Jiri Kosina wrote:
> On Tue, 10 Feb 2009, Stephen Rothwell wrote:
> 
> > Today's linux-next merge of the trivial tree got a conflict in fs/Kconfig
> > between commit c417122fec0f6b10a6c338c84180c6b9e06601c8 ("quota: Move
> > quota files into separate directory") from the quota tree and commit
> > 8310459012b926e121b3546bfed833910dd6f3ef ("trivial: fix typos/grammar
> > errors in Kconfig texts") from the trivial tree.
> 
> Thanks for notification Stephen. I have dropped the conflicting hunk from 
> my tree now. Jan, could you please take the patch below through your tree? 
  Merged into quota tree. Thanks.


> From: Matt LaPlante <kernel1@cyberdogtech.com>
> Subject: trivial: fix typos/grammar errors in fs/Kconfig
> 
> Signed-off-by: Matt LaPlante <kernel1@cyberdogtech.com>
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> 
> diff --git a/fs/Kconfig b/fs/Kconfig
> index 93945dd..951b310 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -87,7 +87,7 @@ config PRINT_QUOTA_WARNING
>  	  Note that this behavior is currently deprecated and may go away in
>  	  future. Please use notification via netlink socket instead.
>  
> -# Generic support for tree structured quota files. Seleted when needed.
> +# Generic support for tree structured quota files. Selected when needed.
>  config QUOTA_TREE
>  	 tristate

									Honza
