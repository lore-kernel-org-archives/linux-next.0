Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34BE34A76F;
	Wed,  7 Jan 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796720; cv=none; b=hH2aUusfGifYso0n8VEjWvVJXEtfRAkvGNtK+pars97aB66tpgkxr1BPhMjDpTQNnDG5awQJusfHj0faGnMSV0ys0ewS33O2aSXXZpeOwPKrpsfrpjFUECGUAVNtDUrrbpnLuK+6y60pLbm53R4cwIeD9lB/yzB9M5sqCc7gBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796720; c=relaxed/simple;
	bh=PLmO1sBLy84quG8MDi8ZocY7oGZp7m42XgxMRuw0VyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkzF26aMQx6669kpOPUB1+TnFQ97e7LqwoNp9erJHgOhLH9o1JNKe3Fs6YNd8ZYbNhULVNYAjZ+uwU9zYTNdrcATVIEanjDuqXJJA6MOjP/plj7eFNEx8WDmy20J49GEvJUMxiFG1mpBMQ4yipZwPD9cVEzPM+VLbGejjwr4kAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5X0+eSL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5X0+eSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EC0C4CEF1;
	Wed,  7 Jan 2026 14:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767796720;
	bh=PLmO1sBLy84quG8MDi8ZocY7oGZp7m42XgxMRuw0VyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P5X0+eSLPbTGz+ZJ0Jkq7k0ooV9UskmFRypScw4ZDFCnqv3gwOxtrAqwUHmypDQ3P
	 TfLBZw99XdicLVSmjqgx9V7m8gwFbC3Hi7N0vZMy89QJejdG9WrvGR8ZJcqH8aKd2E
	 fs6WWpy3LaHoUTkuOnJXF7mBXrYs4yswqnNs+KqHMnn5RmY4qdUqbX2isetvHv9Vtb
	 wifueTQoo0/Asd9g8OUDMuWziFmyttaO+6xn58CEJfTbjiPfl8Kurlk+L/csifknIE
	 pCRnGYYKBK3IhAewzvzJHGdSFeySGc6laX4geVkdNAIJpaSScxqr/prgN0SMMbgF9e
	 TM5rG3Pfx9+Tw==
Message-ID: <a79281e8-cadf-4960-9542-e6ed4736f7c9@kernel.org>
Date: Wed, 7 Jan 2026 15:38:37 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the driver-core tree with the
 driver-core.current tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tamir Duberstein <tamird@gmail.com>
References: <20260107152919.19977947@canb.auug.org.au>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260107152919.19977947@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/26 5:29 AM, Stephen Rothwell wrote:
> diff --cc rust/kernel/device.rs
> index 71b200df0f40,a13f6ee24b09..000000000000
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@@ -12,9 -12,8 +12,6 @@@ use crate::
>   };
>   use core::{any::TypeId, marker::PhantomData, ptr};
>   
> - #[cfg(CONFIG_PRINTK)]
> - use crate::c_str;
>  -use crate::str::CStrExt as _;
> --
>   pub mod property;
>   
>   // Assert that we can `read()` / `write()` a `TypeId` instance from / into `struct driver_type`.

Looks good to me, thanks!

(The conflict should go away after the next -rc release.)
