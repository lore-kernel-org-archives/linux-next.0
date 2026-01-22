Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879D301037;
	Thu, 22 Jan 2026 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095950; cv=none; b=emljpBJV4iNzZMK6S80i5BvTj7CiAavNIt0oTANdWEVHhScg3HCd2osVObFdkTMyvHtYoswmFAfYSGKGh8oWhFu5hOO7jNk7y2Wa9uaoail+pQD+nma9QSAsAr6bIVRDMxFjkvRSwFaHv4rTcs7EHleefeqE79smfQA37pKCt5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095950; c=relaxed/simple;
	bh=InSVCFIT33w5N1L2S3/jWSoV1YUJDJjL/FhmzXEUTAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TeLBdpHz5sxa3P6fhqjDIqhigtJR9rAVU/t1k1kp13DX4aEnkQ6A1cfHrzO3WDuAKpHFpqhzD/hai1jml/4VhW8KIU9qOZWlb+LMPZgZVf/OmDeewfY6txzitJJLKL4i75j9TaQT3llnzaqmJ+JRRIKEJgHUtbZugCofptBTTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QA2BJ+Kf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QA2BJ+Kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF816C116C6;
	Thu, 22 Jan 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769095949;
	bh=InSVCFIT33w5N1L2S3/jWSoV1YUJDJjL/FhmzXEUTAM=;
	h=Date:From:To:Cc:Subject:From;
	b=QA2BJ+Kf1MuCLvN6mGncJlArYycgepkoxLkbD8O0+aUouVn8bGFZa/ze73/XCxC7C
	 k4mPATuOD1NqyBZA4LEHt2FWks/bTZiVzJvgj1t4Px6nfTelkkeHxhNoRc4ZldODE8
	 DeUwstsUYV0iMx9b30tuTQuIVPcQ/T8Y1Wx6vZaVcADFfgwZrxNLDpPTl3lQac2Jx/
	 4NVb8PnVwQllmMN991cLOT/LC5dHeT0VQJqONMGeWSJJ5TEW/JfWuhDQkqKF66L4Sb
	 BVosBZnKGu7NZbrEO6Tt5l9z1g4xgsmemkAHivvLUtDWou2a1X2og1bwtjNl1Gv631
	 0A2MR442FKuzw==
Date: Thu, 22 Jan 2026 15:32:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the risc-v tree
Message-ID: <aXJDCUstU1SYL0Rg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nWttR+PKXLhkG+CY"
Content-Disposition: inline


--nWttR+PKXLhkG+CY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  include/uapi/linux/prctl.h
  kernel/sys.c

between commit:

  d3d1efd48b3b6 ("prctl: add arch-agnostic prctl()s for indirect branch tra=
cking")

=66rom the risc-v tree and commit:

  28621ec2d46c6 ("rseq: Add prctl() to enable time slice extensions")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/uapi/linux/prctl.h
index f57098fb0ba8b,79944b7ae50aa..0000000000000
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@@ -386,31 -386,14 +386,41 @@@ struct prctl_mm_map=20
  # define PR_FUTEX_HASH_SET_SLOTS	1
  # define PR_FUTEX_HASH_GET_SLOTS	2
 =20
 +/*
 + * Get the current indirect branch tracking configuration for the current
 + * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATU=
S.
 + */
 +#define PR_GET_INDIR_BR_LP_STATUS      79
 +
 +/*
 + * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE =
will
 + * enable cpu feature for user thread, to track all indirect branches and=
 ensure
 + * they land on arch defined landing pad instruction.
 + * x86 - If enabled, an indirect branch must land on an ENDBRANCH instruc=
tion.
 + * arch64 - If enabled, an indirect branch must land on a BTI instruction.
 + * riscv - If enabled, an indirect branch must land on an lpad instructio=
n.
 + * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indire=
ct
 + * branches will no more be tracked by cpu to land on arch defined landin=
g pad
 + * instruction.
 + */
 +#define PR_SET_INDIR_BR_LP_STATUS      80
 +# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
 +
 +/*
 + * Prevent further changes to the specified indirect branch tracking
 + * configuration.  All bits may be locked via this call, including
 + * undefined bits.
 + */
 +#define PR_LOCK_INDIR_BR_LP_STATUS      81
 +
+ /* RSEQ time slice extensions */
 -#define PR_RSEQ_SLICE_EXTENSION			79
++#define PR_RSEQ_SLICE_EXTENSION			82
+ # define PR_RSEQ_SLICE_EXTENSION_GET		1
+ # define PR_RSEQ_SLICE_EXTENSION_SET		2
+ /*
+  * Bits for RSEQ_SLICE_EXTENSION_GET/SET
+  * PR_RSEQ_SLICE_EXT_ENABLE:	Enable
+  */
+ # define PR_RSEQ_SLICE_EXT_ENABLE		0x01
+=20
  #endif /* _LINUX_PRCTL_H */
diff --cc kernel/sys.c
index 9071422c16096,35ea9d79a42e4..0000000000000
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@@ -2883,21 -2868,11 +2883,26 @@@ SYSCALL_DEFINE5(prctl, int, option, uns
  	case PR_FUTEX_HASH:
  		error =3D futex_hash_prctl(arg2, arg3, arg4);
  		break;
 +	case PR_GET_INDIR_BR_LP_STATUS:
 +		if (arg3 || arg4 || arg5)
 +			return -EINVAL;
 +		error =3D arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
 +		break;
 +	case PR_SET_INDIR_BR_LP_STATUS:
 +		if (arg3 || arg4 || arg5)
 +			return -EINVAL;
 +		error =3D arch_set_indir_br_lp_status(me, arg2);
 +		break;
 +	case PR_LOCK_INDIR_BR_LP_STATUS:
 +		if (arg3 || arg4 || arg5)
 +			return -EINVAL;
 +		error =3D arch_lock_indir_br_lp_status(me, arg2);
 +		break;
+ 	case PR_RSEQ_SLICE_EXTENSION:
+ 		if (arg4 || arg5)
+ 			return -EINVAL;
+ 		error =3D rseq_slice_extension_prctl(arg2, arg3);
+ 		break;
  	default:
  		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
  		error =3D -EINVAL;

--nWttR+PKXLhkG+CY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyQwgACgkQJNaLcl1U
h9D+swf+OcI9F9cP/x8xFUUVBZ5fF6mmETigTaZQqiIpi7CtuBr5omyFRt6BdMe+
nsx42t4sj8gPwoWKdsJf1tRIt/9WFUV6ITNVY453uPc0344HNrUC4SHBmIa48a4L
ia+Vlz397q0JJHDlqBHC5pM6TYf36zaTQuuMRP7DgwIpJC97swlmI1qxAapQLuMZ
eGvTVSQ/nSSRqm4+Be7QseGsspJOkjFIQ1Ynp8bwSbUiTzXWNU41NV1UBEMoL7C+
4zgv31zAMrgHLkvuWkeOIpBVa7pj6AjHGgIJla+QHD+ECDk0/WPNzcSdZ8Y3d3ai
SZKCfyfKNbXXJlUJ1rIn31Wtbfq9bA==
=D7eP
-----END PGP SIGNATURE-----

--nWttR+PKXLhkG+CY--
