From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the security-testing tree
Date: Tue, 25 Nov 2008 16:49:59 -0500
Message-ID: <20081125214959.GH4078@fieldses.org>
References: <20081125191137.d5474c9e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:33650 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755843AbYKYVuI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 16:50:08 -0500
Content-Disposition: inline
In-Reply-To: <20081125191137.d5474c9e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

On Tue, Nov 25, 2008 at 07:11:37PM +1100, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the security-testing tree got a conflict in
> fs/nfsd/nfs4recover.c between commit
> e4625eb826de4f6774ee602c442ba23b686bdcc7 ("nfsd: use of unitialized list
> head on error exit in nfs4recover.c") from the nfsd tree and commit
> d84f4f992cbd76e8f39c488cf0c5d123843923b1 ("CRED: Inaugurate COW
> credentials") from the security-testing tree.
> 
> Just a context change. I fixed it up (see below) and can carry the fix as
> necessary.

Thanks!--b.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc fs/nfsd/nfs4recover.c
> index cf94563,9371ea1..0000000
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@@ -224,10 -230,12 +230,13 @@@ nfsd4_list_rec_dir(struct dentry *dir, 
>   	if (!rec_dir_init)
>   		return 0;
>   
> - 	nfs4_save_user(&uid, &gid);
> + 	status = nfs4_save_creds(&original_cred);
> + 	if (status < 0)
> + 		return status;
>  +	INIT_LIST_HEAD(dentries);
>   
> - 	filp = dentry_open(dget(dir), mntget(rec_dir.mnt), O_RDONLY);
> + 	filp = dentry_open(dget(dir), mntget(rec_dir.mnt), O_RDONLY,
> + 			   current_cred());
>   	status = PTR_ERR(filp);
>   	if (IS_ERR(filp))
>   		goto out;
