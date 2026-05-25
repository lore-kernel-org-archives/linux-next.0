Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC43B775B;
	Mon, 25 May 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779718608; cv=none; b=MeGDKRMg+jwLi103uEjbs490PzFOuR1C47eLp+sO+TtClYqOEE/K2u+jLq//nWYQTGLTd2u0pIWS72yZpf3fN8i2xTZ5y2IdSjOEBcwBu0ix+5nphfR0jioGhq4gqb0Wdzz4+npUQZhZflHIRBhlnp/xcVh0lUTQ5jQRVGQgN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779718608; c=relaxed/simple;
	bh=CTMZs/pdDKxTC84tM/d1YCwzj25as4lS7m7xkIFk/wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BcDZXAGm7Cq2NnWkcOMWtJCUabD9OzgXJm7sPBuoX+l3RZru3pIEoDBf5SCv63GtseR5tHYNxxAf8W4+QIBsA0xtC+QpUXgRlkYi/fkUT5xgPNAtZ9J21RcterCC68CsXD9bOm27szKd10f3Zb4atAZRWGng4tF0a0S2hz9z6CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2u6Jne3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2u6Jne3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DE21F000E9;
	Mon, 25 May 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718607;
	bh=QdxFI6GSnn/2/Ve4CpnpfIdomKR51g2OKaWeVy8S7yU=;
	h=Date:From:To:Cc:Subject;
	b=i2u6Jne3l6KYji1y5qUO8z3Jou5zTe6uFPdzlOn7AwYkd70wwV197LrwsAWseXvFX
	 wRSA4V7/o6PLeM+weItWwVhmEDvAXeu5B1ySMHyGjZD6PDfDp4oMmj34w+GBZc2166
	 WmRZb5CV37IovxZ9lwUUclAbzWYHojpIC2Ueg9niHF9yHFmYieXQTqbtlvNFhWtMFw
	 Qc3WT+wA0DdRvK/7gxGbMgHN48Ez/SSsAqDCekGJgxG+cyVaFneE08lUy+ZCaZpqUk
	 gkX4tLtWywH430muUFwtu4CxuKMKCw5jD7MbM1jTALtLBozlRLh4gj36grNa5behrc
	 Fd3ZzWM52HXYA==
Date: Mon, 25 May 2026 15:16:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sean Young <sean@mess.org>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <ahRZy0wqaUFv6xO9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fq11XRe15w8CpfqQ"
Content-Disposition: inline


--fq11XRe15w8CpfqQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  drivers/cpufreq/Kconfig.x86
  drivers/cpufreq/Makefile

between commits:

  6fb302d2109c8 ("cpufreq: elanfreq: Drop support for AMD Elan SC4*")

=66rom the pm tree and commit:

  435ef16e69b9d ("x86/cpu, cpufreq: Remove AMD ELAN support")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/cpufreq/Kconfig.x86
index 46b9742a16882,53025a063d2f4..0000000000000
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@@ -5,6 -5,7 +5,6 @@@
 =20
  config X86_INTEL_PSTATE
  	bool "Intel P state control"
 -	depends on X86
  	select ACPI_PROCESSOR if ACPI
  	select ACPI_CPPC_LIB if X86_64 && ACPI && SCHED_MC_PRIO
  	select CPU_FREQ_GOV_PERFORMANCE
@@@ -35,7 -36,7 +35,7 @@@ config X86_PCC_CPUFRE
 =20
  config X86_AMD_PSTATE
  	bool "AMD Processor P-State driver"
 -	depends on X86 && ACPI
 +	depends on ACPI
  	select ACPI_PROCESSOR
  	select ACPI_CPPC_LIB if X86_64
  	select CPU_FREQ_GOV_SCHEDUTIL if SMP
@@@ -71,7 -72,7 +71,7 @@@ config X86_AMD_PSTATE_DEFAULT_MOD
 =20
  config X86_AMD_PSTATE_UT
  	tristate "selftest for AMD Processor P-State driver"
 -	depends on X86 && ACPI_PROCESSOR
 +	depends on ACPI_PROCESSOR
  	depends on X86_AMD_PSTATE
  	default n
  	help
@@@ -113,17 -114,6 +113,6 @@@ config X86_ACPI_CPUFREQ_CP
  	  By enabling this option the acpi_cpufreq driver provides the old
  	  entry in addition to the new boost ones, for compatibility reasons.
 =20
- config SC520_CPUFREQ
- 	tristate "AMD Elan SC520"
- 	depends on MELAN
- 	help
- 	  This adds the CPUFreq driver for AMD Elan SC520 processor.
-=20
- 	  For details, take a look at <file:Documentation/cpu-freq/>.
-=20
- 	  If in doubt, say N.
-=20
-=20
  config X86_POWERNOW_K6
  	tristate "AMD Mobile K6-2/K6-3 PowerNow!"
  	depends on X86_32
diff --combined drivers/cpufreq/Makefile
index 8056b8f2200bd,6c7a39b7f8d26..0000000000000
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@@ -40,7 -40,6 +40,6 @@@ obj-$(CONFIG_X86_POWERNOW_K6)		+=3D power
  obj-$(CONFIG_X86_POWERNOW_K7)		+=3D powernow-k7.o
  obj-$(CONFIG_X86_LONGHAUL)		+=3D longhaul.o
  obj-$(CONFIG_X86_E_POWERSAVER)		+=3D e_powersaver.o
- obj-$(CONFIG_SC520_CPUFREQ)		+=3D sc520_freq.o
  obj-$(CONFIG_X86_LONGRUN)		+=3D longrun.o
  obj-$(CONFIG_X86_GX_SUSPMOD)		+=3D gx-suspmod.o
  obj-$(CONFIG_X86_SPEEDSTEP_ICH)		+=3D speedstep-ich.o

--fq11XRe15w8CpfqQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUWcoACgkQJNaLcl1U
h9CweQf/YC/uX1Xlq55vocWmoJb6cgA4NsKR70aemWTZ31BgSN5aO3mWoukIZfL1
K4y9XWpgmPWX3zNPqTFfFSiLUCCcZNl2AWCqPm0Lh7BIVCW9S2QvaMtGfHhzeM3K
9Ho4q1W2dX1jP6dUpjOoB11J0mshUTHyO7gvaZDMa6AdMxm09rMAf1WQj3TxAWiY
ipi4IJlAYxncctBCqwLPkNkakpTxXD1pOjsNm0wnDabGFQjNcT/5AmNB5IOZ5MYY
aiaZuU1KBL6cGpaf/sTp8+2dOfF0DFfWJ0QI4uGfaVV2UEBjjgTqAfKha2wtpeqP
7m4Q2warUGQ/3dYcXwP/KwWpsje6gA==
=En2k
-----END PGP SIGNATURE-----

--fq11XRe15w8CpfqQ--
