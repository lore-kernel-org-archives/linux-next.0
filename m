Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873F2EEE90;
	Thu,  6 Aug 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021869; cv=none; b=GbZOnpdN+Xayhyg9SMjAhh1M7Cca2tzJXieLi7eCJYUAUoaLsxeSBj3yk8yFGAquUqNI0La+UGyAfWNo3DpeZIGD9QY34/CDoQ7LtjLEWV0uNP0L6s4v3MWg2oFCnh+k0OknbeAlgocWqu4kB7DIKyxKxmOgJEBLM+pl6cwp1tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021869; c=relaxed/simple;
	bh=+5BNNrItMhNx0dkavLugGHJZYGFrD4RMyRDjCRzUgEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avDuNXHr7suCSP4euuiu2ywcVV0tw9cDBwGR7TxwtMsCGEfvLtgYoa0EtNiI+k6BJqmeOIZdghiUB2HFxuJMqZyILLiiykk+B4gdSSefi9I0e4MZeIGhNm2IHXgzZF+6lDvlFS7TbQqRAKdFjztlGZIiToNy6OBYGmGbhZGO6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZy/6m4D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZy/6m4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E381F000E9;
	Thu,  6 Aug 2026 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021866;
	bh=Koa7LFZ2l5HhvzKSqo0oCjkWwJLXMvFKAaDNdkTO4MA=;
	h=Date:From:To:Cc:Subject;
	b=KZy/6m4D2+DbkfdVXrU20Uilpk350eUeGkMlZUjF43Kjb6zQYSQa+r1HdGNheOyIO
	 7+lUpdK3nRt2BSc/MOJE/PVXQEAESLmwyjenLvhQ+3PKialVjlKUFW6l/gRXacmdnb
	 p2AJ8JctBCiUAIUVoZrIh8q5uE97lSeiVg6MJh5N2FDjXOsPP16bZOs1m9juU1ZzEE
	 7y0BPIfOar2L4jQB1ZV8warjSJm2CUnY8DJkOVEvbGnfZbwuVgWrda6Da03dCY6E3X
	 KzJKQLNxf+6Maixf3NtDVtxEqbIyuZfjzP1VkyHkTFVC4J7HLepLhXHW+HnleL6ek2
	 eiM2xJ3YP11iA==
Date: Thu, 6 Aug 2026 14:11:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Peixin Xie <peixin.xie@linux.spacemit.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the pm tree with the risc-v tree
Message-ID: <anSH5R8s3L_Br-Zw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J6y4mvtw3VcBixf+"
Content-Disposition: inline


--J6y4mvtw3VcBixf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  arch/riscv/include/asm/acpi.h

between commit:

  286109eaee3d4 ("riscv: acpi: Handle LPI architectural context loss flags")

=66rom the risc-v tree and commit:

  704ce0039a629 ("ACPI: irq: Move RISC-V interrupt controllers autodep to A=
CPI IRQ code")

=66rom the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/include/asm/acpi.h
index 980aa11d77416,f598520ac9030..0000000000000
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@@ -69,23 -67,7 +69,24 @@@ int acpi_get_riscv_isa(struct acpi_tabl
 =20
  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_s=
ize,
  			     u32 *cboz_size, u32 *cbop_size);
+ acpi_handle acpi_get_riscv_gsi_handle(u32 gsi);
 +
 +/*
 + * RISC-V Functional Fixed Hardware Specification Version v1.0.1,
 + * Chapter 3.1.2, Table 4: Arch. Context Lost Flags
 + */
 +#define RISCV_LPI_HART_TIMER_CTXT_LOST		BIT(0)
 +
 +static inline unsigned int arch_get_idle_state_flags(u32 arch_flags)
 +{
 +	if (arch_flags & RISCV_LPI_HART_TIMER_CTXT_LOST)
 +		return CPUIDLE_FLAG_TIMER_STOP;
 +
 +	return 0;
 +}
 +
 +#define arch_get_idle_state_flags arch_get_idle_state_flags
 +
  #else
  static inline void acpi_init_rintc_map(void) { }
  static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)

--J6y4mvtw3VcBixf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0h+UACgkQJNaLcl1U
h9CrAgf/QTtGxtOuAf7jxUGFL0Txv3jWNvdVYPXJfvG/PyWPEzPPdvY10ipXy93Q
r7C38PCx6qRImx/Qryr8eWwtQu34M2OyO3hhei73CIEy8eWZoMgKnm59NaBUxO8t
HVPyN92N8rEk6SjzDuP5aJyavF+MOpJE80C4J4/Yz2HhQazMfS+Wr/EVVtIW+1CC
TfC6cLjTDOaZT+7F5JuMOedTlkkC815gayc5I7DICxc2SSMv5Uh9bFqcybQ2yDy6
p0CTmujMwljlat3mPUAD/nO92G7VVh7vaAXQUKVIhw9HQ5hx63kBi2Wy5JgialgW
vof6Kvn5njGou7Bn8wGrmttZuTiszg==
=aUlQ
-----END PGP SIGNATURE-----

--J6y4mvtw3VcBixf+--
