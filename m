Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17817481FD8;
	Wed, 15 Jul 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129850; cv=none; b=Pt3sh2ogrAFumcTJbadhnmnqCEUEUOcVkPY4SeoFvYN3nKSXdfQr3Q8MqmQ4E+ChOpNLh8C2CO+FAuzW6kCfexR+o5G2IkzkNEm78nADlMhcwwNGQUnAnhSzlkDpOCtAB2z71jiqrfrd2M0fMqiQB/iL4Ium76v8q11khno+aGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129850; c=relaxed/simple;
	bh=8iD2RbmucAvDO/he4I3TULjFMPlp3h823LjA4PUEqC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0QAFyQhMnEE5CUZwvptoEUvpkKZhjg/DWNOG7nDfC6FnmUwu1MXEUUG2O9JxsX8hjZwogwlPs3sZMOR3Q4Lzfp3WBEBp9taMIO5q9akRi13KsWfs4pAxJiOX0scqlLjKmVg4F7opk91J2fojGRedoH8IcXrFXlKIbfmj7pLvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jk3ugkRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jk3ugkRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1AD1F000E9;
	Wed, 15 Jul 2026 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784129848;
	bh=E91WlkmxyBCa/BCn7Et7Cn3czzZjBm3ELtqoA4JVFMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jk3ugkRQYX8oX3+aefOuwh9c6QzedmtH0muJg3IUftHDiohTR+S9XWHBGhnoCeRUC
	 qyjqop+DQr9DzN7/Zgu1V68QOaxcogsjW+V3vF+8ADj1JiW0LHQZokHkwdSqY/R3i/
	 pot3amOnNg/51gWGAYtgoswBKIhD5ZX4NkqRt3jIOMpSzNqQyeser78u3/vvfm/kSM
	 4lhaHZHScQIei82Wb+GnAVXEe9DhGMShERR0LXLOI2A2ZgfYZQnqpZ9X5/aO2VXjBM
	 uY+V5RjvUtEa4uS+KClXEVFyfxQV3olTztKYzQd7vq9VdudGCgjzIv3lgQGvdlbOM4
	 8eQnzIXrgfHOA==
Date: Wed, 15 Jul 2026 16:37:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
References: <alUk8OTfE-f9oQo8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fu0Wn9d4q/B4YP6F"
Content-Disposition: inline
In-Reply-To: <alUk8OTfE-f9oQo8@sirena.org.uk>
X-Cookie: "Speed is subsittute fo accurancy."


--Fu0Wn9d4q/B4YP6F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 06:48:32PM +0100, Mark Brown wrote:
> Hi all,
>=20
> In the final builds, today's linux-next build (arm64 allyesconfig)
> failed like this:

This error is due to a71f5aef1be98 (USB: gadget: fsl-udc: enable compile
testing) from the usb tree, a dependency change as expected.  I'll do
something about this tomorrow.

