Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550500;
	b=khbHcTzDPAfTIreo++w9/AeMcP85aIWEtta+Am+j9yDXMbLiS97pFkUhbrXwZsys8CKD
	 9mEtgOlbxootlw5jQMvs4ZaXhQ2b6dmp+R7eRqZNYeiDqFC9QT0tM3KaKtWT8zDaUdrbv
	 +nKLWMUrLbY5HHNwqCczZMgGtJVYpCQHNu2p+V7kGUXU/aEmTZmMVRARn0LFReFTjXBjp
	 Vj+K6IEHFGRAWNReQYwEunvXb1WIs8WuGSsKcdBnfb5FUxF76jNl4u/aRuAi/bV06JMYH
	 lEs8yBMoUD7byygf2WM3oSYKbamJFkpxu/pRFIsBsPYRK0HT8k94+ylddicq4F6l0pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550500;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=4CeFBC8F0GpfgjetE6K61fNjfOJ2aKpPtYKIk9sm7lk=;
	b=aQdI39UmK2Z0XHA3WjHOtFhuRmud1kQpwRu76iATvYR5VkNnjrZZUvgbgoqRz9jGHkHA
	 4cO5oIm53vacguf3NLTZMvMKTtHwt54w5tmZg8mBy/AZFk8kItazpxjqXNvgmbvjmHAfc
	 AaXzVRWjpnQva1Gsl0PHTrqA+PbwyRqk6AclTvZUXqdxNKJpiLmCWZh8ffAYdfOuEsLlV
	 qp3c1mad6ITRFjcP0zpjtX3/XC/tIGv0raikEjENfc+UtJ5hjBinz902qXU1dE1NmChkh
	 YxrmZjBXooqzIXIzLH2saX4BLJJGn0hk9JPI9Q2vSL7SjKCiTvaEihYSZ1/6+bumRSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YylZA1Oc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D55606A321;
	Tue, 24 Nov 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YylZA1Oc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8E61F000C4;
	Tue, 24 Nov 2026 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550499;
	bh=4CeFBC8F0GpfgjetE6K61fNjfOJ2aKpPtYKIk9sm7lk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YylZA1OceXzPyMSpM7hOv4QkHchLqjKySsijc/4pbV2VoVUBFAHuTuy5KSJ1KBnhn
	 tSWbqIxZgtXboumbFlBWuuaPBeh+yL5Tao/wg9eqI6At/JMn6SbW+RUQstQU9QjqcO
	 h/ej5lZ9JVh496iqe8wDFsAegWlSWNJUEYfL1qfh6ISgDc00tvV30PYBp/dRYGnXQi
	 2jsx5munzLykzicuVKjn423J5IRWtxEVQzvlrBQprYtiDGfR0cHGNuXPphW6lyp9+F
	 8MNDrRLb3jonjktng7yy7IbToYHQ2Cy54fO+VYEQwetL9Yr1X7gfavZdUCVs0ukD/1
	 0k8g+/wpPfQeA==
Date: Tue, 24 Nov 2026 21:01:37 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: manual merge of the hid tree with the origin tree
In-Reply-To: <awRJA60QzxdxM0Mo@sirena.org.uk>
Message-ID: <6rsqp5on-699p-4on2-1q58-p18qp2526435@xreary.bet>
References: <awRJA60QzxdxM0Mo@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2026, Mark Brown wrote:

> Hi all,
> 
> Today's linux-next merge of the hid tree got a conflict in:
> 
>   drivers/hid/hid-sensor-custom.c
> 
> between commit:
> 
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
> 
> from the origin tree and commit:
> 
>   ac6c19392c799 ("HID: sensor: custom: Fix state lifetime during removal")
> 
> from the hid tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/hid/hid-sensor-custom.c
> index c12272479d82d,4d7cb7994dd81..0000000000000
> --- a/drivers/hid/hid-sensor-custom.c
> +++ b/drivers/hid/hid-sensor-custom.c
> @@@ -977,7 -1019,7 +1019,7 @@@ static int hid_sensor_custom_probe(stru
>   	int ret;
>   	const struct hid_sensor_custom_match *match;
>   
> - 	sensor_inst = devm_kzalloc_obj(&pdev->dev, *sensor_inst);
>  -	sensor_inst = kzalloc(sizeof(*sensor_inst), GFP_KERNEL);
> ++	sensor_inst = kzalloc_obj(*sensor_inst);

This is now merged in Linus' tree and resolved.

-- 
Jiri Kosina
SUSE Labs

