Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786195;
	b=hAGjheZNheVPwN1fhR2dT2pF0feF3oJNyn62Mq+6afO9Y1rkTIjXl3zpcH3FHwIz4gE6
	 NRwg72lNkwMtwlIKXOlKTuZDE2DO6hEldDXBO7w7gQZhxyttixc1aDoRDUSiJYZPM7cnw
	 2QWqMH+vHtawVh5DG67Z6CG7qgymS2H6nK2bfTtfZi7MAMzyaY/cUyCVS7MqyZUV981QE
	 abGcoOVfKuR38SiD7R+QiZvd9NZGTrl5WmFonrlKZVilHg6gYS/E58TwooQMwsWq84CY2
	 brC2QuHxRAZg7bZSL4yfBzadhi2lnC39EBp90P8rxkQ5ZXkLzJ2CFt6oMMNDZIu0QIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786195;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a5iRnrftrc8+dx5MiL2MQ+HbTuYNazQ1r+VW9KxLHI4=;
	b=ZqhM1h5ZfOzHUH9N9xMjVM5UuwfEh4JQpfVQ58iCLRhS3AX6v2t9LGPc4HUCgpMdTemk
	 X6XkRzNYXDu4+hc1T9tbOpIA+laukk9rSUhojRGlEP8qGP1r1EKbyZOAdX5XSj5ZMxEJ6
	 beclGQUcwzNzVdbiW1EajoplpV/idt8LjgvUy+qKhNBC4VZBNye1TNxUbNCBocS/H8G85
	 fAhID+DXSRHQr3LAmwiXHE75WAn+l/SH4lFnPvFZbO38Airkusydfu/8P8DXW3p+eOoXK
	 Arfxtsvc/AOhKWg8scmexMafUPzuFOpRTsaAPu+8b8io30MpUteFW7Ooid8qNQtbp6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D86J25Ib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE680606A334;
	Fri, 27 Nov 2026 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D86J25Ib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59901F000C1;
	Fri, 27 Nov 2026 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786195;
	bh=a5iRnrftrc8+dx5MiL2MQ+HbTuYNazQ1r+VW9KxLHI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D86J25IbwlQE5UHzkzZxBnjaU3C/qS1Os7UHGStxSNWTrsKOfIl18U9sPfG15Hc1i
	 GuDmC0yCCzx6pONr/F5CjKhg7/8Zoy4sTrwn8QmN4JhnvPd1dhJnAA5dsZ/18bFhTo
	 Q+Y48KJNzO/Bt1DMnQsDMP3Wy0qJV0g/ZVH6JKJfQXBdIl9qKYNUCHZKwi0fxVjAR0
	 1e5ZUtbrf5gWjksz06ZrvH9OdT+/Ra3f9SJrDCpxkD9ACZo+Q8rgnNDQ0RnJk1tj5Q
	 GzUerfPKON+FZlY1vEPdMoOApKgxwlA9SRiOEBilOEfwpz8RGwcm0Ly/+jAnMiKJTh
	 Z3fqJDTuNewIA==
Date: Fri, 27 Nov 2026 13:29:46 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: linux-next: manual merge of the leds-lj tree with the origin tree
Message-ID: <20261127132946.GT38590@joneslee-macbookpro.roam.internal>
References: <awBqIVPvQaRJN-bU@sirena.org.uk>
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
In-Reply-To: <awBqIVPvQaRJN-bU@sirena.org.uk>

On Fri, 20 Nov 2026, Mark Brown wrote:

> Hi all,
> 
> Today's linux-next merge of the leds-lj tree got a conflict in:
> 
>   drivers/leds/leds-netxbig.c
> 
> between commit:
> 
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
> 
> from the origin tree and commit:
> 
>   41ea2c75f886d ("leds: netxbig: Fix platform device reference leak on successful probe")
> 
> from the leds-lj tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/leds/leds-netxbig.c
> index 6f59f91fac6c8,3a0456eae2c32..0000000000000
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@@ -461,32 -461,30 +461,29 @@@ static int netxbig_leds_get_of_pdata(st
>   	}
>   	gpio_ext_dev = &gpio_ext_pdev->dev;
>   
>  -	gpio_ext = devm_kzalloc(dev, sizeof(*gpio_ext), GFP_KERNEL);
>  +	gpio_ext = devm_kzalloc_obj(dev, *gpio_ext);
> - 	if (!gpio_ext) {
> - 		of_node_put(gpio_ext_np);
> + 	if (!gpio_ext)
>   		ret = -ENOMEM;
> - 		goto put_device;
> - 	}
> - 	ret = netxbig_gpio_ext_get(dev, gpio_ext_dev, gpio_ext);
> + 	else
> + 		ret = netxbig_gpio_ext_get(dev, gpio_ext_dev, gpio_ext);
> + 
>   	of_node_put(gpio_ext_np);
> + 	put_device(gpio_ext_dev);
>   	if (ret)
> - 		goto put_device;
> + 		return ret;
> + 
>   	pdata->gpio_ext = gpio_ext;
>   
>   	/* Timers (optional) */
>   	ret = of_property_count_u32_elems(np, "timers");
>   	if (ret > 0) {
> - 		if (ret % 3) {
> - 			ret = -EINVAL;
> - 			goto put_device;
> - 		}
> + 		if (ret % 3)
> + 			return -EINVAL;
>   
>   		num_timers = ret / 3;
>  -		timers = devm_kcalloc(dev, num_timers, sizeof(*timers),
>  -				      GFP_KERNEL);
>  +		timers = devm_kzalloc_objs(dev, *timers, num_timers);
> - 		if (!timers) {
> - 			ret = -ENOMEM;
> - 			goto put_device;
> - 		}
> + 		if (!timers)
> + 			return -ENOMEM;
>   		for (i = 0; i < num_timers; i++) {
>   			u32 tmp;
>   
> @@@ -511,15 -507,12 +506,13 @@@
>   	num_leds = of_get_available_child_count(np);
>   	if (!num_leds) {
>   		dev_err(dev, "No LED subnodes found in DT\n");
> - 		ret = -ENODEV;
> - 		goto put_device;
> + 		return -ENODEV;
>   	}
>   
>  +	leds = devm_kzalloc_objs(dev, *leds, num_leds);
> - 	if (!leds) {
> - 		ret = -ENOMEM;
> - 		goto put_device;
> - 	}
> + 	leds = devm_kcalloc(dev, num_leds, sizeof(*leds), GFP_KERNEL);

Doesn't this now reallocate leds?

> + 	if (!leds)
> + 		return -ENOMEM;
>   
>   	led = leds;
>   	for_each_available_child_of_node_scoped(np, child) {
> @@@ -540,14 -533,14 +533,12 @@@
>   		ret = of_property_read_u32(child, "max-brightness",
>   					   &led->bright_max);
>   		if (ret)
> - 			goto put_device;
> + 			return ret;
>   
>   		mode_val =
>  -			devm_kcalloc(dev,
>  -				     NETXBIG_LED_MODE_NUM, sizeof(*mode_val),
>  -				     GFP_KERNEL);
>  +			devm_kzalloc_objs(dev, *mode_val, NETXBIG_LED_MODE_NUM);
> - 		if (!mode_val) {
> - 			ret = -ENOMEM;
> - 			goto put_device;
> - 		}
> + 		if (!mode_val)
> + 			return -ENOMEM;
>   
>   		for (i = 0; i < NETXBIG_LED_MODE_NUM; i++)
>   			mode_val[i] = NETXBIG_LED_INVALID_MODE;



-- 
Lee Jones
