Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F893AF674
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860032; cv=none; b=DwuybRe/KvvbjPN6U4fNeYSbqO8O+BFfDokx3m3ojBnIngdvzSiB0ht/+7nVAJXjp8zUKBltkKZs0QZfDbSwW7EZZ2vp2Tmx3A1nYbpEI6lAhUW6hSqgBP5DXBb/QN1cK6j1BENCCLiwyXFfQCgg23fG0xGY41IeH+UQZnV8bN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860032; c=relaxed/simple;
	bh=4T1ZH0NOBdL7c3JpqUItrqaJqjxfb1jAnChaf1gEq4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQlxtd3ou1xW6MxkPwLolre7nIC0SA2BkfUqlp6ng2THvAkcYByVxqZx8CnltLN997c04hxi49Ggk5HS+wq3FeMamlmLnyCqQoWMDuIWNOD7y4Idba9Hg+6Ryv/+XM8wupJJ4Sin9M64i4GLcO9Uhkyo/Bnif6+pL/vu5qxuvIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SPENjS+W; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=j7IXlHks; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SPENjS+W; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=j7IXlHks; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SPENjS+W";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j7IXlHks";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SPENjS+W";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j7IXlHks"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D47F05BED0;
	Mon, 30 Mar 2026 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1774860027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7fsciCF0m/o/Q3WijYo7f/indCrHNUUk8Gr5E+FAR2E=;
	b=SPENjS+Wgxrj4k1YeyZ8En2GOxuoCCrgZcGXUpnt0xEPkgJuzOwRbGUoOglnQFI8g2h7gU
	wI5Sau1odqI9QYEKS7qgECHFM6p4N7Map+PRjtHrnZ+aEXPXMbABDANUmZBt9XpaQBOgyA
	NqrhzgLx3Hav75hwGotNKb2bRUAyBdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1774860027;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7fsciCF0m/o/Q3WijYo7f/indCrHNUUk8Gr5E+FAR2E=;
	b=j7IXlHkseCbCz528mm/frh2Q8EjjVPjbOG6PECy/wrO7clIK+YBHf3KbX95J2Yipql/+HT
	04Iwe2g35BDmoODg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1774860027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7fsciCF0m/o/Q3WijYo7f/indCrHNUUk8Gr5E+FAR2E=;
	b=SPENjS+Wgxrj4k1YeyZ8En2GOxuoCCrgZcGXUpnt0xEPkgJuzOwRbGUoOglnQFI8g2h7gU
	wI5Sau1odqI9QYEKS7qgECHFM6p4N7Map+PRjtHrnZ+aEXPXMbABDANUmZBt9XpaQBOgyA
	NqrhzgLx3Hav75hwGotNKb2bRUAyBdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1774860027;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7fsciCF0m/o/Q3WijYo7f/indCrHNUUk8Gr5E+FAR2E=;
	b=j7IXlHkseCbCz528mm/frh2Q8EjjVPjbOG6PECy/wrO7clIK+YBHf3KbX95J2Yipql/+HT
	04Iwe2g35BDmoODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD86F4A0A2;
	Mon, 30 Mar 2026 08:40:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fbcqMvs2ymkCawAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 30 Mar 2026 08:40:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 3AB95A0AE1; Mon, 30 Mar 2026 10:30:26 +0200 (CEST)
Date: Mon, 30 Mar 2026 10:30:26 +0200
From: Jan Kara <jack@suse.cz>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <qljzxwmb5wtritfvhrjw6e2mo4ow52j6v34j7pcc3dog5dkg2f@cdzoawvadgsj>
References: <acbAlnfUcjBSLNpt@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbAlnfUcjBSLNpt@sirena.co.uk>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO

On Fri 27-03-26 17:38:30, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
> 
>   fs/ext4/fsync.c
> 
> between commit:
> 
>   3a0fb9e5017077 ("ext4: fix fsync(2) for nojournal mode")
> 
> from the ext4 tree and commit:
> 
>   41189b49bcf1c2 ("ext4: Track metadata bhs in fs-private inode part")
> 
> from the vfs-brauner tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks good. Thanks!

								Honza

> 
> diff --cc fs/ext4/fsync.c
> index bd8f230fa507e7,aa80af2b4eea28..00000000000000
> --- a/fs/ext4/fsync.c
> +++ b/fs/ext4/fsync.c
> @@@ -83,23 -83,12 +83,24 @@@ static int ext4_fsync_nojournal(struct 
>   				int datasync, bool *needs_barrier)
>   {
>   	struct inode *inode = file->f_inode;
>  +	struct writeback_control wbc = {
>  +		.sync_mode = WB_SYNC_ALL,
>  +		.nr_to_write = 0,
>  +	};
>   	int ret;
>   
> - 	ret = generic_buffers_fsync_noflush(file, start, end, datasync);
> + 	ret = mmb_fsync_noflush(file, &EXT4_I(inode)->i_metadata_bhs,
> + 				start, end, datasync);
>  -	if (!ret)
>  -		ret = ext4_sync_parent(inode);
>  +	if (ret)
>  +		return ret;
>  +
>  +	/* Force writeout of inode table buffer to disk */
>  +	ret = ext4_write_inode(inode, &wbc);
>  +	if (ret)
>  +		return ret;
>  +
>  +	ret = ext4_sync_parent(inode);
>  +
>   	if (test_opt(inode->i_sb, BARRIER))
>   		*needs_barrier = true;
>   


-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
