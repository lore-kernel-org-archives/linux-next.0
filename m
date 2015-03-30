From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 30 Mar 2015 19:08:12 +1100
Message-ID: <20150330190812.5512205f@canb.auug.org.au>
References: <20150330171334.6f377ba7@canb.auug.org.au>
	<20150330071536.GF24899@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ip9YLt_I9GHT3eAHqJw70le"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53474 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752983AbbC3IIT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2015 04:08:19 -0400
In-Reply-To: <20150330071536.GF24899@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Lynch <nathan_lynch@mentor.com>

--Sig_/Ip9YLt_I9GHT3eAHqJw70le
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, 30 Mar 2015 08:15:37 +0100 Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>
> I'll drop the VDSO stuff from the ARM tree; I can't see a way to keep
> it in my tree and keep my tree buildable without dragging in the tip
> tree.

Does it affect your tree on its own?  If not, then it can be fixed when
merged as I have done, or if you look at the tip tree, all you really
need to merge is tip timers/core branch (which I am sure the tip guys
can tell you if it is stable enough) which is about 28 commits ...

> The ARM VDSO stuff will just have to wait for 4.2 instead.

If that works for you.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Ip9YLt_I9GHT3eAHqJw70le
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGQRxAAoJEMDTa8Ir7ZwVKV8P/jrIcxifE/kgYjMKDmMMphF8
HJjo+tXMxvz1QX5fwbPdaOwaNin4nAVHE4nv97NP6inNr5zhCWXNLRYuk1orF91p
BIK/AaQEsm/msbEomk1y9cWlmc3NKYWtLn+ayeS9SN+WYdQnhiFq64m4E+W1ljY0
Cx6dgBeRSvKNOismUSt2TyQpYH4smbxhQO3ICfxWDmbRtoJcxjMsGB/yfkQgY4oj
oYU/WfIQz+CDyH+dCmVlHwM90jgYYBXRnw/nPbSJcu8u7y4apTP8NVuXi+ImVWYZ
lH/UZGfZ8Lq6ZvGPY/qq289aq3xOgex6/D3tHpkxKy579WCqrvgQ9WWw94c3O1yh
ZwbDA340dweI99BB5lxdtgiMbIlnln2pLx/ckl/vBzEGMJk6O+TY9d9Or8+t9ZBQ
5o8AewRizCSxlCwmTkexrWmTv1I0Vrmta1H4kfLpmny1LZNP1MYJTprJR3kJZKqK
l9U9w9con06D9oFjTfOFNC9LKeXfKTxA6x1ht5xcGU71tNECTk7ee9lVLCk2/oyG
lU/NOXDk/FSnec0ml6U1+eIIdskS1m5n273S4PuuvYT7jJ2/QxTQ9TpLebjqehh0
vKEUNgMt+9jccpsG3qpFX5gikr+IWPTGP+M8nycJsroLxPXZ+GJPbmhEC5YAQFjT
q0s9xe3srR5d0xp7h0KC
=yl2z
-----END PGP SIGNATURE-----

--Sig_/Ip9YLt_I9GHT3eAHqJw70le--
