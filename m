Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336791;
	b=0aguYPuYeYjFg7K5YYiMHuzTFvTZ5zavYDJaiHMPZKuznoWe9h0utWM6iMAdp7vFEmWs
	 HydMd8gZGvmEhWJdTBhWhvmi2i+GZm9qpuysw/JR9XWlZX6Sf7Ujez8PwSu+tCmYsiFiW
	 9grTfGq8GyvEKbyneHunc+vRxhp4eN7aZEL64O5PNVz2gzCQhIT30fRTu2rGFdL+SGyd1
	 3x7Czbd//Fyt9pdqexIHwfYM66W+3k3BTSTPkk7cIXhQKen5vSkWlLWBJouwgz/XnsHDb
	 uXj9wZv2uhBMDuC8NrrCFK5AbMTfeNCwCNqOFMTc8LuYL4WQpNAX5ZU8b94Qrx7Mu8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336791;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lPdwq0l066ttHR8nwrCzRnxS+1MV7qXeVf5wH6cIiog=;
	b=HwYBDFEI4JSRntS50NhqZ9fB7G+N6XPsUarEKgS3gwWdwyCDxQCbV1QhrqdBLxN5cmWk
	 wTrAzKCK7e+d3kzXaLpq0Dukd1e/QMyw+5AZzzBOXrkRtJrp6cG0bTVic1lYwqS0yRJkX
	 bCg2lYhcTgv6JymkNrW1IGdPoI3JVwd32SNbf95lhDhtXfQbZH+zNhqg0sINlsQ7yN/Sc
	 X+CSZpsr2i0RdwKl9asqKEw7qoDkHKPtyrjrJgtXw+zg/X9R9krTZ2mZBz3uVqsr/fOcL
	 LSYTMaYi/2VTt3Bhre0tRdDuVvEhcrtE7TlQ4lqRO01aKL93BoktP9mcDm976nK2+DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcGYv2xN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB677606A320;
	Sun, 22 Nov 2026 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcGYv2xN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76D31F000C0;
	Sun, 22 Nov 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795336790;
	bh=lPdwq0l066ttHR8nwrCzRnxS+1MV7qXeVf5wH6cIiog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XcGYv2xN70oBUhgL6eozgGFzXeX08O8S+XunCD1BqjgVC+F9hpXwSWMBku92XERkc
	 egai6rRjI4V6DHGJEkCowEzc2NvxLpPsH+KJrNCDzbqHzzyj4jtjYqm6nK+iZI6u5E
	 gfkc1Mvx8XiPvtqdltdwsFZbbN8FMDGP+yO/Nb7mm8dikyZAWYpOa8w+eP6clzyo8p
	 z/1BWOnWAZyfEJYLxerJRVgZcxPw1FWQT9amwytr63p1HNBxZhAHsR6W5a6SuhHsKg
	 lutBCsLYJ1Dr3gXdsU1xxdHvSzi+Ms+T//+vsBRZBYDjQjW/G6sN5Z8c9JQUS/ZpZ9
	 3pOl5gXE8SAWg==
Date: Sun, 22 Nov 2026 10:39:45 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Shao Mingyin <shao.mingyin@zte.com.cn>,
	Yong Liu <pkfxxxing@gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the rdma tree
Message-ID: <20261122083945.GA14811@unreal>
References: <av8uRPAvMk_hfVSu@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av8uRPAvMk_hfVSu@sirena.org.uk>

On Thu, Nov 19, 2026 at 05:13:40PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>   drivers/target/target_core_transport.c
> 
> between commit:
> 
>   1ecb732b4524d ("scsi: target: Clear all control read scatterlist entries")

Martin,

That patch is part of this series:
https://lore.kernel.org/all/20261113083848.1517595-1-pkfxxxing@gmail.com/#t

We can drop it from the RDMA tree and have it go through your tree instead.

Thanks

> 
> from the rdma tree and commit:
> 
>   0fc91e8028018 ("scsi: target: core: Drop the dead kmap_local_page() NULL check")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined drivers/target/target_core_transport.c
> index 267f5e2cc8b24,9819515ce9674..0000000000000
> --- a/drivers/target/target_core_transport.c
> +++ b/drivers/target/target_core_transport.c
> @@@ -1633,16 -1633,21 +1633,16 @@@ static int __target_submit(struct se_cm
>   	core_alua_check_nonop_delay(cmd);
>   
>   	if (cmd->t_data_nents != 0) {
>  -		/*
>  -		 * This is primarily a hack for udev and tcm loop which sends
>  -		 * INQUIRYs with a single page and expects the data to be
>  -		 * cleared.
>  -		 */
>  +		/* Control CDB handlers may leave response bytes untouched. */
>   		if (!(cmd->se_cmd_flags & SCF_SCSI_DATA_CDB) &&
>   		    cmd->data_direction == DMA_FROM_DEVICE) {
>  -			struct scatterlist *sgl = cmd->t_data_sg;
>  -			unsigned char *buf = NULL;
>  +			struct scatterlist *sg;
>  +			unsigned int i;
>   
>  -			BUG_ON(!sgl);
>  +			BUG_ON(!cmd->t_data_sg);
>   
>  -			buf = kmap_local_page(sg_page(sgl));
>  -			memset(buf + sgl->offset, 0, sgl->length);
>  -			kunmap_local(buf);
>  +			for_each_sg(cmd->t_data_sg, sg, cmd->t_data_nents, i)
>  +				sg_zero_buffer(sg, 1, sg->length, 0);
>   		}
>   	}
>   


