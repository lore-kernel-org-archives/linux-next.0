From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150720 build: 1 failures 21 warnings (next-20150720)
Date: Mon, 20 Jul 2015 11:15:10 +0100
Message-ID: <20150720101510.GB11162@sirena.org.uk>
References: <E1ZH5pS-0005rv-Dg@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OU94pes+U1zVmu7Y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59856 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753757AbbGTKPR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2015 06:15:17 -0400
Content-Disposition: inline
In-Reply-To: <E1ZH5pS-0005rv-Dg@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chunyan Zhang <zhang.chunyan@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--OU94pes+U1zVmu7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2015 at 08:49:38AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to some implicit
definitions introduced in 1ac0bfba883ee2bf (Coresight: Add an interface
for supporting ETM3/4 Context ID tracing) which introduces dependencies
on sched.h but doesn't add an include of that header leading to problems
if it's not implicitly included by something else:

> 	arm-allmodconfig
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/sched.h:1899:21: error: static declaration of 'task_pid_nr' follows non-static declaration
> ../include/linux/sched.h:2427:28: error: conflicting types for 'find_task_by_vpid'
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:259:2: error: implicit declaration of function 'find_task_by_vpid' [-Werror=implicit-function-declaration]
> ../include/linux/coresight.h:261:3: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]

--OU94pes+U1zVmu7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVrMouAAoJECTWi3JdVIfQKxYH/jFGbanTnYXc+5TQx18rcNh2
UN2qTiw/wTbJslxGoN0VJvhhFk+HQwixWSdYizUN/JaNhic5sdVl4l8mZWz+WpIJ
sLQoKAzuXqT/vHTDJtS1OuS0qqGf6fA6qyNSkQSiLPxYAEXPXvdYzK9lauROBuQC
2Lb7AWSquElSQZbxnIiMknz/V0dFbR6SjGCuLjl6Hm30Ud97cqlwZd/+fhmu6Z03
28UK0u6u6/s1RMUh+GFYtJn8EIASems2NCE6O8J4w2qZ3V9O/0/lTOap2611Ay6K
9jZCDiUSnlZO8bJBFEeIruPgZSdyDzhj8BG0gwLG8NP+nE661KDPbLUP6r/C85Q=
=j1Fl
-----END PGP SIGNATURE-----

--OU94pes+U1zVmu7Y--
