Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC382BE630;
	Fri, 17 Jul 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296090; cv=none; b=tx1nMffoeiQLTJoFF94Q4jAI7Wp/oSQN2TIiG2vALaoNgho+gYneqG95HSJ2njrlscTEvmEYIV5UQzOu92eIyGT+nM3iqmloNpOUwnFHkpGVhf3K6mIUvvgFHHAl+3D8ic5Y8bvqTTtS+rlBDv71IC+KBYifekcxD5DohU0HIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296090; c=relaxed/simple;
	bh=KSKuhoDClEYO5/6T4QjXGUn6F+0/3N3YFpunw7Edj2c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MyHw/ZozKelD3qJ4FfiZx55Xs6SRLKH/z+XeAEYXH0L1iF3aKz8GGl7Uj3sj6d4Q98SbR9iGmQL/5J5ToyOq+jwLYW93tOCbw7S5gLmQUpxH2Ukfp6ftEB1tqRiNCnCxJtWbXqyWdlCYinu1+AhGEKEyw7j0Rceiz0fS0M9llUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p1SiIe8r; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="p1SiIe8r"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h1rp62HJzzMlKJ;
	Fri, 17 Jul 2026 15:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784296078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSKuhoDClEYO5/6T4QjXGUn6F+0/3N3YFpunw7Edj2c=;
	b=p1SiIe8regPhS7ja1NkUyszNOUEnIZYaSNFHJY0pZjUJnzWQp+kV1/RrW3OPk4dL49u3C+
	1sIGirdwBktqEDQlK3KES8RrGW9iGT7NoysT6g65NOuN+SoHox3SYw6r2mWg+hESPYknu5
	c3ZCQCUdH6iQ4f4NnlACi3teFkUcuNX3gzwM2knWOc6AIVsAqQxhTJpdha+OB6JB9Lnj99
	aTr70ad8bhRknvxaYtghsNlq6RfseSAykkIgDjvOc1f9eF5ZKB6ErNE5B5QEQiGmZZL+SZ
	jSwYfdx0lPQEgT+/vcaEsiTZkGHV7qCX9D10N6ETQRG4suowI/EcjK4TPns02Q==
Message-ID: <c2fe4a81c639cddb65116d9b3526e82206927c0d.camel@mailbox.org>
Subject: Re: linux-next: build failure in the final build
From: Manuel Ebner <manuelebner@mailbox.org>
To: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Fri, 17 Jul 2026 15:47:55 +0200
In-Reply-To: <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
References: <alUk8OTfE-f9oQo8@sirena.org.uk>
	 <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: e64018cff395c29e039
X-MBO-RS-META: qrghxa164zqch3gck6du8mj9yrgcptyg

Hi Mark,=C2=A0

On Wed, 2026-07-15 at 16:37 +0100, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 06:48:32PM +0100, Mark Brown wrote:
> > Hi all,
> >=20
> > In the final builds, today's linux-next build (arm64 allyesconfig)
> > failed like this:
>=20
> This error is due to a71f5aef1be98 (USB: gadget: fsl-udc: enable compile
> testing) from the usb tree, a dependency change as expected.=C2=A0 I'll d=
o
> something about this tomorrow.

I stumbled across the same build errors. Are you still on this?

best regarsds
 Manuel Ebner

