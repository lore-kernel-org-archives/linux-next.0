Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342F34E74B;
	Tue,  7 Apr 2026 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775528408; cv=none; b=i3UjDRR8gP5zWwKy8hhMzhZ2c4LQvUfp1QSXd7cHqEtQNivmw4c9bFgSvAR0Khb0oYQq+30ZCSCQJrj4OjmOtsDQovM8Ht7/fPHIzuGVQWar+s17BZrVqRVoyDumC0t7QzjgcXLaPihHh6lswC0MkAsUZxsnN2doP3BiiaNt3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775528408; c=relaxed/simple;
	bh=F1M0eHoC4sMH12kiHO7A6NieEwtDjalMn5M9aJ93wTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2vmbKPHHHCS6C6mon54311KydtbNLP5flJBwq/xvLrC0eD/sjs/DtEWdrC+pJ5io8k7NTNnZamoLWk1tjasyBUvXmO2lSx+F5b/IH5rzKe7Gu003az3CDYMvds1nNouNP6MZSnZqDJAK5j3Gcna7VOc13Vs4iq2hmDrr/dbcdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DFAOOC7P; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DFAOOC7P"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775528401; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tQ+0QZlGvJMJoZCC7Eb73i65RLpZYXN9skVFSmc7wI8=;
	b=DFAOOC7Pp/mozNYeo4N1rGq1vW/7DnfZfgSTDW9e0hIPE0knASf9wdrMJFYlnhjMtOG3qgqHGzyR0sC9zJIo7M7C2+HoncRKv1K0TA2ejmIfp6YXc41PE487pBqSODajE/GZzr5SnNyjXOoZZt/S90a4RyMxVUAcA0aUDgwT5Po=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X0aA6SS_1775528400;
Received: from 30.221.145.153(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X0aA6SS_1775528400 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 07 Apr 2026 10:20:00 +0800
Message-ID: <b96ce2ef-cf9c-4f21-9058-d1791305d5b5@linux.alibaba.com>
Date: Tue, 7 Apr 2026 10:19:59 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
To: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <adOxjbi2byrIet3y@sirena.org.uk>
 <20260406092553.8737d1e3834fe6fdeeaaa8fb@linux-foundation.org>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20260406092553.8737d1e3834fe6fdeeaaa8fb@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/7/26 12:25 AM, Andrew Morton wrote:
> On Mon, 6 Apr 2026 14:13:49 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
>> Today's linux-next merge of the fs-next tree got a conflict in:
>>
>>   fs/ocfs2/dir.c
>>
>> between commits:
>>
>>   bdff37e327275 ("ocfs2: validate dx_root extent list fields during block read")
>>   28c33de101792 ("ocfs2: remove empty extent list check in ocfs2_dx_dir_lookup_rec()")
>>
>> from the mm-nonmm-unstable tree and commit:
>>
>>   0b2600f81cefc ("treewide: change inode->i_ino from unsigned long to u64")
>>
>> from the fs-next tree.
> 
> Thanks.  That's a nasty-looking conflict due to the applying order.  The
> 0b2600f81cefc change is actually small, below.
> 
> Hopefully Linus can figure it out ;)
> 
> 
Should I resend the series base on the latest linux-next?

Thanks,
Joseph

> --- a/fs/ocfs2/dir.c
> +++ b/fs/ocfs2/dir.c
> @@ -794,7 +794,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  	if (le16_to_cpu(el->l_count) !=
>  	    ocfs2_extent_recs_per_dx_root(inode->i_sb)) {
>  		ret = ocfs2_error(inode->i_sb,
> -				  "Inode %lu has invalid extent list length %u\n",
> +				  "Inode %llu has invalid extent list length %u\n",
>  				  inode->i_ino, le16_to_cpu(el->l_count));
>  		goto out;
>  	}
> @@ -812,7 +812,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  
>  		if (el->l_tree_depth) {
>  			ret = ocfs2_error(inode->i_sb,
> -					  "Inode %lu has non zero tree depth in btree tree block %llu\n",
> +					  "Inode %llu has non zero tree depth in btree tree block %llu\n",
>  					  inode->i_ino,
>  					  (unsigned long long)eb_bh->b_blocknr);
>  			goto out;
> @@ -821,7 +821,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  
>  	if (le16_to_cpu(el->l_next_free_rec) == 0) {
>  		ret = ocfs2_error(inode->i_sb,
> -				  "Inode %lu has empty extent list at depth %u\n",
> +				  "Inode %llu has empty extent list at depth %u\n",
>  				  inode->i_ino,
>  				  le16_to_cpu(el->l_tree_depth));
>  		goto out;
> @@ -839,7 +839,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>  
>  	if (!found) {
>  		ret = ocfs2_error(inode->i_sb,
> -				  "Inode %lu has bad extent record (%u, %u, 0) in btree\n",
> +				  "Inode %llu has bad extent record (%u, %u, 0) in btree\n",
>  				  inode->i_ino,
>  				  le32_to_cpu(rec->e_cpos),
>  				  ocfs2_rec_clusters(el, rec));

