Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4063CF205;
	Tue,  9 Jun 2026 07:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988813; cv=none; b=kq4kKocU7qNkcooYhmSp+5gd8KqBObbgULcJHxpZf+dpcZfRD4SeR+Bfn6aCI0COEAHQdtNVotV0vlwYDG4mcErdaxYEGuK3+bGoHdU0/GLzfh+1B384Shl8nxwcmj5Y7KXyB1yVPfnm2w9FFJzDktyWWK6i7vrr34VMQEwjxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988813; c=relaxed/simple;
	bh=CKr1JNRfcJCb/mfIEajfHDyjHj8qNiHBh8gDjDJ1Dc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwIvHZFaP8uKHQW5pEeStlxIWW+6nJdvBl1oRFCCNCaMDccWjXHVsvL4csSd0ST0chFIQrE7K876k/2HHf6GE/AlhBpCHL8+MRNvDWwslT8dYViD7Uw8LPjWgXO7VJDJ1CK6/DLEYDvBrGAGPaSy01tDiH76jfB8YuvZeDzr0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tlxqa53W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tlxqa53W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210011F00893;
	Tue,  9 Jun 2026 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780988812;
	bh=JiZdu6Gywd1b+1ao2M8ONFd/0cPqy/H2X9c5B1Ug6rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tlxqa53WEFXnsMnWQhtYcTAET6bBX+6/+8tkNaJuW4iJnm6a88jcQbeAGQGRV3GtW
	 HAjq2I9GDsXFFJLwms2mmL1gNYe8dh6fp8Os/are1eMa9P2rTA1JV/OJFABwCd+Map
	 PHWjCJ6adAxQMjHP8XAhTD0nrvVbdIL3k0CVs9OBJDWMPVhaEfr0nUWVJ9zUFZEyKn
	 r8Knab8gzHttjDtoY508bhDlSky9pvv49z623gi70qBJKTZ5TWv/W6Bb2ulFsrr8qt
	 W1NivwR4nt2VFdmRGonrC1/uoyR/yMumGf+2Tt7pnh23w+I83u5hL/t5JnEy5rn1uS
	 Kpy79HK8RGWlg==
Date: Tue, 9 Jun 2026 09:06:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Roman Bakshansky <bakshansky.lists@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the hwmon-staging
 tree
Message-ID: <aie7hggt74Qa8jSg@gmail.com>
References: <aibSXki-s7geOFFn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibSXki-s7geOFFn@sirena.org.uk>


* Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/hwmon/coretemp.c
> 
> between commit:
> 
>   1b16a26e79433 ("hwmon: (coretemp) fix coding style issues")
> 
> from the hwmon-staging tree and commit:
> 
>   91660aae2f864 ("x86/msr: Switch rdmsr_safe_on_cpu() users to rdmsrq_safe_on_cpu()")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/hwmon/coretemp.c
> index 02b4e46d965b9,70711a7cca123..0000000000000
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@@ -220,13 -220,14 +220,13 @@@ static int adjust_tjmax(struct cpuinfo_
>   		 * http://softwarecommunity.intel.com/Wiki/Mobility/720.htm
>   		 * For Core2 cores, check MSR 0x17, bit 28 1 = Mobile CPU
>   		 */
> - 		err = rdmsr_safe_on_cpu(id, 0x17, &eax, &edx);
> + 		err = rdmsrq_safe_on_cpu(id, 0x17, &val);

> - 		err = rdmsr_safe_on_cpu(id, 0xee, &eax, &edx);
> + 		err = rdmsrq_safe_on_cpu(id, 0xee, &val);

> - 	u32 eax, edx;
> + 	struct msr val;

> - 	u32 eax, edx;
> + 	struct msr val;

Looks good, thank you!

	Ingo

