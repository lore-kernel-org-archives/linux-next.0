Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54438AC86;
	Mon,  6 Apr 2026 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492754; cv=none; b=FQXErKB9gKQ0QdQBREZD6eZCidYK7KaKYd65lbVlUqY41PnKh6Xmg04IJ0tXw4c22oPcjJaM1mmFQlJ45v2yRr79v/IzxcmTOV32lrBp2KfX1lpmm/lGXbaEZv34LwiZlEKEIlZz6Q52YHWV7+wNkGAszALuPTyNEeXyEVZ0+lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492754; c=relaxed/simple;
	bh=t5y/xftMN2HmvWkzqd+jd4fwsfpC2amdwbFVL1ISm1k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UELbT7hbxNIgwZuYic663gwo+ORtOnDQfQXqzSQCVSsNEomWRrI9b+LM6oKqIedXgCeEsUwwD455nPAcY69bua5BZj8ii9DxQlhJJvKifIILUjxCXqXsgbMXoTDkTAXGI/DMkwnoWWeX5ingkxYkJGe62baQeYbDdINt7ONYQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T9ODojBc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T9ODojBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD2AC4CEF7;
	Mon,  6 Apr 2026 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775492754;
	bh=t5y/xftMN2HmvWkzqd+jd4fwsfpC2amdwbFVL1ISm1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T9ODojBc+XbdWXGsh9yp+JFYxe5rV5jErz/juQNOGKhOtPRCGfz/LFdD3GSN3DC2a
	 cucnlYIF6IYwBzBxQtxLIxI4zyY4Q00JMXS69yvQYYlzzgOzWDnG/JBARmtEvS0xys
	 F/5183KQVvc86uVM7tOW14QT3xvZHFg56HGZQtOI=
Date: Mon, 6 Apr 2026 09:25:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-Id: <20260406092553.8737d1e3834fe6fdeeaaa8fb@linux-foundation.org>
In-Reply-To: <adOxjbi2byrIet3y@sirena.org.uk>
References: <adOxjbi2byrIet3y@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Apr 2026 14:13:49 +0100 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   fs/ocfs2/dir.c
> 
> between commits:
> 
>   bdff37e327275 ("ocfs2: validate dx_root extent list fields during block read")
>   28c33de101792 ("ocfs2: remove empty extent list check in ocfs2_dx_dir_lookup_rec()")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   0b2600f81cefc ("treewide: change inode->i_ino from unsigned long to u64")
> 
> from the fs-next tree.

Thanks.  That's a nasty-looking conflict due to the applying order.  The
0b2600f81cefc change is actually small, below.

Hopefully Linus can figure it out ;)


--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@ -794,7 +794,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 	if (le16_to_cpu(el->l_count) !=
 	    ocfs2_extent_recs_per_dx_root(inode->i_sb)) {
 		ret = ocfs2_error(inode->i_sb,
-				  "Inode %lu has invalid extent list length %u\n",
+				  "Inode %llu has invalid extent list length %u\n",
 				  inode->i_ino, le16_to_cpu(el->l_count));
 		goto out;
 	}
@@ -812,7 +812,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 
 		if (el->l_tree_depth) {
 			ret = ocfs2_error(inode->i_sb,
-					  "Inode %lu has non zero tree depth in btree tree block %llu\n",
+					  "Inode %llu has non zero tree depth in btree tree block %llu\n",
 					  inode->i_ino,
 					  (unsigned long long)eb_bh->b_blocknr);
 			goto out;
@@ -821,7 +821,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 
 	if (le16_to_cpu(el->l_next_free_rec) == 0) {
 		ret = ocfs2_error(inode->i_sb,
-				  "Inode %lu has empty extent list at depth %u\n",
+				  "Inode %llu has empty extent list at depth %u\n",
 				  inode->i_ino,
 				  le16_to_cpu(el->l_tree_depth));
 		goto out;
@@ -839,7 +839,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 
 	if (!found) {
 		ret = ocfs2_error(inode->i_sb,
-				  "Inode %lu has bad extent record (%u, %u, 0) in btree\n",
+				  "Inode %llu has bad extent record (%u, %u, 0) in btree\n",
 				  inode->i_ino,
 				  le32_to_cpu(rec->e_cpos),
 				  ocfs2_rec_clusters(el, rec));

