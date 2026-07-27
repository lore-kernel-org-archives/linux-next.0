Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A1379989;
	Mon, 27 Jul 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154734; cv=none; b=cVsdl/7uRkCO2GGLblx0PJdmKz3GBXCkBrPRAwi4oaRchZPZaIToZ/utne9w45Xo4B4gPjKuJr8GTgFAFz4FBpn7os5QVzx7coNFitB0u97+BGEms28guDZfa8eSv84wJAJa38rKZjzTfxUG+jd4+TjvpURNznWdrw4pngYce0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154734; c=relaxed/simple;
	bh=JqE12VZcVG7EmAR7AdgpEe7RIshunbo0FP+7Oo/A9u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSv/PDqFACN2Rl/x3Vsibqm0tFv4W97/Fhlaex0feZS8//iooHm1ZMk3msfEESfY/uvPpELCEZbty7YDHG9HS+GpoWDljuhhWgiW50MC7lAfNjUQA9HZhBgHkUs8WwEP+ZWmhvRI9XeuMQ6GreCwGM2N74T49KBPTkKoL2DgqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=gPcO6kp4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a0hwNv5X; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gPcO6kp4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a0hwNv5X"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5DD2AEC016E;
	Mon, 27 Jul 2026 08:18:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 27 Jul 2026 08:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785154732; x=1785241132; bh=03vrwcQBrO
	xUcuulhRU14I4Z24psTXnB9z9t6AvSCLc=; b=gPcO6kp4ZqqS8cSmidJ2o8Zt72
	cEx9qVvjG2Nft+pCYQ/BqznlHT1mv1/j9+Y+e30MIvIfex69pUFa8HiEAUsbsfhx
	xNPlY7+VX7oZKWA6/wqxudhTkXgvUhBZpIOWdaCa3S/mYAMouvAevxCoJWPQym1Z
	TihOsv2nZifIzyH1lB/VxHC+zDqQvgTqR+KF4hL95CA8MzcJlh+0Lgnxcj4pdRIt
	JwTUvjgxzH8VnnwoWI5NoS9ck60NF8NUhSoD1dZzZCSjCorLGDSCqdGxMwWfWwo4
	QJPLxp+iCBTBfvrAS8aiQl9cJOM/L0VEJoMd94UChHNlC0ZN1wAXjwtYsoQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785154732; x=1785241132; bh=03vrwcQBrOxUcuulhRU14I4Z24psTXnB9z9
	t6AvSCLc=; b=a0hwNv5Xoim5u0uA36mM3ldnzNnz7fHl3JAqSd5XGpYzpxU0cn9
	cWtyBLIg3QK6btyoM9sDsbe7C8ZhhgjaICZLCpsGLdSG7NC8OQHpLk6UOIaEHoTP
	zdtT0g6wXILt1pgyw8njPZSeN6DacDdwX7/xwC92I6bGh5XTyoHJSEwNsRqB3X89
	0ekOu9evHXP/5yJ6dD74FeydGjANTxem117tnyB8uJ/s+pAVMLTZG40PPkUqv0Kt
	POy7Vgg6pLsz6vhOAoAqyq/ZnGMJZ2LM52PqhfKX5azFV0bs292Ver/Put6ddpQ6
	tobSnIqidSBrsgFEylpwAT96Vp40cI8M3PA==
X-ME-Sender: <xms:q0xnakPTrrb8AFHbPuz2bs501Oibk0BDp3NQFGOke5ulPZVo8Ruxfg>
    <xme:q0xnanpxrMMSPBgAHZf9dkecIZ2HhBnOJ9MfeEWYMPL2Vd43fBxKraKuCvfoJ57kw
    rNs42EBw4BV-_MjSyz58ITZBln59dFO1JjzyqdiGU8CFnF8>