>=20
> >=20
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:105:5: error: no previous
> > prototype for 'write_ulpi' [-Werror=3Dmissing-prototypes]
> > =C2=A0 105 | int write_ulpi(u8 addr, u8 data)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:118:6: error: no previous
> > prototype for 'fsl_otg_chrg_vbus' [-Werror=3Dmissing-prototypes]
> > =C2=A0 118 | void fsl_otg_chrg_vbus(struct otg_fsm *fsm, int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:136:6: error: no previous
> > prototype for 'fsl_otg_dischrg_vbus' [-Werror=3Dmissing-prototypes]
> > =C2=A0 136 | void fsl_otg_dischrg_vbus(int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:154:6: error: no previous
> > prototype for 'fsl_otg_drv_vbus' [-Werror=3Dmissing-prototypes]
> > =C2=A0 154 | void fsl_otg_drv_vbus(struct otg_fsm *fsm, int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:172:6: error: no previous
> > prototype for 'fsl_otg_loc_conn' [-Werror=3Dmissing-prototypes]
> > =C2=A0 172 | void fsl_otg_loc_conn(struct otg_fsm *fsm, int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:191:6: error: no previous
> > prototype for 'fsl_otg_loc_sof' [-Werror=3Dmissing-prototypes]
> > =C2=A0 191 | void fsl_otg_loc_sof(struct otg_fsm *fsm, int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:206:6: error: no previous
> > prototype for 'fsl_otg_start_pulse' [-Werror=3Dmissing-prototypes]
> > =C2=A0 206 | void fsl_otg_start_pulse(struct otg_fsm *fsm)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:222:6: error: no previous
> > prototype for 'b_data_pulse_end' [-Werror=3Dmissing-prototypes]
> > =C2=A0 222 | void b_data_pulse_end(unsigned long foo)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:241:6: error: no previous
> > prototype for 'b_vbus_pulse_end' [-Werror=3Dmissing-prototypes]
> > =C2=A0 241 | void b_vbus_pulse_end(unsigned long foo)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:254:6: error: no previous
> > prototype for 'b_srp_end' [-Werror=3Dmissing-prototypes]
> > =C2=A0 254 | void b_srp_end(unsigned long foo)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:269:6: error: no previous
> > prototype for 'a_wait_enum' [-Werror=3Dmissing-prototypes]
> > =C2=A0 269 | void a_wait_enum(unsigned long foo)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:279:6: error: no previous
> > prototype for 'set_tmout' [-Werror=3Dmissing-prototypes]
> > =C2=A0 279 | void set_tmout(unsigned long indicator)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:285:5: error: no previous
> > prototype for 'fsl_otg_init_timers' [-Werror=3Dmissing-prototypes]
> > =C2=A0 285 | int fsl_otg_init_timers(struct otg_fsm *fsm)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~=
~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:342:6: error: no previous
> > prototype for 'fsl_otg_uninit_timers' [-Werror=3Dmissing-prototypes]
> > =C2=A0 342 | void fsl_otg_uninit_timers(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:446:6: error: no previous
> > prototype for 'otg_reset_controller' [-Werror=3Dmissing-prototypes]
> > =C2=A0 446 | void otg_reset_controller(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:458:5: error: no previous
> > prototype for 'fsl_otg_start_host' [-Werror=3Dmissing-prototypes]
> > =C2=A0 458 | int fsl_otg_start_host(struct otg_fsm *fsm, int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~=
~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:525:5: error: no previous
> > prototype for 'fsl_otg_start_gadget' [-Werror=3Dmissing-prototypes]
> > =C2=A0 525 | int fsl_otg_start_gadget(struct otg_fsm *fsm, int on)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~=
~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:707:13: error: no previou=
s
> > prototype for 'fsl_otg_isr' [-Werror=3Dmissing-prototypes]
> > =C2=A0 707 | irqreturn_t fsl_otg_isr(int irq, void *dev_id)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~
> > /tmp/next/build/drivers/usb/phy/phy-fsl-usb.c:833:5: error: no previous
> > prototype for 'usb_otg_start' [-Werror=3Dmissing-prototypes]
> > =C2=A0 833 | int usb_otg_start(struct platform_device *pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~
> > cc1: all warnings being treated as errors make[6]:
> >=20
> > It looks like this is a change in dependencies which has allowed this t=
o
> > be built from today, I didn't isolate exactly what - it looks like the
> > issue is missing statics on all these function definitions, making them
> > global.=C2=A0 I have ignored this for today.
>=20
