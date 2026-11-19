Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090321;
	b=oVL8Mf68mTBFM6S5sdZpIPcfDOMQbgdp/Q5LzC9lsmgOia2BnqakU6AA5TAL+WIrz7qR
	 hyhkn427qFdOXo6fkFrEZNve2oDXHAnucCMECLVPIm082MY0/q/ODCa8G2B3sdz/j6WCR
	 XVTNXf7pVjXOQA26P7q7kvgQwgVHfLxgMMRcTjsEy0sQIHzWT3HXFGY763jgCjz3lTe0C
	 w1QqaF6DaGAjPh599JhYEN2YPQZuFQCcaNB73xrsw2Ocg0p85RcTjrcbcPmuAQTsSE93v
	 raKsm9db2ITmJQca3WoEmKA9jO3N2CcOIVfmFOss45U/jR4sMQyfapTG0X3gS9QZY2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090321;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zx41qMkLBFw6hL2FFgypUc2nssdoGcaJqxvzFU5UKXk=;
	b=3TNwwdxIBntPwXTqJU4J+K6feSi4sB6dod7OXqdd4lMSmUOhZn/asomM+eUbOcvNCo8F
	 UKIus8ruq7TMAcxkJzS74dzmUOXNfPRcFw8Nedelq6nJ6sQLdmP4dwrnaPwYIVMFknwDi
	 6zomhMixunQtmtlWWgF03rUKLdEe9aXA68Hqejxx7rS52bhaS8sUPAJMvGcs0dGRLfLxL
	 AJQ5HmD9+XeJQwshnUowwiwzGGSaD+4qoCfdgilYUSqIZVODlPA9tfpEpNeRJXL89IwjE
	 QeJ55kR6LpqtMf8NhfSN8V6GqPuyyNcqLcdAXm+prhHa0PgaQw3bNhPwNmnskVQCmeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8d83hT8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E9606A320;
	Thu, 19 Nov 2026 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8d83hT8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBD91F000C6;
	Thu, 19 Nov 2026 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795090320;
	bh=zx41qMkLBFw6hL2FFgypUc2nssdoGcaJqxvzFU5UKXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8d83hT8DJR++jnER0EEdkTgRPw1fo+K6qmpOF2vh/N/+2ZCB8sZgTzaa09YVU1VW
	 dL1u2r5mlbZqND3yYkGma6Hk0wjqIU5sxHauZLefLfWMPNqSf+llvF6q7Qejrie6TY
	 ZN+W0kvJ4h7nbUuzocXZetX/hUpIVTAxXop5KvRtyLZcDyrhT5/P1AwYA6X6GD9aUf
	 G8kH18mf/7s7EKlPFYk/cCZmkMcQ443wYpWElIMoykrFctUhh+X8o5UqwWlOGFQ9MU
	 BhZRpEILcR9d6hVisAdS+6tKhtu4A7wvVd29+mMhJJj7KAiKQV7UMKOdhMdquQ2I9T
	 teN9sKkaK5DOw==
Date: Thu, 19 Nov 2026 13:11:57 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat
 tree
Message-ID: <20261119-seltsam-quillt-sensor-0227a2cbb99d@brauner>
References: <av2mOPyANz3H59F5@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <av2mOPyANz3H59F5@sirena.org.uk>

On Wed, Nov 18, 2026 at 01:20:56PM +0000, Mark Brown wrote:
> from the vfs-brauner tree.  Again, this needs double checking.

Looks right to me. Thanks!
