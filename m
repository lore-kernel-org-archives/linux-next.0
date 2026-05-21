Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102D33554F;
	Thu, 21 May 2026 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365446; cv=none; b=cnmD/5TTSt4GKjRtftCuMtiqWe0Jj3MK4szeGMib4OsohPMnLKzQ6BuJZVenkt6EFpVu2J7vBtLbkkj03nDQ4CXjqdegaAbkGlOncU4c58PCqlI5hSJiqzijWYbSPqY9yH6nD1mc5Kv9YRTC9lhsHGLcbLNQNJWaS0LMSaCM9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365446; c=relaxed/simple;
	bh=9WoLRAuiWyh2C9IZeKDu5XI2y15Mt/ufoEdDAGDjwpo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Hx6ydr0bepyv8yN1ikCZnNGtdbstqQ46vQQ26OyqldPgTihjugnhGW/yeSKwsICbxGymbP1qiyOiCJsVdCcSUkdNNQlUX1RVd0OVxKngulOaJ84mPZL6YxJdhe3mskno3/QPEaB4lweWj/IKIRkKN+KbWSCc2SwAducSBD/c9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcMnWiq5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcMnWiq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8C51F000E9;
	Thu, 21 May 2026 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779365445;
	bh=s+Gqd/KSuOugXjkbTEP2DPfwBBtlSquT9M+G21JCokg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=RcMnWiq5CHW4mEcr0ux7G/QpuM0rZ9cRC5CJ7B0k8sDFPTUkW/u/FfS3gdZQWW9Vx
	 pbzgSuI1G2j4LstHKlA5A8NU8ochfbhqv4BAeubtOOMO6BAT+oYo4yf8zJPiWX294T
	 uDKSER/z54fmlg0gTJxbYkho92wSdhJ0JPALiVg8qPYwH9BfGK9aJ5+WEfVGU5ujL8
	 NtjcLr+cUY6himbAD878bJ2klKiCmo0caybFo587Cxg8IrjuVOfpwU8b6cORDE/eEm
	 EjYKbn6S9FVBY41zKcnZCWccfMrRYUN3ERdQNkqYJXrHsk6l7rBs2aX2uoAd76MYSg
	 mWLjgN8jDDhIw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 14:10:42 +0200
Message-Id: <DIOCENK4QFRB.2G7UT0CQLRZMC@kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 rust-alloc tree
Cc: "Greg KH" <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <ag71mqpl_sgr_hsk@sirena.org.uk>
In-Reply-To: <ag71mqpl_sgr_hsk@sirena.org.uk>

On Thu May 21, 2026 at 2:07 PM CEST, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>
>   rust/kernel/alloc/kbox.rs
>
> between commit:
>
>   9b25d4111e913 ("rust: alloc: cleanup imports and use "kernel vertical" =
style")
>
> from the rust-alloc tree and commit:
>
>   abb21500e7e5d ("rust: alloc: add Box::zeroed()")
>
> from the driver-core tree.

Looks good, thanks!
