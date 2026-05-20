Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45673D9DAA;
	Wed, 20 May 2026 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275647; cv=none; b=BJzLsd59Quoq5pK1ovjS7RTSIkZ+hCwbG/Tq5grnq/A2HgOtzfynZWI7AWbk/w2Q71AK7wN6wOI4KamGThfkxhdduxXuimX7M5TLeLIqf4Ox4Ut5ZMgd2ce8mKgIEzP88mNGJBOT39SU00QJWYI/xpLtPENS/VK/hj6MyKv2GCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275647; c=relaxed/simple;
	bh=NeAH1YtDtcyg7QDtXd1tnPOu2ktv1bhEIsnSbvCRkwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8SlYG2Lu3bUFjuM0OwPkHEduD9RAEBsLKl2DBtUVnWbvHci10WDY4KdlACYPJSmTY5ytBr72QRP35ct+Evho3ty9mPmuuCHDIpXi3fnR2hZVf3URvYrGsldYavoJGxH31f569YLomqdpN77nwmEtEXuOXJpLVo+gX6nrDOpqWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU4ORnkI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU4ORnkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879171F000E9;
	Wed, 20 May 2026 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779275646;
	bh=7tr6VQvfOpbwz4Vf/dgcy8YLDajW0yuwC7+CZz7wGZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LU4ORnkIgCCq33nUiwyDwWWucBDvsDtHPENpLY+PymUCffNpIBJSghtwgFKKcqFmK
	 KeRAW8Acoe2iMDEdpMAITWageb1kqxY8RwdbsBG1Vdh71ERP3GC3c38HeJYeXEd7/E
	 QZpYjAuMhWxVwtWp8NK8+5YXljhTfpdnPjC2Kjt1drVQSHIfwwnwxkBH27ZhXjwkWv
	 3hvyVIt7j9pr2a33TaO1p2GTRof7qX92MFTucLxAibqqh94Rk0Ofv4NQ84J6MUtmZ+
	 an7PFphjd2C65IG/5pOM09vuNA66bIpIr5udBYldxGQdsASVVs2vUbxZ3aYFoQzGwE
	 +LD3d1sBJSLCA==
Date: Wed, 20 May 2026 12:14:02 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the mfd tree
Message-ID: <20260520111402.GW305027@google.com>
References: <ag2IAVXkJ-HkDuEp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag2IAVXkJ-HkDuEp@sirena.org.uk>

On Wed, 20 May 2026, Mark Brown wrote:

> Commit
> 
>   07de145bd1a9c ("mfd: si476x: Fix typos in comments")
> 
> is missing a Signed-off-by from its author

Odd, I seem to have complained about it, then applied the patch!

Unapplied now, thanks for flagging.

-- 
Lee Jones
