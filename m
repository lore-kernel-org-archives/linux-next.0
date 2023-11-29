Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E1460EC4
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yhfdZbj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C8DC433C7;
	Wed, 29 Nov 2023 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701292204;
	bh=aQe3X0+1WsGBf/QVwG5GwFOfFHLsTEKPmwIkORCnfx0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yhfdZbj/Z4TOtnn6qPw+K98272UCT4HB3++xpWlLLB/paoWhN0xilv+/lRB6ArTm8
	 AjJuSfhMaeseyvikeqVgRaajzRokKW8m5LxLh+Ktxm/H+QoFeF3B1b140yRJhYHfCa
	 aM0LAiRIW427lotpgjLAFisdNxnDC1gUqMZeU0GA=
Date: Wed, 29 Nov 2023 13:10:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@rothwell.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: lots of errors/warnings from the
 -Werror=missing-prototypes addition
Message-Id: <20231129131003.d2c1078847c3865c1ac2dfd5@linux-foundation.org>
In-Reply-To: <20231130075838.05e5bc9b@oak>
References: <20231130075838.05e5bc9b@oak>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Nov 2023 07:58:38 +1100 Stephen Rothwell <sfr@rothwell.id.au> wrote:

> Hi all,
> 
> please see the kernelci results here:
> 
> https://lore.kernel.org/all/656732fc.170a0220.49447.2c19@mx.google.com/

And I'm not seeing a lot of fixing activity for these.  Arnd, do you
think it was just too soon?