X-ME-Received: <xmr:q0xnavLPxSD31zeE1udY-o_JSPwyqg1qj_OnHleNSLWRFGxnbZZufpn3u92fdU3GXv0dNJzO2HgGo5od7Tji3xQnNQ>
X-ME-Proxy-Cause: dmFkZTEscXvekO+kWICadqRkLQdOcuIB4jah5CLAFrrcY8eyJc/38qzmYQPIkHKO5UmTUY
    ZD0X+Bz79fVHbVyZj2SUmf1JgstDhg8kD2/9e8FmwkDjY+l0A71jrBwpubAbIUXS5QnNkj
    ygA98nJumeTv6pUfWjwyi/oGbJILfFJGRgS6QtnhXBQl9Wc3BKwbBl7nISQ4ifpKcRFdb+
    nEFet/JXT8579DqwGibCj84vd2RYj5ff/ukieVdWbErn46DV3Idf1+r6wNSZd6TRfuvOLo
    iEierFIVz2lzsSu2MbCwhZwEEjRmFR1noRmyh6xo74KzGVXL013l6aIjc35P56Vft/mUII
    VTaDb4W7Dc/cAy4GNTajtIXT8ay7Rrxo7F1cIvOnATMw2tYyO80PdFGaVe1755BZATAEqj
    h6gZUQnTXdrPAXFmBYRMD7KXW6hWewZ+KoCbZUHeBVYl58+0WQ5HqIkLt2pof5hCHT5J5K
    gjnePcVu3BvP/PFhnZhJMtEzdT2fWLgjmpm2scfptZ0do4a6P03oox8VAIAiIGFKA54zjO
    OJOmIUHTxB9aicoTQ5m23cjobAMOk5zDj7jzSG8IMPgWpfm6OlAUrYH8uIufayzk3bQR46
    MIfZbt3Mw9FSlPYdDqUZhpO+lcNoR3s4FcMe7C8XiG5vEEZd7aNDe014eFHw
X-ME-Proxy: <xmx:q0xnam3p6tlCFTzpRSLb5kOowe1dOqZfQjewnIkx1kwryQb2q1oQ5A>
    <xmx:q0xnagWfsFTaDB5u_Cl77WBwAJ1LmO2dANKY7gJgVI0J-MaztFg8Ew>
    <xmx:q0xnapx6Lt0ivZaqiSb-3X2TZgtB2nCtCdlodx8xNS5Ubq0xl4fGpw>
    <xmx:q0xnanzkLF7VhwB3CGUhxWtVjKoayQxtWln2RMu2qa8jiBGVRdqSTw>
    <xmx:rExnaul3jneFOnlCHcARKQ3N5tFVUw3LHrg6l9MnTBFoezcfeMWwub_0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 08:18:51 -0400 (EDT)
Date: Mon, 27 Jul 2026 14:18:40 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <2026072730-vitamins-humorless-95e0@gregkh>
References: <al40xMdxeEHvedyh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al40xMdxeEHvedyh@sirena.org.uk>

On Mon, Jul 20, 2026 at 03:46:28PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/misc/nsm.c
> 
> between commit:
> 
>   ce1fed11d18e1 ("misc: nsm: only unlock nsm_dev on post-lock error paths")
> 
> from the char-misc.current tree and commit:
> 
>   937cd823bb2c9 ("misc: nsm: do not unlock mutex before locking it")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined drivers/misc/nsm.c
> index 3960506eb7ab3,bb254ee65b840..0000000000000
> --- a/drivers/misc/nsm.c
> +++ b/drivers/misc/nsm.c
> @@@ -243,7 -243,7 +243,7 @@@ static int nsm_sendrecv_msg_locked(stru
>   		goto cleanup;
>   	}
>   
> - 	msg->resp.len = len;
> + 	msg->resp.len = min_t(unsigned int, len, sizeof(msg->resp.data));
>   
>   	rc = 0;
>   
> @@@ -365,9 -365,8 +365,8 @@@ static long nsm_dev_ioctl(struct file *
>   		return -EINVAL;
>   
>   	/* Copy user argument struct to kernel argument struct */
> - 	r = -EFAULT;
>   	if (copy_from_user(&raw, argp, _IOC_SIZE(cmd)))
> - 		return r;
> + 		return -EFAULT;
>   
>   	mutex_lock(&nsm->lock);
>   
> @@@ -413,7 -412,6 +412,7 @@@ static int nsm_device_init_vq(struct vi
>   }
>   
>   static const struct file_operations nsm_dev_fops = {
>  +	.owner = THIS_MODULE,
>   	.unlocked_ioctl = nsm_dev_ioctl,
>   	.compat_ioctl = compat_ptr_ioctl,
>   };

Thanks, looks good, this is now done in my tree too.

greg k-h
