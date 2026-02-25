Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A334F49A
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025768; cv=none; b=LgffJxfPkOu6P/1fVmreETk93HPyF5rjQ8gebtj2c7MI3pPXVfCEpnne71dAWCrhXE4aq8NrECQ+U5DkTuXnTOH+IH/eTZioPJ6W4/9MPV9fGqxuZb7WUiXkQBoeIRm+9oI4gbxCCPwXo2J0iKAp1RSkqO+eqVLdST+H75d3h/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025768; c=relaxed/simple;
	bh=yUcnVdzaps8pHAPyb7UZRWv6/WE6Q0YyIhQgKksTSXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYv18zqLn0CuCV9AkzwastUjuhzxIshKJV8Rlt6aJ1NDBpPrRAvJu9JS1VyH352bk5E82w1MIXYIpQhmsFpx7+9lj3FtSUMzgd8LSeAozKv0oWH28D2T8aSKRVvA1TUInhPHw52RHKbUJz35Vfn8yhvzNESn9nJRbZHI/5hqbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohvLESXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohvLESXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC513C116D0
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772025768;
	bh=yUcnVdzaps8pHAPyb7UZRWv6/WE6Q0YyIhQgKksTSXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohvLESXRsDMpdFB72Ne64IISovpebvrwZh4dFUYv4g8z3SfPWlT9fTbNSzb4W+qjb
	 utXkCc+68wS2PhFDrM92zfhYZtnYG2MdVYbIZa0WpCx9y4ZvoKEdNdPL126EfZeECX
	 MH5oqBJtA+3K5gDQCPEECjOlmEVdazRfo4qlVwyIMHX5Gxh0JlbflLbcXpG1e3/iQN
	 ROpOQ6CQ5x0g3m3WEUNpcTFNo8qmGujiowQkaVODcIM75/0NHB8+3oAuR6TztwZ8zZ
	 2+8T+uOcIaU9kzY7sn094Kk4UKRuRf9Nj2gv6vLuh3fMhauDI3whMsrBLbYD1bRcKU
	 Vjv/e4mA90dow==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so936492166b.1
        for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 05:22:47 -0800 (PST)
X-Gm-Message-State: AOJu0YwYrWnzECWgHvnuBG1Ok/lrVOcNp93LJGW0/QyTjYOQAUHsjVI9
	8YicQLHzbq3xrrTbA1EWzPxcsOY1UTXa8jyInXRqZg8QW9MWwMiRLRcEF4JY7BnxGanw5apIasB
	QBFYXT+klj+QtcMKVVf/4b7TN1jgPs+Y=
X-Received: by 2002:a17:907:96a8:b0:b8d:bf38:7025 with SMTP id
 a640c23a62f3a-b9081a0250fmr987188466b.16.1772025766451; Wed, 25 Feb 2026
 05:22:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
 <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk> <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
 <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com> <ecada199-b746-426d-9207-c2d6da2c2034@sirena.org.uk>
In-Reply-To: <ecada199-b746-426d-9207-c2d6da2c2034@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 25 Feb 2026 22:22:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-HvwQXeLSL3bE4ie9Ce+WwGnFW0FPwSmM3v+d3Xv6tKw@mail.gmail.com>
X-Gm-Features: AaiRm50zK6XhHoFukIJyk0OWd6gtWC2_AjWHDOnaHMY4THLXF6htN2M9uF8jAgY
Message-ID: <CAKYAXd-HvwQXeLSL3bE4ie9Ce+WwGnFW0FPwSmM3v+d3Xv6tKw@mail.gmail.com>
Subject: Re: linux-next inclusion request : ntfs filesystem
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 9:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Feb 18, 2026 at 09:01:59AM +0900, Namjae Jeon wrote:
>
> > It seems the build error is caused by a dependency on Lorenzo Stoakes'
> > recent MM change ("mm: update all remaining mmap_prepare users to use
> > vma_flags_t"), which replaces vm_flags with vma_flags in struct
> > vm_area_desc.
> > I will update the ntfs tree to align with this change and ensure it
> > builds correctly against the current -next.
>
> I checked again today and it looks like the tree wasn't updated - if you
> could let me know when it is that'd be great.
I updated the tree and re-applied the patch last week. I just tested
it again against the latest linux-next, and there are no build errors.
Thanks!
