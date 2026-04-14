Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15D217723;
	Tue, 14 Apr 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174088; cv=none; b=nqFqX7uFCGTmkkwmnBLn94+HXXJN7Mct1xKCzvCrj1WNWB1zTnuU+W/zh56yeXpmos+gKjxJ92IPb9CbTGU4oaZeYERyFaNILc9W7fhQOcjgjICU4BOoDBlj2D/za4Ci8Xh175dXsu6IMDCzCvbmaBh7JOUI2DiUA8A0X/Kpi0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174088; c=relaxed/simple;
	bh=DDY0ZXmIgw3WPKXoz+Cfn0EdT0Hgs0H2jN5RoFOR1Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDnpYvbwhSnsifkOs3I0gMlHyps5JeruF0rcZXKOCs9KhayKknOW3GvWi0yPGZV/yYZ3MaULjP/gDCbl6uZlGJKKYLVl7QxnvfWn5qXSYSx5gRTOiVIeI2k3zXN3eNRkqhGGjSDJR9+I0J5ZJWqdSJDufCiAe8wpBMi+qijdekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhPH74mE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhPH74mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC156C19425;
	Tue, 14 Apr 2026 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776174088;
	bh=DDY0ZXmIgw3WPKXoz+Cfn0EdT0Hgs0H2jN5RoFOR1Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhPH74mE4VH1eKYCZktZSFUKUvFA2vpStY9e6pJ0u9To+UZZCkDjbhNYEBwHGc2A5
	 bCVv/pibUCQFXAN4ULnSQrZM0m9ERGQ+HJNlBPo+SDza4mj9NZ+hlX2l1fFrq4mBLN
	 ujEWZ5Thz0SQcAFTLEwoOFsULvjhgajMsdCwcv+5zv7OAbb4fNQJuSMYyTl5q84att
	 UgvxL/UIJterWxsWptb68LZhEIvGtQnNwyHtelvpcqEfDoMxRS2yuoNOBXcTQtYP+c
	 Uo3lFsX1N02P+8/6LAL2qLhbrzhQJQJAYlKyr7oVQ79Uc+Tq9kKAqHN6gRS0gQWirA
	 dDIX4xfmyfU2g==
Date: Tue, 14 Apr 2026 08:41:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <ad5CXXdkBnr1etqT@baldur>
References: <aarBm-e3NUl9XnY8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aarBm-e3NUl9XnY8@sirena.org.uk>

On Fri, Mar 06, 2026 at 11:59:23AM +0000, Mark Brown wrote:
> Commits
> 
>   390045a24591a ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP")
>   0af8802175d2d ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP")
> 
> are missing a Signed-off-by from their committers

Sorry, missed this thread in the inbox noise.

It looks like Mathieu rebased across the two commits and hence ended up
as committer. Fixing it would imply rebasing a bunch of commits, in
which I would have to add my s-o-b to patches applied by Mathieu.

I'd suggest that we ignore the issue this time. Let me know if you think
otherwise.

PS. It would be nice if checkpatch caught these. I tried to teach it a
while back, but the reviews fell through due to my lacking perl
abilities.

Regards,
Bjorn
