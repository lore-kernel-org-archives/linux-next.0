Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADAF2F28E3;
	Mon,  6 Apr 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481186; cv=none; b=NPoexJdc4lWAhFin8+ZGLCeHOl0xDGB2GnwSsFr/lUbmtd2jDqkxB4f9cfL0N0X4RtRuf6R7zYHghfcuVEhs6+XTgJri7mOaBEwdK4USW2G9+HS42FiAjIQWh6dAosQF/uhNm/ylMSvOE1QlEChc37QTVErrNLIKikGkMG8KVho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481186; c=relaxed/simple;
	bh=iGQshtb9en5Wo4qLfv3Twv7pXWYI95Boysan120G38g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6syptXqsoNvRtjpvDAD9Ve8C/hi1iCxCo0jAihW4Qb0taapQbjN9dEo+cMoX8ext1NTsMwjtbx0fa404upb2lqBFRPwH5G2VjBsHLIZvOQ0m6Y4tYMiUGVcUMlmaOsjSFFD+S/PulTco38frhoiMSR2kyewH6PqmwdALAOz/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tM30VazN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tM30VazN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E5CC4CEF7;
	Mon,  6 Apr 2026 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481185;
	bh=iGQshtb9en5Wo4qLfv3Twv7pXWYI95Boysan120G38g=;
	h=Date:From:To:Cc:Subject:From;
	b=tM30VazN5fx/4Kqi4Z9CpMmbEASfd+rHEha6IEhbJuEw3VvbqmpLwfU92ryr+9SRr
	 KeyiHxQ7sDecjdlJaE3sCT+d1696Jvz26H+YwdrXIqalmHZz1VJHDhYZdZmgJ/yDg3
	 tFtokSYY2dXrqwhcHB0ivmfjHGuWnL1rvN+ps4aoGwKxMugkjszaKoZxm5TSWmpZ6v
	 a5gOZVwnoyAXht7qTna5zjX9WJlKvlbCdjZekGQCKyntlfe1XcrFcH0gymoI6SUKM0
	 TE4dIBvl+m/IVq1wn+e7OHP694kYdMa/9hFe2vtIeeVgVPaftNzzkX3obDtLbZJZ0Y
	 Uxnjxjon1kQyA==
Date: Mon, 6 Apr 2026 14:13:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the origin tree
Message-ID: <adOxXnpJpmQk-opP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idUnWrcHmnfT8KNQ"
Content-Disposition: inline


--idUnWrcHmnfT8KNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/Makefile

between commit:

  dda135077ecc9 ("rust: build: remap path to avoid absolute path")

=66rom the origin tree and commit:

  8980db6e99870 ("rust: kbuild: remove `--remap-path-prefix` workarounds")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/Makefile
index 9801af2e1e027,866f9afc1b7f8..0000000000000
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -144,12 -145,7 +145,7 @@@ doctests_modifiers_workaround :=3D $(rust
  quiet_cmd_rustdoc =3D RUSTDOC $(if $(rustdoc_host),H, ) $<
        cmd_rustdoc =3D \
  	OBJTREE=3D$(abspath $(objtree)) \
- 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=3D% --remap-pa=
th-scope=3D%, \
- 			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 -	$(RUSTDOC) $(filter-out $(skip_flags),$(if $(rustdoc_host),$(rust_common=
_flags),$(rust_flags))) \
++	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=3D%,$(if $(rust=
doc_host),$(rust_common_flags),$(rust_flags))) \
  		$(rustc_target_flags) -L$(objtree)/$(obj) \
  		-Zunstable-options --generate-link-to-definition \
  		--output $(rustdoc_output) \
@@@ -335,7 -329,7 +329,7 @@@ quiet_cmd_rustdoc_test_kernel =3D RUSTDO
  	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
  	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
  	OBJTREE=3D$(abspath $(objtree)) \
- 	$(RUSTDOC) --test $(filter-out --remap-path-prefix=3D% --remap-path-scop=
e=3D%,$(rust_flags)) \
 -	$(RUSTDOC) --test $(rust_flags) \
++	$(RUSTDOC) --test $(filter-out --remap-path-scope=3D%,$(rust_flags)) \
  		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
  		--extern kernel --extern build_error --extern macros \
  		--extern bindings --extern uapi \

--idUnWrcHmnfT8KNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTsV0ACgkQJNaLcl1U
h9DG0wf+KSRQRiZP5KIKonkpPEXnlpxb3SqV9jctEveok6EM9Slfta2m1b9ofZfp
gB0/7yelJ+BbCC2uxBSdwaG8d/hG3plSRc3lL8zshTyQh/1TVhHD4MoKo+pKa/Ob
A7JmV/Q6b8GaHGg1kr1e3wCNZfGAtCQ6sIN7Cu5y8+FX21JtIJkYxzomXQWEDMIg
n4BggPAnssiJrCv3CZ2sT+8xMWq16TGreNBlAYNg5qTI2hwyWFzaYJxy5LVJdGXq
QvHvNJKsFWvITv36VAUZxLBkPbrCZRFnio2Rc7QGIviH/N6F27KRWIuMgRkQlbjD
oNFKxVXoDUynOAic72o9w3hdJDHlQQ==
=RORs
-----END PGP SIGNATURE-----

--idUnWrcHmnfT8KNQ--
