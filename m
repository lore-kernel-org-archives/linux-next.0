Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7FC21ABD7;
	Mon,  3 Aug 2026 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746842; cv=none; b=BJDCEgagwkvwMeD5EsJnAJ+ZsXczRP75N1sCVU0NpV5mPssnQ9klSzmASsxr/kX+V69S21ZETwXq9/wiqlsYR+EnvSelrhG7ww26QkB9tb4046J78vNPMij+Mp+vbXvDIkySX4qZhdnKiorcRW7g+6YfwU7dgXM6Iwe3Qbn7rRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746842; c=relaxed/simple;
	bh=MXTF0PPMNFKn52Gsgs1EPGim/n5bxO07546J9QaMK7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G745b59fnOJOyH6RV616gAysFLSBKD/Sa/BGmwi31RQUR0PBdphHf3WRwMHG0sEaZNoth7jbxc8fTYTyrLkgMiuUlQe1tdnat9b4VyTiqjCBnCKuoOEw0Fwh1P/Rd3ZyQytjMrxBHJfp6A1GfwvvD/IFD8ZNb2Z42tt3C2Zn7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bQIEmyB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bQIEmyB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC63D1F000E9;
	Mon,  3 Aug 2026 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785746840;
	bh=ClsJnQmJ9JtEjDnpLASuZ7iSiCqVSY4umb1nLOIDTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQIEmyB3TAxFM530V3bguozZ36KDpAL4B6VeNzh4kbcLDGG0JbfbK/E2BnqIrGkHD
	 kkBirY5nOQwBSQp6cM/zkkZgz4Ow6vnMYE5t4QgFbb+maRUvEbJMi/cep31pqTpiZc
	 uqN66vC8vhk+bkZKydxOaB6vgXul5uQYLochtztc=
Date: Mon, 3 Aug 2026 10:46:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: linux-next: manual merge of the nvmem tree with the
 char-misc.current tree
Message-ID: <2026080338-overripe-petticoat-7b67@gregkh>
References: <amy67hJt6Ywz-TGE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amy67hJt6Ywz-TGE@sirena.org.uk>

On Fri, Jul 31, 2026 at 04:10:38PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the nvmem tree got a conflict in:
> 
>   drivers/nvmem/layouts/Makefile
> 
> between commit:
> 
>   b5be879519291 ("nvmem: layouts: Add fixed-layout driver")
> 
> from the char-misc.current tree and commits:
> 
>   c00ca6cc2fc96 ("nvmem: layouts: Add fixed-layout driver")
>   eeb4218f73b55 ("nvmem: layouts: Make the fixed-layout driver optional")
> 
> from the nvmem tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined drivers/nvmem/layouts/Makefile
> index dd6c6c70b1a92,9da790a9dde9e..0000000000000
> --- a/drivers/nvmem/layouts/Makefile
> +++ b/drivers/nvmem/layouts/Makefile
> @@@ -3,7 -3,7 +3,7 @@@
>   # Makefile for nvmem layouts.
>   #
>   
> - obj-$(CONFIG_NVMEM_LAYOUTS) += fixed-layout.o
> + obj-$(CONFIG_NVMEM_LAYOUT_FIXED_LAYOUT) += fixed-layout.o
>   obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) += sl28vpd.o
>   obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) += onie-tlv.o
>   obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) += u-boot-env.o



This all should be handled now, hopefully, as the nvmem patches were
sent to me from the nvmem tree to be merged into it.

thanks,

greg k-h
