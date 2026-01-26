Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DDC3BB4A;
	Mon, 26 Jan 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440292; cv=none; b=PXKEv+dcejOhAesTFSP8Zgpk/DzXdGBQWFQU2g734gqX4zC7Q9OtWkXGOWujUd2qxIIdrpY9s4NlPKUmjX0umBtqdO1cgA7vWIkg+/li1S2tWiLF4UQG+qP74S8JCiF+a4v99LqE3aWzDWcDIxUKMlXfg5v9+mm6d7BiDnRzOQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440292; c=relaxed/simple;
	bh=CMUVPHQgyak2qkCnA1vc8HlwwcuEG/jWYQymaALXYyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STzFFnsycgjUpFrhzk2vXGuc1lqvGYP+TFvk4lCBiuw902YIlx2y8y3vUNztywObQNv+2mxDRm8JTm+gPK0wLkmVrq4SM6s+HMGjUVGOGpMTv/z824jyP8tdKZVkSR01lpZO5aOCwgDqwdshJCHyTiE4rvhPL7sMhh0Vynp49Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+gGebG5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+gGebG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BC7C116C6;
	Mon, 26 Jan 2026 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769440291;
	bh=CMUVPHQgyak2qkCnA1vc8HlwwcuEG/jWYQymaALXYyc=;
	h=Date:From:To:Cc:Subject:From;
	b=d+gGebG5rgwg3sTX6kB241KVmHve9H+Pi+JyfQPLsHKeq6ote7jmnDLcalyeMynum
	 zK1K5Fv8FARVYoO2y6O4lygiuXPnbJ1fCg6vErkfJKqQsZ8GquizVAL3veWNvCstbO
	 1PnmijLVCQRBfFNTUfE5m5NHuZWVZcSuRWwAeGeafN95Kxmc8ePmjD20wfSypYq6At
	 iWcr8Ro0hdJIVYAzizXGtOzRGXxkohUJC0+Or2GguX+q8xthT9h9IHI1ZeGojiZKrV
	 sIuwpDWnXh+iUgRBTQkgPCGjwqpi9vOTnHpURx7IcZKOLtTUJeF0tNPWbvou/5Aorq
	 tBxhHBN3kv7VA==
Date: Mon, 26 Jan 2026 15:11:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <aXeEH-iffNS9VIrA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9pK6D3erwauqQBvw"
Content-Disposition: inline


--9pK6D3erwauqQBvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kvm/hyp/entry.S

between commit:

  86364832ba6f2 ("KVM: arm64: Don't blindly set set PSTATE.PAN on guest exi=
t")

=66rom the origin tree and commit:

  018a231b0260e ("arm64: Unconditionally enable PAN support")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Took the version from Linus' tree.]

--9pK6D3erwauqQBvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3hB4ACgkQJNaLcl1U
h9Arpgf9G3kxvbPB8GNAv/ivXqrpfhA1NMMyqGsyrWjwYQmclq5QyePvYLZJYf1P
rGk/8GGfa0Sdpyf/6cXVDfSjjc/dLeTudvSxgOWLfR1YedFeBuQggIUcWNFLAc0N
7Y4zR6gEtRrm35STAULnSJvJ2n0nQ5MjNM5Ma5n6JyBNKg61G/axXQQsJ8rwI7Tx
7jbw8IjZILAjW8QhoUvOgd1TP0a4v08t6NcYQcdmTfyUKpUxxTfmZY92PwOH9AVN
B0988cMM5RMeruvMr3h+1kHuRYb83p/1pcpqsNht0fH30y3GEe/igCkxqqyYJ22U
Vv664nCBIbVr5IeDbMG1byenwtzyDQ==
=PM90
-----END PGP SIGNATURE-----

--9pK6D3erwauqQBvw--
