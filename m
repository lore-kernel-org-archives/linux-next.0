Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CA73DDDD6;
	Wed, 11 Mar 2026 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242405; cv=none; b=od1HpIB+M9w4wpvSKFOgpzPreHB1rp8nCS6ACb65BDX70lSxuNOmkzlRJU5jyJJ+oxR0x9uaSiBDkmEVWj5D/wOawT12B5q7hZagAvrbtHPfOJQLjzkCO3kPreMuNy/uD2PW0+utzhY46GrMcMyAXVAe7LPCCL953c/pCYnSq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242405; c=relaxed/simple;
	bh=6sza7y7uKWq/vhCCqgYT/199EsrT2RMiaTENv912ApE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPyoUOpvrq2QXYGbSyaB2mgYgx6ozlKb5fIhhv35FqGY13Ef1rChkT2+cEgfWKRjsyghzfej6WMDTmkWYV9uriTecaSH0Cjzbh6pMDynGBv48H/MZFoTeteR5+Tgoya+2++vMWfP1emUhKqijqzpKLIgiG/rZ0C3N68/YA1w1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZY5ygLBs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZY5ygLBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0F3C19424;
	Wed, 11 Mar 2026 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242404;
	bh=6sza7y7uKWq/vhCCqgYT/199EsrT2RMiaTENv912ApE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZY5ygLBsxK5MmsWOiyvBF/k1R8udGJhU2MvlVsDsaJGCFsjtPlSUoW2VdJqkexE0Q
	 jfrpCf8xrZfIDcEzLMoxnpndS/aU2uadgnfi+T2ntG9SjpQ5heCwxTy0iPwl0e3b2i
	 QYiuNNdjN8/i74Nr3RoLE9uOzlDm2bZhRfb25URAn8HyWdoKvFrOtyKuEAzawr4/R5
	 KpDzsEZmq+ZK6KYm+G9xJ00agwgztba/6o2bFJmp5uU7iNI+5Ut/QjtY03AlFZ2IfH
	 yO/DH01Hlm8xqZedzEPpJn8A4kEuC0iDV5mz0BvigahB+/8l808WZeSAGiXzKP2Nyk
	 7F+OhoJ+opJiw==
Date: Wed, 11 Mar 2026 15:20:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <feb7b428-eab3-4cec-a004-6067e621398f@sirena.org.uk>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <abGBhmJ7827npf4D@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rNxsdcYxIYYTpHN"
Content-Disposition: inline
In-Reply-To: <abGBhmJ7827npf4D@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
X-Cookie: When all else fails, EAT!!!


--3rNxsdcYxIYYTpHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 08:21:50PM +0530, Ojaswin Mujoo wrote:
> On Wed, Mar 11, 2026 at 12:00:20AM +0000, Mark Brown wrote:
> > On Tue, Mar 10, 2026 at 06:28:30PM +0000, Mark Brown wrote:

> > > I didn't figure out what the source of the issue was, I merged the tip
> > > tree from 20260309 instead.

> > with just tip/master.  My KUnit command line running on current Debian
> > stable is:

> >     ./tools/testing/kunit/kunit.py run --alltests --arch arm64 --cross_compile=aarch64-linux-gnu-

> >     ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 --cross_compile=x86_64-linux-gnu-

> Hi Mark, I'm unable to hit this bug with the 20260310 branch [1]. Am I
> on the wrong branch? I'm using the following command on x86 machine:

See above, because of this test failure I did not merge the current
version of the tip tree which triggers the issue, you need to fetch the
tip tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master

> Also IIUC there's another deadlock issue you are
> facing other than the one here? Would you be able to try out this
> patchset [2], it fixes some of the cleanup related functions which might
> fix this issue.

There was a delightful issue which is already fixed in current mainline:

   https://lore.kernel.org/r/20260224-mittlerweile-besessen-2738831ae7f6@brauner

but which was present in -rc1.  I've not seen anything specifically
about any ext4 issues.

--3rNxsdcYxIYYTpHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxiB8ACgkQJNaLcl1U
h9DXfQf+IueGf3Y+vVrVPSbuI3SycWmPog3hMBIGbz2ik9RqUxW7bZYIcWwVatkp
5/UiTP/aZINhCdIStCUdSkUQ1KsjQF+8L7C8S157thhcZYkNAfpmabXqrilToGvk
74d1xEjvzhYRaylLUR8SwZpihFrA7ZG0ewod67zE+uuygR+aeszGEk3me/Tcx8a+
+Bkg+c1D/+/L2Ew4L9DIs0Av27XO/ZeXMVhdAlaZE4bl31gpnLf01DgGmqjju/Vb
3ML2hKSc+1SovkF+hyikze53juj9f367EG+kM+fAAltuGGJihX60Ttg32UbmCgPI
iQWop9K99UmulhJJniiUPPGMyTGakA==
=7MlZ
-----END PGP SIGNATURE-----

--3rNxsdcYxIYYTpHN--
