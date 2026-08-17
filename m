Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF93275AFD;
	Mon, 17 Aug 2026 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999246; cv=none; b=tTqM/NAVj2rNMaNeEtJvg+kslDXRPh+PGk1fLUzDnjrztHy8Y/kExgXt7+Uqt45RX1FX9b7Hc28Bh5817pOAPZX59jXQmogSod0nkAASsHqDcqh7RNrITsQeKzR82kisr4HvXjgMnKJzYbRgZBjk9zGmfZSzcGcsa7NG4JzXzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999246; c=relaxed/simple;
	bh=kY8oRgiy0m6cB7jzHVB7cq2UJM2xSigVdfWB1kOgZ/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPaIImOdf5RdqnsfkVQDChv26n97vZaz9Efghi+6wx2Ay63pLU3z4qWxvT8daz/A69tk69bgya9PIhKzTOxb+BfTn10rrzWGt2SMFNmhUGEJ4Fu5wpEULd5TRWxyeTHoCt/P5Vw7RjfJRCqtuXJIxWNKrUx0QZyGVOgfOkfO31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKQdc1V3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKQdc1V3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7571F000E9;
	Mon, 17 Aug 2026 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786999245;
	bh=Fvpp+bF7OK1FUxB+ca9+hn62atOdr7debhDMK+chvO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lKQdc1V3Bj/1egH2+IeJ00+mZ4SRU5eqFpJXF2IbS3ukQhaisIJ5slCBOjjaq74e6
	 2kmb5wAu/4NoAjq8N3jWKEaYXZXzNGEYuZz0nOuTC/lLdhQAOp+1M6XTAesnV7c9ZG
	 pZyNYFozOiUxcSzB4B6WYlspnrVuXvdw583BTC6Y3Q+RsOkS0JoDD/KVRF4mBg3HQL
	 /UFrSTg0kC+GdRhoyfrk5FnA0nX/55FTrQlUIV98UavCkorrEoT0OCVMAcNCYea5FL
	 bySY5mjVJ2rbrdzDKc/Uflcom0vobpJy6zpMgo6lhgyT3rGbAyvz3DYQVuIymVcla+
	 1/C5qjJjBvRNA==
Message-ID: <223f6f95-7212-49fd-9756-8e54ff3e4040@kernel.org>
Date: Mon, 17 Aug 2026 22:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <aoMvR5MHCsykmdEO@sirena.org.uk>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aoMvR5MHCsykmdEO@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 5:56 PM, Mark Brown wrote:
> diff --cc include/acpi/acpi_bus.h
> index eaf13f6ac2d3a,7e57f9698f7ce..0000000000000
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@@ -953,18 -996,6 +949,11 @@@ int acpi_scan_add_dep(acpi_handle handl
>   u32 arch_acpi_add_auto_dep(acpi_handle handle);
>   #else	/* CONFIG_ACPI */
>   
>  +static inline struct device *acpi_bus_get_primary_device(struct acpi_device *adev)
>  +{
>  +	return NULL;
>  +}
>  +
> - static inline bool acpi_of_match_device(const struct acpi_device *adev,
> - 					const struct of_device_id *of_match_table,
> - 					const struct of_device_id **of_id)
> - {
> - 	return false;
> - }
> - 
>   static inline int register_acpi_bus_type(void *bus) { return 0; }
>   static inline int unregister_acpi_bus_type(void *bus) { return 0; }

Looks good to me, thanks!
