Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B0B328B61;
	Tue, 10 Feb 2026 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726359; cv=none; b=oIi+3p058QvAjzLLrbPCkGP5vLiamiB/TjSURoG32Pmu0xQSO0N0dgUBc7hqrjJeiZVATkPHjZBxvq+OMowfq7fewlZ3QXTOSG/nozZFoj0Ssl7RoDeh79TBEZmv9FgO89haBe5ae7UgyOF7CHpYVk+OJmzR8gLTjtn5agVz3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726359; c=relaxed/simple;
	bh=BVjy6Qs/sxjQrJIc9iI0I4fxEMF/sztkDRwSeWZiepk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiNCyicQ6GvWEpnooqf1LXAOq621gf3zfAKdEhYmt0s6xbRsLVjbaUyUkFcGA9qpyX7EIcjt88Q39kFvwp5F8dRQAAVuZfng9KwSTJ8zUffrG83fDYqjoR0Dif3ySyKHHyU9fIgb/UI/Tv2omE4RaqfLvKUpgjSd39Gry4FrQCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9gF5c/b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9gF5c/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4EDC116C6;
	Tue, 10 Feb 2026 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770726358;
	bh=BVjy6Qs/sxjQrJIc9iI0I4fxEMF/sztkDRwSeWZiepk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9gF5c/bua6i7EvTvXVwnwVfYeV0A5hISDk8CN1pAOfbFvQGuRNM8fhoxC4RTzKIe
	 nNWgwAIMK+0TUJ0E1FY9sYv8zxKSeWwIgqKZ+OCS2z05EGDt3Iw2gc70pdm65ovFHz
	 leznGX3CJSDt+lt5hR5mCM8TsbAfLaTBCjrHhcbwIeom2vaxVGt0o/qQooeroKQ3Jq
	 MO2hfChLrdHbqcRoBaEF11rUnNYi0Dar/0S615a6RvvCBcVf0Iiass4JOXSghpBnhK
	 7vol5Ak95ODMSE/6fzFNkiP8x24cs20CRsy0h51gEQv/L44hKGn6ATQGdQegbDmURW
	 mpzBgUeTSf4eg==
Date: Tue, 10 Feb 2026 12:25:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jean Delvare <jdelvare@suse.de>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christoph Lameter <cl@linux-foundation.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Dennis Zhou <dennis@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Ingo Molnar <mingo@kernel.org>, Lee Jones <lee@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>,
	Tyler Hicks <code@tyhicks.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <f6f443a1-19ea-4ab7-a8cb-58bcc08d4381@sirena.org.uk>
References: <20251215184126.39dae2c7@canb.auug.org.au>
 <8b249d75a33bfde87f725e89c2b82c297a2b1b45.camel@suse.de>
 <20260210051904.1d22a634@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dv4waa9it8alhncM"
Content-Disposition: inline
In-Reply-To: <20260210051904.1d22a634@canb.auug.org.au>
X-Cookie: Spelling is a lossed art.


--dv4waa9it8alhncM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 04:19:04PM +1100, Stephen Rothwell wrote:
> On Mon, 09 Feb 2026 13:33:32 +0100 Jean Delvare <jdelvare@suse.de> wrote:

> > > dmi			2024-05-14 11:23:02 +0200
> > > =A0 https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.=
git#dmi-for-next

> > I have DMI updates to send to Linus again, so I have updated the DMI
> > tree above, and I would appreciate if you could include it in linux-
> > next again. Thanks for your work.

> Mark (cc'd) has taken over linux-next ...

It looks like that's actually still in there one way or another so no
action to take here, I should probably go back and look at the list of
stale trees and flush out any others that remained.

--dv4waa9it8alhncM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLI88ACgkQJNaLcl1U
h9CwIwf/dn2VboHWYhSemAN7nucSBCD+dHqqAh/vXxRK//AXzRw14FJRCaZ1cLc7
mQOt1txsDbJeWv5y8LxhW9m7X1rSgZTwlB82UysVAyQsXH+ui/hylI50+XDO1eYc
L1EHpvAX3j4wf6aGxa9YXdZsHztAkpYy6+QVbF3IQTidQOLYS/t7XvO75JYTq2nG
L9q7lxrtUM2FKaYBrQ8qwqC+mc7RpIYwnvkgpL6zJXj7Lbp9MnxsrU0TaQlZs7gu
NzMFntKOxs42RE9fJ8MIVyBF+qOHZJ7XMyY4W35yNlDDowUukM/nqONoplyk8xn4
dr8K1ziFdL/nx4n45le9fMMJQQWoew==
=VMYh
-----END PGP SIGNATURE-----

--dv4waa9it8alhncM--
