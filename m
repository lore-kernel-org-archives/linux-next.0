Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758842AA6;
	Thu,  2 Apr 2026 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159151; cv=none; b=OVw5CbTJurvrc4n7nk/uKqyLvg2Bp2mPVLkT80USoSkMqiXwyeKu2a5c2hqqqidWG5zJ66UOBfMqAKAFBc8Tnbz/nRgXeNsj6KSaWEimDZ8HHWoSx+x1nCunX/u0ak3UOdfbfrM9a4DIah9nkIajHMaTkz1zBT1ytHtzcZIkEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159151; c=relaxed/simple;
	bh=MI/py337GadfZN4WZ8IPhkot2+69VK9pA//eQtegBqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFBqq0O+IXJOFWCtiuAjzRgxQ2WcR+i6iZWplwGDGL5EirejBDsZz+PoJr4fuRkCDK1PLihfFpGwG/hYomCFTSJOHecfbEot5EXgru8dYbNaz4R+Q/mPIaCh7zpPU3wDPGEUZvg4Ostb0SaPgujCSQJ+LhrkkjPL6EZ6rxQD6sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtPZH4ij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtPZH4ij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CC1C116C6;
	Thu,  2 Apr 2026 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775159150;
	bh=MI/py337GadfZN4WZ8IPhkot2+69VK9pA//eQtegBqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtPZH4ijq9sMjirwBauRN3EmLRnYcUWQoba8btSFxzI+HVtRtaesuddRtO11aSD/l
	 +DPs8jo4KqCNn8w7THEdCuQ6is9Ucv4DjJHibobDztWJ+htrl4U6w7gxxsaNDZ4n77
	 Htp/GUnh6euVvDH2lKpMeKMiwLbmUpcVV13V+/fLfytTdlin1gWfRGqhf5oWmbxJTP
	 Be8uTLSBPSBDZot0pX36tEamhtueakUVT1zp5MQlAqxTyMwAsjhSDn14eTaRNXNnP4
	 JiI91+9IqiCeBbEnh+o3aBBZ3wrATeJhGoJETRDj2GDIKEQhhaH8kGj9P+VYdvk+hw
	 8ucF/EOv1PwRw==
Date: Thu, 2 Apr 2026 21:45:46 +0200
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the vfs-brauner-fixes tree
Message-ID: <20260402-festrede-bussard-dd3e564414cb@brauner>
References: <ac5NL-ClYJZWAGJO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5NL-ClYJZWAGJO@sirena.org.uk>

On Thu, Apr 02, 2026 at 12:04:15PM +0100, Mark Brown wrote:
> Commit
> 
>   fa430096c7100 ("eventpoll: defer struct eventpoll free to RCU grace period")
> 
> is missing a Signed-off-by from its committer

Fixed, thank you!
