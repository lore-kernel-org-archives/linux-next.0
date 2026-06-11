Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE03EAC9B;
	Thu, 11 Jun 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186845; cv=none; b=EUbON9x5/aW0H6VSHkiaro4YTHBOVcRNG4uogvOBBA0zBJrSW12acZkJjNkZ0bBegVjTmqfVGKH4YVS+Vh92pXPax6qAJuzMErxvcrU92r3GSQC9sIoOR0FkaPvzqiFegw2CjzUSjwDZh8mcOMWlDIQSEe9ghOZnfBwR5Ycw0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186845; c=relaxed/simple;
	bh=0AwffcFEZkhWZr6KHua91LwWKthAkEgTrFmJ31sqCKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGsxtRopWqB9ulLObe+xS2bt0VB+NZkpkd7bNpJctqDxDMRfTGj4YGZ3zRWGBbmRGDCw1aaVMwOB/fzGDWnwInSfI7oVt2x37jrZ//3wpUymq00rJNt7EtKen6E0uedrJVtPCM/iXs6MsJOtJKa0aIk3NGWDRTf9BgfdE85af84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FVj3MeDU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FVj3MeDU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EjIOcA2M5wsDkb4nNI8T4wAfYZXLKy9y2jheua42cSU=; b=FVj3MeDUuvWsFfVeLQbGgy2KZV
	Mmlej14Pxf0QZPPdci0TF+3sne5zWMAHIqI5YdmslJriDWZ2WP8InwvtpID0hpRO0rZArrrnkjd5m
	gBQh/NGwZGi2Gkc7VLbOvVKIYmKDCp9LkDZoSZGUxM/DeeY5O0f1nQElZcohh/ydqWre9UdVVVUvC
	BjBjBkk+6eoVKyS+VWdRaO9zZsIv122wuW4xIsaZdIB6ZMvoXO2je0cOA0lYOkk7EhD7UixJrYfm5
	6lInhyTK6n7Lnb1wb0DakGVNEJFgNgx3fovr2HmkY3qZkbtZvftQ82RSElCd4vVSgq03Hxog7IdOd
	l0ZMYDSQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg42-000000020UW-2BIx;
	Thu, 11 Jun 2026 14:07:22 +0000
Date: Thu, 11 Jun 2026 15:07:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <airBGjtjTf3Yuy0X@casper.infradead.org>
References: <aiq8CByJNMlXo6Be@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiq8CByJNMlXo6Be@sirena.co.uk>

On Thu, Jun 11, 2026 at 02:45:44PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
> 
>   fs/jbd2/journal.c
> 
> between commit:
> 
>   bbe9015f23432b ("jbd2: remove special jbd2 slabs")
> 
> from the ext4 tree and commit:
> 
>   2f6702dc6fdcf0 ("jbd2: replace __get_free_pages() with kmalloc()")
> 
> from the vfs-brauner tree.

2f6702dc6fdcf0 is a subset of bbe9015f23432b and should be dropped from
vfs-brauner.


