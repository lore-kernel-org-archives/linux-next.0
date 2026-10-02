Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375747C0F2
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936915; cv=none; b=DoJ+143IsX4p29j3KpdF7dzBVJjL8yRnccClG7YKcpOr1xtkGZs68gwMqYVT2WG3xfYwW8iUJI5FWl8PhAYGrdfvmHcuV/sBCIwJAvL2jj0gyg2oI3Gac3CWWVA8u8fFVhQrogWYB69ZuehFKTg3hLKWj3RqpRkdbnkGSVWnnkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936915; c=relaxed/simple;
	bh=ulZGt3hGW/DWBTKj73zWF29XUQW/kZUlxv4IcnV4FFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn/WCPkb0sqATRAhECMLW+7ujC0ncho2QzQ9YYhbyBZbZMuNOBQQkMbFVOge/dQPcWteFxCm+UdCTK6dIByVE7wz+/lA0HjeJyjO4GUNi1iK3JmJWA6ng9vCwOtSZX0k4CxwqaAqJsM1My+Is7bzNZyLqGmtPJzLVTiLmejEHzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=lrQZHkYo; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="lrQZHkYo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qmQEr/Dj+35mDYom6RMdTBxkcfbDjTwzfcf3Fv3oU7o=; b=lrQZHkYoifLJAG4Vhex+TKnarH
	Mph+8HPz6atlJaORvsZWnH7mc5VMLMbIhtQ5ijvcLW12N6ZrOtHuhNJtE0+YBC/hqd6sXcRhPOgHY
	Sjwv9M7GHh0x3fYOeQj8lgyRgLueGMA8VbJ6cUY1jTvmqpDtzK5gS8FSFb7DNUUfItJZR+8pNWOOh
	Ivpm5YJ+EQIhR3xp7Pvn3wbp78plCp0iWBRUm9E2on02offCTXf81LVKZbC6N9SYwac3FPnu5gEsT
	fcD3ZvH4pJSDpOS6y53teQXMFzhhx/H6IBD6RKb0nx80pT6HfEHs0hIt3uu2cRJt9O7m1BGo6Exzy
	kSBXKrvw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xCaVB-000nlf-2m;
	Fri, 02 Oct 2026 10:28:30 +0000
Date: Fri, 2 Oct 2026 03:28:24 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org
Subject: Re: [PATCH] merge_msg: Gather the email addresses for the
 conflicting tree
Message-ID: <ar-HExtECa8SRtMc@gmail.com>
References: <20261001204935.635681-1-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001204935.635681-1-broonie@kernel.org>
X-Debian-User: leitao

On Thu, Oct 01, 2026 at 09:49:35PM +0100, Mark Brown wrote:
> +# Rely on the sending MUA to dedupe
> +for b in "${hb[@]}"; do
> +	if [ "${b}" = "origin" ]; done

I am confused about this 'done' here. Shouldn't it be 'then' ?

> +		continue
> +	fi
> +	bc=$(../tools/get_contacts ${b})
> +	IFS=',' read -r -a addrs <<< ${bc}
> +	cc+=("${addrs[@]}")
> +done
> +