>=20
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:105:5: error: no previous
> prototype for 'write_ulpi' [-Werror=3Dmissing-prototypes]
>   105 | int write_ulpi(u8 addr, u8 data)
>       |     ^~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:118:6: error: no previous
> prototype for 'fsl_otg_chrg_vbus' [-Werror=3Dmissing-prototypes]
>   118 | void fsl_otg_chrg_vbus(struct otg_fsm *fsm, int on)
>       |      ^~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:136:6: error: no previous
> prototype for 'fsl_otg_dischrg_vbus' [-Werror=3Dmissing-prototypes]
>   136 | void fsl_otg_dischrg_vbus(int on)
>       |      ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:154:6: error: no previous
> prototype for 'fsl_otg_drv_vbus' [-Werror=3Dmissing-prototypes]
>   154 | void fsl_otg_drv_vbus(struct otg_fsm *fsm, int on)
>       |      ^~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:172:6: error: no previous
> prototype for 'fsl_otg_loc_conn' [-Werror=3Dmissing-prototypes]
>   172 | void fsl_otg_loc_conn(struct otg_fsm *fsm, int on)
>       |      ^~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:191:6: error: no previous
> prototype for 'fsl_otg_loc_sof' [-Werror=3Dmissing-prototypes]
>   191 | void fsl_otg_loc_sof(struct otg_fsm *fsm, int on)
>       |      ^~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:206:6: error: no previous
> prototype for 'fsl_otg_start_pulse' [-Werror=3Dmissing-prototypes]
>   206 | void fsl_otg_start_pulse(struct otg_fsm *fsm)
>       |      ^~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:222:6: error: no previous
> prototype for 'b_data_pulse_end' [-Werror=3Dmissing-prototypes]
>   222 | void b_data_pulse_end(unsigned long foo)
>       |      ^~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:241:6: error: no previous
> prototype for 'b_vbus_pulse_end' [-Werror=3Dmissing-prototypes]
>   241 | void b_vbus_pulse_end(unsigned long foo)
>       |      ^~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:254:6: error: no previous
> prototype for 'b_srp_end' [-Werror=3Dmissing-prototypes]
>   254 | void b_srp_end(unsigned long foo)
>       |      ^~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:269:6: error: no previous
> prototype for 'a_wait_enum' [-Werror=3Dmissing-prototypes]
>   269 | void a_wait_enum(unsigned long foo)
>       |      ^~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:279:6: error: no previous
> prototype for 'set_tmout' [-Werror=3Dmissing-prototypes]
>   279 | void set_tmout(unsigned long indicator)
>       |      ^~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:285:5: error: no previous
> prototype for 'fsl_otg_init_timers' [-Werror=3Dmissing-prototypes]
>   285 | int fsl_otg_init_timers(struct otg_fsm *fsm)
>       |     ^~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:342:6: error: no previous
> prototype for 'fsl_otg_uninit_timers' [-Werror=3Dmissing-prototypes]
>   342 | void fsl_otg_uninit_timers(void)
>       |      ^~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:446:6: error: no previous
> prototype for 'otg_reset_controller' [-Werror=3Dmissing-prototypes]
>   446 | void otg_reset_controller(void)
>       |      ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:458:5: error: no previous
> prototype for 'fsl_otg_start_host' [-Werror=3Dmissing-prototypes]
>   458 | int fsl_otg_start_host(struct otg_fsm *fsm, int on)
>       |     ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:525:5: error: no previous
> prototype for 'fsl_otg_start_gadget' [-Werror=3Dmissing-prototypes]
>   525 | int fsl_otg_start_gadget(struct otg_fsm *fsm, int on)
>       |     ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:707:13: error: no previous
> prototype for 'fsl_otg_isr' [-Werror=3Dmissing-prototypes]
>   707 | irqreturn_t fsl_otg_isr(int irq, void *dev_id)
>       |             ^~~~~~~~~~~
> /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:833:5: error: no previous
> prototype for 'usb_otg_start' [-Werror=3Dmissing-prototypes]
>   833 | int usb_otg_start(struct platform_device *pdev)
>       |     ^~~~~~~~~~~~~
> cc1: all warnings being treated as errors make[6]:
>=20
> It looks like this is a change in dependencies which has allowed this to
> be built from today, I didn't isolate exactly what - it looks like the
> issue is missing statics on all these function definitions, making them
> global.  I have ignored this for today.



--Fu0Wn9d4q/B4YP6F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXqTQACgkQJNaLcl1U
h9Al8gf+MOOSFZdSL3b0LcVl180zi/Mp8BpEGrLcW5lw+tDdpkx2UOgXqP1Otuon
9G7fZqKrXWGaBrwvpGEnJDKveUDD8m758wk76IR+NWuMb5mE0aeL0sPo+yf2xWyP
Hk+11VnBI/kVguIUxvyuq3YugLyWiYSG9fCBZ6RcyeJy+dr+wQCfdcTjmbaZyD+h
BgvMSwNF8hvrDXnihXBDZgQYdjz3P2F/E6ZZeO2PzBFIufDjkJGT15WfSXOGEF1/
iF5UJbhalN6OzNE6fyZPYjX9oZIT6p2Xo5uWZovvxXtSXHF+qmA7Je/789T6PRYB
E/eUDiAuxmxSajWgwkVOjURYLn6ViA==
=2A+X
-----END PGP SIGNATURE-----

--Fu0Wn9d4q/B4YP6F--
