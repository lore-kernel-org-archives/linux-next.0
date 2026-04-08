Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D86346FB0;
	Wed,  8 Apr 2026 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668378; cv=none; b=L+kBY7wzEYk6w+BE3RpGG1fIGupAqlEb505jBiY/7paLWpv34gAYSGaizyOWz3R7UNq61NhlGQ1qNxDJIKjHUcBPgIffkUGb9DSkx56brFmeMMSzpjJVyrF6yE4yf8JymGav5xV7cniVbe8xy/KGnIoIltibyora5VzVnSDj2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668378; c=relaxed/simple;
	bh=8VqS+vQAwbWwcwSw4iDd6KYyKYX0LPORQ3zWm01cHx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSO/CNa9S8yxREfTkKrqQ1NS2eWyB+v1ZUTb2rHkQFAZiADvlYdniPC/p7XgYbQOaCAdn9HUDeCTegW2lI1HLjJIJubq/Ayt9h8UbhdQvKEyk13LkGJOJymOY2hVpFw2gekfMxJ1YxZjBWbLHncQnDL6jb4J+52rkLaW55U5aQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=XMR1fRmV; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="XMR1fRmV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f7CdK3HPiaXgFwJoUZjAyDMQKLdRFu3oQUyrzloXJqA=; b=XMR1fRmVpO4z/Kv4vgSd/Mp3Gn
	2jcC8Tz9vonNDCcGKj+3vWOH1rbRQ/JN8w7XPvFvg7MBKjEAIfbLESNbZG6bc0tOIK0PzyZtweBB2
	dm89dsZwJ+tarSaIRRKtzykk/XTHLwj7fdv+HafvqHB/sLfVQaA9ehPZQ2mWPRmLkx9sYfo2fR/ew
	OCZ0VSamSP1cu/94jYKAKJqZNlQhyMy1Zxm4y0ts+bXNV1FR4Ee0PWNlUIzvuxq1fl0yIsjQrq8iV
	nsE5ydSTE1c04wGXX8uiH4Zir0nj66ntli9PU9L2EIsWwyoh0ADxQvn202653UnvqqDxuLq7CQW4R
	oMltreWg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wAWW7-00000000FYe-30he;
	Wed, 08 Apr 2026 17:16:40 +0000
Date: Wed, 8 Apr 2026 18:16:39 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neil@brown.name>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-brauner
 tree
Message-ID: <20260408171639.GG3836593@ZenIV>
References: <adZNhv68QCxJt00c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adZNhv68QCxJt00c@sirena.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Apr 08, 2026 at 01:43:50PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   Documentation/filesystems/porting.rst
> 
> between commits:
> 
>   336faf5d9115c ("VFS: make lookup_one_qstr_excl() static.")
>   4d94ce88c77e7 ("VFS: unexport lock_rename(), lock_rename_child(), unlock_rename()")
> 
> from the vfs-brauner tree and commit:
> 
>   408d8af01f3a4 ("for_each_alias(): helper macro for iterating through dentries of given inode")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

FWIW, I suspect that it might be a good policy to put notes on likely
-next conflicts and their suggested resolution in the head commits of
#for-next branches.  What I'd done yesterday was
commit e82ff9b6cb767fc823d5e461034f32388c4092a2 (vfs/for-next, for-next)
Merge: e252ed898857 14a51045e10d
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed Apr 8 03:17:38 2026 -0400
 
    Merge branches 'work.coda' and 'work.dcache-busy-wait' into for-next
 
    -next: trivial conflict in Documentation/filesystems/porting.rst (several
    branches append to the end of that file, order of entries is irrelevant)
 
    -next: hopefully no cifs conflict anymore, but if they still use the
    variant with ->d_u.d_alias in cifs_d_mark_tmpfile(), just replace the
    line in question with
            BUG_ON(d_really_is_positive(dentry));
    as in fs/dcache.c:d_mark_tmpfile().
