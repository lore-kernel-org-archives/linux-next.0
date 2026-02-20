Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F1E322A1F;
	Fri, 20 Feb 2026 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601718; cv=none; b=clnTEvvebpuLCUtQfih9dJYZceX9QZMoxKsrpj5WusfO7dREKB3cJ+GxedNy+1SGpp9W3zFHa9/To+hiwAXFUq9xWlaYCFg1Foqw0Lo/+1orFbKJK30dWT3cZyOWIVTsMLsXaXIJMKrMPrJxkuzDtlGtAG7VBycGwXnVK7bVTsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601718; c=relaxed/simple;
	bh=l9oDVyoI8Qs5q+mveED1sNgqS99LZU4kGGeuZ/pGNzU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kpPldktQKZYkHZh0O5ekN5NN72uHpxIwUwjO4Ne50xhro5t0SDdFwVOJfGSgKajQCHzBp811hyIWxI6NhHNPSlJQ2FxndScLM3Oi5gyFGdlxsh6j32xoXINQMT8/HrOVi6pslzaSlV8+pT5ADGT8eQDMfQRy/HQXDoc7Cx6g7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Fa1A73Fx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Fa1A73Fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCE3C116C6;
	Fri, 20 Feb 2026 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1771601717;
	bh=l9oDVyoI8Qs5q+mveED1sNgqS99LZU4kGGeuZ/pGNzU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fa1A73FxkDdBUeO0uadkRSuYJmjPPGTr1jG1XKydPB8MTEe0zvS/v9OhIq36dohfK
	 1ereEQ31pAuu2gyAX78BNtFu1Vmlnv3+Kp2ssYoCeGaWgh26UDaLG35nhvVj2xvcXf
	 SojFe2n0QYVWN3opMHqLdFvbNzRoaIjIdIq5eiAI=
Date: Fri, 20 Feb 2026 07:35:17 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the mm-nonmm-unstable tree
Message-Id: <20260220073517.2bf4d8cc090f01cf9962bec5@linux-foundation.org>
In-Reply-To: <aZhmDGF4Z75dPduE@sirena.org.uk>
References: <aZhmDGF4Z75dPduE@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Feb 2026 13:47:56 +0000 Mark Brown <broonie@kernel.org> wrote:

> In commit
> 
>   ece626c304380 ("proc: fix pointer error dereference")
> 
> Fixes tag
> 
>   Fixes: 61a28784028e6 ("proc: Remove the hard coded inode numbers")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Looks OK to me.  Is it possible that the script got upset at
"61a28784028e6" having 13 digits instead of 12?
