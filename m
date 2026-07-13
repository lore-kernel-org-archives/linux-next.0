Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D2233927;
	Mon, 13 Jul 2026 17:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783964918; cv=none; b=aw103HD18fOEllyC5O8Ponrv1vgkxg0MCPq66eK+6iZNjQiDZZM3eSlUen2cvdKWaPqR/cGBHVzq9QKB6j6G1mfZA2e9zhFgkkrJQ3nm6/eRde8pUGTCukdZbxw5jhoLrNcMXbSIwFUDsQLov2kwhCQQa+TnOcWYFarhQ7ZyjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783964918; c=relaxed/simple;
	bh=3QPIuUInfY/d/Prhg4EcXBK9czSVJwNskRsmn//elB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoqZBK2rSbtvHfhbTpJjxTaT1qxYULLH+j2hnmlBzCWCi+j3rdICDBPncTDdF8Ikw+B4k5cr6RlSD6ZB3bDTWzo63fd/et+50SrRlk0/MDwMHqGn11hiHy/ydQHjk7Y3R48v+Ltc1TD10Aa+rPrKTn9FvBPW43dVfoRXZYD7lKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyKUmCoH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyKUmCoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2124C1F00A3A;
	Mon, 13 Jul 2026 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964916;
	bh=Jk1a7tl0upPDlDo+2eAg4Ep5cOLoYzgg3ARLAnQf5zQ=;
	h=Date:From:To:Cc:Subject;
	b=CyKUmCoHe+F0RmSxIVfnov5M3fsWfRr+DECBTyBDKDYYY1J6aipNtRIg4rVhHNuTO
	 IQ6ifKKn6c9OgRQGW/YziIs/gg9OJB22ulMPYaHQFJNbtW5ZgeYHc3LLJHwn+aVYkp
	 j56257PKhLMst8YXcWCxrVuNR+mtS6NGGeSk54hWdx8qdCdbur1nLlioktCOihLs03
	 W2CJl+8Eaj/76WPRYfYHbvp3eI8PZYJeRUNcyMn30OynaU6BzJPFCeZno1PpXBmUxL
	 VMjywM8tCVEnp4s3MW310y8QQyFKFkgowoEQdsA2nqbOonjrrEIQnbgF3k7mgClhn7
	 yFJJw70DtRjEw==
Date: Mon, 13 Jul 2026 18:48:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <alUk8OTfE-f9oQo8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EQSMrb3Bv6iMuyJ1"
Content-Disposition: inline


--EQSMrb3Bv6iMuyJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final builds, today's linux-next build (arm64 allyesconfig)
failed like this:

/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:105:5: error: no previous
prototype for 'write_ulpi' [-Werror=missing-prototypes]
  105 | int write_ulpi(u8 addr, u8 data)
      |     ^~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:118:6: error: no previous
prototype for 'fsl_otg_chrg_vbus' [-Werror=missing-prototypes]
  118 | void fsl_otg_chrg_vbus(struct otg_fsm *fsm, int on)
      |      ^~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:136:6: error: no previous
prototype for 'fsl_otg_dischrg_vbus' [-Werror=missing-prototypes]
  136 | void fsl_otg_dischrg_vbus(int on)
      |      ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:154:6: error: no previous
prototype for 'fsl_otg_drv_vbus' [-Werror=missing-prototypes]
  154 | void fsl_otg_drv_vbus(struct otg_fsm *fsm, int on)
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:172:6: error: no previous
prototype for 'fsl_otg_loc_conn' [-Werror=missing-prototypes]
  172 | void fsl_otg_loc_conn(struct otg_fsm *fsm, int on)
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:191:6: error: no previous
prototype for 'fsl_otg_loc_sof' [-Werror=missing-prototypes]
  191 | void fsl_otg_loc_sof(struct otg_fsm *fsm, int on)
      |      ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:206:6: error: no previous
prototype for 'fsl_otg_start_pulse' [-Werror=missing-prototypes]
  206 | void fsl_otg_start_pulse(struct otg_fsm *fsm)
      |      ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:222:6: error: no previous
prototype for 'b_data_pulse_end' [-Werror=missing-prototypes]
  222 | void b_data_pulse_end(unsigned long foo)
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:241:6: error: no previous
prototype for 'b_vbus_pulse_end' [-Werror=missing-prototypes]
  241 | void b_vbus_pulse_end(unsigned long foo)
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:254:6: error: no previous
prototype for 'b_srp_end' [-Werror=missing-prototypes]
  254 | void b_srp_end(unsigned long foo)
      |      ^~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:269:6: error: no previous
prototype for 'a_wait_enum' [-Werror=missing-prototypes]
  269 | void a_wait_enum(unsigned long foo)
      |      ^~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:279:6: error: no previous
prototype for 'set_tmout' [-Werror=missing-prototypes]
  279 | void set_tmout(unsigned long indicator)
      |      ^~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:285:5: error: no previous
prototype for 'fsl_otg_init_timers' [-Werror=missing-prototypes]
  285 | int fsl_otg_init_timers(struct otg_fsm *fsm)
      |     ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:342:6: error: no previous
prototype for 'fsl_otg_uninit_timers' [-Werror=missing-prototypes]
  342 | void fsl_otg_uninit_timers(void)
      |      ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:446:6: error: no previous
prototype for 'otg_reset_controller' [-Werror=missing-prototypes]
  446 | void otg_reset_controller(void)
      |      ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:458:5: error: no previous
prototype for 'fsl_otg_start_host' [-Werror=missing-prototypes]
  458 | int fsl_otg_start_host(struct otg_fsm *fsm, int on)
      |     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:525:5: error: no previous
prototype for 'fsl_otg_start_gadget' [-Werror=missing-prototypes]
  525 | int fsl_otg_start_gadget(struct otg_fsm *fsm, int on)
      |     ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:707:13: error: no previous
prototype for 'fsl_otg_isr' [-Werror=missing-prototypes]
  707 | irqreturn_t fsl_otg_isr(int irq, void *dev_id)
      |             ^~~~~~~~~~~
/tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:833:5: error: no previous
prototype for 'usb_otg_start' [-Werror=missing-prototypes]
  833 | int usb_otg_start(struct platform_device *pdev)
      |     ^~~~~~~~~~~~~
cc1: all warnings being treated as errors make[6]:

It looks like this is a change in dependencies which has allowed this to
be built from today, I didn't isolate exactly what - it looks like the
issue is missing statics on all these function definitions, making them
global.  I have ignored this for today.

--EQSMrb3Bv6iMuyJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVJPAACgkQJNaLcl1U
h9A+Ngf/eax7xQgatwmAzQApIWFTXl6URn2s07lja6OFHBi86d1xEqDN3N88YNlK
IdMge+b/w41B3x60A0huPg6ImBPBWmLbpSzP5NJoOcEMmhEySz/sb4+MRHhkBuzb
1lxI0M4f8kA+Hh31kRQ8tG8ecMkWQRpPI9FyNfmscPpTlcESdQ1cYaRAOF6RInG9
e93+qmZe3Rrro//FEPPKDcXbnnIlpxYU4HPxhCedY4U4Krf5WWGP80iOzAKXskiJ
CZY8OBLy7stavZ2nQvlvk18tDNlvO+YeseWpyOlkCyustGOyb3LPhfTx3UgzpIwU
Z9a4Edsuz1krkpT5hNH5f44E7r8awA==
=OTq4
-----END PGP SIGNATURE-----

--EQSMrb3Bv6iMuyJ1--
