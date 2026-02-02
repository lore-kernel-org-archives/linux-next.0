Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C536D51E;
	Mon,  2 Feb 2026 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042619; cv=none; b=d1VH+WM716AnJErIILZxGF7nLp6OKXCqispO4cl/DiwFgacrce4HgyO4jwluw40uPxZWi+8R2yCjmiiZx6Fnx+8GwScWywsoIMhR1FNYoD7UKjfU33kwh297NbLBLC6j+5kuGcQinDKlwA26vTX73aPkYvWSR31kXRFDa2lI01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042619; c=relaxed/simple;
	bh=D1dbk0VFiLgCUx3q7No2yBY7EzHRSWg6ldmMlTc02gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7snXyHQ7Y2lIR/H6vHBUF2CVjdIHmd96eZY7TSjoviqpzRi2QWitzjhD5Bz2x3xHVV1HMM8W66Kup8wIdTT9dXuMgFmU4TivTJtDOIgxsWUaYOYFGg5MDHk3WcZr1B/ZzK9IuQHCKeRPgoUiyigHiDAvq2USrrEcbktAeemDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZ8UDnx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZ8UDnx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B5EC2BCF6;
	Mon,  2 Feb 2026 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770042618;
	bh=D1dbk0VFiLgCUx3q7No2yBY7EzHRSWg6ldmMlTc02gc=;
	h=Date:From:To:Cc:Subject:From;
	b=RZ8UDnx0iPUd9CKeZ0qmTvtHXBYoRBpRN8O34ZTZHw6ffj6cIEcve3qolvi/5VU0p
	 Yfcs0QSLfTJ6nrBPAy3K3nu+S1oTjuvdMHWsiy7Vd6DDrU7sWB82YPAjRz6C0QSP10
	 xySkT0WlevFIpuY3w4JQzLol0AbQ3eiIOyGFqxzlr3HLLdbR7J9YJcif7Fzwa11Xno
	 qT1WnU8PpXAi6PCqud4m10MYUpJpfwxo49ASzWLJZYwLpvXxM2ak6acgjn8K3Dq0hs
	 ZFpFw85AUOjpB7lTyHvX41SPVuz3CyFDeu+xA8KJ+Ao/WJ5mT1vFv7nMddtnW/m8Ba
	 +QoTmIYvmczLw==
Date: Mon, 2 Feb 2026 14:30:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the bpf-next tree
Message-ID: <aYC09rYDOvkNNOaA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/R5sBwaMyJ7MhrQt"
Content-Disposition: inline


--/R5sBwaMyJ7MhrQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/bpf_trace.c

between commit:

  93f0d09697613 ("bpf: move recursion detection logic to helpers")

=66rom the bpf-next tree and commit:

  f7d327654b886 ("bpf: Have __bpf_trace_run() use rcu_read_lock_dont_migrat=
e()")

=66rom the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/trace/bpf_trace.c
index f7baeb8278cac,abbf0177ad20b..0000000000000
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@@ -2076,8 -2062,8 +2076,8 @@@ void __bpf_trace_run(struct bpf_raw_tp_
  	struct bpf_run_ctx *old_run_ctx;
  	struct bpf_trace_run_ctx run_ctx;
 =20
- 	cant_sleep();
+ 	rcu_read_lock_dont_migrate();
 -	if (unlikely(this_cpu_inc_return(*(prog->active)) !=3D 1)) {
 +	if (unlikely(!bpf_prog_get_recursion_context(prog))) {
  		bpf_prog_inc_misses_counter(prog);
  		goto out;
  	}
@@@ -2090,8 -2075,8 +2089,8 @@@
 =20
  	bpf_reset_run_ctx(old_run_ctx);
  out:
 -	this_cpu_dec(*(prog->active));
 +	bpf_prog_put_recursion_context(prog);
+ 	rcu_read_unlock_migrate();
  }
 =20
  #define UNPACK(...)			__VA_ARGS__

--/R5sBwaMyJ7MhrQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAtPUACgkQJNaLcl1U
h9CwPQf9H42nP8Kc8HgMO25k8BG7s278+vqpklf36Y/sRDk/62p+x3jTTR5x5Xq1
RyNlHZTLXJGNT5AZdUJmsAJ7f+7oN/8MmcCVWTLT6f6MV0PJi4QCCNhNB7EF1dRf
6bzpMQ62Q9Ux3oqMWoeuJXptROuUATv7lIZwSth0hRu6H2Jbm3sCGZNfJ8s0BDWw
bIu6QXXAzqCv/PHk7zeqyDxQ8dkh+ESVNyHiT3gVzuxWwe+IXLxpofQbIAS6yi3J
PmBEDg3I8Qx/Cs7rbuGaQpJmZlMa6ozR3XZVdceVCwlmIj3wws6T7aySnXAm6WIJ
FaBufMP5EAiLBM2EEGErrDXmDDVJpw==
=TANY
-----END PGP SIGNATURE-----

--/R5sBwaMyJ7MhrQt--
