Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028B379EE6;
	Mon, 22 Jun 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125629; cv=none; b=gLZC8b97RhKyLF1bzhWA+mBEGnuGV66JM3LmEVv1LW5nu47XFbjGFoz4qZLfmhH+uXM46lHj7+pKIIgnTy6P7mtLA6H3Dgalf3pKJlOndvWZhxL/QtRThMsDLZhsqbWImVA+joShR6VLb7rTfxa8uR9qWfXFL4nYIPSoj+5WtMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125629; c=relaxed/simple;
	bh=JJBmEEz7b1QqizOc5Nz77sPlGzqdbtMNlX56GU3kgQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tn89f95NOiJ+OxVHI35BBixVvR/pCKFTIv8kheYyXxO4VrFfcJ9SpVtLV0Mpf02CTi/7CtligLSk9nDDUFg2Enwi10oiHNN6nm7MlKTlgW6EYKctwtP6OWK0Sj05YM5VRJ398NufJde54s9QSXeCqp2/5tPMCMbj7Q+4+MHJ/p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR7eY/22; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR7eY/22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9481F00A3A;
	Mon, 22 Jun 2026 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125628;
	bh=64uVaRQ9eGeWUejCp8W8NU+VvO8DXgqqdSVmi3pgjlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TR7eY/22dV7CzjcfEq7NrCMf12JQpVsAQkkr4XLf939vtsRGX05qYH2GS5f5pmW6X
	 YjVGRFbv9nfuBjjvolEuWUhEqjq714CSiQv2pQhcplQo8qJlhjZzhGZoYEsxuBeUK7
	 kdkTkzcZObuSYOzo60dKhupyrRH6QM55qvYS++mPmGgNC9DSXAYjbX2du0qE653j1a
	 tFgL5jc1FCbiBlSXljw1E3xtb1aBZDlSMsb5N75jb331KI64nCr/pE7KvOQmj5kAiZ
	 UVTp5H+YhcwG1vfChL9EZYKU3V9GA+HpCN5zj4s4GbLx7gJek/ClXw0L4aKOWP8Pci
	 gVA+LA8DyyMtA==
Date: Mon, 22 Jun 2026 18:53:36 +0800
From: Gao Xiang <xiang@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Gao Xiang <xiang@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the erofs tree
Message-ID: <ajkUMAClisEo0NEK@debian>
Mail-Followup-To: Mark Brown <broonie@kernel.org>,
	Gao Xiang <xiang@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
References: <ajkSK9jNJBSi4omB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajkSK9jNJBSi4omB@sirena.org.uk>

On Mon, Jun 22, 2026 at 11:44:59AM +0100, Mark Brown wrote:
> Commit
> 
>   8501551579195 ("erofs: handle 48-bit blocks_hi for compressed inodes")
> 
> is missing a Signed-off-by from its committer

Thanks, fixed and pushed.

Thanks,
Gao Xiang
