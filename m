Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D13ACA42;
	Tue, 11 Aug 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463362; cv=none; b=TAR39ehjzNyCLwGdLqS+sm4k8l9QrOn0w9jTKaIiIL/kLVY/FoIJBq5Xw86qTdJ/rSdMtUWwcAV6hIv4faE+CIHKM86uWUH6wJnI7u0jH9DhB2e7SVbcE1D0cMkIvw4Mf0y8eg1EP+SR3qTd4EmYkHJI+PBrqU0P3LC4OGiDO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463362; c=relaxed/simple;
	bh=UKw+dIyrKoWQOPg2Dd2IP+eXvuNtIUCuhttJh0v87Nc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=h6KYpxI/ey0t/di8fyAqsAbq5tminVRoMU+BQuZM71BrC8T5DSiFVEKWJCD4DTWBZa34+opsfVhEmCH+FGumUZgQKe+OahVDZTBfTaibMJcfoNh/sYooDfz7f5XOfT1cMo2ak5D8U6iFPC3h+Geebcx8aWjbM9wnvzCWg3MoWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzN4TlxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzN4TlxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8397C1F00A3D;
	Tue, 11 Aug 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786463361;
	bh=aHSuRoiwSj1og4AzLWHV/59OKnZmGeLK2vkNFiNEOjg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=gzN4TlxPnaXmPjLbKbzE9FqywhfA6+GGH96MsNO9k+32AUfDrBTKowcQksz8ycJXX
	 RQNJ9UBV8EsLwQwHl9EdTHtHVM5hajvVFYbBXbPc1GOsFkbYifm7Kr57r6ZlMnRwtj
	 76sPJ6LF2+ozIBByxxxxM0ZDb+lP1RqrmrvYQIcfxgD2fEiiVdyez0pqLz0f0USUDB
	 dM7HcC2LvY7Eu6u1Aec1Si8KZFJb8ciDdfD13OGM6Uh+c35J3mdn8HoiVTTRWC6Unc
	 uLdjPMo/1xOmFk8drlL+AiUonEgfrylrH+5zhMef0xfi6vHDl1sexRBBWeejSq55WG
	 iJGsrLFQNEu9A==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 17:49:18 +0200
Message-Id: <DKM8EPAHOTAD.1RAZ3DUAID3UK@kernel.org>
Subject: Re: linux-next: manual merge of the pwm tree with the rust tree
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Guru Das
 Srinagesh" <linux@gurudas.dev>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <ans961J686zSzNE6@sirena.org.uk>
In-Reply-To: <ans961J686zSzNE6@sirena.org.uk>

Hi Mark,

The conflict should be between PWM and either drm-rust or driver-core, whic=
h
both share commit 7488dc14b05aa ("rust: io: mem: return DevresLt from
IoMem/ExclusiveIoMem::into_devres()") through a shared signed tag, dependin=
g on
what you merge first (I think it is drm-rust).

On Tue Aug 11, 2026 at 5:21 PM CEST, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the pwm tree got a conflict in:
>
>   drivers/pwm/pwm_th1520.rs
>
> between commit:
>
>   7488dc14b05aa ("rust: io: mem: return DevresLt from IoMem/ExclusiveIoMe=
m::into_devres()")
>
> from the rust tree and commit:
>
>   b4e94b0418ad6 ("pwm: th1520: use vertical import style")
>
> from the pwm tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me, thanks!
