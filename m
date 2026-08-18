Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74E3515D5;
	Tue, 18 Aug 2026 23:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096971; cv=none; b=hdWgAQtMOPx6ftKu9AdiJHzJbGlJuGswQlZWvvbeT65Vyy1IQJii72AKIf0/PrOF6ecJj/rjDNARBS32JHFFMWKWdTWNeCEpG3DgSz1EfPUD+mVzvMU8FhMvX+3jCe7EHMKmsxG2c4pPzHkSEUMc9WCNIfdnQ9MkYuNXtbTVAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096971; c=relaxed/simple;
	bh=bOTsR7d9mUw69gsDFI6JpreqD6U1UjRalPgVlIQwZ7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcnUhqOjcKJCruCR0nW0rk4h+KNH05dJ9gWFAc/FEFy9+yQvNtBl+NIHFUXnhd75vjG7b88SjpgWMo16anux7hbPfKsZDV1i0xihMrqpfnli+cE3Ao3US993ySAZUiQLzbBVP7fejRAtxAltlb0IMx1HXdM8HP0AvSjRz5EE35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNw4ghpU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNw4ghpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB821F000E9;
	Tue, 18 Aug 2026 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787096970;
	bh=RcEOhrTaMB6QCN9gzUhtiMe/uAF+LaIlsn68lvI2jV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nNw4ghpUngtprcHINpRhfxq/ancwQ2crlEZzCqHbjCljZbDNrc1ZFuAYW7KK0OSbT
	 k1I9QkcFkMJ5HpmHWeTR09E0KDqFOzQeEadc1MzZhTsSS1Zn+7KEZf16od/KJf+fOs
	 JAQoaKLR2zG8KzHL3INjrBMltYWdGkaA7r/HHBzE5ibFPPrSuX72nMNl3TpF2qKg0t
	 8gjXjVUzHLsMsVGxjv7cPVxjOVfixs6GSxlySNspo1y6NCU+87NPGCzFkdoWBqBk2B
	 FGmZcaAnxt4Dqoa3IxIv8tM3UXR1XnZFGOP9zahTT8ktetf99S+ekLkAdSVQZC/fUk
	 EZKlbqGE+EYWw==
Date: Tue, 18 Aug 2026 16:49:28 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <aoTt9Mka8iDVZKIQ@jpoimboe>
References: <aoTGgoeZ_FormkL-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aoTGgoeZ_FormkL-@sirena.org.uk>

On Tue, Aug 18, 2026 at 09:54:26PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the  tree, today's linux-next build
> (arm64 allyesconfig) failed like this:
> 
> ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o'
> ...
> ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/smbios.stub.o'
> make[3]: *** [/tmp/next/build/scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> 
> Presumably caused by commit
> 
>    c19ac4abbd696 (efi/libstub: Remove obsolete .note.gnu.property workaround)
> 
> though I did not verify.  I have ignored this for today.

Ah, that commit had an implicit dependency on the previous patch in the
series, which wasn't merged:

  https://lore.kernel.org/0445b20df50894615ada70abb1e6238f33c78a2e.1786768375.git.jpoimboe@kernel.org

Ard, can you rebase and slip that one underneath?

-- 
Josh
